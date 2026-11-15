# Prompts e Respostas — Telas da Dashboard (Personagens, Usuários e Histórias)

## Prompt 1

> Leia "DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telasDashboard).md" e gere um plano de implementação em "DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPersonagem).md". Inclua: arquivos alterados ou criados, componentes, fluxo, regras de negócio, decisões técnicas e etapas numeradas com a forma de validar cada uma. Não implemente nada. Apenas planeje.

### Resposta 1

Plano gerado (aprovado pelo usuário) e gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPersonagem).md`, contendo:

- **Arquivos:** criação de `public/dashboard/personagens.html`, `public/dashboard/usuarios.html`, `public/dashboard/historias.html` e `public/css/dashboardListas.css` (compartilhado); alteração mínima em `public/dashboard/dashboard.html` (apenas hrefs da sidebar + `Sair`); nada em `app.js`, `src/*` ou `.env`.
- **Componentes:** sidebar idêntica à da `dashboard.html` com `opcaoSelecionada` por rota, card externo com título, card interno com barra de ações (botão `+ Novo` ausente em Usuários, busca + selects) e listagem.
- **Listagem em `div`s + CSS Grid** (sem `<table>`): `.linhaCabecalho` e `.linhaItem` compartilham o mesmo `grid-template-columns` (por tela: 3 colunas em Personagens/Usuários, 4 em Histórias) para o alinhamento corresponder aos protótipos.
- **Fluxo:** `loginAdm.html` → `dashboard.html` → sidebar → páginas servidas por `express.static`; botões com `href="#"`.
- **Regras de negócio:** nenhuma (front-end apenas, conforme seção 5 da especificação).
- **Decisões técnicas:** só HTML+CSS estático (busca/selects visuais, sem JS); cores/fontes do projeto; azul `#0066ff` nos botões; sidebar `15vw` sem media queries; conteúdo estático igual ao protótipo; SVG inline para avatar; um único CSS novo.
- **Etapas numeradas (9)** com validação para cada uma: registro do prompt, ajuste da `dashboard.html`, criação dos 3 HTMLs, criação do CSS, `npm i` + `npm start`, teste manual contra os protótipos e revisão dos critérios de aceitação.

## Pergunta de esclarecimento (durante o planejamento)

**Pergunta 1:** O arquivo pedido é `plano-implementacao(telasPersonagem).md`, mas a spec cobre as 3 telas da dashboard. Qual o escopo? E como tratar a filtragem em tempo real (seção 6) x critério "somente HTML e CSS"? E para onde apontam `Detalhes`/`+ Novo`?

**Resposta do usuário:** Escopo das **3 telas** da dashboard; busca/filtros **só HTML+CSS estático** (sem JS); botões **tudo `href="#"`** por enquanto.

## Prompt 2

> Troque as table que você planejado usar no HTML e use divs no lugar. Organize as divs para elas conseguirem corresponder as imagens do protótipo.

### Resposta 2

Plano revisado: a listagem passa de `<table>` para **`div`s + CSS Grid** — `.tabelaListagem` contém `.linhaCabecalho` e `.linhaItem`, ambas com o mesmo `grid-template-columns` definido por classe modificadora por tela (`.listaPersonagens` `2fr 1fr 200px`; `.listaUsuarios` `1.5fr 1fr 0.7fr`; `.listaHistorias` `2.2fr 1fr 1fr 1.3fr`), garantindo colunas alinhadas e correspondência com os protótipos. Estrutura-base das células (thumb/avatar + texto, badge, botão `Detalhes`) documentada no plano.

## Prompt 3

> Perfeito, pode gravar.

### Resposta 3

Plano revisado gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPersonagem).md` e registro de prompts/respostas criado neste arquivo.

## Prompt 4

> Ok, reenomei o plano-implementacao(telasPersonagem) para plano-implementacao(telasDashboard). Siga este plano de implementação e faça as telas requisitadas nesse arquivo.

### Resposta 4

Implementação concluída seguindo o plano:

- **`public/dashboard/dashboard.html` (alterado):** hrefs da sidebar preenchidos (`./dashboard.html`, `./usuarios.html`, `./historias.html`, `./personagens.html`) + `Sair → ./loginAdm.html`; removido o `</div>` excedente (era linha 82).
- **`public/dashboard/personagens.html` (criado):** sidebar com Personagens ativo, título, barra `+ Novo personagem` + busca + select `Mais Favoritados`, listagem em `div`s (grid 3 colunas) com a linha Robin (Dick Grayson) / Herói / botão Detalhes.
- **`public/dashboard/usuarios.html` (criado):** sem botão de criação, busca + `Mais recentes`, grid 3 colunas com avatar SVG, 2 linhas Rian / rian.crash@gmail.com.
- **`public/dashboard/historias.html` (criado):** `+ Nova história`, busca + `Todos os tipos` + `Mais recentes`, grid 4 colunas com badge `Filme`, linha Batman Contra o Capuz Vermelho / 4.8.
- **`public/css/dashboardListas.css` (criado):** CSS compartilhado das 3 telas (sidebar copiada do `dashboard.css`, card externo/interno, barra de ações, inputs/selects com seta SVG, grid por tela via `.listaPersonagens`/`.listaUsuarios`/`.listaHistorias`, thumb, avatar, badge, botões azuis `#0066ff` com hover).
- **Validação:** `npm i` OK; `npm start` falha por **problema pré-existente** (`app.js:19` exige `./src/routes/usuarios`, que não existe no repositório — apenas `index.js` está em `src/routes`); validação estática executada com servidor temporário: as 4 páginas, os 2 CSSs, a logo, as 2 imagens de linha e o `loginAdm.html` retornaram **200**; todas as referências locais (`href`/`src`) dos 4 HTMLs resolvem para arquivos existentes.
- **Pergunta durante a implementação:** o protótipo de Personagens foi reexportado mostrando avatar + "Rian" + e-mail sob "Categoria" (placeholder). Usuário confirmou manter **Robin + Herói** (como no plano).
- **Desvio do plano (grid de Personagens):** `2fr 1fr 200px` → `1.6fr 1fr 1.4fr`, por medição do protótipo (centraliza `Categoria` em ~1170px como no mockup).
