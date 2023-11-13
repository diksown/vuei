CREATE TABLE PESSOA (
        EMAIL VARCHAR(20) NOT NULL,
        NOME VARCHAR(25) NOT NULL,
        SENHA VARCHAR(20) NOT NULL,
        TELEFONE VARCHAR(15) NOT NULL,
        DATA DATE NOT NULL,
        CONSTRAINT PK_PESSOA PRIMARY KEY(EMAIL),
        CONSTRAINT CK_EMAIL CHECK(EMAIL LIKE '%@%.com')
);

CREATE TABLE PILOTO (
        EMAIL VARCHAR(20) NOT NULL,
        LICENÇA VARCHAR(15) NOT NULL,
        CONSTRAINT PK_PILOTO PRIMARY KEY(EMAIL),
        CONSTRAINT FK_EMAIL FOREIGN KEY(EMAIL) REFERENCES PESSOA(EMAIL) ON DELETE CASCADE
);

CREATE TABLE TURISTA (
        EMAIL VARCHAR(20) NOT NULL,
        PAIS VARCHAR(15) NOT NULL,
        CONSTRAINT PK_TURISTA PRIMARY KEY(EMAIL),
        CONSTRAINT FK_EMAIL FOREIGN KEY(EMAIL) REFERENCES PESSOA(EMAIL) ON DELETE CASCADE
);

CREATE TABLE GALAXIA (
        NOME VARCHAR(20) NOT NULL,
        CONSTRAINT PK_GALAXIA PRIMARY KEY(NOME)
);

CREATE TABLE NAVE (
        NUMERO_REGISTRO INTEGER NOT NULL,
        MODELO VARCHAR(15) NOT NULL,
        CAPACIDADE INTEGER NOT NULL,
        CONSTRAINT PK_NAVE PRIMARY KEY(NUMERO_REGISTRO)
);

CREATE TABLE ROTA (
        NOME VARCHAR(15) NOT NULL,
        CONSTRAINT PK_ROTA PRIMARY KEY(NOME)
);

CREATE TABLE FACÇÃO (
        NOME VARCHAR(20) NOT NULL,
        NUMERO_MEMBROS INTEGER,
        CONSTRAINT PK_FACÇÃO PRIMARY KEY(NOME) 
);

CREATE TABLE RAÇA (
        NOME VARCHAR(20) NOT NULL,
        PESO_MEDIO FLOAT NOT NULL,
        TAMANHO_MEDIO INTEGER NOT NULL,
        DESCRIÇÃO VARCHAR(50) NOT NULL,
        CONSTRAINT PK_RAÇA PRIMARY KEY (NOME)
);

CREATE TABLE EXPEDIÇÃO (
        PILOTO VARCHAR(20) NOT NULL,
        NAVE INTEGER NOT NULL,
        DH_INICIO DATE NOT NULL,
        DH_FIM DATE NOT NULL,
        ROTA VARCHAR(15) NOT NULL,
        CONSTRAINT PK_EXPEDIÇÃO PRIMARY KEY(NAVE, DH_INICIO),
        CONSTRAINT FK_NAVE FOREIGN KEY(NAVE) REFERENCES NAVE(NUMERO_REGISTRO) ON DELETE SET NULL,
        CONSTRAINT FK_PILOTO FOREIGN KEY(PILOTO) REFERENCES PILOTO(EMAIL) ON DELETE SET NULL
);

CREATE TABLE EXPEDIÇÃO_TURISTA (
        NAVE INTEGER NOT NULL,
        DH_INICIO DATE NOT NULL,
        TURISTA VARCHAR(20) NOT NULL,
        CONSTRAINT PK_EXP_TUR PRIMARY KEY(NAVE, DH_INICIO, TURISTA),
        CONSTRAINT FK_EXPEDIÇÃO FOREIGN KEY(NAVE, DH_INICIO) REFERENCES EXPEDIÇÃO(NAVE, DH_INICIO) ON DELETE CASCADE,
        CONSTRAINT FK_TURISTA FOREIGN KEY(TURISTA) REFERENCES TURISTA(EMAIL) ON DELETE CASCADE
);

CREATE TABLE CORPO (
        GALAXIA VARCHAR(20) NOT NULL,
        NOME VARCHAR(20) NOT NULL,
        RAIO INTEGER,
        MASSA INTEGER,
        GRAVIDADE FLOAT,
        TEMPERATURA FLOAT,
        DISTANCIA_TERRA INTEGER,
        TIPO VARCHAR(15),
        CONSTRAINT PK_CORPO PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_GALAXIA FOREIGN KEY(GALAXIA) REFERENCES GALAXIA(NOME) ON DELETE CASCADE
);

CREATE TABLE ROTA_CORPO (
        ROTA VARCHAR(15) NOT NULL,
        GALAXIA_CORPO VARCHAR(20) NOT NULL,
        NOME_CORPO VARCHAR(20) NOT NULL,
        CONSTRAINT PK_ROTA_CORPO PRIMARY KEY(ROTA, GALAXIA_CORPO, NOME_CORPO),
        CONSTRAINT FK_ROTA FOREIGN KEY(ROTA) REFERENCES ROTA(NOME) ON DELETE CASCADE,
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA_CORPO, NOME_CORPO) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE ESTRELA (
        GALAXIA VARCHAR(20) NOT NULL,
        NOME VARCHAR(20) NOT NULL,
        LUMINOSIDADE INTEGER,
        CONSTRAINT PK_ESTRELA PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA, NOME) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE
        
);

CREATE TABLE PLANETA (
        GALAXIA VARCHAR(20) NOT NULL,
        NOME VARCHAR(20) NOT NULL,
        TEM_AGUA CHAR,
        HABITAVEL CHAR NOT NULL,
        GALAXIA_ESTRELA VARCHAR(20) NOT NULL,
        NOME_ESTRELA VARCHAR(20) NOT NULL,
        CONSTRAINT PK_PLANETA PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_CORPO FOREIGN KEY(GALAXIA, NOME) REFERENCES CORPO(GALAXIA, NOME) ON DELETE CASCADE,
        CONSTRAINT FK_ESTRELA FOREIGN KEY(GALAXIA_ESTRELA, NOME_ESTRELA) REFERENCES ESTRELA(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE PLANETA_HABITAVEL (
        GALAXIA VARCHAR(20) NOT NULL,
        NOME VARCHAR(20) NOT NULL,
        CONSTRAINT PK_PLANETA_HABITAVEL PRIMARY KEY(GALAXIA, NOME),
        CONSTRAINT FK_PLANETA FOREIGN KEY(GALAXIA, NOME) REFERENCES PLANETA(GALAXIA, NOME) ON DELETE CASCADE
);

CREATE TABLE FACÇÃO_RAÇA (
        FACÇÃO VARCHAR(20) NOT NULL,
        RAÇA VARCHAR(20) NOT NULL,
        CONSTRAINT PK_FACÇÃO_RAÇA PRIMARY KEY(FACÇÃO, RAÇA),
        CONSTRAINT FK_FACÇÃO FOREIGN KEY(FACÇÃO) REFERENCES FACÇÃO(NOME) ON DELETE CASCADE,
        CONSTRAINT FK_RAÇA FOREIGN KEY(RAÇA) REFERENCES RAÇA(NOME) ON DELETE CASCADE
);

CREATE TABLE COLONIA (
        ID INTEGER NOT NULL,
        GALAXIA VARCHAR(20) NOT NULL,
        NOME_PLANETA VARCHAR(20) NOT NULL,
        FACÇÃO_NOME VARCHAR(20) NOT NULL,
        DH_INICIO DATE NOT NULL,
        DH_FIM DATE,
        NOME VARCHAR(20),
        CONSTRAINT PK_COLONIA PRIMARY KEY(ID),
        CONSTRAINT SK_COLONIA UNIQUE(GALAXIA, NOME_PLANETA, FACÇÃO_NOME, DH_INICIO),
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
        CONSTRAINT FK_DEFENSOR FOREIGN KEY(AGRESSOR) REFERENCES COLONIA(ID),
        CONSTRAINT CK_DIFF_COL CHECK (AGRESSOR <> DEFENSOR)
);