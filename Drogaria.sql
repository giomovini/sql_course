CREATE TABLE farmacia(
    CNPJ_farmacia   NUMBER(14),
    nome_farmacia   VARCHAR2(30),
    tel_farmacia    NUMBER(13),
    end_farmacia    VARCHAR2(50)
);

CREATE TABLE produto(
    cod_produto         NUMBER(14),
    valor_produto       NUMBER(14,2),
    qtd_produto         NUMBER(14),
    fk_CNPJ_farmacia    NUMBER(14)
);

CREATE TABLE farmaceutico(
    RG_farmaceutico     NUMBER(7),
    nome_farmaceutico   VARCHAR2(30),
    fk_CNPJ_farmacia    NUMBER(14)
);

Select * from drogaria;
Select * from farmaceutico;
Select * from produto;

-- Adicionando PK's
ALTER TABLE farmacia ADD CONSTRAINT pk_CNPJ_farmacia PRIMARY KEY (CNPJ_farmacia);
ALTER TABLE produto ADD CONSTRAINT pk_cod_produto PRIMARY KEY (cod_produto);
ALTER TABLE farmaceutico ADD CONSTRAINT pk_RG_farmaceutico PRIMARY KEY (RG_farmaceutico);

-- Adicionando FK's
ALTER TABLE produto ADD CONSTRAINT fk_CNPJ_farmacia FOREIGN KEY (fk_CNPJ_farmacia) REFERENCES farmacia(CNPJ_farmacia);
ALTER TABLE farmaceutico ADD CONSTRAINT fk_CNPJ_farmacia2 FOREIGN KEY (fk_CNPJ_farmacia) REFERENCES farmacia(CNPJ_farmacia);

ALTER TABLE farmaceutico ADD e_mail VARCHAR2(30);
ALTER TABLE farmaceutico ADD sexo VARCHAR2(1);

ALTER TABLE farmacia RENAME TO drogaria;

ALTER TABLE drogaria RENAME COLUMN CNPJ_farmacia TO CNPJ_drogaria;
ALTER TABLE drogaria RENAME COLUMN nome_farmacia TO nome_drogaria;
ALTER TABLE drogaria RENAME COLUMN tel_farmacia TO tel_drogaria;
ALTER TABLE drogaria RENAME COLUMN end_farmacia TO end_drogaria;

ALTER TABLE produto RENAME COLUMN fk_CNPJ_farmacia TO fk_CNPJ_drogaria;
ALTER TABLE farmaceutico RENAME COLUMN fk_CNPJ_farmacia TO fk_CNPJ_drogaria;

INSERT INTO drogaria VALUES(123, 'drogaria do Vini', 1199887733, 'avenida paulista 30');
INSERT INTO drogaria VALUES(456, 'drogaria do Vitor', 11977556633, 'rua alemanha 626');

INSERT INTO farmaceutico VALUES(0001288, 'Evandro', 123, 'M', 'evandro@gmail.com');
INSERT INTO farmaceutico VALUES(1114477, 'Maysa', 456, 'F', 'maysa@gmail.com');

INSERT INTO produto VALUES (111, 20.0, 10, 123);
INSERT INTO produto VALUES (222, 15.0, 8, 123);
INSERT INTO produto VALUES (333, 45.50, 2, 123);
INSERT INTO produto VALUES (444, 25.75, 9, 123);
INSERT INTO produto VALUES (555, 150.50, 5, 123);
INSERT INTO produto VALUES (666, 70.7, 2, 456);
INSERT INTO produto VALUES (777, 33.00, 34, 456);
INSERT INTO produto VALUES (888, 14.99, 14, 456);
INSERT INTO produto VALUES (999, 6.75, 19, 456);
INSERT INTO produto VALUES (000, 43.88, 57, 456);