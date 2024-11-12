CREATE TABLE empregado (
    nomeEmpregado       VARCHAR2(50 CHAR) NOT NULL,
    rgEmpregado         NUMBER(10) NOT NULL,
    cicEmpregado        NUMBER(11) NOT NULL,
    deptoEmpregado      NUMBER(2) NOT NULL,
    rgSurpevisor        NUMBER(10),
    salarioEmpregado    NUMBER(10, 2) NOT NULL
);

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY (rgEmpregado);

CREATE TABLE departamento (
    nomeDepartamento    VARCHAR2(50 CHAR) NOT NULL,
    numeroDepartamento  NUMBER(2) NOT NULL,
    rgGerente           NUMBER(10) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY (numeroDepartamento);

CREATE TABLE projeto (
    nomeProjeto    VARCHAR2(20 CHAR) NOT NULL,
    numeroProjeto  NUMBER(2) NOT NULL,
    localizacao    VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY (numeroProjeto);

CREATE TABLE dependentes (
    rgResponsavel   NUMBER(10) NOT NULL,
    nomeDependente  VARCHAR2(50 CHAR) NOT NULL,
    nascimento      DATE NOT NULL,    
    relacao         VARCHAR2(10 CHAR) NOT NULL,
    sexo            VARCHAR2(10 CHAR) NOT NULL
);

CREATE TABLE departamento_projeto (
    numeroDepto     NUMBER(2) NOT NULL,
    numeroProjeto   NUMBER(2) NOT NULL
);

ALTER TABLE departamento_projeto ADD CONSTRAINT departamento_projeto_pk PRIMARY KEY (numeroDepto, numeroProjeto);

CREATE TABLE empregado_projeto (
    rgEmpregado     NUMBER(10) NOT NULL,
    numeroProjeto   NUMBER(2) NOT NULL,
    horas           NUMBER(4) NOT NULL
);

ALTER TABLE empregado_projeto ADD CONSTRAINT empregado_projeto_pk PRIMARY KEY (rgEmpregado, numeroProjeto);

INSERT ALL
    INSERT INTO DEPARTAMENTO VALUES ('Contabilidade', 1, 10101010)
    INSERT INTO DEPARTAMENTO VALUES ('Engenharia Civil', 2, 30303030)
    INSERT INTO DEPARTAMENTO VALUES ('Engenharia Mecânica', 3, 20202020)
SELECT * FROM dual;

INSERT ALL
    INTO EMPREGADO VALUES ('João Luiz', 10101010, 11111111, 1, NULL, 3000.00)
    INTO EMPREGADO VALUES ('Fernando', 20202020, 22222222, 2, 10101010, 2500.00)
    INTO EMPREGADO VALUES ('Ricardo', 30303030, 33333333, 2, 10101010, 2300.00)
    INTO EMPREGADO VALUES ('Jorge', 40404040, 44444444, 2, 20202020, 4200.00)
    INTO EMPREGADO VALUES ('Renato', 50505050, 55555555, 3, 20202020, 1300.00)
SELECT * FROM dual;

INSERT ALL
    INTO PROJETO VALUES ('Financeiro 1', 5, 'São Paulo')
    INTO PROJETO VALUES ('Motor 3', 10, 'Rio Claro')
    INTO PROJETO VALUES ('Prédio Central', 20, 'Campinas')
SELECT * FROM dual;

INSERT ALL
    INTO DEPENDENTES VALUES (10101010, 'Jorge', TO_DATE('27/12/1986', 'DD/MM/YYYY'), 'Filho', 'Masculino')
    INTO DEPENDENTES VALUES (10101010, 'Luiz', TO_DATE('18/11/1979', 'DD/MM/YYYY'), 'Filho', 'Masculino')
    INTO DEPENDENTES VALUES (20202020, 'Fernanda', TO_DATE('14/02/1969', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino')
    INTO DEPENDENTES VALUES (20202020, 'Ângelo', TO_DATE('10/02/1995', 'DD/MM/YYYY'), 'Filho', 'Masculino')
    INTO DEPENDENTES VALUES (30303030, 'Adreia', TO_DATE('01/05/1990', 'DD/MM/YYYY'), 'Filho', 'Feminino')
SELECT * FROM dual;

INSERT ALL
    INTO DEPARTAMENTO_PROJETO VALUES (2, 5)
    INTO DEPARTAMENTO_PROJETO VALUES (2, 10)
    INTO DEPARTAMENTO_PROJETO VALUES (2, 20)
SELECT * FROM dual;

INSERT ALL
    INTO EMPREGADO_PROJETO VALUES (20202020, 5, 10)
    INTO EMPREGADO_PROJETO VALUES (20202020, 10, 25)
    INTO EMPREGADO_PROJETO VALUES (30303030, 5, 35)
    INTO EMPREGADO_PROJETO VALUES (40404040, 20, 20)
    INTO EMPREGADO_PROJETO VALUES (50505050, 20, 25)
SELECT * FROM dual;

ALTER TABLE empregado
    ADD CONSTRAINT empregado_departamento_fk FOREIGN KEY (deptoEmpregado)
        REFERENCES departamento(numeroDepartamento);

ALTER TABLE empregado
    ADD CONSTRAINT empregado_surpevisor_fk FOREIGN KEY (rgSurpevisor)
        REFERENCES empregado(rgEmpregado);

ALTER TABLE dependentes
    ADD CONSTRAINT dependente_responsavel_fk FOREIGN KEY (rgResponsavel)
        REFERENCES empregado (rgEmpregado);

ALTER TABLE departamento
    ADD CONSTRAINT departamento_gerente_fk FOREIGN KEY (rgGerente)
        REFERENCES empregado(rgEmpregado);

ALTER TABLE departamento_projeto
    ADD CONSTRAINT departamento_projeto_depto_fk FOREIGN KEY (numeroDepto)
        REFERENCES departamento (numeroDepartamento);

ALTER TABLE departamento_projeto
    ADD CONSTRAINT departamento_projeto_projeto_fk FOREIGN KEY (numeroProjeto)
        REFERENCES projeto (numeroProjeto);

ALTER TABLE empregado_projeto
    ADD CONSTRAINT empregado_projeto_empregado_fk FOREIGN KEY (rgEmpregado)
       REFERENCES empregado (rgEmpregado);

ALTER TABLE empregado_projeto
    ADD CONSTRAINT empregado_projeto_projeto_fk FOREIGN KEY (numeroProjeto)
        REFERENCES projeto (numeroProjeto);