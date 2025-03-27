--- Total de clientes
SELECT COUNT(idClient) AS Total FROM clients;

----------------------------------------------------------------
--- Recuperar informações do cliente especifico

SET @CLIENT_ID = 1;
SELECT * FROM clients WHERE idClient = (@CLIENT_ID);
----------------------------------------------------------------

--- Recuperar informações de compras realizadas por clientes

SELECT clients.idClient,CONCAT(clients.fName,' ',clients.mName,'. ',clients.lName) AS name,orders.status,orders.description,orders.paymentType
FROM clients 
JOIN orders ON clients.idClient = orders.idClient;
----------------------------------------------------------------

--- Recuperar os produtos e vendedores comprados por cliente

SELECT a.idClient,CONCAT(d.fName,' ',d.mName,'. ',d.lName) AS Cliente,c.pName AS Produto, b.amount AS Quantidade,e.tName AS Afiliado,g.tName AS Fornecedor, a.status AS Status
FROM orders a
INNER JOIN orders_product b USING (idOrder)
INNER JOIN product c USING (idProduct)
INNER JOIN clients d USING (idClient)
INNER JOIN affiliate e USING (idAffiliate)
INNER JOIN supplier_product f USING (idProduct)
INNER JOIN supplier g USING (idSupplier)
ORDER BY idClient;
