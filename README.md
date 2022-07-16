# Alegria+

Modelagem do banco de dados do serviço da Alegria+, distribuição de Filmes e Series de comédia.


## Funções

1. Quantidade de Epsodios em uma temporada
2. Quantidade de temporadas na serie
3. Lista de Personagens num dado epsodio ou filme
4. Cria regra de distribuição (`setDefaultDistributionRule`):
   1. Essa função tem a responsabilidade de vincular um dado video_id passado como parametro a regra de distribuição padrão. A regra de distribuição padrão é permitir distribuição no Brasil.
5. Tempo total de videos assistidos por usuário
