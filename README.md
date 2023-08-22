
# SQL Playground

Essa é uma projeto que simula um banco de dados MySQL de uma aplicação de músicas. É possível recuperar e filtrar várias informações a respeito dos usuários, artistas e canções.

O foco desse projeto foi organizar e popular um banco de dados a partir de tabelas não normalizadas, para em seguida explorar a aplicação de queries SQL.

## O banco de dados

A partir do [arquivo de dados não normalizados](SpotifyClone-Non-NormalizedTable.xlsx), foram estruturadas sete tabelas no banco de dados.

O diagrama abaixo ilustra a estrutura dos dados normalizados.
![](diagrama.png)


## Funcionalidades

A partir dos dados disponíveis, foram estruturadas queries SQL para:

- Recuperar o total de artistas, canções e álbuns
- Contabilizar a quantidade de músicas ouvidas e minutos totais ouvidos por cada usuário
- Checar se o usuário está ativo ou inativo
- Recuperar a quantidade de reproduções de uma música
- Recuperar o faturamento mínimo, máximo, médio e total obtido com o plano dos usuários
- Contabilizar os seguidores de cada artista
- Recuperar os álbuns de cada artista
- Recuperar a quantidade de músicas no histórico de cada usuário
- Recuperar a quantidade de reproduções de cada música


## Tecnologias utilizadas

SQL queries, MySQL, MySQL Workbench, Docker


## Instalação local

O projeto é configurado com containeres node e mysql, portanto para rodar esta aplicação é necessário ter o Docker e o Docker Compose (v1.29 ou superior) instalados em sua máquina.

1. Clone o repositório e entre no diretório
```bash
  git clone git@github.com:lzaghi/sql-playground.git
  cd sql-playground
```

2. Instale as dependências 
```bash
  npm install
```
3. Suba os containeres
```bash
  docker-compose up -d --build
```

A consulta das pode ser feita diretamente a partir de um cliente MySQL de sua preferência, como o MySQL Workbench.
Conecte-se na porta ```3006``` com as credenciais de user ```root``` e senha ```password```.

As queries podem ser encontradas nos arquivos ```desafio[n].sql```.
Note que em ```desafio1.sql``` está a query que cria as tabelas e popula o banco de dados, e nos arquivos subsequentes estão as queries de consulta.

