insert into pecas(tipoPeca,custo,descricao,marca,estoque) values
('Processador',170.00,'AMD Ryzen 5 Quad Core 1400','Ryzen',4),
('Processador',175.00,'Intel Core i5-6600','Intel',5),
('Ventilação',25.00,'Corsair ML 120','Corsair',3),
('Ventilação',30.00,'Corsair ML 140','Corsair',3),
('Gabinete',130.00,'MSI MPG Gungnir 100','MSI',2),
('Gabinete',80.00,'NZXT S340 Black','NZXT',1),
('Memória RAM',95.00,'CORSAIR Dominator Platinum 8 GB 2800 MHz','Corsair',2),
('Memória RAM',35.00,'ADATA Premier Series 4 GB 2133 MHz','Adata',6),
('Armazenamento',60.00,'Seagate BarraCuda 1 TB 64MB Cache','Seagate',4),
('Armazenamento',70.00,'Seagate BarraCuda 2 TB 64MB Cache','Seagate',3),
('Alimentação',30.00,'Shean Powerking 300','Shean',2),
('Alimentação',50.00,'Shean Powerking 400','Shean',2),
('Placa de vídeo',155.00,'EVGA GeForce GTX 1050 Ti GAMING','EVGA',2),
('Placa de vídeo',160.00,'MSI GeForce GTX 1050 Ti GAMING 4G','MSI',3),
('Placa de vídeo',275.00,'MSI GeForce GTX 970 GAMING LE 100ME','MSI',1);

insert into cliente(nome,email,telefone) values
('José Camargo','jose@email.com','1254-4896'),
('Charlotte Whiltshire','charlotte@email.com','1596-1035'),
('Benedito Campos','benedito@email.com','8796-1028');

insert into servico(idCliente,tipoServico,diaSolicitacao,prazoEntrega,preco) values
(1,'Limpeza','2023-8-15','2023-8-17',20.00),
(2,'Diagnóstico','2023-8-18','2023-8-20',15.00),
(3,'Montagem','2023-8-18','2023-8-30',1300.00),
(2,'Venda','2023-8-27','2023-8-27',95.00),
(1,'Troca de peça','2023-8-30','2023-9-3',45.00),
(3,'Limpeza','2023-8-15','2023-10-17',20.00);

insert into fornecedor(razaoSocial,cnpj,endereco) values
('Fornecedor 1','25631254890201','Rua 1'),
('Fornecedor 2','12012598756200','Rua 2'),
('Fornecedor 3','46325989542115','Rua 3'),
('Fornecedor 4','15987500149865','Rua 4');

insert into compras(idFornecedor,custoTotal) values
(1,566.00),
(2,150.00),
(3,271.00),
(4,830.00),
(2,106.00),
(4,1411.00);

insert into pecas_na_compra(idCompra,idPeca,quantidade,precoUn) values
(1,1,2,140.00),
(1,2,2,143.00),
(2,8,6,25.00),
(3,3,3,17.00),
(3,4,3,20.00),
(3,7,2,80.00),
(4,5,1,100.00),
(4,6,1,65.00),
(4,13,2,130.00),
(4,14,3,135.00),
(5,11,2,18.00),
(5,12,2,35.00),
(6,9,4,50.00),
(6,10,3,54.00),
(6,1,2,140.00),
(6,2,3,143.00),
(6,5,1,100.00),
(6,15,1,240.00);

insert into pecas_utilizadas_em_servico(idServico,idPeca,quantidade) values
(4,4,2),
(4,8,1),
(5,11,1),
(3,5,1),
(3,12,1),
(3,10,2),
(3,7,2),
(3,15,1),
(3,2,1),
(3,4,2);