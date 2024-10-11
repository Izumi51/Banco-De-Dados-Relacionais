CREATE TABLE ck_titularidade (
    pessoa_idpessoa        INTEGER NOT NULL,
    conta_comum_nroconta   NUMBER(10, 2) NOT NULL,
    conta_comum_codagencia NUMBER(4, 2) NOT NULL,
    titularidade           CHAR(1 BYTE) DEFAULT 'T' NOT NULL
);

ALTER TABLE ck_titularidade
    ADD CHECK ( titularidade IN ( 'A', 'T' ) );

ALTER TABLE ck_titularidade
    ADD CONSTRAINT ck_titularidade_pk PRIMARY KEY ( pessoa_idpessoa,
                                                    conta_comum_nroconta,
                                                    conta_comum_codagencia );

CREATE TABLE conta_comum (
    nroconta         NUMBER(10, 2) NOT NULL,
    codagencia       NUMBER(4, 2) NOT NULL,
    tipoconta        NUMBER(1) NOT NULL,
    dataabertura     DATE NOT NULL,
    dataencerramento DATE,
    situacaoconta    CHAR(1) NOT NULL,
    senha            INTEGER NOT NULL,
    saldo            NUMBER(11, 2) NOT NULL
);

ALTER TABLE conta_comum
    ADD CHECK ( tipoconta IN ( 1, 2, 3 ) );

ALTER TABLE conta_comum
    ADD CHECK ( situacaoconta IN ( '0', '1' ) );

COMMENT ON COLUMN conta_comum.nroconta IS
    'Número da conta corrente.';

COMMENT ON COLUMN conta_comum.codagencia IS
    'Código da agência associada à conta corrente.';

COMMENT ON COLUMN conta_comum.tipoconta IS
    'Indica o tipo de conta que será criada (comum,especial ou poupança).';

COMMENT ON COLUMN conta_comum.dataabertura IS
    'Data de abertura da conta.';

COMMENT ON COLUMN conta_comum.dataencerramento IS
    'Data de encerramento da conta.';

COMMENT ON COLUMN conta_comum.situacaoconta IS
    'Indica se a conta está ativa ou não no sistema.';

COMMENT ON COLUMN conta_comum.senha IS
    'Senha para acesso à conta.';

ALTER TABLE conta_comum ADD CONSTRAINT conta_comum_pk PRIMARY KEY ( nroconta,
                                                                    codagencia );

CREATE TABLE conta_especial (
    nroconta   NUMBER(10, 2) NOT NULL,
    codagencia NUMBER(4, 2) NOT NULL,
    limite     NUMBER(11, 2)
);

COMMENT ON COLUMN conta_especial.nroconta IS
    'Número da conta corrente.';

COMMENT ON COLUMN conta_especial.codagencia IS
    'Código da agência associada à conta corrente.';

ALTER TABLE conta_especial ADD CONSTRAINT conta_especial_pk PRIMARY KEY ( nroconta,
                                                                          codagencia );

CREATE TABLE conta_poupanca (
    nroconta        NUMBER(10, 2) NOT NULL,
    codagencia      NUMBER(4, 2) NOT NULL,
    dataaniversario DATE
);

COMMENT ON COLUMN conta_poupanca.nroconta IS
    'Número da conta corrente.';

COMMENT ON COLUMN conta_poupanca.codagencia IS
    'Código da agência associada à conta corrente.';

ALTER TABLE conta_poupanca ADD CONSTRAINT conta_poupanca_pk PRIMARY KEY ( nroconta,
                                                                          codagencia );

CREATE TABLE movimento (
    idmovimento            INTEGER NOT NULL,
    tipomovimento          CHAR(1) NOT NULL,
    datamovimento          DATE NOT NULL,
    horamovimento          DATE,
    valormovimento         NUMBER(11, 2) NOT NULL,
    conta_comum_nroconta   NUMBER(10, 2) NOT NULL,
    conta_comum_codagencia NUMBER(4, 2) NOT NULL
);

ALTER TABLE movimento ADD CONSTRAINT movimento_pk PRIMARY KEY ( idmovimento );

CREATE TABLE pessoa (
    idpessoa       INTEGER NOT NULL,
    nome           VARCHAR2(80) NOT NULL,
    endereco       VARCHAR2(120),
    cep            NUMBER(8, 2),
    telefone       NUMBER(10, 2),
    rendamedia     NUMBER(11, 2) NOT NULL,
    tipopessoa     NUMBER(1) NOT NULL,
    situacaopessoa NUMBER(1) DEFAULT 1 NOT NULL
);

ALTER TABLE pessoa
    ADD CHECK ( tipopessoa IN ( 1, 2 ) );

ALTER TABLE pessoa
    ADD CHECK ( situacaopessoa IN ( 1, 2 ) );

COMMENT ON COLUMN pessoa.idpessoa IS
    'Identificador único do cliente no sistema.';

COMMENT ON COLUMN pessoa.nome IS
    'Nome completo do cliente.';

COMMENT ON COLUMN pessoa.endereco IS
    'Endereço do cliente.';

COMMENT ON COLUMN pessoa.cep IS
    'CEP do cliente.';

COMMENT ON COLUMN pessoa.telefone IS
    'Telefone de contato do cliente.';

COMMENT ON COLUMN pessoa.rendamedia IS
    'Renda média do cliente.';

COMMENT ON COLUMN pessoa.tipopessoa IS
    'Tipo de pessoa associada ao cliente (Física ou Jurídica).';

COMMENT ON COLUMN pessoa.situacaopessoa IS
    'Valor lógico (binário) que identifica se o cliente está ativo no sistema.';

ALTER TABLE pessoa ADD CONSTRAINT pessoa_pk PRIMARY KEY ( idpessoa );

CREATE TABLE pessoa_fisica (
    idpessoa    INTEGER NOT NULL,
    cpf         NUMBER(11) NOT NULL,
    celular     NUMBER(11, 2),
    email       VARCHAR2(100),
    estadocivil CHAR(1) DEFAULT 'S' NOT NULL
);

ALTER TABLE pessoa_fisica
    ADD CHECK ( estadocivil IN ( 'C', 'D', 'S', 'V', 'X' ) );

COMMENT ON COLUMN pessoa_fisica.idpessoa IS
    'Identificador único do cliente no sistema.';

COMMENT ON COLUMN pessoa_fisica.cpf IS
    'Cadastro de Pessoa Física do cliente';

COMMENT ON COLUMN pessoa_fisica.celular IS
    'Número do celular do cliente com 11 posições:
· Duas posições iniciais para o código DDD;
· Nove posições restantes para o número.';

COMMENT ON COLUMN pessoa_fisica.email IS
    'Endereço de e-mail do cliente (se houver).';

ALTER TABLE pessoa_fisica ADD CONSTRAINT pessoa_fisica_pk PRIMARY KEY ( idpessoa );

ALTER TABLE pessoa_fisica ADD CONSTRAINT pessoa_fisica_pkv1 UNIQUE ( cpf );

CREATE TABLE pessoa_juridica (
    idpessoa      INTEGER NOT NULL,
    cnpj          NUMBER(14) NOT NULL,
    inscrestadual NUMBER(12, 2)
);

COMMENT ON COLUMN pessoa_juridica.idpessoa IS
    'Identificador único do cliente no sistema.';

ALTER TABLE pessoa_juridica ADD CONSTRAINT pessoa_juridica_pk PRIMARY KEY ( idpessoa );

ALTER TABLE pessoa_juridica ADD CONSTRAINT pessoa_juridica_pkv1 UNIQUE ( cnpj );

ALTER TABLE ck_titularidade
    ADD CONSTRAINT ck_titularidade_conta_comum_fk FOREIGN KEY ( conta_comum_nroconta,
                                                                conta_comum_codagencia )
        REFERENCES conta_comum ( nroconta,
                                 codagencia );

ALTER TABLE ck_titularidade
    ADD CONSTRAINT ck_titularidade_pessoa_fk FOREIGN KEY ( pessoa_idpessoa )
        REFERENCES pessoa ( idpessoa );

ALTER TABLE conta_especial
    ADD CONSTRAINT conta_especial_conta_comum_fk FOREIGN KEY ( nroconta,
                                                               codagencia )
        REFERENCES conta_comum ( nroconta,
                                 codagencia );

ALTER TABLE conta_poupanca
    ADD CONSTRAINT conta_poupanca_conta_comum_fk FOREIGN KEY ( nroconta,
                                                               codagencia )
        REFERENCES conta_comum ( nroconta,
                                 codagencia );

ALTER TABLE movimento
    ADD CONSTRAINT movimento_conta_comum_fk FOREIGN KEY ( conta_comum_nroconta,
                                                          conta_comum_codagencia )
        REFERENCES conta_comum ( nroconta,
                                 codagencia );

ALTER TABLE pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pessoa_fk FOREIGN KEY ( idpessoa )
        REFERENCES pessoa ( idpessoa );

ALTER TABLE pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_pessoa_fk FOREIGN KEY ( idpessoa )
        REFERENCES pessoa ( idpessoa );