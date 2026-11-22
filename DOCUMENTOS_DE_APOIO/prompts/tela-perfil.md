# Prompts e Respostas — Telas de Perfil

## Prompt 1

> Leia "DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telasPerfil).md" e gere um plano de implementação em "DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPerfil).md". Inclua: arquivos alterados ou criados, componentes, fluxo, regras de negócio, decisões técnicas e etapas numeradas com a forma de validar cada uma. Não implemente nada. Apenas planeje.

### Resposta 1

Plano gerado (aprovado pelo usuário) e gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPerfil).md`, contendo:

- **Arquivos:** criação de `public/perfil.html`, `public/css/perfil.css`, `public/js/perfil.js` (só troca de abas), `DOCUMENTOS_DE_APOIO/prompts/tela-perfil.md` e do próprio plano; alteração de 10 HTMLs existentes trocando o href quebrado `perfilLogin.html` → `perfil.html`; nada em `app.js`, `src/*` ou `.env`.
- **Componentes:** navbar padrão com bloco estático `Meu perfil` (sólido) + `Sair` (vazado) no lugar do bloco logado (sem `navBar.js`, que exigiria os ids `deslogado`/`logado`/`nomeUsuario`), título `RIAN ALENCAR`, barra de 4 abas e as 4 seções — Visão geral (card de dados pessoais + 3 cards de métricas), Favoritos (filtro + lista), Histórias avaliadas (tabela com cabeçalho de colunas) e Quizzes concluídos (banner de métricas + lista).
- **Fluxo:** navbar das demais páginas → `perfil.html` → abas via `perfil.js` → `Ver detalhes` (`detalhesHistoria.html?idHistoria=1|2|3` conforme seed `BatCave.sql` e `detalhesPersonagem.html`) → `Sair` → `login.html`. Sem API, sem novas queries.
- **Regras de negócio:** nenhuma funcional (front-end apenas, conforme seção 5 da spec); dados mockados; filtro do dropdown apenas visual; `Editar perfil` inoperante (`href="#"`).
- **Decisões técnicas:** CSS por página no padrão do projeto; paleta do projeto (`#0b0b0d`, `#191d24`, `#1a2230`, `#23364d`, `#c62839`, `#f2f4f7`, `#9aa5b1`); JS mínimo só nas abas; valores do protótipo mantidos mesmo com inconsistências; **sem media query/responsividade**.
- **Etapas numeradas (8)** com validação para cada uma.

## Perguntas de esclarecimento (durante o planejamento)

**Pergunta 1:** Qual nome usar para o HTML da tela de perfil? (todas as navbars já apontam para `./perfilLogin.html`, arquivo inexistente)

**Resposta do usuário:** `perfil.html` — atualizando o href nas páginas existentes.

**Pergunta 2:** A spec diz "somente HTML e CSS", mas as abas, o filtro "Filtrar por" e o botão "Sair" são interativos. Como tratar?

**Resposta do usuário:** **JS mínimo só nas abas**; filtro apenas visual (select sem efeito); `Sair` como link.

**Pergunta 3:** De onde vêm os dados exibidos (nome, e-mail, listas, métricas)?

**Resposta do usuário:** **Estáticos no HTML** (mockado igual ao protótipo).

## Prompt 2

> Ok, deste plano de implementação, remova mediaquery e tudo que emvolve responsividade. Ainda não aprendi ou vi como usar isso, então remova do código.

### Resposta 2

Plano revisado sem nenhuma menção a responsividade: removida a etapa de media query/empilhamento do CSS e o teste de resize; incluída nas decisões técnicas e nos critérios de aceitação a nota "sem media query e sem regras de responsividade — layout fixo para desktop".

## Prompt 3

> Ok, pode gravar. / Pode gravar o plano.

### Resposta 3

Plano revisado gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPerfil).md` (na primeira tentativa a escrita foi bloqueada pelo modo plano de leitura; na segunda, após liberação, o arquivo foi criado).

## Prompt 4

> Ok, agora seguindo o plano de implementação de telas de perfil, crie as telas.

### Resposta 4

Implementação concluída seguindo o plano:

- **Criado `public/perfil.html`** — navbar padrão com bloco `Meu perfil`/`Sair`, título `RIAN ALENCAR`, barra de 4 abas e as 4 seções com conteúdo estático (dados pessoais + métricas; 2 favoritos; 3 avaliações; banner de quizzes + 3 resultados), com `Ver detalhes` apontando para `detalhesHistoria.html?idHistoria=1|2|3` e `detalhesPersonagem.html`.
- **Criado `public/css/perfil.css`** — paleta e fontes do projeto, grids de 3 colunas, listas com `max-height` + `overflow-y: auto`, **sem media query**.
- **Criado `public/js/perfil.js`** — somente troca de abas via as classes `abaAtiva` (padrão: Visão geral).
- **Alterados 10 HTMLs** — href `./perfilLogin.html` → `./perfil.html` em `index`, `login`, `historias`, `personagens` (3 listas), `detalhesHistoria`, `detalhesPersonagem` e `telaQuiz`; validado que não resta nenhuma referência a `perfilLogin`.
- **Nada alterado** em `app.js`, `src/*`, `.env`, `navBar.css`/`navBar.js` ou demais páginas.
