# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login e Histórias, Personagens, e Login e Dashboard administrativa. Atualmente, um usuário consegue se cadastrar e avaliar histórias ou favoritar um personagem ou história. Porém, não existe uma tela de perfil para o usuário visualizar suas próprias informações e suas interações com o site (favoritar, avaliar, quiz).
## 2. Objetivo
Criar uma tela "Perfil", com telas para o usuário ver suas próprias informações, seus favoritados, avaliados e quizes concluidos.

## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar uma tela "Perfil", com um botão de "Sair" em cada uma das telas, e as telas que serão de listagem (como a de favoritar, avaliar e curtir) devem conter cards que, dentro de uma div, ainda será possível scrollar para baixo e visualizar as interações restantes.

## 5. Regras de negócio
**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interface
* **Navbar Superior:** Logo `BatCave` à esquerda[cite: 16, 17, 18, 19], links de navegação centrais (`Home`, `Histórias`, `Personagens`, `Curiosidades`)[cite: 16, 17, 18, 19] e ações à direita com botão ativo `Meu perfil` (`#C62839`) e botão vazado `Sair`[cite: 16, 17, 18, 19].
* **Título da Página:** Nome do usuário logado em caixa alta e destaque vermelho (`#C62839`) alinhado à esquerda (ex.: `RIAN ALENCAR`)[cite: 16, 17, 18, 19].
* **Barra de Navegação por Abas (Tabs):** Container arredondado (`#191D24`) ocupando a largura total com 4 abas horizontais[cite: 16, 17, 18, 19]: `Visão geral`, `Favoritos (N)`, `Histórias avaliadas (N)` e `Quizzes concluídos (N)`[cite: 16, 17, 18, 19]. A aba selecionada recebe preenchimento sólido em `#C62839` com texto `#F2F4F7`[cite: 16, 17, 18, 19].
* **Aba 1 — Visão geral (`perfilInicial`):**
  * **Card Dados Pessoais (`#191D24`):** Cabeçalho com título `Dados pessoais` e botão vazado `Editar perfil` à direita[cite: 18]. Abaixo, grid de 3 colunas com caixas escuras (`#0A0C10`) exibindo rótulo (`#9AA5B1`) e valor (`#F2F4F7`) para `Nome`, `E-mail` e `Data de criação`[cite: 18].
  * **Cards de Métricas:** Grid inferior de 3 colunas com cards em `#23364D` exibindo número grande em destaque (`#F2F4F7`) e descrição abaixo para: `Personagens ou histórias favoritadas`, `Histórias avaliadas` e `Quizzes concluídos`[cite: 18].
* **Aba 2 — Favoritos (`perfilFavoritados`):**
  * **Cabeçalho da Seção:** Título `Meus favoritos` à esquerda e controle `Filtrar por:` com seletor dropdown (`Todos`, `Histórias`, `Personagens`) à direita[cite: 17].
  * **Lista de Itens:** Container principal (`#191D24`) listando linhas horizontais com miniatura retangular da obra/personagem, título em `#F2F4F7`, tag de categoria em azul claro (`História` ou `Personagem`) e botão sólido `#C62839` `Ver detalhes` à direita[cite: 17].
* **Aba 3 — Histórias avaliadas (`perfilAvaliados`):**
  * **Cabeçalho da Seção:** Título `Minhas avaliações` à esquerda e contador total (`N histórias avaliadas`) à direita[cite: 16].
  * **Tabela/Lista de Avaliações:** Container em `#191D24` com cabeçalhos de coluna (`HISTÓRIA`, `SUA NOTA`, `AVALIAÇÃO`) e cards internos escuros (`#0A0C10`) por item contendo: miniatura, categoria (`Quadrinho`, `Filme`, `Jogo`), título da história, data da avaliação, nota atribuída (`X / 5`) e botão escuro com borda `Ver detalhes`[cite: 16].
* **Aba 4 — Quizzes concluídos (`perfilQuizConcluido`):**
  * **Cabeçalho e Banner de Resumo:** Título `Meus quizzes concluídos` com contador à direita, seguido de uma barra horizontal em `#23364D` exibindo 3 métricas em linha: `Quizzes concluídos`, `Acertos no total` (ex.: `27 de 30`) e `Aproveitamento geral` (ex.: `90%`)[cite: 19].
  * **Lista de Resultados:** Cards horizontais (`#0A0C10` dentro de `#191D24`) contendo miniatura, status `CONCLUÍDO` em vermelho (`#C62839`), título da história, data de conclusão, pontuação (`X / 5` + percentual de acertos) e botão `Ver detalhes`[cite: 19].

## 7. Critérios de aceitação

Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar as imagens que estarão no diretório "DOCUMENTOS_DE_APOIO/imgs-referencia/" e começem com a palavara "perfil" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas para a criação desta. Faça com o padrão parecido com o que já foi criado. 
