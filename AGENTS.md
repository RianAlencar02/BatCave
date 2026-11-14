## Visão geral
Esse sistema é um Projeto Individual da matéria de Pesquisa e Inovação (PI) em meu primeiro semestre no curso de Análise e Desenvolvimento de Sistemas, com a principal finalidade deste projeto sendo o aprendizado.
Esse sistema é o BatCave, um sistema voltado para fãs do Batman e do universo deste personagem, onde os usuários conseguem visualizar histórias cadastradas no site, e cada história contém uma sinopse própria e opções para: Fazer um quiz daquela história, avaliar e favoritar a história. O sistema tamém contempla uma área de Personagens, onde os usuários podem visualizar um personagem já cadastrado, visualizar sua biografia e favoritar ou fazer um quiz daquele personagem. Por fim, tanto as histórias quanto os personagens tem uma sessão chamada "Comentario do editor", um comentario escrito pelo desenvolvedor do site sobre a opnião dele sobre aquela história/personagem.
## Tecnologias
Principais tecnologias: HTML, CSS, JS (JavaScript), MySQL, API web-data-viz (API que usa o Node.js para conexão do sistema web com o banco de dados MySQL) e opencode, uma ferramenta de assistência para desenvolvimento com IA.

## Comandos
npm i (para a instalação das dependências.)
npm start (para inicializar o projeto e a conexão com o banco de dados.)

## Arquitetura
Estrutura do projeto:
public: Diretório responsável por conter os arquivos HTML, CSS, JS e assets/imagens do projeto. É um diretório mais voltado para o que será visualizado pelo usuário. 
node_modules: Diretório responsável por todas as dependências necessárias para o funcionamento do projeto. Esse diretório só existe após digitar o comando "npm i".
src: Diretório responsável por grande parte do "back-end" do projeto. Dentro deste diretório, existirão outros diretórios importantes onde cada diretório terá arquivos com funções únicas:
- controllers: Diretório responsável por conter diferentes arquivos JS. Cada arquivo representa uma possível entidade ou função diferente do sistema, onde muitos terão conexões com o diretório "models" para preparar a execução de queries SQL. É o responsável, por exemplo, de receber um "email" e "senha" de um usuário, tratar esses dados e preparar a inserção desses dados no MySQL.
- database: Diretório responsável por conter arquivos referentes a configuração do banco de dados. Pode conter um arquivo de configuração do banco e um outro de criação do banco de dados e de suas tabelas. 
- models: Diretório responsável por conter arquivos .JS com as principais queries que serão utilizadas no sistema. 
- routes: Diretório responsável por conter as "rotas" do sistema. Neste arquivo, ele redireciona dados recebidos de uma página HTML para um arquivo do diretório controller para executar alguma função.
.env: Arquivo responsável por armazenar as configurações do ambiente e do banco de dados.
.gitigonre: Arquivo que dita o que vai ser ignorado pelo GitHub. Deve ser usado para não enviar nenhuma informação confidencial do usuário ou algo que possa comprometer o projeto.
app.js: Arquivo importantíssimo para o funcionamento do projeto. Nele, são declarado variáveis e funções importantes para o sistema todo, além de ser o responsável por parte da configuração do servidor (junto do .env).

Sempre que for necessário criar um arquivo, verificar sua funcionalidade para analisar onde ele deve ser criado. Arquivos voltados para o "back-end" sempre são armazenados no diretório src, enquanto os arquivos que serão visualizados pelo usuário (arquivos HTML, CSS, imagens) são armazenados no diretório public. 
É comum que, de um arquivo HTML ou qualquer outra funcionalidade, seja seguido uma "trilha de diretórios", onde primeiramente são chamados pelas "routes", depois os dados são enviados para os "controllers" e por fim, são usados em "models".

## Padrões de desenvolvimento
Sempre nomear arquivos, váriaveis e functions no estilo camelCase (nomeUsuario, emailUsuario, senhaUsuario).
Sempre armazenar arquivos em sua respectiva pasta (arquivos .css na pasta css, imagens na pasta assets).
Para commits, sempre escrever um comentário que seja condizente ao que foi feito no projeto ("Criação da página de cadastro (paginaCadastro.html)", "Estilização da página de cadastro (styleCadastro.css)").

## Cuidados e restrições
Sempre listar todas as alterações e tudo que foi criado.
Antes de fazer qualquer alteração em arquivos de configurações, como o .env, main.js ou qualquer outro arquivo importante para a execução do projeto, exigir permissão e listar o que será alterado.
Nunca deletar arquivo algum. Caso sejá necessário, avisar qual arquivo o desenvolvedor deve excluir e o porquê disso.

## Regra geral: 
Ao iniciar, sempre executar "npm i" para instalar as dependências do projeto.
Após a instalação de dependências, executar "npm start" para iniciar o projeto.
Caso a especificação pedida envolver somente o front-end (HTML e CSS), ignorar o npm start e fazer somente o que foi exigido, sem verificar ligação com banco ou dependencias.
Seguir o padrão de estrutura do projeto.
Seguir sempre o padrão do código que estiver analisando.
Seguir todas as orientações deste arquivo. 
Caso haja a necessidade de alguma informação, analise o projeto e siga os padrões já adotados no mesmo. 
Sempre que, eu exigir algo ou pedir uma nova função, você deve guardar meus prompts em um arquivo .md dentro de "DOCUMENTOS_DE_APOIO/prompts", e também guardar todas as respostas que me enviar no mesmo arquivo, sempre especificando o prompt e a resposta.