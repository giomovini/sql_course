CREATE TABLE produto (
    nome_produto        VARCHAR2(45),
    descricao_produto   VARCHAR2(45),
    cod_barra_produto   VARCHAR2(45),
    id_produto          INT,
    produto_categoria_id_produto_categoria  INT
);

CREATE TABLE produto_categoria(
    nome_produto_categoria  VARCHAR2(45),
    id_produto_categoria    INT
);

CREATE TABLE produto_sku (
    produto_sku                 INT,
    id_produto_sku              INT,
    produto_id_produto          INT,
    produto_cor_id_produto_cor  INT,
    produto_tamanho_id_produto_tamanho  INT
);

CREATE TABLE produto_preco(
    preco_produto_preco         VARCHAR2(45),
    id_produto_preco            INT,
    produto_sku_id_produto_sku  INT
);

CREATE TABLE produto_estoque(
    id_produto_estoque          INT,
    quantidade_produto_estoque  INT,
    produto_sku_id_produto_sku  INT
);

CREATE TABLE produto_cor(
    id_produto_cor      INT,
    produto_id_produto  INT,
    cor_id_cor          INT
);

CREATE TABLE produto_tamanho(
    id_produto_tamanho  INT,
    produto_id_produto  INT,
    tamanho_id_tamanho  INT
);

CREATE TABLE especificacao_produto(
    id_especificacao_produto    INT,
    info_especificacao_produto  VARCHAR2(45),
    produto_sku_id_produto_sku  INT
);

CREATE TABLE cor(
    id_cor      INT,
    nome_cor    VARCHAR2(45)
);

CREATE TABLE tamanho(
    id_tamanho      INT,
    nome_tamanho    VARCHAR2(45)
);

--> Incluindo PK
ALTER TABLE produto ADD CONSTRAINT pk_id_produto PRIMARY KEY (id_produto);
ALTER TABLE produto_categoria ADD CONSTRAINT pk_id_produto_categoria PRIMARY KEY (id_produto_categoria);
ALTER TABLE produto_sku ADD CONSTRAINT pk_id_produto_sku PRIMARY KEY (id_produto_sku);
ALTER TABLE produto_preco ADD CONSTRAINT pk_id_produto_preco PRIMARY KEY (id_produto_preco);
ALTER TABLE produto_estoque ADD CONSTRAINT pk_id_produto_estoque PRIMARY KEY (id_produto_estoque);
ALTER TABLE produto_cor ADD CONSTRAINT pk_id_produto_cor PRIMARY KEY (id_produto_cor);
ALTER TABLE produto_tamanho ADD CONSTRAINT pk_id_produto_tamanho PRIMARY KEY (id_produto_tamanho);
ALTER TABLE especificacao_produto ADD CONSTRAINT pk_id_especificacao_produto PRIMARY KEY (id_especificacao_produto);
ALTER TABLE cor ADD CONSTRAINT pk_id_cor PRIMARY KEY (id_cor);
ALTER TABLE tamanho ADD CONSTRAINT pk_id_tamanho PRIMARY KEY (id_tamanho);

--> Incluindo FK
-- ALTER TABLE nome_tabela ADD CONSTRAINT nome_fk FOREIGN KEY (coluna) REFERENCES nome_tabela_origem(coluna)
-- ALTER TABLE  ADD CONSTRAINT  FOREIGN KEY () REFERENCES ();
ALTER TABLE produto ADD CONSTRAINT fk_id_produto_categoria FOREIGN KEY (produto_categoria_id_produto_categoria) REFERENCES produto_categoria(id_produto_categoria);
ALTER TABLE produto_sku ADD CONSTRAINT fk_id_produto FOREIGN KEY (produto_id_produto) REFERENCES produto(id_produto);
ALTER TABLE produto_sku ADD CONSTRAINT fk_id_produto_cor FOREIGN KEY (produto_cor_id_produto_cor) REFERENCES produto_cor(id_produto_cor);
ALTER TABLE produto_sku ADD CONSTRAINT fk_id_produto_tamanho FOREIGN KEY (produto_tamanho_id_produto_tamanho) REFERENCES produto_tamanho(id_produto_tamanho);
ALTER TABLE produto_preco ADD CONSTRAINT fk_id_produto_sku FOREIGN KEY (produto_sku_id_produto_sku) REFERENCES produto_sku(id_produto_sku);
ALTER TABLE produto_estoque ADD CONSTRAINT fk_id_produto_estoque FOREIGN KEY (produto_sku_id_produto_sku) REFERENCES produto_sku(id_produto_sku);
ALTER TABLE produto_cor ADD CONSTRAINT fk_produto FOREIGN KEY (produto_id_produto) REFERENCES produto(id_produto);
ALTER TABLE produto_cor ADD CONSTRAINT fk_cor FOREIGN KEY (cor_id_cor) REFERENCES cor(id_cor);
ALTER TABLE produto_tamanho ADD CONSTRAINT fk_produto_id FOREIGN KEY (produto_id_produto) REFERENCES produto(id_produto);
ALTER TABLE produto_tamanho ADD CONSTRAINT fk_tamanho FOREIGN KEY (tamanho_id_tamanho) REFERENCES tamanho(id_tamanho);
ALTER TABLE especificacao_produto ADD CONSTRAINT fk_produto_sku FOREIGN KEY (produto_sku_id_produto_sku) REFERENCES produto_sku(id_produto_sku);

INSERT INTO produto VALUES (nome, descricao_produto, cod_barra_produto, id produto, produto_categoria_id_produto_categoria)

DESC produto;
DESC produto_categoria;
DESC produto_sku;
DESC produto_preco;
DESC produto_estoque;
DESC produto_cor;
DESC produto_tamanho;
DESC especificacao_produto;
DESC cor;
DESC tamanho;

DROP TABLE produto;
DROP TABLE produto_categoria;
DROP TABLE produto_sku;
DROP TABLE produto_preco;
DROP TABLE produto_estoque;
DROP TABLE produto_cor;
DROP TABLE produto_tamanho;
DROP TABLE especificacao_produto;
DROP TABLE cor;
DROP TABLE tamanho;


