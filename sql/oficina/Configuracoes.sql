drop database oficina;
create database oficina;
use oficina;

create table pecas (
	idPeca int auto_increment,
    tipoPeca enum('Processador','Ventilação','Gabinete','Memória RAM','Armazenamento','Alimentação','Placa de vídeo'),
    custo float,
    descricao varchar(150),
    marca varchar(50),
    estoque int,
    constraint pk_peca primary key (idPeca)
);

create table cliente (
	idCliente int auto_increment,
    nome varchar(150),
    email varchar(100),
    telefone varchar(12),
    constraint pk_cliente primary key (idCliente)
);

create table servico (
	idServico int auto_increment,
    idCliente int,
    tipoServico enum('Limpeza','Diagnóstico','Troca de peça','Montagem','Venda'),
    diaSolicitacao date,
    prazoEntrega date,
    preco float,
    constraint pk_servico primary key (idServico),
    constraint fk_servico_cliente foreign key (idCliente) references cliente (idCliente)
);

create table fornecedor (
	idFornecedor int auto_increment,
    razaoSocial varchar(150),
    cnpj char(14) unique,
    endereco varchar(150),
    constraint pk_fornecedor primary key (idFornecedor)
);

create table compras (
	idCompra int auto_increment,
    idFornecedor int,
    custoTotal float,
    constraint pk_compras primary key (idCompra),
    constraint fk_compras_fornecedor foreign key (idFornecedor) references fornecedor (idFornecedor)
);

create table pecas_na_compra (
	idCompra int,
    idPeca int,
    quantidade int,
    precoUn float,
    constraint pk_pecas_na_compra primary key (idCompra,idPeca),
    constraint fk_compra_na_compra_de_peca foreign key (idCompra) references compras (idCompra),
    constraint fk_peca_na_compra_de_peca foreign key (idPeca) references pecas (idPeca)
);

create table pecas_utilizadas_em_servico(
    idServico int,
    idPeca int,
    quantidade int,
    constraint pk_pecas_utilizadas_em_servico primary key (idServico,idPeca),
    constraint fk_servico_na_pecas_utilizadas_em_servico foreign key (idServico) references servico (idServico),
    constraint fk_peca_na_pecas_utilizadas_em_servico foreign key (idPeca) references pecas (idPeca)
);