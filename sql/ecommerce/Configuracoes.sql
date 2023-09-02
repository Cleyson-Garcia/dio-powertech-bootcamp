-- Criação do banco de dados
create database ecommerce;
use ecommerce;

-- Criação das tabelas

-- tabela cliente PF
CREATE TABLE IF NOT EXISTS customerPF (
  idCustomerPF INT AUTO_INCREMENT,
  CPF CHAR(11) NOT NULL UNIQUE,
  Fname VARCHAR(10) NOT NULL,
   Minit VARCHAR(3),
   Lname VARCHAR(20),
   Birthday DATE,
  CONSTRAINT pk_customerPF PRIMARY KEY (idCustomerPF)
);

-- tabela cliente PJ
CREATE TABLE IF NOT EXISTS customerPJ (
idCustomerPJ INT AUTO_INCREMENT,
  CNPJ CHAR(14) NOT NULL UNIQUE,
  socialName VARCHAR(45),
  CONSTRAINT pk_customerPJ PRIMARY KEY (idCustomerPJ)
);

-- tabela cliente
CREATE TABLE IF NOT EXISTS customer(
   idCustomer INT AUTO_INCREMENT,
   customerPF INT,
   customerPJ INT,
   Address VARCHAR(45),
   CONSTRAINT pk_customer PRIMARY KEY (idCustomer),
   CONSTRAINT fk_customer_customerPF FOREIGN KEY (customerPF) REFERENCES customerPF(idCustomerPF),
   CONSTRAINT fk_customer_customerPJ FOREIGN KEY (customerPJ) REFERENCES customerPJ(idCustomerPJ)
);

-- tabela produto
CREATE TABLE IF NOT EXISTS product (
  idProduct INT AUTO_INCREMENT,
  Pname VARCHAR(30) NOT NULL,
  Pstatus ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
  category ENUM('Eletronicos','Moveis','Moda') NOT NULL,
  Pdescription VARCHAR(45),
  price FLOAT NOT NULL,
  CONSTRAINT pk_product PRIMARY KEY (idProduct)
);

-- tabela fornecedor
CREATE TABLE IF NOT EXISTS supplier (
  idSupplier INT AUTO_INCREMENT,
  socialName VARCHAR(200) NOT NULL,
  CNPJ CHAR(14) NOT NULL UNIQUE,
  address VARCHAR(200),
  contact VARCHAR(30),
  CONSTRAINT pk_supplier PRIMARY KEY (idSupplier)
);

-- tabela relação produto e fornecedor
CREATE TABLE IF NOT EXISTS product_supplier (
  idSupplier INT,
  idProduct INT,
  quantity INT NOT NULL,
  CONSTRAINT pk_product_supplier PRIMARY KEY (idSupplier, idProduct),
  CONSTRAINT fk_supplier FOREIGN KEY (idSupplier) REFERENCES supplier (idSupplier)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_product FOREIGN KEY (idProduct) REFERENCES product (idProduct)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- tabela vendedor PF
CREATE TABLE IF NOT EXISTS sellerPF (
  idSellerPF INT AUTO_INCREMENT,
  CPF CHAR(11) UNIQUE,
  Fname VARCHAR(20),
  Lname VARCHAR(20),
  CONSTRAINT pk_sellerPF PRIMARY KEY (idSellerPF)
);

-- tabela vendedor PJ
CREATE TABLE IF NOT EXISTS sellerPJ (
  idSellerPJ INT AUTO_INCREMENT,
  CNPJ CHAR(14) UNIQUE,
  socialName VARCHAR(50),
  CONSTRAINT pk_sellerPJ PRIMARY KEY (idSellerPJ)
);

-- tabela terceiro - vendedor
CREATE TABLE IF NOT EXISTS seller (
  idSeller INT AUTO_INCREMENT,
  sellerPF INT,
  sellerPJ INT,
  address VARCHAR(200),
  contact VARCHAR(100),
  CONSTRAINT pk_seller PRIMARY KEY (idSeller),
  CONSTRAINT fk_seller_sellerPF FOREIGN KEY (sellerPF) REFERENCES sellerPF (idSellerPF),
  CONSTRAINT fk_seller_sellerPJ FOREIGN KEY (sellerPJ) REFERENCES sellerPJ (idSellerPJ)
);

-- tabela Relação produto e terceiro vendedor
CREATE TABLE IF NOT EXISTS product_seller (
  idSeller INT,
  idProduct INT,
  quantity FLOAT NOT NULL,
  CONSTRAINT pk_product_seller PRIMARY KEY (idSeller, idProduct),
  CONSTRAINT fk_seller FOREIGN KEY (idSeller) REFERENCES seller (idSeller),
  CONSTRAINT fk_product_seller_sell FOREIGN KEY (idProduct) REFERENCES product (idProduct)
);

-- tabela estoque
CREATE TABLE IF NOT EXISTS storageLocation (
  idStorage INT AUTO_INCREMENT,
  location VARCHAR(200),
  storageLimit INT,
  CONSTRAINT pk_productStorage PRIMARY KEY (idStorage)
);

-- tabela relação produto e estoque
CREATE TABLE IF NOT EXISTS product_storageLocation (
  idStorage INT,
  idProduct INT,
  quantity FLOAT NOT NULL,
  CONSTRAINT pk_product_productStorage PRIMARY KEY (idStorage, idProduct),
  CONSTRAINT fk_productStorage FOREIGN KEY (idStorage) REFERENCES storageLocation (idStorage),
  CONSTRAINT fk_product_storageLocation FOREIGN KEY (idProduct) REFERENCES product (idProduct)
);

-- tabela pedido
CREATE TABLE IF NOT EXISTS orders (
  idOrder INT AUTO_INCREMENT,
  idCustomer INT,
  orderStatus ENUM("Em Andamento", "Processando", "Cancelado", "Concluído") NOT NULL DEFAULT 'Processando',
  orderDescription VARCHAR(255),
  CONSTRAINT pk_orders PRIMARY KEY (idOrder),
  CONSTRAINT fk_orders_customer FOREIGN KEY (idCustomer) REFERENCES customer (idCustomer)
);

-- tabela forma de pagamento
CREATE TABLE IF NOT EXISTS payments (
  idPayment INT AUTO_INCREMENT,
  idOrder INT,
  paymentMethod ENUM('Crédito','Débito','Boleto','Dinheiro','PIX') NOT NULL,
  ammount FLOAT,
  tax FLOAT,
  paymentDelay INT,
  CONSTRAINT pk_payments PRIMARY KEY (idPayment),
  CONSTRAINT fk_orders_payments FOREIGN KEY (idOrder) REFERENCES orders (idOrder)
);

-- tabela entrega
CREATE TABLE IF NOT EXISTS shippings (
  idShipping INT AUTO_INCREMENT,
  idOrder INT,
  shippingCost FLOAT,
  shippingStatus ENUM('Em Andamento','Processando','Cancelado','Concluído') DEFAULT 'Processando',
  shippingCode VARCHAR(45) UNIQUE,
  estimatedDate DATE,
  CONSTRAINT pk_shipping PRIMARY KEY (idShipping),
  CONSTRAINT fk_shipping_order FOREIGN KEY (idOrder) REFERENCES orders (idOrder)
);

-- tabela relação produto e pedido
CREATE TABLE IF NOT EXISTS products_in_order (
  idProduct INT,
  idOrder INT,
  quantity FLOAT NOT NULL,
  CONSTRAINT pk_products_in_order PRIMARY KEY (idProduct, idOrder),
  CONSTRAINT fk_productSide FOREIGN KEY (idProduct) REFERENCES product (idProduct),
  CONSTRAINT fk_orderSide FOREIGN KEY (idOrder) REFERENCES orders (idOrder)
);

