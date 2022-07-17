# Alegria+

Modelagem do banco de dados do serviço da Alegria+, distribuição de Filmes e Series de comédia.


## Funções

1. Quantidade de Epsódios em uma temporada (`countEpsodiesBySeason(seasonID INTEGER) RETURNS INTEGER`):
   1. Retorna quantidade de epsódios numa temporada.
2. Quantidade de temporadas na série (`countSeasonBySerie(serieID INTEGER) RETURNS INTEGER`):
   1. Retorna quantidade de temporadas numa série.
3. Lista de Personagens num dado epsodio ou filme (`characterListByMovieID(videoID INTEGER) | characterListByEpsodieID(videoID INTEGER) RETURNS TABLE`):
   1. Retorna o nome de todos os personagens num epsódio ou filme.
4. Cria regra de distribuição (`setDefaultDistributionRule(videoID INTEGER) RETURNS VOID`):
   1. Essa função tem a responsabilidade de vincular um dado video_id passado como parametro a regra de distribuição padrão. A regra de distribuição padrão é permitir distribuição no Brasil.
5. Tempo total de videos assistidos por usuário
