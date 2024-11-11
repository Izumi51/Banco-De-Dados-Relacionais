CREATE TABLE empregado (
    nomeEmpregado       VARCHAR(30 CHAR) NOT NULL,
    rgEmpregado         VARCHAR(10 CHAR) NOT NULL,
    cicEmpregado        VARCHAR(11 CHAR) NOT NULL,
    deptoEmpregado      INTEGER NOT NULL,
    rgSurpevisor        VARCHAR(10 CHAR),
    salarioEmpregado    NUMBER(10, 2) NOT NULL
);

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY (rgEmpregado);

CREATE TABLE departamento (
    nomeDepartamento    VARCHAR(20 CHAR) NOT NULL,
    numeroDepartamento  INTEGER NOT NULL,
    rgGerente           VARCHAR(10 CHAR) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY (numeroDepartamento);

CREATE TABLE projeto (
    nomeProjeto    VARCHAR(20 CHAR) NOT NULL,
    numeroProjeto  INTEGER NOT NULL,
    localizacao    VARCHAR(20 CHAR) NOT NULL
);

ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY (numeroProjeto);

CREATE TABLE dependentes (
    rgResponsavel   VARCHAR(10 CHAR) NOT NULL,
    nomeDependente  VARCHAR(30 CHAR) NOT NULL,
    nascimento      DATE NOT NULL,    
    relacao         VARCHAR(10 CHAR) NOT NULL,
    sexo            VARCHAR(10 CHAR) NOT NULL
);

ALTER TABLE dependentes ADD CONSTRAINT dependentes_pk PRIMARY KEY (rgResponsavel, nomeDependente);

CREATE TABLE departamento_projeto (
    numeroDepto     INTEGER NOT NULL,
    numeroProjeto   INTEGER NOT NULL
);

ALTER TABLE departamento_projeto ADD CONSTRAINT departamento_projeto_pk PRIMARY KEY (numeroDepto, numeroProjeto);

CREATE TABLE empregado_projeto (
    rgEmpregado     VARCHAR(10 CHAR) NOT NULL,
    numeroProjeto   INTEGER NOT NULL,
    horas           INTEGER NOT NULL
);

ALTER TABLE empregado_projeto ADD CONSTRAINT empregado_projeto_pk PRIMARY KEY (rgEmpregado, numeroProjeto);

ALTER TABLE dependentes
    ADD CONSTRAINT dependente_empregado_fk FOREIGN KEY (rgResponsavel)
        REFERENCES empregado (rgEmpregado);

ALTER TABLE departamento_projeto
    ADD CONSTRAINT departamento_projeto_depto_fk FOREIGN KEY (numeroDepto)
        REFERENCES departamento (numeroDepartamento);

ALTER TABLE empregado_projeto
    ADD CONSTRAINT empregado_projeto_empregado_fk FOREIGN KEY (rgEmpregado)
        REFERENCES empregado (rgEmpregado);