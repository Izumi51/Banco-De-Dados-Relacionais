## 1. Exercício: Identificação de Dependências Funcionais.
Dada a tabela abaixo, identifique as dependências funcionais:

| PedidoID | ClienteID | DataPedido | NomeCliente |
|----------|-----------|------------|-------------|
| 1 | 101 | 01/01/2024 | João |
| 2 | 102 | 02/01/2024 | Maria |
| 3 | 101 | 03/01/2024 | João |

Quais são as dependências funcionais presentes?

> - PedidoID → DataPedido
> - PedidoID → ClienteID, NomeCliente

## 2. Exercício: Aplicação de 1FN.

A tabela abaixo está na 1FN?

| ClienteID | NomeCliente | Telefones |
|-----------|--------------|------------------|
| 1 | João da Silva| (11) 9999-9999, (11) 8888-8888 |

Se não estiver, normalize-a para que atenda à 1FN.

> | ClienteID | NomeCliente | Telefones |
> |-----------|--------------|------------------|
> | 1 | João da Silva| (11) 9999-9999 |
> | 1 | João da Silva| (11) 8888-8888 |

## 3. Exercício 3: Aplicação de 2FN.
A tabela a seguir está na 2FN?

| CursoID | AlunoID | NomeAluno | Nota |
|---------|---------|-----------|------|
| 1 | 101 | João | 8.5 |
| 2 | 102 | Maria | 9.0 |

Se não estiver, normalize-a para que atenda à 2FN.

> | CursoID | AlunoID | Nota |
> |---------|---------|------|
> | 1 | 101 | 8.5 |
> | 1 | 102 | 9.0 |

> | AlunoID | NomeAluno |
> |---------|------------|
> | 101 | João |
> | 102 | Maria |

## 4. Exercício 4: Aplicação de 3FN.
A tabela a seguir está na 3FN?

| DepartamentoID | Gerente | SalárioGerente |
|----------------|-------------|----------------|
| 1 | João Silva | 8.000 |
| 2 | Maria Souza | 7.500 |

Se não estiver, normalize-a para que atenda à 3FN.

> | DepartamentoID | Gerente |
> |----------------|-------------|
> | 1 | João Silva |
> | 2 | Maria Souza |

>| Gerente | SalárioGerente |
>|-------------|----------------|
>| João Silva | 8.000 |
>| Maria Souza | 7.500 |