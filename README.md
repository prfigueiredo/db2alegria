# BD2 Alegria+

Modelagem do banco de dados do serviço da Alegria+, distribuição de Filmes e Series de comédia.

## O projeto está organizado da seguinte forma:

Na raíz temos o `create.sql` que as criações para o schema e as tabelas. Também contém os relacionamentos.
Também na raíz, podemos ver as pastas "functions", "selects", "triggers" e "views".
Em cada uma dessas pastas temos como conteúdo as funções, os selectes, as triggers e as views, respectivamente.

Na pasta de select ainda temos segregação por "usuários" e "videos".


## Funções

1. Quantidade de Epsódios em uma temporada (`countEpsodiesBySeason(seasonID INTEGER) RETURNS INTEGER`):
   1. Retorna quantidade de epsódios numa temporada.
2. Quantidade de temporadas na série (`countSeasonBySerie(serieID INTEGER) RETURNS INTEGER`):
   1. Retorna quantidade de temporadas numa série.
3. Lista de Personagens num dado epsodio ou filme (`characterListByMovieID(videoID INTEGER) | characterListByEpsodieID(videoID INTEGER) RETURNS TABLE`):
   1. Retorna o nome de todos os personagens num epsódio ou filme.
4. Cria regra de distribuição (`setDefaultDistributionRule(videoID INTEGER) RETURNS VOID`):
   1. Essa função tem a responsabilidade de vincular um dado video_id passado como parametro a regra de distribuição padrão. A regra de distribuição padrão é permitir distribuição no Brasil.
5. Tempo total de videos assistidos por usuário (`GET_TOTAL_HORAS_ASSISTIDAS() RETURNS VARCHAR`):
   1. Essa função tem por responsabilidade retornar o total de horas assistidas na plataforma, formatando os minutos para horas.

## Selects
1. Planos mais assinados: Retorna os planos mais assinados da plataforma, junto com seu identificador e a quantidade de assinantes
2. Quantidade de planos ativos: Retorna a quantidade de planos ativos e inativos na plataforma, agrupando por planos ativos.
3. Usuário x título x quantidade assistida: Retorna quantas vezes o usuário assitiu o título.
4. Três filmes mais longos: Retorna os três filmes mais longos na plataforma que já estejam publicados (filmes que ainda não foram publicados são desconsiderados)
5. Assistir depois: Retorna a lista de "Assistir depois" dos usuários, mostrando o nome do usuário e o nome do título que está na sua lista.
6. Continuar assistindo: Retorna a lista de "Continuar assistindo" dos usuários, mostrando o nome do usuário, o nome do título que está na sua lista e quanto tempo falta para finalizar o título.
7. Quantidade de videos por país: Retorna a quantidade de vídeos disponíveis por cada país cadastrado no banco de dados.
8. Títulos disponívels no BR: Retorna a lista de todos os títulos disponíveis em um determinado país (neste caso BR).

## Triggers
1. Controle videos assistidos: Quando um update é feito na tabela `continue_watching` e o valor restante é setado para 0 (quando o título acaba), a trigger é responsável por captar o evento e inserir na tabela de controle de títulos assistidos.
2. Refresh publiehd videos: Responsável por atualizar a view materializada `published_videos`
3. Regra distribuição video: Responsável por triggar o `setDefaultDistributionRule` ao inserir um novo video. Setando o distribution rule para o BR.

## Views
1. Published videos: Retorna a quantidade de videos publicados na plataforma
2. User view: Retorna o nome de usuário e quanto ele paga no seu plano. Caso seu plano esteja inativo, o valor de retorno é zero.

