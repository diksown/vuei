CREATE TABLE PESSOA (
        EMAIL VARCHAR(50) NOT NULL,
        NOME VARCHAR(60) NOT NULL,
        SENHA VARCHAR(50) NOT NULL,
        TELEFONE VARCHAR(15) NOT NULL,
        DATA DATE NOT NULL,
        CONSTRAINT PK_PESSOA PRIMARY KEY(EMAIL),
        CONSTRAINT SK_PESSOA UNIQUE(TELEFONE),
        CONSTRAINT CK_EMAIL CHECK(EMAIL LIKE '%@%.com'),
        CONSTRAINT CK_NAME CHECK(NOME NOT LIKE '%[^a-zA-Z]%'),
        CONSTRAINT CK_TELEFONE CHECK (TELEFONE NOT LIKE '%[^0-9]%')
);

CREATE TABLE PILOTO (
        EMAIL VARCHAR(50) NOT NULL,
        LICENCA VARCHAR(15) NOT NULL,
        CONSTRAINT PK_PILOTO PRIMARY KEY(EMAIL),
        CONSTRAINT FK_EMAIL_PILOTO FOREIGN KEY(EMAIL) REFERENCES PESSOA(EMAIL) ON DELETE CASCADE,
        CONSTRAINT CK_LICENCA CHECK (LICENCA NOT LIKE '%[^0-9]%')
);

CREATE TABLE TURISTA (
        EMAIL VARCHAR(50) NOT NULL,
        PAIS VARCHAR(20) NOT NULL,
        CONSTRAINT PK_TURISTA PRIMARY KEY(EMAIL),
        CONSTRAINT FK_EMAIL_TURISTA FOREIGN KEY(EMAIL) REFERENCES PESSOA(EMAIL) ON DELETE CASCADE
);

CREATE TABLE GALAXIA (
        NOME VARCHAR(50) NOT NULL,
        CONSTRAINT PK_GALAXIA PRIMARY KEY(NOME)
);

CREATE TABLE NAVE (
        NUMERO_REGISTRO INTEGER NOT NULL,
        MODELO VARCHAR(15) NOT NULL,
        CAPACIDADE INTEGER NOT NULL,
        CONSTRAINT PK_NAVE PRIMARY KEY(NUMERO_REGISTRO),
        CONSTRAINT CK_CAPACIDADE CHECK(CAPACIDADE >= 1)
);

CREATE TABLE ROTA (
        NOME VARCHAR(50) NOT NULL,
        CONSTRAINT PK_ROTA PRIMARY KEY(NOME)
);

CREATE TABLE FACCAO (
        NOME VARCHAR(50) NOT NULL,
        NUMERO_MEMBROS INTEGER,
        CONSTRAINT PK_FACCAO PRIMARY KEY(NOME) 
);

CREATE TABLE RACA (
        NOME VARCHAR(50) NOT NULL,
        PESO_MEDIO FLOAT NOT NULL, -- Peso medido em quilos
        TAMANHO_MEDIO INTEGER NOT NULL, -- Tamanho medido em centímetros
        DESCRICAO VARCHAR(50) NOT NULL,
        CONSTRAINT PK_RACA PRIMARY KEY (NOME)
);

CREATE TABLE EXPEDICAO (
        PILOTO VARCHAR(50) NOT NULL,
        NAVE INTEGER NOT NULL,
        DH_INICIO DATE NOT NULL,
        DH_FIM DATE NOT NULL,
        ROTA VARCHAR(50) NOT NULL,
        CONSTRAINT PK_EXPEDICAO PRIMARY KEY(NAVE, DH_INICIO),
        CONSTRAINT FK_NAVE FOREIGN KEY(NAVE) REFERENCES NAVE(NUMERO_REGISTRO) ON DELETE CASCADE,
        CONSTRAINT FK_PILOTO FOREIGN KEY(PILOTO) REFERENCES PILOTO(EMAIL) ON DELETE CASCADE
);

CREATE TABLE EXPEDICAO_TURISTA (
        NAVE INTEGER NOT NULL,
        DH_INICIO DATE NOT NULL,
        TURISTA VARCHAR(50) NOT NULL,
        CONSTRAINT PK_EXP_TUR PRIMARY KEY(NAVE, DH_INICIO, TURISTA),
        CONSTRAINT FK_EXPEDICAO FOREIGN KEY(NAVE, DH_INICIO) REFERENCES EXPEDICAO(NAVE, DH_INICIO) ON DELETE CASCADE,
        CONSTRAINT FK_TURISTA FOREIGN KEY(TURISTA) REFERENCES TURISTA(EMAIL) ON DELETE CASCADE
);

CREATE TABLE CORPO (
        GALAXIA VARCHAR(50) NOT NULL,
        NOME VARCHAR(50) NOT NULL,
        RAIO INTEGER,
        MASSA INTEGER,
        GRAVIDADE FLOAT,
        TEMPERATURA FLOAT,
        DISTANCIA_TERRA INTEGER,
        TIPO VARCHAR(30),
        CONSTRAINT PK_CORPO PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_GALAXIA FOREIGN KEY(GALAXIA) REFERENCES GALAXIA(NOME) ON DELETE CASCADE
);

CREATE TABLE ROTA_CORPO (
        ROTA VARCHAR(50) NOT NULL,
        GALAXIA_CORPO VARCHAR(50) NOT NULL,
        NOME_CORPO VARCHAR(50) NOT NULL,
        CONSTRAINT PK_ROTA_CORPO PRIMARY KEY(ROTA, GALAXIA_CORPO, NOME_CORPO),
        CONSTRAINT FK_ROTA FOREIGN KEY(ROTA) REFERENCES ROTA(NOME) ON DELETE CASCADE,
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA_CORPO, NOME_CORPO) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE ESTRELA (
        GALAXIA VARCHAR(50) NOT NULL,
        NOME VARCHAR(50) NOT NULL,
        LUMINOSIDADE INTEGER,
        CONSTRAINT PK_ESTRELA PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA, NOME) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE
        
);

CREATE TABLE PLANETA (
        GALAXIA VARCHAR(50) NOT NULL,
        NOME VARCHAR(50) NOT NULL,
        TEM_AGUA CHAR,
        HABITAVEL CHAR NOT NULL,
        GALAXIA_ESTRELA VARCHAR(50) NOT NULL,
        NOME_ESTRELA VARCHAR(50) NOT NULL,
        CONSTRAINT PK_PLANETA PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA, NOME) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE,
        CONSTRAINT FK_ESTRELA FOREIGN KEY(GALAXIA_ESTRELA, NOME_ESTRELA) REFERENCES ESTRELA(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE PLANETA_HABITAVEL (
        GALAXIA VARCHAR(50) NOT NULL,
        NOME VARCHAR(50) NOT NULL,
        CONSTRAINT PK_PLANETA_HABITAVEL PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_PLANETA FOREIGN KEY(GALAXIA, NOME) REFERENCES PLANETA(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE FACCAO_RACA (
        FACCAO VARCHAR(50) NOT NULL,
        RACA VARCHAR(50) NOT NULL,
        CONSTRAINT PK_FACCAO_RACA PRIMARY KEY(FACCAO, RACA),
        CONSTRAINT FK_FACCAO FOREIGN KEY(FACCAO) REFERENCES FACCAO(NOME) ON DELETE CASCADE,
        CONSTRAINT FK_RACA FOREIGN KEY(RACA) REFERENCES RACA(NOME) ON DELETE CASCADE
);

CREATE TABLE COLONIA (
        ID INTEGER NOT NULL,
        GALAXIA VARCHAR(50) NOT NULL,
        NOME_PLANETA VARCHAR(50) NOT NULL,
        FACCAO_NOME VARCHAR(50) NOT NULL,
        DH_INICIO DATE NOT NULL,
        DH_FIM DATE,
        NOME VARCHAR(50),
        CONSTRAINT PK_COLONIA PRIMARY KEY(ID),
        CONSTRAINT SK_COLONIA UNIQUE(GALAXIA, NOME_PLANETA, FACCAO_NOME, DH_INICIO),
        CONSTRAINT FK_PLANETA_HABITAVEL FOREIGN KEY(GALAXIA, NOME_PLANETA) REFERENCES PLANETA_HABITAVEL(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE GUERRA (
        AGRESSOR INTEGER NOT NULL,
        DEFENSOR INTEGER NOT NULL,
        DH_INICIO DATE NOT NULL,
        DH_FIM DATE,
        OBITOS INTEGER,
        CONSTRAINT PK_GUERRA PRIMARY KEY(AGRESSOR, DEFENSOR, DH_INICIO),
        CONSTRAINT FK_AGRESSOR FOREIGN KEY(AGRESSOR) REFERENCES COLONIA(ID),
        CONSTRAINT FK_DEFENSOR FOREIGN KEY(DEFENSOR) REFERENCES COLONIA(ID),
        CONSTRAINT CK_DIFF_COL CHECK (AGRESSOR <> DEFENSOR)
);