USE DIO_ECOMMERCE;

INSERT INTO Stock (address) VALUES 
('Rua fulano de tal 1251, Aviela - Cidade de Deus'),
('Avenida beltrano de souza 12345, Tanatonta - Longelá');

INSERT INTO Affiliate (CNPJ,cName,tName,address) VALUES
('33222111000101','Carlos ME','Carlitos Comercios',null),
('66555444000101','ECommmerce Networking S.A','Revendas Digitais',null),
('99888777000101','Comprou Chegou ME','Corredex',null);

INSERT INTO Supplier (CNPJ,cName,tName,address,contact) VALUES
('11222333000101','Almeida & Filhos ME','Almeida & Filhos',null,'12345678'),
('44555666000101','Eletrônicos Silva LTDA','Silvinha Bugigangas',null,'98765432'),
('77888999000101','Eletrônicos Valma S.A','Valma Perifericos',null,'40028922');

INSERT INTO Product (pName, classiKids, category, avaliation, size) VALUES
('Fone de Ouvido',false,'Eletrônico','4',null),
('Barbie Elsa',true,'Brinquedos','3',null),
('Body Carters',true,'Vestimenta','5',null),
('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
('Sofá retrátil',false,'Móveis','3','3x57x80'),
('Farinha de arroz',false,'Alimentos','2',null),
('Fire Stick Amazon',false,'Eletrônico','3',null);

INSERT INTO Clients (fName, mName, lName, CPF_CNPJ, address, bDate) VALUES 
('Maria','M','Silva',123456789,'Rua silva de prata 29, Carangola - Cidade das flores','1984-12-01'),
('Matheus','O','Pimentel',987654321,'Rua alamenda 289, Centrol - Cidade das flores','1994-01-24'),
('Ricardo','F','Silva',456789123,'Rua laranjeira 861, Centro - Cidade das flores','2001-04-05'),
('Julia','S','França',789123456,'Avenida alamenda vinha 1009, Centro - Cidade das flores','2002-06-04'),
('Roberta','G','Assis',987456321,'Avenida koller 19, Centro - Cidade das flores','1982-08-04'),
('Isabela','M','Cruz',654789123,'Rua alamenda das flores 28, Centro - Cidade das flores','2004-04-23');

INSERT INTO Payments (idClient, typePayment, cardNumber, cardExpiration, cardName) VALUES
(2,'Credit Card',1111222233334444,'2029-01-01','Matheus O. Pimentel'),
(4,'Debit Card',5555666677778888,'2026-05-01','Julia S. França');

INSERT INTO Orders (idClient,status,description,sendValue,paymentType,idPayment) VALUES
(1,DEFAULT,'Compra via aplicativo',null,'Ticket',null),
(2,DEFAULT,'Compra via aplicativo',50,'Card',1),
(3,'Confirmed',null,null,'Ticket',null),
(4,DEFAULT,'Compra via web site',150,'Card',null);

INSERT INTO Stock_Product (idStock,idProduct,amount) VALUES 
(1,1,5),
(1,2,4),
(1,3,6),
(2,3,2),
(1,4,12),
(1,5,2),
(2,5,52);

INSERT INTO Supplier_Product (idSupplier,idProduct) VALUES 
(1,2),
(1,3),
(1,5),
(1,6),
(2,1),
(2,4),
(3,7);

INSERT INTO Affiliate_Product (idAffiliate,idProduct) VALUES 
(1,2),
(1,3),
(1,5),
(1,6),
(2,1),
(2,4),
(3,7);

INSERT INTO Orders_Product (idOrder,idProduct,idAffiliate,amount,status) VALUES
(1,5,1,2,null),
(2,5,1,1,null),
(3,6,1,1,null);