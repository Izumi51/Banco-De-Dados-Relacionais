Aula: Normalização de Bancos de Dados
e Dependência Funcional

Objetivos da Aula
- Compreender o conceito de dependência funcional e seu papel no design de bancos de
dados.
- Explicar as três primeiras formas normais (1FN, 2FN, 3FN) e como aplicá-las.
- Apresentar exemplos práticos e exercícios que demonstrem como identificar
dependências funcionais e normalizar tabelas.

# Parte 1: Dependência Funcional
Conceito de Dependência Funcional
Dependência funcional ocorre quando um atributo ou conjunto de atributos determina
outro atributo. Notação: A → B. Isso significa que o valor de B é determinado pelo valor de A.
Exemplos de Dependência Funcional
1. Tabela de Clientes:
    - ClienteID → NomeCliente (Cada ClienteID único determina exatamente um NomeCliente).
    - ClienteID → Email (Cada ClienteID também determina um Email).
2. Tabela de Produtos:
    - ProdutoID → NomeProduto (Cada ProdutoID único determina exatamente um
    NomeProduto).
    - ProdutoID → Preço (Cada produto tem um preço determinado pelo ProdutoID).

## Exemplo Prático: 
### Tabela de Funcionários
| CPF | Nome | Cargo | Salário |
|-------------|--------------|-----------|---------|
| 123.456.789-00 | João da Silva | Gerente | 5.000 |
| 987.654.321-00 | Maria Souza | Assistente| 3.500 |

Dependências Funcionais:
- CPF → Nome
- CPF → Cargo, Salário

# Parte 2: Formas Normais
Primeira Forma Normal (1FN)
Regras:
- Todos os atributos devem conter valores atômicos (indivisíveis).
- Eliminar grupos repetidos.
Exemplo:
> Tabela antes da 1FN (contendo listas de telefones em uma célula):
> 
> | ClienteID | NomeCliente | Telefones |
> |-----------|--------------|------------------|
> | 1 | João da Silva| (11) 9999-9999, (11) 8888-8888 |

> Tabela após a 1FN:
> 
> | ClienteID | NomeCliente | Telefone |
> |-----------|--------------|-----------------|
> | 1 | João da Silva| (11) 9999-9999 |
> | 1 | João da Silva| (11) 8888-8888 |

Segunda Forma Normal (2FN)
Regras:
- A tabela deve estar na 1FN.
- Eliminar dependências parciais.

Exemplo:

> Antes da 2FN:
> 
> | CursoID | AlunoID | NomeAluno | Nota |
> |---------|---------|------------|------|
> | 1 | 101 | João | 8.5 |
> | 1 | 102 | Maria | 9.0 |

Correção para 2FN (separar dados do aluno):
> Tabela de Inscrições:
> 
> | CursoID | AlunoID | Nota |
> |---------|---------|------|
> | 1 | 101 | 8.5 |
> | 1 | 102 | 9.0 |

> Tabela de Alunos:
> 
> | AlunoID | NomeAluno |
> |---------|------------|
> | 101 | João |
> | 102 | Maria |

Terceira Forma Normal (3FN)
Regras:
- A tabela deve estar na 2FN.
- Eliminar dependências transitivas.

Exemplo:

>Antes da 3FN:
>
>| DepartamentoID | Gerente | SalárioGerente |
>|----------------|-------------|----------------|
>| 1 | João Silva | 8.000 |
>| 2 | Maria Souza | 7.500 |

Correção para 3FN:

> Tabela de Departamentos:
>
> | DepartamentoID | Gerente |
> |----------------|-------------|
> | 1 | João Silva |
> | 2 | Maria Souza |

>Tabela de Gerentes:
>
>| Gerente | SalárioGerente |
>|-------------|----------------|
>| João Silva | 8.000 |
>| Maria Souza | 7.500 |

# Parte 3: Exercícios Práticos
## 1. Exercício: Identificação de Dependências Funcionais.
Dada a tabela abaixo, identifique as dependências funcionais:

| PedidoID | ClienteID | DataPedido | NomeCliente |
|----------|-----------|------------|-------------|
| 1 | 101 | 01/01/2024 | João |
| 2 | 102 | 02/01/2024 | Maria |
| 3 | 101 | 03/01/2024 | João |

Quais são as dependências funcionais presentes?

## 2. Exercício: Aplicação de 1FN.

A tabela abaixo está na 1FN?

| ClienteID | NomeCliente | Telefones |
|-----------|--------------|------------------|
| 1 | João da Silva| (11) 9999-9999, (11) 8888-8888 |

Se não estiver, normalize-a para que atenda à 1FN.

## 3. Exercício 3: Aplicação de 2FN.
A tabela a seguir está na 2FN?

| CursoID | AlunoID | NomeAluno | Nota |
|---------|---------|-----------|------|
| 1 | 101 | João | 8.5 |
| 2 | 102 | Maria | 9.0 |

## 4. Exercício 4: Aplicação de 3FN.
A tabela a seguir está na 3FN?

| DepartamentoID | Gerente | SalárioGerente |
|----------------|-------------|----------------|
| 1 | João Silva | 8.000 |
| 2 | Maria Souza | 7.500 |

Se não estiver, normalize-a para que atenda à 3FN.