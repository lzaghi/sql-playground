SELECT
    COUNT(c.cancao) AS cancoes,
    COUNT(DISTINCT ar.artista) AS artistas,
    COUNT(DISTINCT al.album) AS albuns
FROM SpotifyClone.cancao AS c
    INNER JOIN SpotifyClone.artista AS ar ON c.artista_id = ar.artista_id
    INNER JOIN SpotifyClone.album AS al ON c.album_id = al.album_id;