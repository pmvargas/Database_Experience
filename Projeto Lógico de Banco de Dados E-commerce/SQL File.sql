-- Paula Vargas de Medeiros.
-- criação do banco de dados para o cenário de E-commmerce
-- drop database ecommerce;

create database ecommerce;
use ecommerce; 

-- Criar tabela cliente

create table Clients(
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

alter table clients AUTO_INCREMENT=1;

-- Criar tabela produto 

create table product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Pets') NOT NULL,
    evaluation FLOAT DEFAULT 0,
    size VARCHAR(10)
);

create table payment(
	idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvaliable FLOAT,
	PRIMARY KEY(idClient, idPayment)
);

-- Criar tabela pedido
create table orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,	
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

-- Criar tabela de estoque
create table productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,	
    storagyLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,	
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor
create table seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,	
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- tabela produto vendedor
create table procuctSeller(
	idPseller INT,
    idPproduct INT,
    productQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY(idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY(idPproduct) REFERENCES product(idProduct)
);
    
-- tabela relação produto/pedido    
create table procuctOrder(
	idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY(idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY(idPOorder) REFERENCES orders(idOrder)
);
    
create table storageLocation(
	idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);
    
create table productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_prodcut FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

