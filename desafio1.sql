DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT PRIMARY KEY AUTO_INCREMENT,
        plano VARCHAR(45) NOT NULL,
        valor_plano DOUBLE NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT PRIMARY KEY AUTO_INCREMENT,
        usuario VARCHAR(150) NOT NULL,
        idade INT NOT NULL,
        plano_id INT NOT NULL,
        data_assinatura DATE NOT NULL,
        FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artista(
        artista_id INT PRIMARY KEY AUTO_INCREMENT,
        artista VARCHAR(150) NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album(
        album_id INT PRIMARY KEY AUTO_INCREMENT,
        album VARCHAR(200) NOT NULL,
        artista_id INT NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancao(
        cancao_id INT PRIMARY KEY AUTO_INCREMENT,
        cancao VARCHAR(150) NOT NULL,
        album_id INT NOT NULL,
        artista_id INT NOT NULL,
        duracao_segundos INT NOT NULL,
        ano_lancamento INT NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id),
        FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico(
        usuario_id INT NOT NULL,
        data_reproducao DATETIME NOT NULL,
        cancao_id INT NOT NULL,
        CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
        FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao (cancao_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo(
        usuario_id INT NOT NULL,
        artista_id INT,
        CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.plano (plano, valor_plano)
VALUES ('gratuito', 0.00), ('familiar', 7.99), ('universitario', 5.99), ('pessoal', 6.99);

INSERT INTO
    SpotifyClone.usuario (
        usuario,
        idade,
        plano_id,
        data_assinatura
    )
VALUES (
        'Barbara Liskov',
        82,
        1,
        '2019-10-20'
    ), (
        'Robert Cecil Martin',
        58,
        1,
        '2017-01-06'
    ), (
        'Ada Lovelace',
        37,
        2,
        '2017-12-30'
    ), (
        'Martin Fowler',
        46,
        2,
        '2017-01-17'
    ), (
        'Sandi Metz',
        58,
        2,
        '2018-04-29'
    ), (
        'Paulo Freire',
        19,
        3,
        '2018-02-14'
    ), (
        'Bell Hooks',
        26,
        3,
        '2018-01-05'
    ), (
        'Christopher Alexander',
        85,
        4,
        '2019-06-05'
    ), (
        'Judith Butler',
        45,
        4,
        '2020-05-13'
    ), (
        'Jorge Amado',
        58,
        4,
        '2017-02-17'
    );

INSERT INTO
    SpotifyClone.artista (artista)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

INSERT INTO
    SpotifyClone.album (album, artista_id)
VALUES ('Renaissance', 1), ('Jazz', 2), ('Hot Space', 2), ('Falso Brilhante', 3), ('Vento de Maio', 3), ('QVVJFA?', 4), ('Somewhere Far Beyond', 5), ('I Put A Spell On You', 6);

INSERT INTO
    SpotifyClone.cancao (
        cancao,
        album_id,
        artista_id,
        duracao_segundos,
        ano_lancamento
    )
VALUES ("BREAK MY SOUL", 1, 1, 279, 2022), (
        "VIRGO’S GROOVE",
        1,
        1,
        369,
        2022
    ), (
        "ALIEN SUPERSTAR",
        1,
        1,
        116,
        2022
    ), (
        "Don’t Stop Me Now",
        2,
        2,
        203,
        1978
    ), (
        "Under Pressure",
        3,
        2,
        152,
        1982
    ), (
        "Como Nossos Pais",
        4,
        3,
        105,
        1998
    ), (
        "O Medo de Amar é o Medo de Ser Livre",
        5,
        3,
        207,
        2001
    ), (
        "Samba em Paris",
        6,
        4,
        267,
        2003
    ), (
        "The Bard’s Song",
        7,
        5,
        244,
        2007
    ), ("Feeling Good", 8, 6, 100, 2012);

INSERT INTO
    SpotifyClone.historico (
        usuario_id,
        data_reproducao,
        cancao_id
    )
VALUES (1, "2022-02-28 10:45:55", 8), (1, "2020-05-02 05:30:35", 2), (1, "2020-03-06 11:22:33", 10), (2, "2022-08-05 08:05:17", 10), (2, "2020-01-02 07:40:33", 7), (3, "2020-11-13 16:55:13", 10), (3, "2020-12-05 18:38:30", 2), (4, "2021-08-15 17:10:10", 8), (5, "2022-01-09 01:44:33", 8), (5, "2020-08-06 15:23:43", 5), (6, "2017-01-24 00:31:17", 7), (6, "2017-10-12 12:35:20", 1), (7, "2011-12-15 22:30:49", 4), (8, "2012-03-17 14:56:41", 4), (9, "2022-02-24 21:14:22", 9), (10, "2015-12-13 08:30:22", 3);

INSERT INTO
    SpotifyClone.seguindo (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);