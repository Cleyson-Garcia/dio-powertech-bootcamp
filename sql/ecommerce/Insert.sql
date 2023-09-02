INSERT INTO customerpf(CPF,Fname,Minit,Lname,Birthday) VALUES
('12345678912','Rodrigo','M','Rocha','2000-7-04'),
('98765432100','Carlos','S','Campos','1980-2-01');

INSERT INTO customerpj(CNPJ,socialName)VALUES
('15948715326842','Loja A'),
('74854589632564','Loja B');

insert into customer(customerpf,customerpj,Address) values 
(1,null,'Rua Tal'),
(2,null,'Rua Aquela'),
(null,1,'Rua Bon'),
(null,2,'Rua La');

INSERT INTO sellerpf(CPF,Fname,Lname)VALUES
('14859631289','Monteiro','Narv'),
('15232158941','Isabela','Silva');

INSERT INTO sellerpj(CNPJ,socialName)VALUES
('58987451232521','Vendedor 1'),
('15421523695841','Vendedor 2');

INSERT INTO seller(sellerPF,sellerPJ,address,contact)VALUES
(1,null,'Rua vendedor 1','email1@contato.com'),
(2,null,'Rua vendedor 2','email2@contato.com'),
(null,1,'Rua vendedor 3','email3@contato.com'),
(null,2,'Rua vendedor 4','email4@contato.com');

INSERT INTO supplier(socialName,CNPJ,address,contact)VALUES
('Fornecedor 1','12345951234561','Fornecedor endereço 1','Fornecedor contato 1'),
('Fornecedor 2','98756421359853','Fornecedor endereço 2','Fornecedor contato 2'),
('Fornecedor 3','15421523695841','Fornecedor endereço 3','Fornecedor contato 3');

INSERT INTO storagelocation(location,storageLimit)VALUES
('Armazem 1',200),
('Armazem 2',50),
('Armazem 3',450);

INSERT INTO orders(idCustomer,orderStatus,orderDescription)VALUES
(1,'Em Andamento','Venda 1'),
(2,'Processando','Venda 2'),
(3,'Cancelado','Venda 3'),
(4,'Concluído','Venda 4');

INSERT INTO shippings(idOrder,shippingCost,shippingStatus,shippingCode,estimatedDate)VALUES
(1,20,'Em Andamento','f21s65fc15ds','2023-3-17'),
(2,25,'Processando','1fd56as165fds','2023-3-29'),
(3,30,'Cancelado','b1vc6x5','2023-3-10'),
(4,20,'Concluído','bhtr4e891','2023-2-12');

INSERT INTO payments(idOrder,paymentMethod,ammount,tax,paymentDelay)VALUES
(1,'Débito',3020.39,5.50,2),
(2,'Crédito',1368.50,10.50,5),
(3,'Boleto',12499.95,3.00,3),
(4,'PIX',421.37,1.20,0);

INSERT INTO product(Pname,category,Pdescription,price)VALUES
('Televisão','Eletronicos','Marca X',2499.99),
('Micro-ondas','Eletronicos','Marca X',500.40),
('Geladeira','Eletronicos','Marca X',1200.00),
('Sofá','Moveis','Marca X',700.00),
('Mesa','Moveis','Marca X',500.50),
('Cadeira','Moveis','Marca X',35.75),
('Armário','Moveis','Marca X',140.40),
('Calçado','Moda','Marca X',60.00),
('Camisa','Moda','Marca X',25.49),
('Vestido','Moda','Marca X',99.99),
('Blusa','Moda','Marca X',149.99);

INSERT INTO products_in_order(idProduct,idOrder,quantity)VALUES
(2,1,1),
(3,1,1),
(4,2,1),
(5,2,1),
(6,2,4),
(1,3,5),
(8,4,1),
(9,4,2),
(11,4,1),
(7,4,1);

INSERT INTO product_storagelocation(idStorage,idProduct,quantity)VALUES
(2,1,10),
(2,2,12),
(2,3,20),
(1,4,20),
(1,5,30),
(1,6,110),
(1,7,35),
(3,8,50),
(3,9,50),
(3,10,29),
(3,11,34);

INSERT INTO product_seller(idSeller,idProduct,quantity)VALUES
(1,4,5),
(1,5,7),
(1,6,12),
(1,7,14),
(1,11,20),
(2,1,5),
(2,7,25),
(3,1,3),
(3,2,20),
(3,3,15),
(4,8,30),
(4,9,45),
(4,10,71),
(4,11,34);

INSERT INTO product_supplier(idSupplier,idProduct,quantity)VALUES
(1,1,50),
(1,2,50),
(1,3,50),
(2,4,120),
(2,5,30),
(2,6,120),
(2,7,120),
(3,8,70),
(3,9,80),
(3,10,50),
(3,11,100);
