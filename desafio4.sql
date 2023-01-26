SELECT
    u.usuario,
    IF (
        YEAR(MAX(h.data_reproducao)) >= 2021,
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM SpotifyClone.usuario AS u
    INNER JOIN SpotifyClone.historico AS h ON u.usuario_id = h.usuario_id
GROUP BY h.usuario_id
ORDER BY u.usuario;