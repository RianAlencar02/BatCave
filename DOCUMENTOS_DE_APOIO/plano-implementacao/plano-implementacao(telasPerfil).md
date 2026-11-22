# Plano de implementação — Telas de Perfil

> Baseado em: `DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telasPefil).md` (nome do arquivo contém typo na spec)
> Protótipos: `perfilFavoritados.png`, `perfilAvaliados.png`, `perfilQuizConcluido.png`, `Frame 23.png` (Visão geral)

## 1. Contexto e objetivo

Criar a tela **Perfil** (front-end: HTML + CSS + JS mínimo apenas nas abas), com 4 abas — Visão geral, Favoritos, Histórias avaliadas e Quizzes concluídos — exibindo dados e interações do usuário. Conteúdo 100% estático (mockado como no protótipo). Nenhuma alteração de back-end. **Sem responsividade** (sem media query).

## 2. Arquivos alterados ou criados

| Ação | Arquivo |
|---|---|
| **Criar** | `public/perfil.html` |
| **Criar** | `public/css/perfil.css` |
| **Criar** | `public/js/perfil.js` (somente troca de abas) |
| **Criar** | `DOCUMENTOS_DE_APOIO/prompts/tela-perfil.md` (registro prompt/resposta, AGENTS.md) |
| **Criar** | `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPerfil).md` (este plano) |
| **Alterar** | 10 HTMLs: trocar `href="./perfilLogin.html"` → `href="./perfil.html"` em `index.html`, `login.html`, `historias.html`, `personagens.html`, `personagensAliados.html`, `personagensBatmans.html`, `personagensViloes.html`, `detalhesHistoria.html`, `detalhesPersonagem.html`, `telaQuiz.html` (arquivo `perfilLogin.html` nunca existiu — links hoje estão quebrados) |
| **Não alterar** | `app.js`, `src/*`, `.env`, `navBar.css`, `navBar.js`, demais CSS/JS, imagens |

Imagens existentes usadas (sem novos assets): `imgBatmanAbsoluto.jpe`, `historias/bannerBatmanCapuzVermelho.avif`, `imgBatmanArkhamKnight.jpe`, `personagens/imgRobinDick.webp`.

## 3. Componentes da página

1. **Navbar** — cópia do padrão (`navBar.css`, classes `opcoaoNavBar` incluindo o typo), links Home/Histórias/Personagens/Curiosidades **sem** `opcaoSelecionada`; à direita bloco estático com botão sólido `Meu perfil` (`#c62839`) e botão vazado `Sair` (mockup). **Não** incluir `navBar.js` (ele exige ids `deslogado`/`logado`/`nomeUsuario` e daria erro) — navbar conforme protótipo, sempre visível nas 4 abas.
2. **Título** — `RIAN ALENCAR` em Oswald, caixa alta, vermelho, alinhado à esquerda.
3. **Tabs** — container arredondado (`#1a2230`) com 4 botões: `Visão geral`, `Favoritos (3)`, `Histórias avaliadas (3)`, `Quizzes concluídos (3)`; ativo = fundo `#c62839`, texto `#f2f4f7`.
4. **Aba 1 `perfilInicial`** — Card "Dados pessoais" (cabeçalho + botão vazado `Editar perfil` `href="#"`) com grid 3 colunas (`Nome`/`Rian Alencar`, `E-mail`/`rian@email.com`, `Data de criação`/`12 de outubro de 2026`); abaixo, 3 cards de métricas em `#23364d` (`3` favoritadas, `3` avaliadas, `3` quizzes).
5. **Aba 2 `perfilFavoritados`** — Cabeçalho `Meus favoritos` + `Filtrar por:` com `<select>` nativo (`Todos`/`Histórias`/`Personagens`) **visual apenas** (sem JS); lista em container `#1a2230` com linhas: miniatura, título, tag `História`/`Personagem` (azul claro) e botão sólido `Ver detalhes`. Itens do protótipo: Batman Contra o Capuz Vermelho (História), Robin (Dick Grayson) (Personagem).
6. **Aba 3 `perfilAvaliados`** — Cabeçalho `Minhas avaliações` + contador `3 histórias avaliadas`; container com colunas `HISTÓRIA`/`SUA NOTA`/`AVALIAÇÃO` e 3 cards (`#0b0b0d`): miniatura, categoria (`Quadrinho`/`Filme`/`Jogo`), título, data, `X / 5` + `Nota atribuída`, botão escuro `Ver detalhes`. Itens: Batman Absoluto (5/5, 16/11/2026), Batman Contra o Capuz Vermelho (4/5, 14/11), Batman Arkham Knight (5/5, 10/11).
7. **Aba 4 `perfilQuizConcluido`** — Cabeçalho `Meus quizzes concluídos` + contador; banner `#23364d` com 3 métricas (`3` quizzes, `27 de 30` acertos, `90%` aproveitamento); 3 cards com tag vermelha `CONCLUÍDO`, título, data, `X / 5` + `% de acertos`, botão `Ver detalhes` (Absoluto 4/5 80%; Capuz 1/5 20%; Arkham 2/5 40%).
8. **Listas scrolláveis** — `max-height` + `overflow-y: auto` nos containers das abas 2/3/4 (regra da spec seção 4).

## 4. Fluxo

Navbar das demais páginas → link do usuário logado (já aponta para `perfil.html`) → página abre na aba **Visão geral** → `perfil.js` alterna as 4 abas via classe/`display` → `Ver detalhes` de histórias → `detalhesHistoria.html?idHistoria=1|2|3` (ids conforme seed `BatCave.sql`: 1=Absoluto, 2=Capuz Vermelho, 3=Arkham Knight); Robin → `detalhesPersonagem.html` (estático) → `Sair` → `login.html` (link simples, sem limpar sessionStorage, pois JS é só nas abas) → `Meu perfil` → própria página. **Sem API, sem novas queries.**

## 5. Regras de negócio

Nenhuma funcional — spec seção 5 manda ignorar (só front). Decisões: dados mockados (sem sessionStorage); filtro do dropdown apenas visual; `Editar perfil` inoperante (`href="#"`); "Sair em cada uma das telas" atendido pelo botão da navbar presente em todas as abas (o `Sair` grande ao lado do título no `Frame 23.png` é resquício do mockup, não reproduzido). Fora do escopo: avaliação de personagens, comentários, `curiosidades.html`.

## 6. Decisões técnicas

- **CSS por página** (`perfil.css`), regras da navbar importadas via `navBar.css` já linkado (padrão de todas as páginas).
- **Paleta do projeto** (`#0b0b0d`, `#1a2230`, `#23364d`, `#c62839`, `#f2f4f7`, Oswald/Inter) nos hex equivalentes da spec (`#0A0C10`/`#191D24`); `#9aa5b1` mantido só nos rótulos (sem equivalente no projeto).
- **JS mínimo aprovado**: `perfil.js` (~15 linhas) só com troca de abas (ids `perfilInicial|perfilFavoritados|perfilAvaliados|perfilQuizConcluido`, conforme nomes da spec); demais interações são links/estáticas.
- Nome **`perfil.html`** (escolha do usuário) + atualização dos 10 hrefs quebrados.
- Valores do protótipo mantidos mesmo com inconsistências (aba `Favoritos (3)` com 2 linhas visíveis; `27 de 30` vs soma real 7/15) — critério de aceitação manda privilegiar a imagem.
- Títulos seguem o protótipo (`Batman Arkham Knight`, sem `:` do seed) — diferença trivial de texto.
- **Sem media query e sem regras de responsividade** — layout fixo para desktop, conforme pedido.
- Não tocar em `app.js`, rotas, controllers, models ou `.env`.

## 7. Etapas numeradas e validação

1. **Registrar prompt e resposta** em `DOCUMENTOS_DE_APOIO/prompts/tela-perfil.md` → *validar:* arquivo existe com prompt e resposta completos.
2. **Criar `public/perfil.html`** (head igual às demais páginas, navbar com `Meu perfil`+`Sair`, título, tabs, 4 seções com conteúdo estático, paths das 4 imagens, `<script src="./js/perfil.js">`) → *validar:* HTML abre e nenhum recurso retorna 404.
3. **Criar `public/css/perfil.css`** (reset, `body #0b0b0d`, navbar, título, tabs com `.abaAtiva`, cards/métricas, tabelas/listas, banner de métricas dos quizzes, `overflow-y`) → *validar:* sem seletores órfãos; DevTools conferindo grids de 3 colunas.
4. **Criar `public/js/perfil.js`** (troca de abas) → *validar:* clicar em cada aba mostra só o painel correspondente e aplica o estilo ativo; aba padrão = Visão geral.
5. **Atualizar os 10 hrefs** `perfilLogin.html` → `perfil.html` → *validar:* busca por `perfilLogin` em `public/` retorna vazio.
6. **Rodar `npm i` e `npm start`** → *validar:* servidor sobe sem erro no console.
7. **Teste manual:** logar → clicar no nome na navbar → perfil abre; alternar as 4 abas comparando com as 4 imagens; `Ver detalhes` das histórias carrega a história correta (ids 1/2/3) e Robin abre `detalhesPersonagem.html`; `Sair` vai para `login.html`; console limpo → *validar:* visual equivalente aos protótipos, sem 404 nem erros.
8. **Revisão final dos critérios de aceitação** (só front; imagens como referência principal; CSS no padrão das outras páginas; sem responsividade) → *validar:* checklist item a item marcado.
