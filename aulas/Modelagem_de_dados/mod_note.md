# Comando: CREATE TABLE
Usado para criar uma tabela.
```sql
CREATE TABLE {{nome}}
    ({{coluna}} {{tipo}} {{opcoes}} COMMENT
    {{'COMENTARIO'}});
```
## exemplo
```sql
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
```

# Comando: INSERT
Usado para inserir registros em uma tabela.
```sql
INSERT INTO
    {{nome-tabela}}
    ([coluan1, coluna2,coluna(n)])***pode ocultar as colunas mas os valores precisaram estar em ordem <br>
VALUES ([valor-coluna1, valor-coluna2, valor-coluna(n)])
```
## exemplo
```sql
-- Inserts --
INSERT INTO aulasql.usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');

INSERT INTO aulasql.destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

INSERT INTO aulasql.reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');
```


# Comando: SELECT
Seleciona colunas de uma tabela.
```sql
SELECT {{lista_colunas}}
FROM tabela;

onde * retorna todas as colunas
```
## exemplo
```sql
-- Selecionar todos os registros da tabela "usuarios"
SELECT * FROM usuarios;

-- Selecionar apenas o nome e o email dos usuários
SELECT nome, email FROM usuarios;

```

# Comando: SELECT com WHERE
Seleciona colunas de uma tabela dada uma condição.
```sql
SELECT {{lista_colunas}}
FROM tabela
WHERE {{condicao}};
```
### Operadores Logicos
- = (igualdade)
- <> ou ! (desigualdade)
- '>' (maior que)
- < (menor que)
- '>=' (maior ou igual que)
- <= (menor ou igual que)
- LIKE (comparacao de padroes)
- IN (pertence a uma lista de valores)
- BETWEEN (dentro de um intervalo)
- AND (e logico)
- OR (ou logico)
## exemplo
```sql
-- Selecionar os usuários que possuem o nome "João Silva"
SELECT * FROM usuarios WHERE nome = 'João Silva';

-- Selecionar os usuários que nasceram antes de uma determinada data
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';

-- Like
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
SELECT * FROM usuarios WHERE nome LIKE '%João%';
```

# Comando: UPDATE
Atualiza um determinado registro em determinada coluna para um novo valor dada uma condição.
```sql
UPDATE {{tabela}}
SET
{{coluna1}}={{novo_valor_1}},
{{coluna2}}={{novo_valor_2}}
WHERE {{condicao}};
```
## exemplo
```sql
-- Update --
UPDATE usuarios SET endereco = 'Nova Rua, 123' WHERE email = 'joao@example.com';
```

# Comando: DELETE
Deleta determinado resgistro de uma tabela dada uma condição.
```sql
DELETE FROM
{{tabela}}
WHERE {{condicao}};
```
## exemplo
```sql
-- delete --
DELETE FROM reservas WHERE status = 'cancelada';
```
# Comando: DROP TABLE
Usado para remover uma tabela existente em um Banco de Dados Relacional. 
> Exclui permanentemente a tabela, ou seja, não é possivel recuperar a tabela.
```sql
DROP TABLE {{tabela}}
```
## exemplo
```sql
DROP TABLE usuarios
```

# Comando: ALTER TABLE
Usado para modificar a estrutura de uma tabela já existente em um Banco de Dados Relacional.
### Permite: 
- Adicionar, alterar ou excluir colunas;
- Modificar restrições, índices;
- Renomear a tabela entre outras alterações.
```sql
ALTER TABLE {{tabela}} {{modificacao}}
```
## exemplo
```sql
-- Renomeando nova tabela --
ALTER TABLE usuarios_nova RENAME usuarios;

-- Ou opção 2 : Alterar tamanho da coluna endereço -- 
ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(100);
```