-- 1. Total de abates de bovinos por região no 2º Trimestre de 2024
SELECT r.nome_regiao, SUM(a.qtd_abtd) AS total_bovinos_abatidos
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
JOIN dm_regiao r ON e.regiao_id = r.regiao_id
WHERE a.animal_id = 1 AND a.trimestre = '2º Trimestre' AND a.ano = 2024
GROUP BY r.nome_regiao;

-- 2. Peso total das carcaças de frangos por estado
SELECT e.nome_estado, SUM(a.peso_carcacas) AS total_peso_carcacas
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
WHERE a.animal_id = 3
GROUP BY e.nome_estado
ORDER BY total_peso_carcacas DESC;

-- 3. Estados com maior número de informantes para abate de suínos
SELECT e.nome_estado, SUM(a.num_informants) AS total_informantes
FROM dm_abate a
JOIN dm_uf e ON a.estado_id = e.estado_id
WHERE a.animal_id = 2
GROUP BY e.nome_estado
ORDER BY total_informantes DESC
LIMIT 5;
