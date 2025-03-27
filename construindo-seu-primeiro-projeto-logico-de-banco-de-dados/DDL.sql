
-- Creating a new database;
CREATE DATABASE DIO_ECOMMERCE;
USE DIO_ECOMMERCE;

-- Creating a table client
CREATE TABLE Clients (
    idClient INT NOT NULL AUTO_INCREMENT,
    fName VARCHAR(45) NOT NULL,
    mName VARCHAR(3) NOT NULL,
    lName VARCHAR(45) NOT NULL,
    CPF_CNPJ VARCHAR(14) NOT NULL,
    address VARCHAR(255) NOT NULL,
    bDate DATE NOT NULL,
    PRIMARY KEY (idClient),
    CONSTRAINT uq_cpf_client UNIQUE (CPF_CNPJ)
)
AUTO_INCREMENT=1;

-- Creating a table Product

CREATE TABLE Product (
    idProduct INT NOT NULL AUTO_INCREMENT,
    pName VARCHAR(45) NOT NULL,
    classiKids BOOLEAN NOT NULL DEFAULT FALSE,
    category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis','Outros') NOT NULL DEFAULT 'Outros',
    description VARCHAR(255),
    avaliation FLOAT NOT NULL DEFAULT 0,
    size VARCHAR(10),
    PRIMARY KEY (idProduct)
)
AUTO_INCREMENT=1;

-- Creating a table Affiliated
CREATE TABLE Affiliate (
    idAffiliate INT NOT NULL AUTO_INCREMENT,
    CNPJ CHAR(14) NOT NULL,
    cName VARCHAR(45) NOT NULL,
    tName VARCHAR(45) NOT NULL,
    address VARCHAR(255),
    CONSTRAINT uq_cnpj_affiliate UNIQUE (CNPJ),
    CONSTRAINT uq_cname_affiliate UNIQUE (cName),
    PRIMARY KEY (idAffiliate)
)
AUTO_INCREMENT=1;

-- Creating a table Stock
CREATE TABLE Stock (
    idStock INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (idStock)
)
AUTO_INCREMENT=1;

-- Creating a table Supplier

CREATE TABLE Supplier (
    idSupplier INT NOT NULL AUTO_INCREMENT,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    cName VARCHAR(45) NOT NULL UNIQUE,
    tName VARCHAR(45) NOT NULL,
    address VARCHAR(255),
    contact VARCHAR(24),
    CONSTRAINT uq_cnpk_supplier UNIQUE (CNPJ),
    CONSTRAINT uq_cname_supplier UNIQUE (cName),
    PRIMARY KEY(idSupplier)
)
AUTO_INCREMENT=1;

-- Creating a table Payments

CREATE TABLE Payments (
    idPayment INT NOT NULL AUTO_INCREMENT,
    idClient INT NOT NULL,
    typePayment ENUM('Debit Card','Credit Card') NOT NULL,
    cardNumber CHAR(16) NOT NULL,
    cardExpiration DATE NOT NULL,
    cardName VARCHAR(45) NOT NULL,
    PRIMARY KEY (idPayment, idClient),
    CONSTRAINT fk_idclient_payments FOREIGN KEY (idClient) REFERENCES Clients(idClient)
)
AUTO_INCREMENT=1;
-- Creating a table Orders

CREATE TABLE Orders (
    idOrder INT NOT NULL AUTO_INCREMENT,
    idClient INT NOT NULL,
    status ENUM('Canceled','Processing','Confirmed','Sent','Delivered') NOT NULL DEFAULT 'Processing',
    description VARCHAR(255),
    paymentType ENUM('Ticket','Card') NOT NULL,
    idPayment INT,
    sendValue FLOAT,
    PRIMARY KEY (idOrder, idClient),
    CONSTRAINT fk_idpayment_orders FOREIGN KEY (idClient, idPayment) REFERENCES Payments(idClient, idPayment),
    CONSTRAINT fk_idclient_orders FOREIGN KEY (idClient) REFERENCES Clients(idClient)
)
AUTO_INCREMENT=1;


-- Creating a table SupplierProduct

CREATE TABLE Supplier_Product (
    idSupplier INT NOT NULL,
    idProduct INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_idsupplier_supplier_product FOREIGN KEY (idSupplier) REFERENCES Supplier(idSupplier),
    CONSTRAINT fk_idproduct_supplier_product FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

-- Creating a table StockProduct

CREATE TABLE Stock_Product (
    idStock INT NOT NULL,
    idProduct INT NOT NULL,
    amount INT NOT NULL DEFAULT 0,
    PRIMARY KEY (idStock, idProduct),
    CONSTRAINT fk_idstock_stock_product FOREIGN KEY (idStock) REFERENCES Stock(idStock),
    CONSTRAINT fk_idproduct_stock_product FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

-- Creating a table AffiliateProduct

CREATE TABLE Affiliate_Product (
    idAffiliate INT NOT NULL,
    idProduct INT NOT NULL,
    amount INT NOT NULL DEFAULT 0,
    PRIMARY KEY (idAffiliate,idProduct),
    CONSTRAINT fk_idaffiliate_affiliate_product FOREIGN KEY (idAffiliate) REFERENCES Affiliate(idAffiliate),
    CONSTRAINT fk_idaaffiliate_affiliate_product FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

-- Creating a table OrderProduct

CREATE TABLE Orders_Product (
    idOrder INT NOT NULL ,
    idProduct INT NOT NULL,
    idAffiliate INT NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(45),
    PRIMARY KEY (idOrder, idProduct, idAffiliate),
    CONSTRAINT fk_idaffiliate_order_product FOREIGN KEY (idAffiliate, idProduct) REFERENCES Affiliate_Product(idAffiliate, idProduct),
    CONSTRAINT fk_idorder_orders_product FOREIGN KEY (idOrder) REFERENCES Orders(idOrder),
    CONSTRAINT fk_idproduct_orders_product FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

