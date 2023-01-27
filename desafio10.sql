SELECT
    c.cancao AS nome,
    COUNT(h.cancao_id) AS reproducoes
FROM SpotifyClone.cancao AS c
    INNER JOIN SpotifyClone.historico AS h ON c.cancao_id = h.cancao_id
    INNER JOIN SpotifyClone.usuario AS u ON h.usuario_id = u.usuario_id
    INNER JOIN SpotifyClone.plano AS p ON u.plano_id = p.plano_id
WHERE
    p.plano = 'gratuito'
    OR p.plano = 'pessoal'
GROUP BY h.cancao_id
ORDER BY c.cancao;