# Plano de implementação — Tela de Personagens

> Baseado em: `DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao.md`
> Protótipo de referência: `DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoPersonagens.png`

## 1. Contexto e objetivo

Criar apenas o front-end (HTML + CSS) da tela **Personagens**, seguindo o protótipo e o padrão visual das páginas já existentes (`historias.html`/`historias.css`). Nenhuma alteração de back-end.

## 2. Arquivos alterados ou criados

| Ação | Arquivo |
|---|---|
| **Criar** | `public/personagens.html` |
| **Criar** | `public/css/personagens.css` |
| **Criar** | `DOCUMENTOS_DE_APOIO/plano-implementacao/modelo-especificacao.md` (este plano) |
| **Criar** | `DOCUMENTOS_DE_APOIO/prompts/tela-personagens.md` (registro do prompt/resposta, conforme AGENTS.md) |
| **Não alterar** | Demais páginas HTML (a navbar de `index`, `historias`, `login`, `cadastro` e `detalhesHistoria` **já** apontam para `./personagens.html`), `app.js`, `src/*`, imagens |

Imagens dos cards já existem em `public/assets/imgs/personagens/`.

## 3. Componentes da página

1. **Navbar** — cópia idêntica da de `historias.html` (logo, `opcoesNavBar`, `butoesNavBar`), com a classe `opcaoSelecionada` no link **Personagens**; mantidas as classes existentes, inclusive o typo `opcoaoNavBar` (padrão do projeto).
2. **Cabeçalho** — título `PERSONAGENS` (vermelho `#c62839`, fonte Oswald, bold, caixa alta, ~40px) + subtítulo de 2 linhas (texto do protótipo, branco, centrado, largura ~95vw).
3. **Lista de 3 cards-banner empilhados** — largura ~90vw, cantos arredondados (~15px), imagem de fundo escurecida (`background-size: cover` + overlay `linear-gradient(rgba(0,0,0,.45), rgba(0,0,0,.45))`), título branco bold centrado:
   - **Batman** → `./assets/imgs/personagens/imgPersonagensAliados.jpe` *(mapeamento por conteúdo)*
   - **Aliados** → `./assets/imgs/personagens/imgPersonagensBatman.jpg`
   - **Vilões** → `./assets/imgs/personagens/imgPersonagensViloes.webp`

## 4. Fluxo

Usuário clica em **Personagens** na navbar de qualquer página → `express.static` (`app.js:27`) serve `personagens.html` → visualiza título, subtítulo e 3 cards → cards são `<a href="#">` (sem navegação real até existirem telas de detalhe). **Sem JavaScript, sem API, sem login.**

## 5. Regras de negócio

Nenhuma — a especificação (seção 5) manda ignorar; o escopo é 100% front-end estático. Fora do escopo: avaliação de personagens, listagem/detalhes de personagens, blog de comentários, `curiosidades.html`.

## 6. Decisões técnicas

- **CSS por página**, sem arquivo compartilhado (padrão do projeto); regras da navbar duplicadas do `historias.css`.
- **Cores/fontes do projeto** (`#0b0b0d`, `#c62839`, `#f2f4f7`, Oswald/Inter) em vez dos hex da spec (`#0D0E10`/`#C82333`) — critério de aceitação manda seguir o padrão existente.
- Overlay escurecedor via CSS puro (gradiente sobre a imagem) para o texto branco ficar legível.
- `href="#"` nos cards + `cursor: pointer` e hover sutil.
- Não tocar em `app.js`, rotas, controllers, models ou `.env`.
- Mapeamento das imagens decidido com o usuário: **pelo conteúdo** (os nomes dos arquivos estão trocados em relação ao conteúdo).

## 7. Etapas numeradas e validação

1. **Registrar prompt e resposta** em `DOCUMENTOS_DE_APOIO/prompts/tela-personagens.md` → *validar:* arquivo existe com prompt e resposta completos.
2. **Criar `public/personagens.html`** (head com Google Fonts igual às demais páginas, navbar com `opcaoSelecionada` em Personagens, título, subtítulo, 3 cards com `href="#"` e paths corretos de imagem) → *validar:* HTML abre sem erro e o link `./personagens.html` resolve.
3. **Criar `public/css/personagens.css`** (reset `*`, `body #0b0b0d`, navbar copiada do `historias.css`, estilos do cabeçalho e dos cards-banner) → *validar:* sem seletores órfãos; conferir no DevTools que os cards têm altura ~250–300px, imagem cobrindo e texto centrado.
4. **Rodar `npm i` e `npm start`** → *validar:* servidor sobe sem erro no console.
5. **Teste manual:** acessar `http://<host>:<port>/personagens.html`, navegar de todas as páginas até ela, comparar com `prototipoPersonagens.png`, confirmar que as 3 imagens carregam (sem 404), console do navegador limpo, teste de resize (100% / mobile) → *validar:* visual equivalente ao protótipo.
6. **Revisão final dos critérios de aceitação** da especificação (só HTML+CSS; protótipo como referência principal; padrão das outras páginas) → *validar:* checklist item a item marcado.
