-- Criado no phpmyadmin

CREATE TABLE usuarios (
	id INT, 
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuario',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do usuario',
    endereco VARCHAR(50) NOT NULL COMMENT 'Endereco do usuario',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuario'
);

CREATE TABLE aulasql.destinos (
	id INT, 
    nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descricao do destino'
);

CREATE TABLE aulasql.reservas (
	id INT COMMENT 'Id unico da reserva',
    id_usuario INT COMMENT 'Referencia ao Id do usuario',
    id_destino INT COMMENT 'Referencia ao Id do destino',
    data DATE COMMENT 'Data da reserva',
    status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada etc)'
);