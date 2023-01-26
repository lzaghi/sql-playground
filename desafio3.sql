SELECT
    u.usuario,
    COUNT(h.usuario_id) AS qt_de_musicas_ouvidas,
    ROUND( (SUM(c.duracao_segundos) / 60),
        2
    ) AS total_minutos
FROM SpotifyClone.usuario AS u
    INNER JOIN SpotifyClone.historico AS h ON u.usuario_id = h.usuario_id
    INNER JOIN SpotifyClone.cancao AS c ON h.cancao_id = c.cancao_id
GROUP BY h.usuario_id
ORDER BY u.usuario;