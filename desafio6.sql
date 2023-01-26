SELECT
    CAST(
        MIN(p.valor_plano) AS DECIMAL(10, 2)
    ) AS faturamento_minimo,
    CAST(
        MAX(p.valor_plano) AS DECIMAL(10, 2)
    ) AS faturamento_maximo,
    CAST(
        ROUND(AVG(p.valor_plano), 2) AS DECIMAL(10, 2)
    ) AS faturamento_medio,
    CAST(
        ROUND(SUM(p.valor_plano), 2) AS DECIMAL(10, 2)
    ) AS faturamento_total
FROM SpotifyClone.plano AS p
    INNER JOIN SpotifyClone.usuario as u ON p.plano_id = u.plano_id;