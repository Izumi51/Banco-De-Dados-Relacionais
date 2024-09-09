
CREATE TABLE bloco (
    id_bloco         CHAR(1 CHAR) NOT NULL,
    quant_salas      INTEGER,
    andares          INTEGER,
    campus_id_campus INTEGER NOT NULL
);

ALTER TABLE bloco ADD CONSTRAINT bloco_pk PRIMARY KEY ( id_bloco );

CREATE TABLE campus (
    nome      VARCHAR2(50) NOT NULL,
    id_campus INTEGER NOT NULL,
    cep       INTEGER NOT NULL
);

ALTER TABLE campus ADD CONSTRAINT campus_pk PRIMARY KEY ( id_campus );

CREATE TABLE carteira (
    id_carteira  INTEGER NOT NULL,
    lado_braco   VARCHAR2(7 CHAR) NOT NULL,
    sala_id_sala INTEGER NOT NULL
);

ALTER TABLE carteira ADD CONSTRAINT carteira_pk PRIMARY KEY ( id_carteira );

CREATE TABLE sala (
    id_sala         INTEGER NOT NULL,
    quant_carteiras INTEGER,
    area            FLOAT,
    bloco_id_bloco  CHAR(1 CHAR) NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( id_sala );

ALTER TABLE bloco
    ADD CONSTRAINT bloco_campus_fk FOREIGN KEY ( campus_id_campus )
        REFERENCES campus ( id_campus );

ALTER TABLE carteira
    ADD CONSTRAINT carteira_sala_fk FOREIGN KEY ( sala_id_sala )
        REFERENCES sala ( id_sala );

ALTER TABLE sala
    ADD CONSTRAINT sala_bloco_fk FOREIGN KEY ( bloco_id_bloco )
        REFERENCES bloco ( id_bloco );

