# Plano de implementação — Tela de Detalhes do Personagem

> Baseado em: `DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(detalhesPersonagem).md`
> Protótipo de referência: `DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoDetalhesPersonagem.png`

## 1. Contexto e objetivo

Criar apenas o front-end (HTML + CSS) da tela **Detalhes do personagem** (personagem Robin/Dick Grayson, conteúdo estático), seguindo o protótipo e o padrão visual/estrutural das páginas já existentes (`detalhesHistoria.html`/`detalhesHistoria.css`). Nenhuma alteração de back-end.

## 2. Arquivos alterados ou criados

| Ação | Arquivo |
|---|---|
| **Criar** | `public/detalhesPersonagem.html` (nome já referenciado pelos cards "Ver detalhes" das 3 listas de personagens) |
| **Criar** | `public/css/detalhesPersonagem.css` |
| **Criar** | `DOCUMENTOS_DE_APOIO/prompts/detalhes-personagem.md` (registro do prompt/resposta, conforme AGENTS.md) |
| **Criar** | `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(detalhesPersonagem).md` (este plano) |
| **Não alterar** | Listas (`personagensAliados.html`, `personagensBatmans.html`, `personagensViloes.html` **já** apontam para `detalhesPersonagem.html`), `app.js`, `src/*`, demais páginas/CSS, imagens |

Imagens disponíveis (sem necessidade de novos assets):
- Banner: `public/assets/imgs/personagens/imgRobinDick.webp` (1140x760, horizontal)
- Imagem vertical: `public/assets/imgs/personagens/imgRobinCapa.jpg` (398x610)
- Avatar do editor: `public/assets/imgs/imgRianAlencar.jpe`

## 3. Componentes da página

1. **Navbar** — cópia da de `detalhesHistoria.html`/`detalhesHistoria.css`, com a classe `opcaoSelecionada` no link **Personagens** (spec, seção 6, manda corrigir o mockup que mostra `Histórias` ativo); mantidas as classes existentes, inclusive o typo padrão `opcoaoNavBar`.
2. **Banner hero** — imagem panorâmica do Robin, largura total, ~240px de altura, `object-fit: cover` (padrão `.bannerDetalhes`).
3. **Detalhes principais (2 colunas, ~30% / ~70%)**:
   - **Esquerda (~30%):** imagem vertical do Robin (`imgRobinCapa.jpg`).
   - **Direita (~70%):**
     - **Cabeçalho:** nome `Robin (Dick Grayson)` (vermelho, Oswald bold) + `Identidade secreta: Dick Grayson` + `Herói` em texto pequeno.
     - **Botões:** `Favoritar` e `Fazer quiz` (fundo escuro, ícone à esquerda, estilo `.botaoAcao`).
     - **Card "Informações:":** box escuro arredondado com `Primeira Aparição`, `Criadores`, `Gênero`, `Principais Afiliações` — **corrigir o typo "Princiapais" do mockup**.
     - **Citação:** frase de efeito centralizada em vermelho e negrito abaixo do card.
4. **Biografia** — seção com título `Biografia` + 3 parágrafos, separada por linhas horizontais sutis (`1px #23364d`, padrão `.secaoSinopse`).
5. **Comentário do editor** — card escuro dividido verticalmente: à esquerda título, avatar circular e nome (`Rian Alencar Souza`) com borda direita; à direita área do texto (padrão `.containerEditor`).
6. **Responsividade** — media query `max-width: 900px` empilhando as colunas (padrão do projeto).

## 4. Fluxo

Usuário está em `personagens*.html` → clica em **Ver detalhes** (link já existente) → `express.static` (`app.js`) serve `detalhesPersonagem.html` → visualiza banner, informações, biografia e comentário do editor → navega pela navbar para as demais páginas. Botões **Favoritar**/**Fazer quiz** são estáticos (`href="#"`/`div`, sem JavaScript). **Sem API, sem login, sem back-end.**

## 5. Regras de negócio

Nenhuma — a especificação (seção 5) manda ignorar, pois somente o front-end está sendo produzido. Fora do escopo: favoritar de verdade, quiz, avaliação de personagens, blog/comentários dos usuários, `curiosidades.html`.

## 6. Decisões técnicas

- **CSS por página**, sem arquivo compartilhado (padrão do projeto); regras da navbar e base copiadas de `detalhesHistoria.css`.
- **Cores/fontes do projeto** (`#0b0b0d`, `#c62839`, `#f2f4f7`, `#23364d`, `#1a2230`, Oswald/Inter) em vez dos hex da spec (`#0D0E10`/`#C82333`) — critério de aceitação manda seguir o padrão já existente.
- Estrutura e nomes de classes espelhando `detalhesHistoria.*` (ex.: `bannerDetalhes`, `containerDetalhes`, `cardInformacoes`, `containerEditor`), adaptados ao conteúdo de personagem.
- Container `width: 90vw; max-width: 1280px; margin: auto` — atende ao padrão 90vw do projeto **e** à nota de compatibilidade ultrawide/notebook da spec (seção 6).
- Conteúdo 100% estático (Robin) — sem query params/JS, pois não existe back-end de personagens.
- Correção do typo "Princiapais" → "Principais Afiliações", conforme spec.
- Não tocar em `app.js`, rotas, controllers, models ou `.env`.

## 7. Etapas numeradas e validação

1. **Registrar prompt e resposta** em `DOCUMENTOS_DE_APOIO/prompts/detalhes-personagem.md` → *validar:* arquivo existe com prompt e resposta completos.
2. **Criar `public/detalhesPersonagem.html`** (head com Google Fonts igual às demais páginas, navbar com `opcaoSelecionada` em Personagens, banner, 2 colunas, botões, card de informações, citação, biografia, comentário do editor, paths de imagem corretos) → *validar:* HTML abre sem erro e nenhum arquivo chamado retorna 404.
3. **Criar `public/css/detalhesPersonagem.css`** (reset `*`, `body #0b0b0d`, navbar copiada do `detalhesHistoria.css`, banner, grid 30/70, botões com hover, card, citação, biografia com bordas, editor, media query 900px) → *validar:* sem seletores órfãos; conferir no DevTools layout de 2 colunas e empilhamento abaixo de 900px.
4. **Rodar `npm i` e `npm start`** → *validar:* servidor sobe sem erro no console.
5. **Teste manual:** acessar `detalhesPersonagem.html` a partir dos cards "Ver detalhes" das 3 listas, comparar com `prototipoDetalhesPersonagem.png`, confirmar que as imagens carregam (sem 404), console do navegador limpo, hover nos botões, teste de resize (1366x768, Full HD, mobile) → *validar:* visual equivalente ao protótipo e nada estourado.
6. **Revisão final dos critérios de aceitação** da especificação (só HTML+CSS; protótipo como referência principal; CSS no padrão das outras páginas) → *validar:* checklist item a item marcado.
