-- Serviços em prazos a serem realizados
select c.nome as 'Cliente', s.tipoServico as 'Serviço a ser realizado', s.prazoEntrega as 'Data Limite' from servico s, cliente c
where s.prazoEntrega >= SYSDATE() and s.idCliente = c.idCliente;

-- Serviços cujo prazo já se passou
select c.nome as 'Cleinte', s.tipoServico as 'Serviço a ser realizado', s.prazoEntrega as 'Data Limite' from servico s, cliente c
where s.prazoEntrega < SYSDATE() and s.idCliente = c.idCliente;

-- Valor total do estoque
select SUM(custo * estoque) as 'Valor do estoque' from pecas;

-- Valor total do estoque por categoria
select tipoPeca as 'Categoria',SUM(custo * estoque) as 'Valor do estoque' from pecas
group by tipoPeca;

-- Fornecedores com compra total acima de 500.00
select f.razaoSocial as 'Fornecedor', SUM(c.custoTotal) as 'Valor total de compras' from compras c, fornecedor f
where c.idFornecedor = f.idFornecedor
group by c.idFornecedor
having SUM(c.custoTotal) > 500;

-- As 10 peças mais caras em estoque
select concat(marca,' - ',descricao) as 'Peça', custo as 'Valor' from pecas
order by  custo desc limit 10;

-- As 10 peças mais caras em estoque total
select concat(marca,' - ',descricao) as 'Peça', custo*estoque as 'Valor em estoque' from pecas
order by  custo*estoque desc limit 10;

-- Peças mais vendidas
select concat(p.marca,' - ',p.descricao) as 'Peça',SUM(ps.quantidade) as 'Quantidade Utilizada' from pecas p, pecas_utilizadas_em_servico ps
where p.idPeca = ps.idPeca
group by ps.idPeca
order by SUM(ps.quantidade) desc;