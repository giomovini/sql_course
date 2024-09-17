-- ============================================================
--   Dropar todas as tabelas
-- ============================================================
Drop table MARCA cascade constraints;
Drop table COR  cascade constraints;
Drop table TIPO cascade constraints;
Drop table MODELO cascade constraints;
Drop table LOJA cascade constraints;
Drop table OPCIONAL cascade constraints;
Drop table TRANSMISSAO cascade constraints;
Drop table MOTOR cascade constraints;
Drop table COMBUSTIVEL cascade constraints;
Drop table CARRO cascade constraints;
Drop table VEICULO cascade constraints;
Drop table VEICULO_OPCIONAL cascade constraints;
Drop table LOJA_TELEFONE cascade constraints;

-- ============================================================
--   Table : MARCA
-- ============================================================
create table MARCA
(
    COD_MARCA             NUMERIC(3)            not null,
    NOM_MARCA             VARCHAR(15)          not null unique,
    constraint pk_marca primary key (COD_MARCA)
);

-- ============================================================
--   Table : COR
-- ============================================================
create table COR
(
    COD_COR               NUMERIC(3)            not null,
    NOM_COR               VARCHAR(15)           not null unique,
    constraint pk_cor primary key (COD_COR)
);

-- ============================================================
--   Table : TIPO
-- ============================================================
create table TIPO
(
    COD_TIPO              NUMERIC(3)            not null,
    DSC_TIPO              VARCHAR(15)           not null unique,
    constraint pk_tipo primary key (COD_TIPO)
);

-- ============================================================
--   Table : MODELO
-- ============================================================
create table MODELO
(
    COD_MODELO            NUMERIC(3)            not null,
    DSC_MODELO            VARCHAR(15)           not null unique,
    constraint pk_modelo primary key (COD_MODELO)
);

-- ============================================================
--   Table : LOJA
-- ============================================================
create table LOJA
(
    COD_LOJA              NUMERIC(3)            not null,
    NOM_LOJA              VARCHAR(100)          not null,
    END_LOJA              VARCHAR(100)          not null,
    NOM_BAIRRO_LOJA       VARCHAR(50)           not null,
    constraint pk_loja primary key (COD_LOJA)
);

-- ============================================================
--   Table : OPCIONAL
-- ============================================================
create table OPCIONAL
(
    COD_OPCIONAL          NUMERIC(3)            not null,
    DSC_OPCIONAL          VARCHAR(30)           not null unique,
    constraint pk_opcional primary key (COD_OPCIONAL)
);

-- ============================================================
--   Table : TRANSMISSAO
-- ============================================================
create table TRANSMISSAO
(
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    DSC_TRANSMISSAO       VARCHAR(25)           not null unique,
    constraint pk_transmissao primary key (COD_TRANSMISSAO)
);

-- ============================================================
--   Table : MOTOR
-- ============================================================
create table MOTOR
(
    COD_MOTOR             NUMERIC(3)            not null,
    DSC_MOTOR             VARCHAR(10)           not null unique,
    constraint pk_motor primary key (COD_MOTOR)
);

-- ============================================================
--   Table : COMBUSTIVEL
-- ============================================================
create table COMBUSTIVEL
(
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    DSC_COMBUSTIVEL       VARCHAR(25)           not null unique,
    OBS_COMBUSTIVEL       VARCHAR(10)                  ,
    constraint pk_combustivel primary key (COD_COMBUSTIVEL)
);

-- ============================================================
--   Table : CARRO
-- ============================================================
create table CARRO
(
    COD_CARRO             NUMERIC(6)            not null,
    NOM_CARRO             VARCHAR2(25)          not null unique,
    COD_MARCA             NUMERIC(3)            not null,
    constraint pk_carro primary key (COD_CARRO)
);

-- ============================================================
--   Table : VEICULO
-- ============================================================
create table VEICULO
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_CARRO             NUMERIC(6)            not null,
    COD_MODELO            NUMERIC(3)            not null,
    COD_COR               NUMERIC(3)            not null,
    COD_TIPO              NUMERIC(3)            not null,
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    COD_MOTOR             NUMERIC(3)            not null,
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    COD_LOJA              NUMERIC(3)            not null,
    QTD_PORTAS            NUMERIC(1)            not null,
    ANO_FABRICACAO        NUMERIC(4)            not null,
    ANO_MODELO            NUMERIC(4)            not null,
    VAL_VEICULO           NUMERIC(11,2)         not null,
    KM_VEICULO            NUMERIC(7)                null,
    OBS_VEICULO           VARCHAR(100)              null,
    constraint pk_veiculo primary key (COD_PLACA)
);

-- ============================================================
--   Table : VEICULO_OPCIONAL
-- ============================================================
create table VEICULO_OPCIONAL
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_OPCIONAL          NUMERIC(3)            not null,
    constraint pk_veiculo_opc primary key (COD_PLACA, COD_OPCIONAL)
);

-- ============================================================
--   Table : LOJA_TELEFONE
-- ============================================================
create table LOJA_TELEFONE
(
    COD_LOJA              NUMERIC(3)            not null,
    COD_TELEFONE          NUMERIC(3)            not null,
    NUM_TELEFONE          NUMERIC(8)            not null,
    TPO_TELEFONE          VARCHAR(1)                    ,
    constraint pk_loja_telefone primary key (COD_LOJA, COD_TELEFONE)
);

alter table CARRO
    add constraint fk_car_mar foreign key (COD_MARCA)
       references MARCA (COD_MARCA);

alter table VEICULO
    add constraint fk_vei_car foreign key (COD_CARRO)
       references CARRO (COD_CARRO);

alter table VEICULO
    add constraint fk_vei_cor foreign key (COD_COR)
       references COR (COD_COR);

alter table VEICULO
    add constraint fk_vei_tip foreign key (COD_TIPO)
       references TIPO (COD_TIPO);

alter table VEICULO
    add constraint fk_vei_mod foreign key (COD_MODELO)
       references MODELO (COD_MODELO);

alter table VEICULO
    add constraint fk_vei_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

alter table VEICULO
    add constraint fk_vei_tra foreign key (COD_TRANSMISSAO)
       references TRANSMISSAO (COD_TRANSMISSAO);

alter table VEICULO
    add constraint fk_vei_mot foreign key (COD_MOTOR)
       references MOTOR (COD_MOTOR);

alter table VEICULO
    add constraint fk_vei_com foreign key (COD_COMBUSTIVEL)
       references COMBUSTIVEL (COD_COMBUSTIVEL);

alter table VEICULO_OPCIONAL
    add constraint fk1_veiopc_vei foreign key (COD_PLACA)
       references VEICULO (COD_PLACA);

alter table VEICULO_OPCIONAL
    add constraint fk2_veiopc_opc foreign key (COD_OPCIONAL)
       references OPCIONAL (COD_OPCIONAL);

alter table LOJA_TELEFONE
    add constraint fk1_lojtel_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

----------------------------------------------------------------
-- Inserir os dados nas tabelas
----------------------------------------------------------------
Insert into MARCA values( 1,  'Ford');
Insert into MARCA values( 2,  'Volkswagen');
Insert into MARCA values( 3,  'Fiat');
Insert into MARCA values( 4,  'Chevrolet');
Insert into MARCA values( 5,  'BMW');
Insert into MARCA values( 6,  'Mercedes-Benz');
Insert into MARCA values( 7,  'Audi');
Insert into MARCA values( 8,  'Toyota');
Insert into MARCA values( 9,  'Honda');
Insert into MARCA values( 10, 'Peugeot');
Insert into MARCA values( 11, 'Ferrari');
----------------------------------------------------------------------
Insert into COR values( 1,  'Preto');
Insert into COR values( 2,  'Branco');
Insert into COR values( 3,  'Vermelho');
Insert into COR values( 4,  'Amarelo');
Insert into COR values( 5,  'Cinza');
Insert into COR values( 6,  'Prata');
Insert into COR values( 7,  'Azul');
Insert into COR values( 8,  'Verde');
Insert into COR values( 9,  'Bege');
----------------------------------------------------------------------
Insert into TIPO values( 1, 'Passeio');
Insert into TIPO values( 2, 'Utilit rio');
----------------------------------------------------------------------
Insert into MODELO values( 1,  'GT');
Insert into MODELO values( 2,  'GTS');
Insert into MODELO values( 3,  'GTI');
Insert into MODELO values( 4,  'GL');
Insert into MODELO values( 5,  'COPA');
Insert into MODELO values( 6,  'XL');
Insert into MODELO values( 7,  'GLS');
Insert into MODELO values( 8,  'XLT');
Insert into MODELO values( 9,  'DLX');
Insert into MODELO values( 10, 'XLS');
Insert into MODELO values( 11, 'LIFE');
Insert into MODELO values( 12, 'GLX');
Insert into MODELO values( 13, 'ELX');
Insert into MODELO values( 14, 'EX');
Insert into MODELO values( 15, 'HLX');
Insert into MODELO values( 16, 'Adventure');
Insert into MODELO values( 17, 'Stile');
Insert into MODELO values( 18, 'Sport');
Insert into MODELO values( 19, 'Fire');
Insert into MODELO values( 20, 'Elegance');
Insert into MODELO values( 21, 'Elite');
Insert into MODELO values( 22, 'Tropical');
Insert into MODELO values( 23, 'SS');
Insert into MODELO values( 24, 'GSI');
Insert into MODELO values( 25, 'Maxx');
Insert into MODELO values( 26, 'Joy');
Insert into MODELO values( 27, 'Plus');
Insert into MODELO values( 28, 'City');
Insert into MODELO values( 29, 'Sportline');
Insert into MODELO values( 30, 'Supersurf');
Insert into MODELO values( 31, 'CL');
Insert into MODELO values( 32, 'Confortline');
Insert into MODELO values( 33, 'Connect');
Insert into MODELO values( 34, 'Abarth');
Insert into MODELO values( 35, 'Spirit');
Insert into MODELO values( 36, 'CD');
----------------------------------------------------------------------
Insert into LOJA values( 1, 'Guarulhos - Centro', 'Av. Tiradentes, n  321', 'Centro');
Insert into LOJA values( 2, 'Guarulhos - Dutra',  'Via Dutra, km 98', 'Cecap');
Insert into LOJA values( 3, 'Sao Caetano',        'Av. Goi s, n  354', 'Centro');
Insert into LOJA values( 4, 'Tatuape',            'R. Analia Franco, n  73', 'Analia Franco');
----------------------------------------------------------------------
Insert into LOJA_TELEFONE values( 1, 1, 64090909, 'C');
Insert into LOJA_TELEFONE values( 1, 2, 64090808, 'C');
Insert into LOJA_TELEFONE values( 1, 3, 64091010, 'F');
Insert into LOJA_TELEFONE values( 2, 1, 64641234, 'C');
Insert into LOJA_TELEFONE values( 2, 2, 64641235, 'F');
Insert into LOJA_TELEFONE values( 3, 1, 32645689, 'C');
Insert into LOJA_TELEFONE values( 3, 2, 32645690, 'F');
Insert into LOJA_TELEFONE values( 4, 1, 69742558, 'C');
Insert into LOJA_TELEFONE values( 4, 2, 69742560, 'F');
----------------------------------------------------------------------
Insert into OPCIONAL values( 1,  'Ar condicionado manual');
Insert into OPCIONAL values( 2,  'Vidro eletrico');
Insert into OPCIONAL values( 3,  'Trava eletrica');
Insert into OPCIONAL values( 4,  'Teto solar');
Insert into OPCIONAL values( 5,  'Retrovisor eletrico');
Insert into OPCIONAL values( 6,  'Air bag motorista');
Insert into OPCIONAL values( 7,  'Air bag passageiro');
Insert into OPCIONAL values( 8,  'Air bag cortina');
Insert into OPCIONAL values( 9,  'Dire  o hidraulica');
Insert into OPCIONAL values( 10, 'Freios ABS - dianteiro');
Insert into OPCIONAL values( 11, 'Freios ABS - traseiro');
Insert into OPCIONAL values( 12, 'Ar condicionado digital');
Insert into OPCIONAL values( 13, 'Teto solar - sky window');
Insert into OPCIONAL values( 14, 'Rodas de liga leve aro 15');
Insert into OPCIONAL values( 15, 'Rodas de liga leve aro 16');
Insert into OPCIONAL values( 16, 'Rodas de liga leve aro 17');
Insert into OPCIONAL values( 17, 'Computador de bordo');
Insert into OPCIONAL values( 18, 'Desemba ador traseiro');
Insert into OPCIONAL values( 19, 'Farol de milha');
Insert into OPCIONAL values( 20, 'Farol de neblina');
Insert into OPCIONAL values( 21, '4x4');
Insert into OPCIONAL values( 22, 'Rodas de liga leve aro 18');
Insert into OPCIONAL values( 23, 'Bancos de couro');
Insert into OPCIONAL values( 24, 'Teto solar panoromico');
Insert into OPCIONAL values( 25, 'Far is Xenon');
----------------------------------------------------------------------
Insert into TRANSMISSAO values( 'M', 'Mec nica');
Insert into TRANSMISSAO values( 'A', 'Automotica');
Insert into TRANSMISSAO values( 'T', 'Automotica - Tiptronic');
Insert into TRANSMISSAO values( 'S', 'Automotica - Steptronic');
----------------------------------------------------------------------
Insert into MOTOR values( 1,  '1.0 8V');
Insert into MOTOR values( 2,  '1.6 8V');
Insert into MOTOR values( 3,  '1.7');
Insert into MOTOR values( 4,  '1.8 8V');
Insert into MOTOR values( 5,  '2.0 8V');
Insert into MOTOR values( 6,  '2.2');
Insert into MOTOR values( 7,  '2.4');
Insert into MOTOR values( 8,  '2.8');
Insert into MOTOR values( 9,  '3.0');
Insert into MOTOR values( 10, '4.0');
Insert into MOTOR values( 11, '4.1');
Insert into MOTOR values( 12, '1.0 16V');
Insert into MOTOR values( 13, '1.8 16V');
Insert into MOTOR values( 14, '1.8T 20V');
Insert into MOTOR values( 15,  '2.0 16V');
Insert into MOTOR values( 16,  '4.2 TB');
Insert into MOTOR values( 17,  '1.6 16V');
Insert into MOTOR values( 18,  '2.4 20V');
Insert into MOTOR values( 19,  '4.3 V6');
Insert into MOTOR values( 20,  '3.8 V6');
Insert into MOTOR values( 21,  '1.9');
----------------------------------------------------------------------
Insert into COMBUSTIVEL values( 1, 'Gasolina', null);
Insert into COMBUSTIVEL values( 2, ' lcool', null);
Insert into COMBUSTIVEL values( 3, 'Diesel', null);
Insert into COMBUSTIVEL values( 4, 'Flex - Gasolina/ lcool', null);
Insert into COMBUSTIVEL values( 5, 'Gas', null);
Insert into COMBUSTIVEL values( 6, 'Gasolina/G s', null);
----------------------------------------------------------------------
Insert into CARRO values( 1,  'Gol',     2);
Insert into CARRO values( 2,  'Fox',     2);
Insert into CARRO values( 3,  'Polo',    2);
Insert into CARRO values( 4,  'Fusca',   2);
Insert into CARRO values( 5,  'Passat',  2);
Insert into CARRO values( 6,  'Saveiro', 2);
Insert into CARRO values( 7,  'Parati',  2);
Insert into CARRO values( 8,  'Bora',    2);
Insert into CARRO values( 9,  'Golf',    2);
Insert into CARRO values( 10, 'Santana', 2);
Insert into CARRO values( 11, 'Kombi',   2);
Insert into CARRO values( 90, 'Crossfox',   2);

Insert into CARRO values( 12, 'Courier',                 1);
Insert into CARRO values( 13, 'Ecosport',                1);
Insert into CARRO values( 14, 'F-250 - cabine simples',  1);
Insert into CARRO values( 15, 'F-250 - cabine dupla',    1);
Insert into CARRO values( 16, 'Fiesta',                  1);
Insert into CARRO values( 17, 'Focus hatch',             1);
Insert into CARRO values( 18, 'Focus sedan',             1);
Insert into CARRO values( 19, 'Ka',                      1);
Insert into CARRO values( 20, 'Ranger - cabine simples', 1);
Insert into CARRO values( 21, 'Ranger - cabine dupla',   1);

Insert into CARRO values( 22, 'Uno',           3);
Insert into CARRO values( 23, 'Palio',         3);
Insert into CARRO values( 24, 'Palio weekend', 3);
Insert into CARRO values( 25, 'Fiorino',       3);
Insert into CARRO values( 26, 'Marea',         3);
Insert into CARRO values( 27, 'Marea weekend', 3);
Insert into CARRO values( 28, 'Siena',         3);
Insert into CARRO values( 29, 'Stilo',         3);
Insert into CARRO values( 30, 'Strada',        3);

Insert into CARRO values( 31, 'Astra hatch',          4);
Insert into CARRO values( 32, 'Astra sedan',          4);
Insert into CARRO values( 33, 'Vectra',               4);
Insert into CARRO values( 34, 'Blazer',               4);
Insert into CARRO values( 35, 'Celta',                4);
Insert into CARRO values( 36, 'Corsa hatch',          4);
Insert into CARRO values( 37, 'Corsa sedan',          4);
Insert into CARRO values( 38, 'Meriva',               4);
Insert into CARRO values( 39, 'Montana',              4);
Insert into CARRO values( 40, 'Omega',                4);
Insert into CARRO values( 41, 'S10 - cabine simples', 4);
Insert into CARRO values( 42, 'S10 - cabine dupla',   4);
Insert into CARRO values( 43, 'Monza',                4);
Insert into CARRO values( 44, 'Zafira',               4);

Insert into CARRO values( 45, 'Serie 1',             5);
Insert into CARRO values( 46, 'Serie 3 - coup ',     5);
Insert into CARRO values( 47, 'Serie 3 - sedan',     5);
Insert into CARRO values( 48, 'Serie 5 - sedan',     5);
Insert into CARRO values( 49, 'Serie 6 - cabriolet', 5);
Insert into CARRO values( 50, 'Serie 6 - coup ',     5);
Insert into CARRO values( 51, 'Serie 7 - sedan',     5);
Insert into CARRO values( 52, 'X3',                  5);
Insert into CARRO values( 53, 'X5',                  5);
Insert into CARRO values( 54, 'Z3',                  5);
Insert into CARRO values( 55, 'Z4',                  5);

Insert into CARRO values( 56, 'Classe A',           6);
Insert into CARRO values( 57, 'Classe C',           6);
Insert into CARRO values( 58, 'Classe C - touring', 6);
Insert into CARRO values( 59, 'Classe E',           6);
Insert into CARRO values( 60, 'Classe E - touring', 6);
Insert into CARRO values( 61, 'CLK',                6);
Insert into CARRO values( 62, 'SLK',                6);

Insert into CARRO values( 64, 'A3',         7);
Insert into CARRO values( 65, 'A4',         7);
Insert into CARRO values( 66, 'A4 - avant', 7);
Insert into CARRO values( 67, 'A6',         7);
Insert into CARRO values( 68, 'A6 - avant', 7);
Insert into CARRO values( 69, 'S3',         7);
Insert into CARRO values( 70, 'TT',         7);

Insert into CARRO values( 71, 'Camry',                  8);
Insert into CARRO values( 72, 'Corolla',                8);
Insert into CARRO values( 73, 'Corolla Fielder',        8);
Insert into CARRO values( 74, 'Hilux - cabine simples', 8);
Insert into CARRO values( 75, 'Hilux - cabine dupla',   8);
Insert into CARRO values( 76, 'Hilux SW4',              8);
Insert into CARRO values( 77, 'Rav4',                   8);

Insert into CARRO values( 78, 'Accord', 9);
Insert into CARRO values( 79, 'Civic',  9);
Insert into CARRO values( 80, 'Fit',    9);

Insert into CARRO values( 81, '206 - hatch', 10);
Insert into CARRO values( 82, '206 - SW',    10);
Insert into CARRO values( 83, '306 - break', 10);
Insert into CARRO values( 84, '306 - hatch', 10);
Insert into CARRO values( 85, '307 - hatch', 10);
Insert into CARRO values( 86, '307 - SW',    10);
Insert into CARRO values( 87, '307 - sedan', 10);

Insert into CARRO values( 88, 'F40', 11);
Insert into CARRO values( 89, '360 Modena', 11);
----------------------------------------------------------------------
---                        ( PLACA       CARRO   MODELO   COR   TIPO   TRANSMISSAO   MOTOR   COMBUSTIVEL   LOJA   PORTAS   A_FABR   A_MOD   VALOR   KM      Obs
Insert into VEICULO values( 'AAA-1111', 1,      1,       1,    1,     'M',          2,      1,            1,     2,       1990,    1990,    4300,  120452, null);
Insert into VEICULO values( 'AAA-1112', 1,      3,       7,    1,     'M',          5,      1,            1,     2,       1992,    1993,    7250,  136986, null);
Insert into VEICULO values( 'AAA-1113', 1,      5,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   31750,   10502, null);
Insert into VEICULO values( 'AAA-1114', 1,      27,      3,    1,     'M',          12,     4,            1,     4,       2003,    2004,   17500,   20521, null);
Insert into VEICULO values( 'AAA-1115', 2,      28,      3,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23500,   27900, null);
Insert into VEICULO values( 'AAA-1116', 2,      28,      1,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23000,    8000, null);
Insert into VEICULO values( 'AAA-1117', 2,      29,      1,    1,     'M',          2,      4,            1,     4,       2004,    2004,   32900,   18478, null);
Insert into VEICULO values( 'AAA-1118', 2,      27,      6,    1,     'M',          2,      4,            1,     2,       2004,    2004,   29000,   35819, null);
Insert into VEICULO values( 'AAA-1119', 6,      30,      3,    1,     'M',          2,      4,            1,     2,       2005,    2005,   37000,   12000, null);
Insert into VEICULO values( 'AAA-1120', 6,      31,      1,    1,     'M',          2,      1,            1,     2,       1999,    1999,   16000,   91000, null);
Insert into VEICULO values( 'AAA-1121', 9,      32,      3,    1,     'M',          5,      1,            1,     2,       2000,    2000,   32000,   79000, null);
Insert into VEICULO values( 'AAA-1122', 9,      3,       3,    1,     'M',          14,     1,            1,     2,       2000,    2001,   39000,   41000, null);
Insert into VEICULO values( 'AAA-1123', 13,     10,      1,    1,     'M',          2,      1,            1,     4,       2003,    2004,   39000,   53800, null);
Insert into VEICULO values( 'AAA-1124', 13,     6,       3,    1,     'M',          2,      1,            1,     4,       2004,    2004,   40000,   20000, null);
Insert into VEICULO values( 'AAA-1125', 13,     8,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   53000,    8000, null);
Insert into VEICULO values( 'AAA-1126', 14,     8,       1,    2,     'M',          16,     3,            1,     2,       2003,    2004,   59000,   99300, null);
Insert into VEICULO values( 'AAA-1127', 15,     8,       5,    2,     'M',          16,     3,            1,     4,       2005,    2005,   79000,   21000, null);
Insert into VEICULO values( 'AAA-1128', 17,     12,      6,    1,     'M',          15,     1,            1,     4,       2004,    2005,   48900,    8000, null);
Insert into VEICULO values( 'AAA-1129', 21,     8,       1,    2,     'M',          10,     1,            1,     4,       2001,    2002,   47000,   99900, null);
Insert into VEICULO values( 'AAA-1130', 24,     17,      3,    2,     'M',          17,     1,            1,     4,       2001,    2001,   16800,  110900, null);
Insert into VEICULO values( 'AAA-1131', 24,     16,      6,    2,     'M',          17,     4,            1,     4,       2005,    2005,   36800,   40500, null);
Insert into VEICULO values( 'AAA-1132', 29,     33,      6,    1,     'M',          4,      1,            1,     4,       2003,    2004,   32900,   51000, null);
Insert into VEICULO values( 'AAA-1133', 29,     34,      6,    1,     'M',          18,     1,            1,     4,       2004,    2004,   49900,  31000, null);
Insert into VEICULO values( 'AAA-1134', 31,     20,      1,    1,     'M',          5,      1,            1,     2,       2005,    2005,   41900,  25000, null);
Insert into VEICULO values( 'AAA-1135', 31,     20,      6,    1,     'M',          5,      1,            1,     4,       2003,    2003,   34600,  61000, null);
Insert into VEICULO values( 'AAA-1136', 31,     24,      3,    1,     'A',          15,     1,            1,     4,       2003,    2004,   45900,  21200, null);
Insert into VEICULO values( 'AAA-1137', 31,     21,      1,    1,     'M',          5,      4,            1,     4,       2005,    2005,   53200,  14000, null);
Insert into VEICULO values( 'AAA-1138', 32,     21,      5,    1,     'A',          5,      4,            1,     4,       2005,    2005,   54300,  16000, null);
Insert into VEICULO values( 'AAA-1139', 32,     20,      6,    1,     'M',          5,      4,            1,     4,       2004,    2005,   40700,  46000, null);
Insert into VEICULO values( 'AAA-1140', 33,     4,       6,    1,     'M',          6,      1,            1,     4,       1999,    2000,   27900,  80000, null);
Insert into VEICULO values( 'AAA-1141', 33,     20,      6,    1,     'M',          5,      4,            1,     4,       2006,    2006,   59700,  0,     null);
Insert into VEICULO values( 'AAA-1142', 33,     21,      1,    1,     'A',          7,      4,            1,     4,       2006,    2006,   74700,  0,     null);
Insert into VEICULO values( 'AAA-1143', 34,     9,       6,    2,     'M',          19,     6,            1,     4,       1998,    1998,   26700,  99000, null);
Insert into VEICULO values( 'AAA-1144', 35,     11,      6,    1,     'M',          1,      1,            1,     2,       2005,    2005,   17000,  29000, null);
Insert into VEICULO values( 'AAA-1145', 35,     11,      1,    1,     'M',          1,      1,            1,     4,       2004,    2005,   18700,  26000, null);
Insert into VEICULO values( 'AAA-1146', 35,     35,      7,    1,     'M',          1,      1,            1,     2,       2005,    2005,   23500,  35600, null);
Insert into VEICULO values( 'AAA-1147', 36,     26,      3,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30500,  20000, null);
Insert into VEICULO values( 'AAA-1148', 36,     25,      6,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30800,  18000, null);
Insert into VEICULO values( 'AAA-1149', 36,     25,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   36700,  6000,  null);
Insert into VEICULO values( 'AAA-1150', 36,     23,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   40700,  7000,  null);
Insert into VEICULO values( 'AAA-1151', 37,     4,       1,    1,     'M',          2,      1,            1,     4,       1998,    1998,   17000,  80000, null);
Insert into VEICULO values( 'AAA-1152', 38,     25,      5,    1,     'M',          4,      4,            1,     4,       2005,    2005,   40900,  26000, null);
Insert into VEICULO values( 'AAA-1153', 39,     18,      6,    2,     'M',          4,      4,            1,     4,       2005,    2005,   33900,  25000, null);
Insert into VEICULO values( 'AAA-1154', 40,     36,      6,    1,     'M',          20,     1,            1,     4,       1999,    2000,   43000,  78000, null);
Insert into VEICULO values( 'AAA-1155', 44,     21,      1,    1,     'A',          15,     1,            1,     4,       2004,    2005,   59700,  39000, null);
Insert into VEICULO values( 'AAA-1156', 52,     18,      1,    2,     'S',          9,      1,            1,     4,       2004,    2005,   235000, 31000, null);
Insert into VEICULO values( 'AAA-1157', 56,     20,      5,    1,     'A',          21,     1,            1,     4,       2002,    2003,   37500,  28000, null);

Insert into VEICULO_OPCIONAL values( 'AAA-1112', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1114', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 13);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 8);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 11);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 22);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 24);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 25);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 20);

Commitcreate table MARCA
(
    COD_MARCA             NUMERIC(3)            not null,
    NOM_MARCA             VARCHAR(15)          not null unique,
    constraint pk_marca primary key (COD_MARCA)
);

-- ============================================================
--   Table : COR
-- ============================================================
create table COR
(
    COD_COR               NUMERIC(3)            not null,
    NOM_COR               VARCHAR(15)           not null unique,
    constraint pk_cor primary key (COD_COR)
);

-- ============================================================
--   Table : TIPO
-- ============================================================
create table TIPO
(
    COD_TIPO              NUMERIC(3)            not null,
    DSC_TIPO              VARCHAR(15)           not null unique,
    constraint pk_tipo primary key (COD_TIPO)
);

-- ============================================================
--   Table : MODELO
-- ============================================================
create table MODELO
(
    COD_MODELO            NUMERIC(3)            not null,
    DSC_MODELO            VARCHAR(15)           not null unique,
    constraint pk_modelo primary key (COD_MODELO)
);

-- ============================================================
--   Table : LOJA
-- ============================================================
create table LOJA
(
    COD_LOJA              NUMERIC(3)            not null,
    NOM_LOJA              VARCHAR(100)          not null,
    END_LOJA              VARCHAR(100)          not null,
    NOM_BAIRRO_LOJA       VARCHAR(50)           not null,
    constraint pk_loja primary key (COD_LOJA)
);

-- ============================================================
--   Table : OPCIONAL
-- ============================================================
create table OPCIONAL
(
    COD_OPCIONAL          NUMERIC(3)            not null,
    DSC_OPCIONAL          VARCHAR(30)           not null unique,
    constraint pk_opcional primary key (COD_OPCIONAL)
);

-- ============================================================
--   Table : TRANSMISSAO
-- ============================================================
create table TRANSMISSAO
(
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    DSC_TRANSMISSAO       VARCHAR(25)           not null unique,
    constraint pk_transmissao primary key (COD_TRANSMISSAO)
);

-- ============================================================
--   Table : MOTOR
-- ============================================================
create table MOTOR
(
    COD_MOTOR             NUMERIC(3)            not null,
    DSC_MOTOR             VARCHAR(10)           not null unique,
    constraint pk_motor primary key (COD_MOTOR)
);

-- ============================================================
--   Table : COMBUSTIVEL
-- ============================================================
create table COMBUSTIVEL
(
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    DSC_COMBUSTIVEL       VARCHAR(25)           not null unique,
    OBS_COMBUSTIVEL       VARCHAR(10)                  ,
    constraint pk_combustivel primary key (COD_COMBUSTIVEL)
);

-- ============================================================
--   Table : CARRO
-- ============================================================
create table CARRO
(
    COD_CARRO             NUMERIC(6)            not null,
    NOM_CARRO             VARCHAR2(25)          not null unique,
    COD_MARCA             NUMERIC(3)            not null,
    constraint pk_carro primary key (COD_CARRO)
);

-- ============================================================
--   Table : VEICULO
-- ============================================================
create table VEICULO
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_CARRO             NUMERIC(6)            not null,
    COD_MODELO            NUMERIC(3)            not null,
    COD_COR               NUMERIC(3)            not null,
    COD_TIPO              NUMERIC(3)            not null,
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    COD_MOTOR             NUMERIC(3)            not null,
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    COD_LOJA              NUMERIC(3)            not null,
    QTD_PORTAS            NUMERIC(1)            not null,
    ANO_FABRICACAO        NUMERIC(4)            not null,
    ANO_MODELO            NUMERIC(4)            not null,
    VAL_VEICULO           NUMERIC(11,2)         not null,
    KM_VEICULO            NUMERIC(7)                null,
    OBS_VEICULO           VARCHAR(100)              null,
    constraint pk_veiculo primary key (COD_PLACA)
);

-- ============================================================
--   Table : VEICULO_OPCIONAL
-- ============================================================
create table VEICULO_OPCIONAL
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_OPCIONAL          NUMERIC(3)            not null,
    constraint pk_veiculo_opc primary key (COD_PLACA, COD_OPCIONAL)
);

-- ============================================================
--   Table : LOJA_TELEFONE
-- ============================================================
create table LOJA_TELEFONE
(
    COD_LOJA              NUMERIC(3)            not null,
    COD_TELEFONE          NUMERIC(3)            not null,
    NUM_TELEFONE          NUMERIC(8)            not null,
    TPO_TELEFONE          VARCHAR(1)                    ,
    constraint pk_loja_telefone primary key (COD_LOJA, COD_TELEFONE)
);

alter table CARRO
    add constraint fk_car_mar foreign key (COD_MARCA)
       references MARCA (COD_MARCA);

alter table VEICULO
    add constraint fk_vei_car foreign key (COD_CARRO)
       references CARRO (COD_CARRO);

alter table VEICULO
    add constraint fk_vei_cor foreign key (COD_COR)
       references COR (COD_COR);

alter table VEICULO
    add constraint fk_vei_tip foreign key (COD_TIPO)
       references TIPO (COD_TIPO);

alter table VEICULO
    add constraint fk_vei_mod foreign key (COD_MODELO)
       references MODELO (COD_MODELO);

alter table VEICULO
    add constraint fk_vei_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

alter table VEICULO
    add constraint fk_vei_tra foreign key (COD_TRANSMISSAO)
       references TRANSMISSAO (COD_TRANSMISSAO);

alter table VEICULO
    add constraint fk_vei_mot foreign key (COD_MOTOR)
       references MOTOR (COD_MOTOR);

alter table VEICULO
    add constraint fk_vei_com foreign key (COD_COMBUSTIVEL)
       references COMBUSTIVEL (COD_COMBUSTIVEL);

alter table VEICULO_OPCIONAL
    add constraint fk1_veiopc_vei foreign key (COD_PLACA)
       references VEICULO (COD_PLACA);

alter table VEICULO_OPCIONAL
    add constraint fk2_veiopc_opc foreign key (COD_OPCIONAL)
       references OPCIONAL (COD_OPCIONAL);

alter table LOJA_TELEFONE
    add constraint fk1_lojtel_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

----------------------------------------------------------------
-- Inserir os dados nas tabelas
----------------------------------------------------------------
Insert into MARCA values( 1,  'Ford');
Insert into MARCA values( 2,  'Volkswagen');
Insert into MARCA values( 3,  'Fiat');
Insert into MARCA values( 4,  'Chevrolet');
Insert into MARCA values( 5,  'BMW');
Insert into MARCA values( 6,  'Mercedes-Benz');
Insert into MARCA values( 7,  'Audi');
Insert into MARCA values( 8,  'Toyota');
Insert into MARCA values( 9,  'Honda');
Insert into MARCA values( 10, 'Peugeot');
Insert into MARCA values( 11, 'Ferrari');
----------------------------------------------------------------------
Insert into COR values( 1,  'Preto');
Insert into COR values( 2,  'Branco');
Insert into COR values( 3,  'Vermelho');
Insert into COR values( 4,  'Amarelo');
Insert into COR values( 5,  'Cinza');
Insert into COR values( 6,  'Prata');
Insert into COR values( 7,  'Azul');
Insert into COR values( 8,  'Verde');
Insert into COR values( 9,  'Bege');
----------------------------------------------------------------------
Insert into TIPO values( 1, 'Passeio');
Insert into TIPO values( 2, 'Utilit rio');
----------------------------------------------------------------------
Insert into MODELO values( 1,  'GT');
Insert into MODELO values( 2,  'GTS');
Insert into MODELO values( 3,  'GTI');
Insert into MODELO values( 4,  'GL');
Insert into MODELO values( 5,  'COPA');
Insert into MODELO values( 6,  'XL');
Insert into MODELO values( 7,  'GLS');
Insert into MODELO values( 8,  'XLT');
Insert into MODELO values( 9,  'DLX');
Insert into MODELO values( 10, 'XLS');
Insert into MODELO values( 11, 'LIFE');
Insert into MODELO values( 12, 'GLX');
Insert into MODELO values( 13, 'ELX');
Insert into MODELO values( 14, 'EX');
Insert into MODELO values( 15, 'HLX');
Insert into MODELO values( 16, 'Adventure');
Insert into MODELO values( 17, 'Stile');
Insert into MODELO values( 18, 'Sport');
Insert into MODELO values( 19, 'Fire');
Insert into MODELO values( 20, 'Elegance');
Insert into MODELO values( 21, 'Elite');
Insert into MODELO values( 22, 'Tropical');
Insert into MODELO values( 23, 'SS');
Insert into MODELO values( 24, 'GSI');
Insert into MODELO values( 25, 'Maxx');
Insert into MODELO values( 26, 'Joy');
Insert into MODELO values( 27, 'Plus');
Insert into MODELO values( 28, 'City');
Insert into MODELO values( 29, 'Sportline');
Insert into MODELO values( 30, 'Supersurf');
Insert into MODELO values( 31, 'CL');
Insert into MODELO values( 32, 'Confortline');
Insert into MODELO values( 33, 'Connect');
Insert into MODELO values( 34, 'Abarth');
Insert into MODELO values( 35, 'Spirit');
Insert into MODELO values( 36, 'CD');
----------------------------------------------------------------------
Insert into LOJA values( 1, 'Guarulhos - Centro', 'Av. Tiradentes, n  321', 'Centro');
Insert into LOJA values( 2, 'Guarulhos - Dutra',  'Via Dutra, km 98', 'Cecap');
Insert into LOJA values( 3, 'Sao Caetano',        'Av. Goi s, n  354', 'Centro');
Insert into LOJA values( 4, 'Tatuape',            'R. Analia Franco, n  73', 'Analia Franco');
----------------------------------------------------------------------
Insert into LOJA_TELEFONE values( 1, 1, 64090909, 'C');
Insert into LOJA_TELEFONE values( 1, 2, 64090808, 'C');
Insert into LOJA_TELEFONE values( 1, 3, 64091010, 'F');
Insert into LOJA_TELEFONE values( 2, 1, 64641234, 'C');
Insert into LOJA_TELEFONE values( 2, 2, 64641235, 'F');
Insert into LOJA_TELEFONE values( 3, 1, 32645689, 'C');
Insert into LOJA_TELEFONE values( 3, 2, 32645690, 'F');
Insert into LOJA_TELEFONE values( 4, 1, 69742558, 'C');
Insert into LOJA_TELEFONE values( 4, 2, 69742560, 'F');
----------------------------------------------------------------------
Insert into OPCIONAL values( 1,  'Ar condicionado manual');
Insert into OPCIONAL values( 2,  'Vidro eletrico');
Insert into OPCIONAL values( 3,  'Trava eletrica');
Insert into OPCIONAL values( 4,  'Teto solar');
Insert into OPCIONAL values( 5,  'Retrovisor eletrico');
Insert into OPCIONAL values( 6,  'Air bag motorista');
Insert into OPCIONAL values( 7,  'Air bag passageiro');
Insert into OPCIONAL values( 8,  'Air bag cortina');
Insert into OPCIONAL values( 9,  'Dire  o hidraulica');
Insert into OPCIONAL values( 10, 'Freios ABS - dianteiro');
Insert into OPCIONAL values( 11, 'Freios ABS - traseiro');
Insert into OPCIONAL values( 12, 'Ar condicionado digital');
Insert into OPCIONAL values( 13, 'Teto solar - sky window');
Insert into OPCIONAL values( 14, 'Rodas de liga leve aro 15');
Insert into OPCIONAL values( 15, 'Rodas de liga leve aro 16');
Insert into OPCIONAL values( 16, 'Rodas de liga leve aro 17');
Insert into OPCIONAL values( 17, 'Computador de bordo');
Insert into OPCIONAL values( 18, 'Desemba ador traseiro');
Insert into OPCIONAL values( 19, 'Farol de milha');
Insert into OPCIONAL values( 20, 'Farol de neblina');
Insert into OPCIONAL values( 21, '4x4');
Insert into OPCIONAL values( 22, 'Rodas de liga leve aro 18');
Insert into OPCIONAL values( 23, 'Bancos de couro');
Insert into OPCIONAL values( 24, 'Teto solar panoromico');
Insert into OPCIONAL values( 25, 'Far is Xenon');
----------------------------------------------------------------------
Insert into TRANSMISSAO values( 'M', 'Mec nica');
Insert into TRANSMISSAO values( 'A', 'Automotica');
Insert into TRANSMISSAO values( 'T', 'Automotica - Tiptronic');
Insert into TRANSMISSAO values( 'S', 'Automotica - Steptronic');
----------------------------------------------------------------------
Insert into MOTOR values( 1,  '1.0 8V');
Insert into MOTOR values( 2,  '1.6 8V');
Insert into MOTOR values( 3,  '1.7');
Insert into MOTOR values( 4,  '1.8 8V');
Insert into MOTOR values( 5,  '2.0 8V');
Insert into MOTOR values( 6,  '2.2');
Insert into MOTOR values( 7,  '2.4');
Insert into MOTOR values( 8,  '2.8');
Insert into MOTOR values( 9,  '3.0');
Insert into MOTOR values( 10, '4.0');
Insert into MOTOR values( 11, '4.1');
Insert into MOTOR values( 12, '1.0 16V');
Insert into MOTOR values( 13, '1.8 16V');
Insert into MOTOR values( 14, '1.8T 20V');
Insert into MOTOR values( 15,  '2.0 16V');
Insert into MOTOR values( 16,  '4.2 TB');
Insert into MOTOR values( 17,  '1.6 16V');
Insert into MOTOR values( 18,  '2.4 20V');
Insert into MOTOR values( 19,  '4.3 V6');
Insert into MOTOR values( 20,  '3.8 V6');
Insert into MOTOR values( 21,  '1.9');
----------------------------------------------------------------------
Insert into COMBUSTIVEL values( 1, 'Gasolina', null);
Insert into COMBUSTIVEL values( 2, ' lcool', null);
Insert into COMBUSTIVEL values( 3, 'Diesel', null);
Insert into COMBUSTIVEL values( 4, 'Flex - Gasolina/ lcool', null);
Insert into COMBUSTIVEL values( 5, 'Gas', null);
Insert into COMBUSTIVEL values( 6, 'Gasolina/G s', null);
----------------------------------------------------------------------
Insert into CARRO values( 1,  'Gol',     2);
Insert into CARRO values( 2,  'Fox',     2);
Insert into CARRO values( 3,  'Polo',    2);
Insert into CARRO values( 4,  'Fusca',   2);
Insert into CARRO values( 5,  'Passat',  2);
Insert into CARRO values( 6,  'Saveiro', 2);
Insert into CARRO values( 7,  'Parati',  2);
Insert into CARRO values( 8,  'Bora',    2);
Insert into CARRO values( 9,  'Golf',    2);
Insert into CARRO values( 10, 'Santana', 2);
Insert into CARRO values( 11, 'Kombi',   2);
Insert into CARRO values( 90, 'Crossfox',   2);

Insert into CARRO values( 12, 'Courier',                 1);
Insert into CARRO values( 13, 'Ecosport',                1);
Insert into CARRO values( 14, 'F-250 - cabine simples',  1);
Insert into CARRO values( 15, 'F-250 - cabine dupla',    1);
Insert into CARRO values( 16, 'Fiesta',                  1);
Insert into CARRO values( 17, 'Focus hatch',             1);
Insert into CARRO values( 18, 'Focus sedan',             1);
Insert into CARRO values( 19, 'Ka',                      1);
Insert into CARRO values( 20, 'Ranger - cabine simples', 1);
Insert into CARRO values( 21, 'Ranger - cabine dupla',   1);

Insert into CARRO values( 22, 'Uno',           3);
Insert into CARRO values( 23, 'Palio',         3);
Insert into CARRO values( 24, 'Palio weekend', 3);
Insert into CARRO values( 25, 'Fiorino',       3);
Insert into CARRO values( 26, 'Marea',         3);
Insert into CARRO values( 27, 'Marea weekend', 3);
Insert into CARRO values( 28, 'Siena',         3);
Insert into CARRO values( 29, 'Stilo',         3);
Insert into CARRO values( 30, 'Strada',        3);

Insert into CARRO values( 31, 'Astra hatch',          4);
Insert into CARRO values( 32, 'Astra sedan',          4);
Insert into CARRO values( 33, 'Vectra',               4);
Insert into CARRO values( 34, 'Blazer',               4);
Insert into CARRO values( 35, 'Celta',                4);
Insert into CARRO values( 36, 'Corsa hatch',          4);
Insert into CARRO values( 37, 'Corsa sedan',          4);
Insert into CARRO values( 38, 'Meriva',               4);
Insert into CARRO values( 39, 'Montana',              4);
Insert into CARRO values( 40, 'Omega',                4);
Insert into CARRO values( 41, 'S10 - cabine simples', 4);
Insert into CARRO values( 42, 'S10 - cabine dupla',   4);
Insert into CARRO values( 43, 'Monza',                4);
Insert into CARRO values( 44, 'Zafira',               4);

Insert into CARRO values( 45, 'Serie 1',             5);
Insert into CARRO values( 46, 'Serie 3 - coup ',     5);
Insert into CARRO values( 47, 'Serie 3 - sedan',     5);
Insert into CARRO values( 48, 'Serie 5 - sedan',     5);
Insert into CARRO values( 49, 'Serie 6 - cabriolet', 5);
Insert into CARRO values( 50, 'Serie 6 - coup ',     5);
Insert into CARRO values( 51, 'Serie 7 - sedan',     5);
Insert into CARRO values( 52, 'X3',                  5);
Insert into CARRO values( 53, 'X5',                  5);
Insert into CARRO values( 54, 'Z3',                  5);
Insert into CARRO values( 55, 'Z4',                  5);

Insert into CARRO values( 56, 'Classe A',           6);
Insert into CARRO values( 57, 'Classe C',           6);
Insert into CARRO values( 58, 'Classe C - touring', 6);
Insert into CARRO values( 59, 'Classe E',           6);
Insert into CARRO values( 60, 'Classe E - touring', 6);
Insert into CARRO values( 61, 'CLK',                6);
Insert into CARRO values( 62, 'SLK',                6);

Insert into CARRO values( 64, 'A3',         7);
Insert into CARRO values( 65, 'A4',         7);
Insert into CARRO values( 66, 'A4 - avant', 7);
Insert into CARRO values( 67, 'A6',         7);
Insert into CARRO values( 68, 'A6 - avant', 7);
Insert into CARRO values( 69, 'S3',         7);
Insert into CARRO values( 70, 'TT',         7);

Insert into CARRO values( 71, 'Camry',                  8);
Insert into CARRO values( 72, 'Corolla',                8);
Insert into CARRO values( 73, 'Corolla Fielder',        8);
Insert into CARRO values( 74, 'Hilux - cabine simples', 8);
Insert into CARRO values( 75, 'Hilux - cabine dupla',   8);
Insert into CARRO values( 76, 'Hilux SW4',              8);
Insert into CARRO values( 77, 'Rav4',                   8);

Insert into CARRO values( 78, 'Accord', 9);
Insert into CARRO values( 79, 'Civic',  9);
Insert into CARRO values( 80, 'Fit',    9);

Insert into CARRO values( 81, '206 - hatch', 10);
Insert into CARRO values( 82, '206 - SW',    10);
Insert into CARRO values( 83, '306 - break', 10);
Insert into CARRO values( 84, '306 - hatch', 10);
Insert into CARRO values( 85, '307 - hatch', 10);
Insert into CARRO values( 86, '307 - SW',    10);
Insert into CARRO values( 87, '307 - sedan', 10);

Insert into CARRO values( 88, 'F40', 11);
Insert into CARRO values( 89, '360 Modena', 11);
----------------------------------------------------------------------
---                        ( PLACA       CARRO   MODELO   COR   TIPO   TRANSMISSAO   MOTOR   COMBUSTIVEL   LOJA   PORTAS   A_FABR   A_MOD   VALOR   KM      Obs
Insert into VEICULO values( 'AAA-1111', 1,      1,       1,    1,     'M',          2,      1,            1,     2,       1990,    1990,    4300,  120452, null);
Insert into VEICULO values( 'AAA-1112', 1,      3,       7,    1,     'M',          5,      1,            1,     2,       1992,    1993,    7250,  136986, null);
Insert into VEICULO values( 'AAA-1113', 1,      5,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   31750,   10502, null);
Insert into VEICULO values( 'AAA-1114', 1,      27,      3,    1,     'M',          12,     4,            1,     4,       2003,    2004,   17500,   20521, null);
Insert into VEICULO values( 'AAA-1115', 2,      28,      3,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23500,   27900, null);
Insert into VEICULO values( 'AAA-1116', 2,      28,      1,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23000,    8000, null);
Insert into VEICULO values( 'AAA-1117', 2,      29,      1,    1,     'M',          2,      4,            1,     4,       2004,    2004,   32900,   18478, null);
Insert into VEICULO values( 'AAA-1118', 2,      27,      6,    1,     'M',          2,      4,            1,     2,       2004,    2004,   29000,   35819, null);
Insert into VEICULO values( 'AAA-1119', 6,      30,      3,    1,     'M',          2,      4,            1,     2,       2005,    2005,   37000,   12000, null);
Insert into VEICULO values( 'AAA-1120', 6,      31,      1,    1,     'M',          2,      1,            1,     2,       1999,    1999,   16000,   91000, null);
Insert into VEICULO values( 'AAA-1121', 9,      32,      3,    1,     'M',          5,      1,            1,     2,       2000,    2000,   32000,   79000, null);
Insert into VEICULO values( 'AAA-1122', 9,      3,       3,    1,     'M',          14,     1,            1,     2,       2000,    2001,   39000,   41000, null);
Insert into VEICULO values( 'AAA-1123', 13,     10,      1,    1,     'M',          2,      1,            1,     4,       2003,    2004,   39000,   53800, null);
Insert into VEICULO values( 'AAA-1124', 13,     6,       3,    1,     'M',          2,      1,            1,     4,       2004,    2004,   40000,   20000, null);
Insert into VEICULO values( 'AAA-1125', 13,     8,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   53000,    8000, null);
Insert into VEICULO values( 'AAA-1126', 14,     8,       1,    2,     'M',          16,     3,            1,     2,       2003,    2004,   59000,   99300, null);
Insert into VEICULO values( 'AAA-1127', 15,     8,       5,    2,     'M',          16,     3,            1,     4,       2005,    2005,   79000,   21000, null);
Insert into VEICULO values( 'AAA-1128', 17,     12,      6,    1,     'M',          15,     1,            1,     4,       2004,    2005,   48900,    8000, null);
Insert into VEICULO values( 'AAA-1129', 21,     8,       1,    2,     'M',          10,     1,            1,     4,       2001,    2002,   47000,   99900, null);
Insert into VEICULO values( 'AAA-1130', 24,     17,      3,    2,     'M',          17,     1,            1,     4,       2001,    2001,   16800,  110900, null);
Insert into VEICULO values( 'AAA-1131', 24,     16,      6,    2,     'M',          17,     4,            1,     4,       2005,    2005,   36800,   40500, null);
Insert into VEICULO values( 'AAA-1132', 29,     33,      6,    1,     'M',          4,      1,            1,     4,       2003,    2004,   32900,   51000, null);
Insert into VEICULO values( 'AAA-1133', 29,     34,      6,    1,     'M',          18,     1,            1,     4,       2004,    2004,   49900,  31000, null);
Insert into VEICULO values( 'AAA-1134', 31,     20,      1,    1,     'M',          5,      1,            1,     2,       2005,    2005,   41900,  25000, null);
Insert into VEICULO values( 'AAA-1135', 31,     20,      6,    1,     'M',          5,      1,            1,     4,       2003,    2003,   34600,  61000, null);
Insert into VEICULO values( 'AAA-1136', 31,     24,      3,    1,     'A',          15,     1,            1,     4,       2003,    2004,   45900,  21200, null);
Insert into VEICULO values( 'AAA-1137', 31,     21,      1,    1,     'M',          5,      4,            1,     4,       2005,    2005,   53200,  14000, null);
Insert into VEICULO values( 'AAA-1138', 32,     21,      5,    1,     'A',          5,      4,            1,     4,       2005,    2005,   54300,  16000, null);
Insert into VEICULO values( 'AAA-1139', 32,     20,      6,    1,     'M',          5,      4,            1,     4,       2004,    2005,   40700,  46000, null);
Insert into VEICULO values( 'AAA-1140', 33,     4,       6,    1,     'M',          6,      1,            1,     4,       1999,    2000,   27900,  80000, null);
Insert into VEICULO values( 'AAA-1141', 33,     20,      6,    1,     'M',          5,      4,            1,     4,       2006,    2006,   59700,  0,     null);
Insert into VEICULO values( 'AAA-1142', 33,     21,      1,    1,     'A',          7,      4,            1,     4,       2006,    2006,   74700,  0,     null);
Insert into VEICULO values( 'AAA-1143', 34,     9,       6,    2,     'M',          19,     6,            1,     4,       1998,    1998,   26700,  99000, null);
Insert into VEICULO values( 'AAA-1144', 35,     11,      6,    1,     'M',          1,      1,            1,     2,       2005,    2005,   17000,  29000, null);
Insert into VEICULO values( 'AAA-1145', 35,     11,      1,    1,     'M',          1,      1,            1,     4,       2004,    2005,   18700,  26000, null);
Insert into VEICULO values( 'AAA-1146', 35,     35,      7,    1,     'M',          1,      1,            1,     2,       2005,    2005,   23500,  35600, null);
Insert into VEICULO values( 'AAA-1147', 36,     26,      3,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30500,  20000, null);
Insert into VEICULO values( 'AAA-1148', 36,     25,      6,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30800,  18000, null);
Insert into VEICULO values( 'AAA-1149', 36,     25,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   36700,  6000,  null);
Insert into VEICULO values( 'AAA-1150', 36,     23,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   40700,  7000,  null);
Insert into VEICULO values( 'AAA-1151', 37,     4,       1,    1,     'M',          2,      1,            1,     4,       1998,    1998,   17000,  80000, null);
Insert into VEICULO values( 'AAA-1152', 38,     25,      5,    1,     'M',          4,      4,            1,     4,       2005,    2005,   40900,  26000, null);
Insert into VEICULO values( 'AAA-1153', 39,     18,      6,    2,     'M',          4,      4,            1,     4,       2005,    2005,   33900,  25000, null);
Insert into VEICULO values( 'AAA-1154', 40,     36,      6,    1,     'M',          20,     1,            1,     4,       1999,    2000,   43000,  78000, null);
Insert into VEICULO values( 'AAA-1155', 44,     21,      1,    1,     'A',          15,     1,            1,     4,       2004,    2005,   59700,  39000, null);
Insert into VEICULO values( 'AAA-1156', 52,     18,      1,    2,     'S',          9,      1,            1,     4,       2004,    2005,   235000, 31000, null);
Insert into VEICULO values( 'AAA-1157', 56,     20,      5,    1,     'A',          21,     1,            1,     4,       2002,    2003,   37500,  28000, null);

Insert into VEICULO_OPCIONAL values( 'AAA-1112', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1114', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 13);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 8);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 11);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 22);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 24);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 25);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 20);

Commit;
Drop table MARCAS cascade constraints;
Drop table MARCA cascade constraints;
Drop table COR  cascade constraints;
Drop table TIPO cascade constraints;
Drop table MODELO cascade constraints;
Drop table LOJA cascade constraints;
Drop table OPCIONAL cascade constraints;
Drop table TRANSMISSAO cascade constraints;
Drop table MOTOR cascade constraints;
Drop table COMBUSTIVEL cascade constraints;
Drop table CARRO cascade constraints;
Drop table VEICULO cascade constraints;
Drop table VEICULO_OPCIONAL cascade constraints;
Drop table LOJA_TELEFONE cascade constraints;
Drop table MARCAS cascade constraints;
create table MARCA
(
    COD_MARCA             NUMERIC(3)            not null,
    NOM_MARCA             VARCHAR(15)          not null unique,
    constraint pk_marca primary key (COD_MARCA)
);

-- ============================================================
--   Table : COR
-- ============================================================
create table COR
(
    COD_COR               NUMERIC(3)            not null,
    NOM_COR               VARCHAR(15)           not null unique,
    constraint pk_cor primary key (COD_COR)
);

-- ============================================================
--   Table : TIPO
-- ============================================================
create table TIPO
(
    COD_TIPO              NUMERIC(3)            not null,
    DSC_TIPO              VARCHAR(15)           not null unique,
    constraint pk_tipo primary key (COD_TIPO)
);

-- ============================================================
--   Table : MODELO
-- ============================================================
create table MODELO
(
    COD_MODELO            NUMERIC(3)            not null,
    DSC_MODELO            VARCHAR(15)           not null unique,
    constraint pk_modelo primary key (COD_MODELO)
);

-- ============================================================
--   Table : LOJA
-- ============================================================
create table LOJA
(
    COD_LOJA              NUMERIC(3)            not null,
    NOM_LOJA              VARCHAR(100)          not null,
    END_LOJA              VARCHAR(100)          not null,
    NOM_BAIRRO_LOJA       VARCHAR(50)           not null,
    constraint pk_loja primary key (COD_LOJA)
);

-- ============================================================
--   Table : OPCIONAL
-- ============================================================
create table OPCIONAL
(
    COD_OPCIONAL          NUMERIC(3)            not null,
    DSC_OPCIONAL          VARCHAR(30)           not null unique,
    constraint pk_opcional primary key (COD_OPCIONAL)
);

-- ============================================================
--   Table : TRANSMISSAO
-- ============================================================
create table TRANSMISSAO
(
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    DSC_TRANSMISSAO       VARCHAR(25)           not null unique,
    constraint pk_transmissao primary key (COD_TRANSMISSAO)
);

-- ============================================================
--   Table : MOTOR
-- ============================================================
create table MOTOR
(
    COD_MOTOR             NUMERIC(3)            not null,
    DSC_MOTOR             VARCHAR(10)           not null unique,
    constraint pk_motor primary key (COD_MOTOR)
);

-- ============================================================
--   Table : COMBUSTIVEL
-- ============================================================
create table COMBUSTIVEL
(
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    DSC_COMBUSTIVEL       VARCHAR(25)           not null unique,
    OBS_COMBUSTIVEL       VARCHAR(10)                  ,
    constraint pk_combustivel primary key (COD_COMBUSTIVEL)
);

-- ============================================================
--   Table : CARRO
-- ============================================================
create table CARRO
(
    COD_CARRO             NUMERIC(6)            not null,
    NOM_CARRO             VARCHAR2(25)          not null unique,
    COD_MARCA             NUMERIC(3)            not null,
    constraint pk_carro primary key (COD_CARRO)
);

-- ============================================================
--   Table : VEICULO
-- ============================================================
create table VEICULO
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_CARRO             NUMERIC(6)            not null,
    COD_MODELO            NUMERIC(3)            not null,
    COD_COR               NUMERIC(3)            not null,
    COD_TIPO              NUMERIC(3)            not null,
    COD_TRANSMISSAO       VARCHAR(1)            not null,
    COD_MOTOR             NUMERIC(3)            not null,
    COD_COMBUSTIVEL       NUMERIC(3)            not null,
    COD_LOJA              NUMERIC(3)            not null,
    QTD_PORTAS            NUMERIC(1)            not null,
    ANO_FABRICACAO        NUMERIC(4)            not null,
    ANO_MODELO            NUMERIC(4)            not null,
    VAL_VEICULO           NUMERIC(11,2)         not null,
    KM_VEICULO            NUMERIC(7)                null,
    OBS_VEICULO           VARCHAR(100)              null,
    constraint pk_veiculo primary key (COD_PLACA)
);

-- ============================================================
--   Table : VEICULO_OPCIONAL
-- ============================================================
create table VEICULO_OPCIONAL
(
    COD_PLACA             VARCHAR(8)            not null,
    COD_OPCIONAL          NUMERIC(3)            not null,
    constraint pk_veiculo_opc primary key (COD_PLACA, COD_OPCIONAL)
);

-- ============================================================
--   Table : LOJA_TELEFONE
-- ============================================================
create table LOJA_TELEFONE
(
    COD_LOJA              NUMERIC(3)            not null,
    COD_TELEFONE          NUMERIC(3)            not null,
    NUM_TELEFONE          NUMERIC(8)            not null,
    TPO_TELEFONE          VARCHAR(1)                    ,
    constraint pk_loja_telefone primary key (COD_LOJA, COD_TELEFONE)
);

alter table CARRO
    add constraint fk_car_mar foreign key (COD_MARCA)
       references MARCA (COD_MARCA);

alter table VEICULO
    add constraint fk_vei_car foreign key (COD_CARRO)
       references CARRO (COD_CARRO);

alter table VEICULO
    add constraint fk_vei_cor foreign key (COD_COR)
       references COR (COD_COR);

alter table VEICULO
    add constraint fk_vei_tip foreign key (COD_TIPO)
       references TIPO (COD_TIPO);

alter table VEICULO
    add constraint fk_vei_mod foreign key (COD_MODELO)
       references MODELO (COD_MODELO);

alter table VEICULO
    add constraint fk_vei_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

alter table VEICULO
    add constraint fk_vei_tra foreign key (COD_TRANSMISSAO)
       references TRANSMISSAO (COD_TRANSMISSAO);

alter table VEICULO
    add constraint fk_vei_mot foreign key (COD_MOTOR)
       references MOTOR (COD_MOTOR);

alter table VEICULO
    add constraint fk_vei_com foreign key (COD_COMBUSTIVEL)
       references COMBUSTIVEL (COD_COMBUSTIVEL);

alter table VEICULO_OPCIONAL
    add constraint fk1_veiopc_vei foreign key (COD_PLACA)
       references VEICULO (COD_PLACA);

alter table VEICULO_OPCIONAL
    add constraint fk2_veiopc_opc foreign key (COD_OPCIONAL)
       references OPCIONAL (COD_OPCIONAL);

alter table LOJA_TELEFONE
    add constraint fk1_lojtel_loj foreign key (COD_LOJA)
       references LOJA (COD_LOJA);

----------------------------------------------------------------
-- Inserir os dados nas tabelas
----------------------------------------------------------------
Insert into MARCA values( 1,  'Ford');
Insert into MARCA values( 2,  'Volkswagen');
Insert into MARCA values( 3,  'Fiat');
Insert into MARCA values( 4,  'Chevrolet');
Insert into MARCA values( 5,  'BMW');
Insert into MARCA values( 6,  'Mercedes-Benz');
Insert into MARCA values( 7,  'Audi');
Insert into MARCA values( 8,  'Toyota');
Insert into MARCA values( 9,  'Honda');
Insert into MARCA values( 10, 'Peugeot');
Insert into MARCA values( 11, 'Ferrari');
----------------------------------------------------------------------
Insert into COR values( 1,  'Preto');
Insert into COR values( 2,  'Branco');
Insert into COR values( 3,  'Vermelho');
Insert into COR values( 4,  'Amarelo');
Insert into COR values( 5,  'Cinza');
Insert into COR values( 6,  'Prata');
Insert into COR values( 7,  'Azul');
Insert into COR values( 8,  'Verde');
Insert into COR values( 9,  'Bege');
----------------------------------------------------------------------
Insert into TIPO values( 1, 'Passeio');
Insert into TIPO values( 2, 'Utilit rio');
----------------------------------------------------------------------
Insert into MODELO values( 1,  'GT');
Insert into MODELO values( 2,  'GTS');
Insert into MODELO values( 3,  'GTI');
Insert into MODELO values( 4,  'GL');
Insert into MODELO values( 5,  'COPA');
Insert into MODELO values( 6,  'XL');
Insert into MODELO values( 7,  'GLS');
Insert into MODELO values( 8,  'XLT');
Insert into MODELO values( 9,  'DLX');
Insert into MODELO values( 10, 'XLS');
Insert into MODELO values( 11, 'LIFE');
Insert into MODELO values( 12, 'GLX');
Insert into MODELO values( 13, 'ELX');
Insert into MODELO values( 14, 'EX');
Insert into MODELO values( 15, 'HLX');
Insert into MODELO values( 16, 'Adventure');
Insert into MODELO values( 17, 'Stile');
Insert into MODELO values( 18, 'Sport');
Insert into MODELO values( 19, 'Fire');
Insert into MODELO values( 20, 'Elegance');
Insert into MODELO values( 21, 'Elite');
Insert into MODELO values( 22, 'Tropical');
Insert into MODELO values( 23, 'SS');
Insert into MODELO values( 24, 'GSI');
Insert into MODELO values( 25, 'Maxx');
Insert into MODELO values( 26, 'Joy');
Insert into MODELO values( 27, 'Plus');
Insert into MODELO values( 28, 'City');
Insert into MODELO values( 29, 'Sportline');
Insert into MODELO values( 30, 'Supersurf');
Insert into MODELO values( 31, 'CL');
Insert into MODELO values( 32, 'Confortline');
Insert into MODELO values( 33, 'Connect');
Insert into MODELO values( 34, 'Abarth');
Insert into MODELO values( 35, 'Spirit');
Insert into MODELO values( 36, 'CD');
----------------------------------------------------------------------
Insert into LOJA values( 1, 'Guarulhos - Centro', 'Av. Tiradentes, n  321', 'Centro');
Insert into LOJA values( 2, 'Guarulhos - Dutra',  'Via Dutra, km 98', 'Cecap');
Insert into LOJA values( 3, 'Sao Caetano',        'Av. Goi s, n  354', 'Centro');
Insert into LOJA values( 4, 'Tatuape',            'R. Analia Franco, n  73', 'Analia Franco');
----------------------------------------------------------------------
Insert into LOJA_TELEFONE values( 1, 1, 64090909, 'C');
Insert into LOJA_TELEFONE values( 1, 2, 64090808, 'C');
Insert into LOJA_TELEFONE values( 1, 3, 64091010, 'F');
Insert into LOJA_TELEFONE values( 2, 1, 64641234, 'C');
Insert into LOJA_TELEFONE values( 2, 2, 64641235, 'F');
Insert into LOJA_TELEFONE values( 3, 1, 32645689, 'C');
Insert into LOJA_TELEFONE values( 3, 2, 32645690, 'F');
Insert into LOJA_TELEFONE values( 4, 1, 69742558, 'C');
Insert into LOJA_TELEFONE values( 4, 2, 69742560, 'F');
----------------------------------------------------------------------
Insert into OPCIONAL values( 1,  'Ar condicionado manual');
Insert into OPCIONAL values( 2,  'Vidro eletrico');
Insert into OPCIONAL values( 3,  'Trava eletrica');
Insert into OPCIONAL values( 4,  'Teto solar');
Insert into OPCIONAL values( 5,  'Retrovisor eletrico');
Insert into OPCIONAL values( 6,  'Air bag motorista');
Insert into OPCIONAL values( 7,  'Air bag passageiro');
Insert into OPCIONAL values( 8,  'Air bag cortina');
Insert into OPCIONAL values( 9,  'Dire  o hidraulica');
Insert into OPCIONAL values( 10, 'Freios ABS - dianteiro');
Insert into OPCIONAL values( 11, 'Freios ABS - traseiro');
Insert into OPCIONAL values( 12, 'Ar condicionado digital');
Insert into OPCIONAL values( 13, 'Teto solar - sky window');
Insert into OPCIONAL values( 14, 'Rodas de liga leve aro 15');
Insert into OPCIONAL values( 15, 'Rodas de liga leve aro 16');
Insert into OPCIONAL values( 16, 'Rodas de liga leve aro 17');
Insert into OPCIONAL values( 17, 'Computador de bordo');
Insert into OPCIONAL values( 18, 'Desemba ador traseiro');
Insert into OPCIONAL values( 19, 'Farol de milha');
Insert into OPCIONAL values( 20, 'Farol de neblina');
Insert into OPCIONAL values( 21, '4x4');
Insert into OPCIONAL values( 22, 'Rodas de liga leve aro 18');
Insert into OPCIONAL values( 23, 'Bancos de couro');
Insert into OPCIONAL values( 24, 'Teto solar panoromico');
Insert into OPCIONAL values( 25, 'Far is Xenon');
----------------------------------------------------------------------
Insert into TRANSMISSAO values( 'M', 'Mec nica');
Insert into TRANSMISSAO values( 'A', 'Automotica');
Insert into TRANSMISSAO values( 'T', 'Automotica - Tiptronic');
Insert into TRANSMISSAO values( 'S', 'Automotica - Steptronic');
----------------------------------------------------------------------
Insert into MOTOR values( 1,  '1.0 8V');
Insert into MOTOR values( 2,  '1.6 8V');
Insert into MOTOR values( 3,  '1.7');
Insert into MOTOR values( 4,  '1.8 8V');
Insert into MOTOR values( 5,  '2.0 8V');
Insert into MOTOR values( 6,  '2.2');
Insert into MOTOR values( 7,  '2.4');
Insert into MOTOR values( 8,  '2.8');
Insert into MOTOR values( 9,  '3.0');
Insert into MOTOR values( 10, '4.0');
Insert into MOTOR values( 11, '4.1');
Insert into MOTOR values( 12, '1.0 16V');
Insert into MOTOR values( 13, '1.8 16V');
Insert into MOTOR values( 14, '1.8T 20V');
Insert into MOTOR values( 15,  '2.0 16V');
Insert into MOTOR values( 16,  '4.2 TB');
Insert into MOTOR values( 17,  '1.6 16V');
Insert into MOTOR values( 18,  '2.4 20V');
Insert into MOTOR values( 19,  '4.3 V6');
Insert into MOTOR values( 20,  '3.8 V6');
Insert into MOTOR values( 21,  '1.9');
----------------------------------------------------------------------
Insert into COMBUSTIVEL values( 1, 'Gasolina', null);
Insert into COMBUSTIVEL values( 2, ' lcool', null);
Insert into COMBUSTIVEL values( 3, 'Diesel', null);
Insert into COMBUSTIVEL values( 4, 'Flex - Gasolina/ lcool', null);
Insert into COMBUSTIVEL values( 5, 'Gas', null);
Insert into COMBUSTIVEL values( 6, 'Gasolina/G s', null);
----------------------------------------------------------------------
Insert into CARRO values( 1,  'Gol',     2);
Insert into CARRO values( 2,  'Fox',     2);
Insert into CARRO values( 3,  'Polo',    2);
Insert into CARRO values( 4,  'Fusca',   2);
Insert into CARRO values( 5,  'Passat',  2);
Insert into CARRO values( 6,  'Saveiro', 2);
Insert into CARRO values( 7,  'Parati',  2);
Insert into CARRO values( 8,  'Bora',    2);
Insert into CARRO values( 9,  'Golf',    2);
Insert into CARRO values( 10, 'Santana', 2);
Insert into CARRO values( 11, 'Kombi',   2);
Insert into CARRO values( 90, 'Crossfox',   2);

Insert into CARRO values( 12, 'Courier',                 1);
Insert into CARRO values( 13, 'Ecosport',                1);
Insert into CARRO values( 14, 'F-250 - cabine simples',  1);
Insert into CARRO values( 15, 'F-250 - cabine dupla',    1);
Insert into CARRO values( 16, 'Fiesta',                  1);
Insert into CARRO values( 17, 'Focus hatch',             1);
Insert into CARRO values( 18, 'Focus sedan',             1);
Insert into CARRO values( 19, 'Ka',                      1);
Insert into CARRO values( 20, 'Ranger - cabine simples', 1);
Insert into CARRO values( 21, 'Ranger - cabine dupla',   1);

Insert into CARRO values( 22, 'Uno',           3);
Insert into CARRO values( 23, 'Palio',         3);
Insert into CARRO values( 24, 'Palio weekend', 3);
Insert into CARRO values( 25, 'Fiorino',       3);
Insert into CARRO values( 26, 'Marea',         3);
Insert into CARRO values( 27, 'Marea weekend', 3);
Insert into CARRO values( 28, 'Siena',         3);
Insert into CARRO values( 29, 'Stilo',         3);
Insert into CARRO values( 30, 'Strada',        3);

Insert into CARRO values( 31, 'Astra hatch',          4);
Insert into CARRO values( 32, 'Astra sedan',          4);
Insert into CARRO values( 33, 'Vectra',               4);
Insert into CARRO values( 34, 'Blazer',               4);
Insert into CARRO values( 35, 'Celta',                4);
Insert into CARRO values( 36, 'Corsa hatch',          4);
Insert into CARRO values( 37, 'Corsa sedan',          4);
Insert into CARRO values( 38, 'Meriva',               4);
Insert into CARRO values( 39, 'Montana',              4);
Insert into CARRO values( 40, 'Omega',                4);
Insert into CARRO values( 41, 'S10 - cabine simples', 4);
Insert into CARRO values( 42, 'S10 - cabine dupla',   4);
Insert into CARRO values( 43, 'Monza',                4);
Insert into CARRO values( 44, 'Zafira',               4);

Insert into CARRO values( 45, 'Serie 1',             5);
Insert into CARRO values( 46, 'Serie 3 - coup ',     5);
Insert into CARRO values( 47, 'Serie 3 - sedan',     5);
Insert into CARRO values( 48, 'Serie 5 - sedan',     5);
Insert into CARRO values( 49, 'Serie 6 - cabriolet', 5);
Insert into CARRO values( 50, 'Serie 6 - coup ',     5);
Insert into CARRO values( 51, 'Serie 7 - sedan',     5);
Insert into CARRO values( 52, 'X3',                  5);
Insert into CARRO values( 53, 'X5',                  5);
Insert into CARRO values( 54, 'Z3',                  5);
Insert into CARRO values( 55, 'Z4',                  5);

Insert into CARRO values( 56, 'Classe A',           6);
Insert into CARRO values( 57, 'Classe C',           6);
Insert into CARRO values( 58, 'Classe C - touring', 6);
Insert into CARRO values( 59, 'Classe E',           6);
Insert into CARRO values( 60, 'Classe E - touring', 6);
Insert into CARRO values( 61, 'CLK',                6);
Insert into CARRO values( 62, 'SLK',                6);

Insert into CARRO values( 64, 'A3',         7);
Insert into CARRO values( 65, 'A4',         7);
Insert into CARRO values( 66, 'A4 - avant', 7);
Insert into CARRO values( 67, 'A6',         7);
Insert into CARRO values( 68, 'A6 - avant', 7);
Insert into CARRO values( 69, 'S3',         7);
Insert into CARRO values( 70, 'TT',         7);

Insert into CARRO values( 71, 'Camry',                  8);
Insert into CARRO values( 72, 'Corolla',                8);
Insert into CARRO values( 73, 'Corolla Fielder',        8);
Insert into CARRO values( 74, 'Hilux - cabine simples', 8);
Insert into CARRO values( 75, 'Hilux - cabine dupla',   8);
Insert into CARRO values( 76, 'Hilux SW4',              8);
Insert into CARRO values( 77, 'Rav4',                   8);

Insert into CARRO values( 78, 'Accord', 9);
Insert into CARRO values( 79, 'Civic',  9);
Insert into CARRO values( 80, 'Fit',    9);

Insert into CARRO values( 81, '206 - hatch', 10);
Insert into CARRO values( 82, '206 - SW',    10);
Insert into CARRO values( 83, '306 - break', 10);
Insert into CARRO values( 84, '306 - hatch', 10);
Insert into CARRO values( 85, '307 - hatch', 10);
Insert into CARRO values( 86, '307 - SW',    10);
Insert into CARRO values( 87, '307 - sedan', 10);

Insert into CARRO values( 88, 'F40', 11);
Insert into CARRO values( 89, '360 Modena', 11);
----------------------------------------------------------------------
---                        ( PLACA       CARRO   MODELO   COR   TIPO   TRANSMISSAO   MOTOR   COMBUSTIVEL   LOJA   PORTAS   A_FABR   A_MOD   VALOR   KM      Obs
Insert into VEICULO values( 'AAA-1111', 1,      1,       1,    1,     'M',          2,      1,            1,     2,       1990,    1990,    4300,  120452, null);
Insert into VEICULO values( 'AAA-1112', 1,      3,       7,    1,     'M',          5,      1,            1,     2,       1992,    1993,    7250,  136986, null);
Insert into VEICULO values( 'AAA-1113', 1,      5,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   31750,   10502, null);
Insert into VEICULO values( 'AAA-1114', 1,      27,      3,    1,     'M',          12,     4,            1,     4,       2003,    2004,   17500,   20521, null);
Insert into VEICULO values( 'AAA-1115', 2,      28,      3,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23500,   27900, null);
Insert into VEICULO values( 'AAA-1116', 2,      28,      1,    1,     'M',          1,      4,            1,     4,       2005,    2005,   23000,    8000, null);
Insert into VEICULO values( 'AAA-1117', 2,      29,      1,    1,     'M',          2,      4,            1,     4,       2004,    2004,   32900,   18478, null);
Insert into VEICULO values( 'AAA-1118', 2,      27,      6,    1,     'M',          2,      4,            1,     2,       2004,    2004,   29000,   35819, null);
Insert into VEICULO values( 'AAA-1119', 6,      30,      3,    1,     'M',          2,      4,            1,     2,       2005,    2005,   37000,   12000, null);
Insert into VEICULO values( 'AAA-1120', 6,      31,      1,    1,     'M',          2,      1,            1,     2,       1999,    1999,   16000,   91000, null);
Insert into VEICULO values( 'AAA-1121', 9,      32,      3,    1,     'M',          5,      1,            1,     2,       2000,    2000,   32000,   79000, null);
Insert into VEICULO values( 'AAA-1122', 9,      3,       3,    1,     'M',          14,     1,            1,     2,       2000,    2001,   39000,   41000, null);
Insert into VEICULO values( 'AAA-1123', 13,     10,      1,    1,     'M',          2,      1,            1,     4,       2003,    2004,   39000,   53800, null);
Insert into VEICULO values( 'AAA-1124', 13,     6,       3,    1,     'M',          2,      1,            1,     4,       2004,    2004,   40000,   20000, null);
Insert into VEICULO values( 'AAA-1125', 13,     8,       4,    1,     'M',          2,      4,            1,     4,       2005,    2006,   53000,    8000, null);
Insert into VEICULO values( 'AAA-1126', 14,     8,       1,    2,     'M',          16,     3,            1,     2,       2003,    2004,   59000,   99300, null);
Insert into VEICULO values( 'AAA-1127', 15,     8,       5,    2,     'M',          16,     3,            1,     4,       2005,    2005,   79000,   21000, null);
Insert into VEICULO values( 'AAA-1128', 17,     12,      6,    1,     'M',          15,     1,            1,     4,       2004,    2005,   48900,    8000, null);
Insert into VEICULO values( 'AAA-1129', 21,     8,       1,    2,     'M',          10,     1,            1,     4,       2001,    2002,   47000,   99900, null);
Insert into VEICULO values( 'AAA-1130', 24,     17,      3,    2,     'M',          17,     1,            1,     4,       2001,    2001,   16800,  110900, null);
Insert into VEICULO values( 'AAA-1131', 24,     16,      6,    2,     'M',          17,     4,            1,     4,       2005,    2005,   36800,   40500, null);
Insert into VEICULO values( 'AAA-1132', 29,     33,      6,    1,     'M',          4,      1,            1,     4,       2003,    2004,   32900,   51000, null);
Insert into VEICULO values( 'AAA-1133', 29,     34,      6,    1,     'M',          18,     1,            1,     4,       2004,    2004,   49900,  31000, null);
Insert into VEICULO values( 'AAA-1134', 31,     20,      1,    1,     'M',          5,      1,            1,     2,       2005,    2005,   41900,  25000, null);
Insert into VEICULO values( 'AAA-1135', 31,     20,      6,    1,     'M',          5,      1,            1,     4,       2003,    2003,   34600,  61000, null);
Insert into VEICULO values( 'AAA-1136', 31,     24,      3,    1,     'A',          15,     1,            1,     4,       2003,    2004,   45900,  21200, null);
Insert into VEICULO values( 'AAA-1137', 31,     21,      1,    1,     'M',          5,      4,            1,     4,       2005,    2005,   53200,  14000, null);
Insert into VEICULO values( 'AAA-1138', 32,     21,      5,    1,     'A',          5,      4,            1,     4,       2005,    2005,   54300,  16000, null);
Insert into VEICULO values( 'AAA-1139', 32,     20,      6,    1,     'M',          5,      4,            1,     4,       2004,    2005,   40700,  46000, null);
Insert into VEICULO values( 'AAA-1140', 33,     4,       6,    1,     'M',          6,      1,            1,     4,       1999,    2000,   27900,  80000, null);
Insert into VEICULO values( 'AAA-1141', 33,     20,      6,    1,     'M',          5,      4,            1,     4,       2006,    2006,   59700,  0,     null);
Insert into VEICULO values( 'AAA-1142', 33,     21,      1,    1,     'A',          7,      4,            1,     4,       2006,    2006,   74700,  0,     null);
Insert into VEICULO values( 'AAA-1143', 34,     9,       6,    2,     'M',          19,     6,            1,     4,       1998,    1998,   26700,  99000, null);
Insert into VEICULO values( 'AAA-1144', 35,     11,      6,    1,     'M',          1,      1,            1,     2,       2005,    2005,   17000,  29000, null);
Insert into VEICULO values( 'AAA-1145', 35,     11,      1,    1,     'M',          1,      1,            1,     4,       2004,    2005,   18700,  26000, null);
Insert into VEICULO values( 'AAA-1146', 35,     35,      7,    1,     'M',          1,      1,            1,     2,       2005,    2005,   23500,  35600, null);
Insert into VEICULO values( 'AAA-1147', 36,     26,      3,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30500,  20000, null);
Insert into VEICULO values( 'AAA-1148', 36,     25,      6,    1,     'M',          4,      4,            1,     4,       2005,    2005,   30800,  18000, null);
Insert into VEICULO values( 'AAA-1149', 36,     25,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   36700,  6000,  null);
Insert into VEICULO values( 'AAA-1150', 36,     23,      3,    1,     'M',          4,      4,            1,     4,       2005,    2006,   40700,  7000,  null);
Insert into VEICULO values( 'AAA-1151', 37,     4,       1,    1,     'M',          2,      1,            1,     4,       1998,    1998,   17000,  80000, null);
Insert into VEICULO values( 'AAA-1152', 38,     25,      5,    1,     'M',          4,      4,            1,     4,       2005,    2005,   40900,  26000, null);
Insert into VEICULO values( 'AAA-1153', 39,     18,      6,    2,     'M',          4,      4,            1,     4,       2005,    2005,   33900,  25000, null);
Insert into VEICULO values( 'AAA-1154', 40,     36,      6,    1,     'M',          20,     1,            1,     4,       1999,    2000,   43000,  78000, null);
Insert into VEICULO values( 'AAA-1155', 44,     21,      1,    1,     'A',          15,     1,            1,     4,       2004,    2005,   59700,  39000, null);
Insert into VEICULO values( 'AAA-1156', 52,     18,      1,    2,     'S',          9,      1,            1,     4,       2004,    2005,   235000, 31000, null);
Insert into VEICULO values( 'AAA-1157', 56,     20,      5,    1,     'A',          21,     1,            1,     4,       2002,    2003,   37500,  28000, null);

Insert into VEICULO_OPCIONAL values( 'AAA-1112', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1112', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1113', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1114', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1115', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1116', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1117', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1118', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1119', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1121', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1122', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1123', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1124', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1125', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1126', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1127', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1128', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1129', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1130', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1131', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1132', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 13);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1133', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1134', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1135', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1136', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1137', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1138', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1139', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1140', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1141', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 16);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1142', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1143', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1144', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1145', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1146', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1147', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1148', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1149', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1150', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1151', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1152', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1153', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 15);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1154', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 4);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1155', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 8);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 11);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 12);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 18);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 20);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 21);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 22);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 23);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 24);
Insert into VEICULO_OPCIONAL values( 'AAA-1156', 25);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 1);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 2);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 3);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 5);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 6);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 7);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 9);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 10);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 14);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 17);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 19);
Insert into VEICULO_OPCIONAL values( 'AAA-1157', 20);

Commit;

select cod_carro, nom_carro from carro;

SELECT C.NOM_CARRO, M.NOM_MARCA
FROM CARRO C, MARCA M
WHERE M.COD_MARCA = C.COD_MARCA
AND C.NOM_CARRO = '206 - SW';

-- NOME, ENDEREÇO E NOME BAIRRO DA LOJA
SELECT  L.NOM_LOJA          AS LOJA,
        L.END_LOJA          AS ENDERECO, 
        L.NOM_BAIRRO_LOJA   AS BAIRRO, 
        LT.NUM_TELEFONE     AS NUM_TEL, 
        DECODE(LT.TPO_TELEFONE, 'C', 'CELULAR', 'F', 'TELEFONE') TIPO_TEL --> "IF", SE FOR "C", CELULAR, SE FOR "F", TELEFONE
FROM    LOJA L, 
        LOJA_TELEFONE LT
WHERE   L.COD_LOJA = LT.COD_LOJA;

SELECT  V.COD_PLACA,
        C.NOM_CARRO,
        CO.NOM_COR,
        CB.DSC_COMBUSTIVEL
FROM    VEICULO V,
        CARRO C,
        COR CO,
        COMBUSTIVEL CB
WHERE   C.COD_CARRO = V.COD_CARRO
AND UPPER(C.NOM_CARRO) = 'GOL'
AND V.COD_COR = CO.COD_COR
AND V.COD_COMBUSTIVEL = CB.COD_COMBUSTIVEL

SELECT  COUNT(CB.DSC_COMBUSTIVEL) Qtde,
        C.NOM_CARRO,
        CB.DSC_COMBUSTIVEL
FROM    VEICULO V,
        CARRO C,
        COR CO,
        COMBUSTIVEL CB
WHERE   C.COD_CARRO = V.COD_CARRO
AND UPPER(C.NOM_CARRO) = 'GOL'
AND V.COD_COR = CO.COD_COR
AND V.COD_COMBUSTIVEL = CB.COD_COMBUSTIVEL
group by c.nom_carro, cb.dsc_combustivel;



SELECT SUBSTR('substr',3,2) FROM DUAL;

SELECT SUBSTR('Banco de dados',1,6) FROM DUAL;

SELECT SUBSTR('Banco de dados',1,7) FROM DUAL;

SELECT UPPER('upper case') FROM DUAL;

SELECT LOWER('LOWER CASE') FROM DUAL;

SELECT '-|' || ('            BANCO DE DADOS          ') || '|' FROM DUAL;

SELECT '-|' || LTRIM('            BANCO DE DADOS          ') || '|' FROM DUAL;

SELECT '-|' || RTRIM('            BANCO DE DADOS          ') || '|' FROM DUAL;

SELECT '-|' || TRIM('            BANCO DE DADOS          ') || '|' FROM DUAL;

SELECT 'OLA '||'MUNDO!'||'.......TUDO BEM?' FROM DUAL;

SELECT 'BANCO'||'-' || 'DE' ||'-'||'DADOS' FROM DUAL;

SELECT CONCAT ('BANCO DE ','DADOS') FROM DUAL;

SELECT CONCAT(CONCAT ('BANCO ', 'DE'), ' DADOS') FROM DUAL;

SELECT LENGTH('BANCO DE DADOS') FROM DUAL;

SELECT REPLACE ('BANCO DE DADOS','BANCO', 'SQL ORACLE') AS REPLACE FROM DUAL;

SELECT REPLACE ('SARDINHA', 'SARD', 'TA') AS REPLACE FROM DUAL;

SELECT REPLACE ('BANCO DE DADOS', 'DE') AS REPLACE FROM DUAL;

SELECT LPAD('BANCO DE DADOS', 20, '>') FROM DUAL;

SELECT RPAD('BANCO DE DADOS', 20, '<') FROM DUAL;

SELECT RPAD(LPAD('BANCO DE DADOS', 20, '>'), 30, '<') FROM DUAL;

SELECT SYSDATE FROM DUAL;

SELECT TRUNC(SYSDATE) FROM DUAL;

SELECT ROUND(SYSDATE) FROM DUAL;

SELECT ROUND(12.4) FROM DUAL;

SELECT ROUND(12.5) FROM DUAL;

SELECT LAST_DAY (SYSDATE) FROM DUAL;

SELECT LAST_DAY (ADD MONTHS(SYSDATE, -1)) FROM DUAL;

SELECT LAST DAY(SYSDATE),
LAST DAY(ADD MONTHS(SYSDATE, -1)),
LAST DAY(ADD MONTHS(SYSDATE, -1)) +1 
FROM DUAL;

SELECT
    DECODE (10, -->CARGO
            1, 'PRESIDENTE',
            2, 'DIRETOR',
            3, 'GERENTE',
               'FUNCIONARIO') AS CARGO
FROM DUAL;

SELECT
    CASE
        4 --> Cargo
        when 1
            THEN 'Presidente'
        when 2
            then 'Diretor'
        when 3
            then 'Gerente'
        else 'Funcionario'
    END AS CARGO
FROM DUAL;
    
