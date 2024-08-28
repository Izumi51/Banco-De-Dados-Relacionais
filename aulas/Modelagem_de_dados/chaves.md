# Chaves Primária
A **Chave Primária** é um atributo ou um conjunto de atributos que identifica de forma excluisva cada resgistro da tabela.  
Responsável pela integridade dos dados, já que impede a duplicação de registros.
- Identifica exclusivamente;
- Não pode ser NULL;
- Uma tabela pode possuir apenas uma chave primária.

## exemplo
```sql
CREATE TABLE {{tabela}} (
    ID INT PRIMARY KEY AUTOINCREMENT,
);
--ou 

ALTER TABLE {{tabela}}
MODIFY COLUMN ID INT PRIMARY KEY;
```

# Chaves Estrangeira
A **Chave Estrangeira** é um atributo ou um conjunto de atributos que é responsável por estabelecer e manter a integridade dos dados entre as tabelas relacionadas.
- pode ser NULL (conhecido como registro orfão);
- Uma tabela pode possuir mais de uma ou nenhuma chave estrangeira.

## exemplo
```sql
CREATE TABLE {{tabela}} (
    ID INT PRIMARY KEY AUTOINCREMENT,
    chave_estrangeira INT, 
    FOREIGN KEY (chave_estrangeria) REFERENCES {{outra_tabela}} (id)
);
--ou 

ALTER TABLE {{tabela}}
MODIFY COLUMN ID INT PRIMARY KEY;
```

# Quem Herda a Chave?

### Relação N para 0 ou 1 >> o N ganha
### Relação 1 para 1 >> decisão do dev
### Relação N para N >> tabela auxiliar 