use ecommerce;
-- Quantos pedidos foram feitos por cada cliente?
select concat(p.Fname,' ',p.Minit,' ',p.Lname) as Nome, count(*) as 'Pedidos Realizados' from customerPF p, customer c, orders o 
where c.idCustomer = o.idCustomer and c.customerpf = p.idCustomerpf group by c.idcustomer;

select j.socialName as Nome, count(*) as 'Pedidos Realizados' from customerPJ j, customer c, orders o 
where c.idCustomer = o.idCustomer and c.customerpj = j.idCustomerpj group by c.idcustomer;

-- Algum vendedor também é fornecedor?
select su.socialName as 'Razao Social',su.cnpj as CNPJ from seller se, sellerpj sj, supplier su
where se.sellerpj = sj.idsellerpj and sj.cnpj = su.cnpj;

-- Relação de produtos fornecedores e estoques;
select p.pname as 'Produto', s.socialName as 'Fornecedor', sl.location as 'Estoque'
from storageLocation sl, supplier s, product_storageLocation pdstg, product p, product_supplier ps
where pdstg.idStorage = sl.idStorage and pdstg.idProduct = p.idProduct 
and p.idProduct = ps.idProduct and ps.idSupplier = s.idSupplier
order by sl.location;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select s.socialName as Fornecedor, p.Pname as Descrição from supplier s, product p, product_supplier ps 
where ps.idSupplier = s.idSupplier and ps.idProduct = p.idProduct;

-- Quais os produtos com valor acima de R$100,00 e abaixo de R$1000,00
select pname as 'Produto', p.category as 'Categoria', p.price as 'Valor' from product p
having p.price between 100 and 1000
order by p.price;