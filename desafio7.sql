SELECT
    ar.artista,
    al.album,
    COUNT(s.artista_id) AS seguidores
FROM SpotifyClone.artista AS ar
    INNER JOIN SpotifyClone.album AS al ON ar.artista_id = al.artista_id
    INNER JOIN SpotifyClone.seguindo AS s ON ar.artista_id = s.artista_id
GROUP BY ar.artista, al.album
ORDER BY
    seguidores DESC,
    ar.artista,
    al.album;