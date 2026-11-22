# Plano de implementação — Tela de Quiz

> Baseado em: `DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telaQuiz).md`
> Protótipo principal: `DOCUMENTOS_DE_APOIO/imgs-referencia/telaQuiz.png`

## 1. Contexto e objetivo

Criar a tela **Quiz** (front-end: HTML + CSS, sem JS de lógica) fiel à imagem de referência, contendo cabeçalho de progresso (`QUESTÃO 1/5` + `Categoria`), bloco do enunciado, 5 alternativas (A–E) e botão `Próxima questão`. A antiga `public/telaQuiz.html` (uma cópia da página de detalhes) foi deletada e será recriada do zero. Nenhuma alteração de back-end; conteúdo estático/placeholder (spec seção 5: ignorar regras de negócio por enquanto).

## 2. Arquivos alterados ou criados

| Ação | Arquivo |
|---|---|
| **Criar** | `public/telaQuiz.html` (recriado do zero) |
| **Criar** | `public/css/telaQuiz.css` |
| **Criar** | `DOCUMENTOS_DE_APOIO/prompts/tela-quiz.md` (registro prompt/resposta, AGENTS.md) |
| **Criar** | `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telaQuiz).md` (este plano) |
| **Não alterar** | `public/js/quiz.js` e `public/js/scriptModals.js` (WIPs não commitados do usuário), `detalhesHistoria.html`, `detalhesPersonagem.html`, `src/*`, `app.js`, `.env`, `navBar.css`/`navBar.js`, demais páginas |

Obs.: a rota `/quiz/buscarAlternativas/...` usada pelo `quiz.js` WIP ainda não existe em `src/routes/quiz.js` — como a tela será estática, isso não afeta esta entrega; o `quiz.js` fica intacto para a fase dinâmica.

## 3. Componentes da página

1. **Navbar** — cópia do padrão (`navBar.css` + `navBar.js`, ids `deslogado`/`logado`/`nomeUsuario`), links Home/Histórias/Personagens/Curiosidades **sem** `opcaoSelecionada` (tela genérica, serve para história e personagem).
2. **Cabeçalho de progresso** — linha flex: `QUESTÃO 1/5` à esquerda (Inter, bold, `#c62839`); `Categoria` à direita (`#9aa5b1`).
3. **Bloco do enunciado** — container centralizado de largura fixa (~640px, como na imagem), fundo `#1a2230`, borda 1px `#23364d`, cantos arredondados (~10px), texto centralizado `#f2f4f7` com o placeholder do enunciado.
4. **Alternativas A–E** — pilha vertical de 5 cards (fundo `#1a2230`, borda `#23364d`, arredondados, altura média), cada um com badge quadrado escuro à esquerda contendo a letra (`A`–`E`, `#f2f4f7`) e o texto do placeholder alinhado à esquerda; `cursor: pointer` + hover sutil (apenas visual).
5. **Botão `Próxima questão`** — alinhado à direita no rodapé, fundo sólido `#c62839`, texto `#f2f4f7`, cantos arredondados; **sem ação** (visual).
6. **Fundo** — `#0b0b0d` com `radial-gradient` sutil nas bordas (textura cinematográfica da caverna, sem novo asset de imagem).

## 4. Fluxo

`detalhesHistoria.html?idHistoria=X` (logado) → botão "Fazer quiz" → modal "Iniciar Quiz" → `telaQuiz.html?idHistoria=X` (redirect já previsto em `scriptModals.js`, WIP do usuário, sem alteração) → navbar permite sair para as demais telas → `Próxima questão` não avança (futuro: `quiz.js` renderizará as questões via API). O botão "Fazer quiz" de `detalhesPersonagem.html` **não** será ligado nesta etapa (decisão do usuário). O parâmetro `idHistoria`/`idPersonagem` permanece na URL, pronto para o JS futuro.

## 5. Regras de negócio

Nenhuma funcional — spec seção 5 manda ignorar (só front). Decisões: contador sempre `1/5`; alternativas não selecionáveis; sem pontuação/tentativa; sem chamadas de API. Fora do escopo: avaliação de personagens, comentários, quizzes dinâmicos.

## 6. Decisões técnicas

- **CSS dedicado** `telaQuiz.css` (padrão de 1 arquivo CSS por página) + `navBar.css` já linkado.
- **Paleta do projeto** (`#0b0b0d`, `#1a2230`, `#23364d`, `#c62839`, `#f2f4f7`) nos hex equivalentes da spec (`#0A0C10`, `#191D24`); `#9aa5b1` mantido só no rótulo "Categoria".
- **Sem JS de lógica**: apenas `navBar.js` (padrão de todas as páginas); `quiz.js` **não** é linkado na página (evita fetch de endpoint inexistente e erro no console); o arquivo não é deletado (AGENTS.md).
- **Somente a questão 1 no markup** (a imagem mostra uma questão; a versão futura renderizará via JS).
- **Sem media query** — layout fixo desktop, padrão do projeto.
- Título da página: `BatCave - Quiz`.
- Não tocar em `app.js`, rotas, controllers, models ou `.env`.

## 7. Etapas numeradas e validação

1. **Registrar prompt e resposta** em `DOCUMENTOS_DE_APOIO/prompts/tela-quiz.md` → *validar:* arquivo existe com prompt e resposta completos.
2. **Criar `public/css/telaQuiz.css`** (reset, fundo, cabeçalho de progresso, enunciado, alternativas com badge, botão, hover) → *validar:* sem seletores órfãos; hex conferidos com a imagem.
3. **Criar `public/telaQuiz.html`** (head padrão com fontes Inter/Oswald, navbar com `navBar.js`, componentes da seção 3, sem `quiz.js`) → *validar:* página abre, nenhum recurso retorna 404, console sem erros.
4. **Conferir os pontos de entrada** (`scriptModals.js` → `telaQuiz.html` + query string) → *validar:* grep por `telaQuiz.html` em `public/js/` aponta para o novo arquivo, sem alterações necessárias.
5. **Instalar dependências** com `npm.cmd i` (o `npm.ps1` está bloqueado pela execution policy do PowerShell) → *validar:* instalação concluída sem erro.
6. **Perguntar ao usuário** se deseja executar `npm start` (AGENTS.md).
7. **Teste manual:** logar → `detalhesHistoria.html?idHistoria=1` → "Fazer quiz" → modal → "Iniciar Quiz" → tela abre com navbar, `QUESTÃO 1/5`, enunciado, 5 alternativas e botão → comparar visualmente com `telaQuiz.png`; navegar pelos links da navbar; console limpo → *validar:* equivalência com a imagem, sem 404 nem erros.
8. **Revisão dos critérios de aceitação** (somente HTML+CSS; imagem como referência principal; CSS no padrão das outras páginas) → *validar:* checklist item a item marcado.
