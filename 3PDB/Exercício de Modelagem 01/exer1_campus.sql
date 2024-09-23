CREATE TABLE bloco (
    idbloco          VARCHAR2(1 CHAR) NOT NULL,
    quantsalas       INTEGER NOT NULL,
    andares          INTEGER NOT NULL,
    campus_id_campus INTEGER NOT NULL
);

ALTER TABLE bloco ADD CONSTRAINT bloco_pk PRIMARY KEY ( idbloco );

CREATE TABLE campus (
    nome     VARCHAR2(50) NOT NULL,
    idcampus INTEGER NOT NULL,
    cep      INTEGER NOT NULL
);

ALTER TABLE campus ADD CONSTRAINT campus_pk PRIMARY KEY ( idcampus );

CREATE TABLE carteira (
    idcarteira   INTEGER NOT NULL,
    ladobraco    VARCHAR2(7 CHAR) NOT NULL,
    sala_id_sala INTEGER NOT NULL
);

ALTER TABLE carteira ADD CONSTRAINT carteira_pk PRIMARY KEY ( idcarteira );

CREATE TABLE sala (
    idsalas        INTEGER NOT NULL,
    quantcarteiras INTEGER NOT NULL,
    area           FLOAT NOT NULL,
    bloco_id_bloco VARCHAR2(1 CHAR) NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( idsalas );

ALTER TABLE bloco
    ADD CONSTRAINT bloco_campus_fk FOREIGN KEY ( campus_id_campus )
        REFERENCES campus ( idcampus );

ALTER TABLE carteira
    ADD CONSTRAINT carteira_sala_fk FOREIGN KEY ( sala_id_sala )
        REFERENCES sala ( idsalas );

ALTER TABLE sala
    ADD CONSTRAINT sala_bloco_fk FOREIGN KEY ( bloco_id_bloco )
        REFERENCES bloco ( idbloco );