# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login , Histórias, Personagens e uma tela para detalhar ambos (tanto história ou personagem).
Neste sistema, teremos um administrador, onde, após fazer um login em uma tela de login administrativo, ele consegue visualizar uma dashboard, que se divide em 4 partes: Dashboard, Usuários, Histórias e Personagens. Atualmente, somente a tela de Dashboard está feita.

## 2. Objetivo

Criar as outras telas da dashboard (histórias, usuários e personagens.), focando em manter exatamente igual ao protótipo e cuidar somente do front-end. Todos os protótipos estão localizadas em "DOCUMENTOS_DE_APOIO/imgs-referencia/".

## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem. Dashboard administrativa, com telas mostrando listagem de usuários, personagens e histórias.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar as telas restantes da dashboard, uma tela com seu titulo e uma listagem, onde para cada tela, haverá informações diferentes para cada item da lista, seguindo o protótipo.

## 5. Regras de negócio

**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interface

- **Tema:** Dark Mode administrativo em tons de preto e azul-acinzentado escuro[cite: 4, 5, 6].
- **Cores:**
  - Sidebar e fundo base: `#07090C`[cite: 4, 5, 6]
  - Card externo / Área de conteúdo: `#141820`[cite: 4, 5, 6]
  - Container da tabela e inputs: `#1E242E`[cite: 4, 5, 6]
  - Destaque primário (logo, botões de ação e `Detalhes`): `#0052CC` / `#0066FF` (azul vibrante)[cite: 4, 5, 6]
  - Item ativo na sidebar: `#243447` (azul acinzentado com bordas arredondadas)[cite: 4, 5, 6]
  - Textos: `#FFFFFF` (principal) e `#9AA5B4` (cabeçalhos de tabela/placeholders)[cite: 4, 5, 6]
- **Topo:** Logotipo do morcego em azul vibrante centralizado[cite: 4, 5, 6].
- **Navegação Vertical:** Links centralizados (`Dashboard`, `Usuários`, `Histórias`, `Personagens`)[cite: 4, 5, 6]. O item da rota atual recebe fundo destacado arredondado (`#243447`)[cite: 4, 5, 6].
- **Card Externo:** Container escuro com bordas arredondadas contendo o título da seção em branco (`Personagens`, `Usuários` ou `Histórias`)[cite: 4, 5, 6].
- **Card Interno (Barra de Ferramentas + Tabela):**
  - **Barra de Ações (Topo):**
    - _Esquerda:_ Botão azul de criação (`+ Novo personagem` ou `+ Nova história`) — **ausente na tela de Usuários**[cite: 4, 5, 6].
    - _Direita:_ Campo de busca (`Buscar por nome...`) + selects de filtro/ordenação (`Mais Favoritados`, `Mais recentes`, `Todos os tipos`)[cite: 4, 5, 6].
  - **Listagem / Tabela:**
    - **Personagens:** Thumbnail retangular + `Nome`, `Categoria` (ex: _Herói_) e botão azul `Detalhes`[cite: 4].
    - **Usuários:** Avatar circular padrão + `Nome`, `Email` e botão azul `Detalhes`[cite: 5].
    - **Histórias:** Thumbnail retangular + `Nome`, `Tipo` (badge azul escuro, ex: _Filme_), `Nota` (ex: _4.8_) e botão azul `Detalhes`[cite: 6].
    - **Compatibilidade (Notebook e PC):** Sidebar com largura fixa (~220px–250px) e área principal fluida (`flex: 1`) que se adapta sem quebrar colunas tanto em telas de notebook (`1366x768`) quanto em monitores Full HD/PC.
- **Interação:** Filtragem em tempo real pela busca/selects, hover nos botões e navegação para criação ou tela de detalhes ao clicar nos botões azuis.

## 7. Critérios de aceitação

Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar as imagens que estão no diretório "DOCUMENTOS_DE_APOIO/imgs-referencia/" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas já existentes para a criação desta. Faça com o padrão parecido com o que já foi criado na outra tela da dashboard (trazendo a mesma NavBar lateral).
- Não se preocupar com responsividade ou media query, somente fazer o front-end básico, seguindo o protótipo. 
