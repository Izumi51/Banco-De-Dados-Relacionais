-- 1. Encontre os nomes de todos os empregados que trabalham para o departamento de Engenharia Civil.
SELECT nomeEmpregado 
FROM empregado 
WHERE deptoEmpregado = 2;

-- 2. Para todos os projetos localizados em “São Paulo”, listar os números dos projetos, os números 
-- dos departamentos, e o nome do gerente do departamento.
SELECT p.numeroProjeto, dp.numeroDepto, e.nomeEmpregado AS nomeGerente
FROM projeto p
JOIN departamento_projeto dp ON p.numeroProjeto = dp.numeroProjeto
JOIN departamento d ON dp.numeroDepto = d.numeroDepartamento
JOIN empregado e ON d.rgGerente = e.rgEmpregado
WHERE p.localizacao = 'São Paulo';

-- 3. Encontre os empregados que trabalham em todos os projetos controlados pelo departamento número 3.
SELECT e.nomeEmpregado
FROM empregado e
JOIN empregado_projeto ep ON e.rgEmpregado = ep.rgEmpregado
WHERE NOT EXISTS (
    SELECT dp.numeroProjeto 
    FROM departamento_projeto dp 
    WHERE dp.numeroDepto = 3 
    MINUS 
    SELECT ep.numeroProjeto 
    FROM empregado_projeto ep 
    WHERE ep.rgEmpregado = e.rgEmpregado
);

-- 4. Faça uma lista dos números dos projetos que envolvem um empregado chamado “Fernando” como um 
-- trabalhador ou como um gerente do departamento que controla o projeto.
SELECT DISTINCT ep.numeroProjeto
FROM empregado e
JOIN empregado_projeto ep ON e.rgEmpregado = ep.rgEmpregado
WHERE e.nomeEmpregado = 'Fernando'
UNION
SELECT dp.numeroProjeto
FROM departamento_projeto dp
JOIN departamento d ON dp.numeroDepto = d.numeroDepartamento
JOIN empregado e ON d.rgGerente = e.rgEmpregado
WHERE e.nomeEmpregado = 'Fernando';

-- 5. Liste os nomes dos empregados que não possuem dependentes.
SELECT e.nomeEmpregado
FROM empregado e
WHERE NOT EXISTS (
    SELECT 1 
    FROM dependentes d 
    WHERE d.rgResponsavel = e.rgEmpregado
);

-- 6. Liste os nomes dos gerentes que têm pelo menos um dependente.
SELECT DISTINCT e.nomeEmpregado
FROM empregado e
JOIN departamento d ON e.rgEmpregado = d.rgGerente
JOIN dependentes dp ON e.rgEmpregado = dp.rgResponsavel;

-- 7. Selecione o número do departamento que controla projetos localizados em Rio Claro.
SELECT dp.numeroDepto
FROM projeto p
JOIN departamento_projeto dp ON p.numeroProjeto = dp.numeroProjeto
WHERE p.localizacao = 'Rio Claro';

-- 8. Selecione o nome e o RG de todos os funcionários que são supervisores.
SELECT DISTINCT e.nomeEmpregado, e.rgEmpregado
FROM empregado e
JOIN empregado sub ON e.rgEmpregado = sub.rgSurpevisor;

-- 9. Selecione todos os empregados com salário maior ou igual a 2000,00.
SELECT nomeEmpregado FROM empregado WHERE salarioEmpregado >= 2000.00;

-- 10. Selecione todos os empregados cujo nome começa com ‘J’.
SELECT nomeEmpregado FROM empregado WHERE nomeEmpregado LIKE 'J%';

-- 11. Mostre todos os empregados que têm ‘Luiz’ ou ‘Luis’ no nome.
SELECT nomeEmpregado
FROM empregado
WHERE nomeEmpregado LIKE '%Luiz%' OR nomeEmpregado LIKE '%Luis%';

-- 12. Mostre todos os empregados do departamento de ‘Engenharia Civil’.
SELECT e.nomeEmpregado
FROM empregado e
JOIN departamento d ON e.deptoEmpregado = d.numeroDepartamento
WHERE d.nomeDepartamento = 'Engenharia Civil';

-- 13. Mostre todos os nomes dos departamentos envolvidos com o projeto ‘Motor 3’.
SELECT DISTINCT d.nomeDepartamento
FROM departamento d
JOIN departamento_projeto dp ON d.numeroDepartamento = dp.numeroDepto
JOIN projeto p ON dp.numeroProjeto = p.numeroProjeto
WHERE p.nomeProjeto = 'Motor 3';

-- 14. Liste o nome dos empregados envolvidos com o projeto ‘Financeiro 1’.
SELECT DISTINCT e.nomeEmpregado
FROM empregado e
JOIN empregado_projeto ep ON e.rgEmpregado = ep.rgEmpregado
JOIN projeto p ON ep.numeroProjeto = p.numeroProjeto
WHERE p.nomeProjeto = 'Financeiro 1';

-- 15. Mostre os funcionários cujo supervisor ganha entre 2000 e 2500.
SELECT DISTINCT e.nomeEmpregado
FROM empregado e
JOIN empregado sup ON e.rgSurpevisor = sup.rgEmpregado
WHERE sup.salarioEmpregado BETWEEN 2000 AND 2500;

-- 16. liste o nome dos gerentes que têm ao menos um dependente.
SELECT DISTINCT e.nomeEmpregado
FROM empregado e
JOIN departamento d ON e.rgEmpregado = d.rgGerente
JOIN dependentes dp ON e.rgEmpregado = dp.rgResponsavel;

-- 17. Atualize o salário de todos os empregados que trabalham no departamento 2 para R$ 3.000,00.
UPDATE empregado
SET salarioEmpregado = 3000.00
WHERE deptoEmpregado = 2;

-- 18. Fazer um comando SQL para ajustar o salário de todos os funcionários da empresa em 10%.
UPDATE empregado
SET salarioEmpregado = salarioEmpregado * 1.10;

-- 19. Mostre a média salarial dos empregados da empresa.
SELECT AVG(salarioEmpregado) AS mediaSalarial
FROM empregado;

-- 20. Mostre os nomes dos empregados (em ordem alfabética)  com salário maior que a média.
SELECT nomeEmpregado
FROM empregado
WHERE salarioEmpregado > (SELECT AVG(salarioEmpregado) FROM empregado)
ORDER BY nomeEmpregado;