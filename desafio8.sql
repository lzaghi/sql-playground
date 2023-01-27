SELECT ar.artista, al.album
FROM SpotifyClone.artista AS ar
    INNER JOIN SpotifyClone.album AS al ON ar.artista_id = al.artista_id
WHERE
    ar.artista = 'Elis Regina';