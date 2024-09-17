DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Pedido CASCADE CONSTRAINTS ;
DROP TABLE Produto CASCADE CONSTRAINTS ;
DROP TABLE Item_pedido CASCADE CONSTRAINTS ;

CREATE TABLE Cliente (
    id_cliente  NUMBER(15),
    nome        VARCHAR2(60),
    sobrenome   VARCHAR2(60),
    email       VARCHAR2(60)
);

CREATE TABLE Pedido (
    id_pedido   NUMBER(15),
    data        DATE,
    valor_total NUMBER(15,2),
    cliente_id  NUMBER(15)
);

CREATE TABLE Produto (
    id_produto  NUMBER(15),
    titulo      VARCHAR2(20),
    descricao   VARCHAR2(80),
    preco       NUMBER(15,2)
);

CREATE TABLE Item_pedido (
    quantidade  NUMBER(5),
    valor_total NUMBER(15,2),
    produto_id  NUMBER(15),
    pedido_id   NUMBER(15)
);

Desc Cliente;

ALTER TABLE Cliente ADD CONSTRAINT pk_id_cliente PRIMARY KEY(id_cliente);
ALTER TABLE Pedido ADD CONSTRAINT pk_id_pedido PRIMARY KEY(id_pedido);
ALTER TABLE Produto ADD CONSTRAINT pk_id_produto PRIMARY KEY(id_produto);