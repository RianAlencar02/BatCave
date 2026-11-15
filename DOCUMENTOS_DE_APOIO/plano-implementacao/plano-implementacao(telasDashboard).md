# Plano de implementação — Telas da Dashboard (Personagens, Usuários e Histórias)

> Baseado em: `DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telasDashboard).md`
> Protótipos: `prototipoPersonagensDashboard.png`, `prototipoUsuariosDashboard.png`, `prototipoHistoriasDashboard.png` (em `DOCUMENTOS_DE_APOIO/imgs-referencia/`)

## 1. Contexto e objetivo

A dashboard administrativa já existe (`public/dashboard/dashboard.html` + `public/css/dashboard.css`) com sidebar de 4 itens, mas todos os links estão vazios (`href=""`) e as telas **Usuários**, **Histórias** e **Personagens** ainda não foram criadas. O objetivo é criar apenas o front-end (HTML + CSS) dessas 3 telas, seguindo os protótipos e reaproveitando o padrão estrutural/visual da `dashboard.html` existente. Nenhuma alteração de back-end.

Decisões confirmadas com o usuário:
- **Escopo:** as 3 telas da dashboard (Personagens, Usuários e Histórias).
- **Busca/filtros:** apenas visuais — HTML+CSS estático, sem JavaScript (vale o critério de aceitação 1 em vez da seção 6).
- **Botões** `Detalhes` e `+ Novo personagem`/`+ Nova história`: `href="#"` (nenhuma tela de criação/detalhe administrativa existe).
- **Listagem:** feita com `div`s (não `<table>`), organizadas para corresponder visualmente aos protótipos.

## 2. Arquivos alterados ou criados

| Ação | Arquivo |
|---|---|
| **Criar** | `public/dashboard/personagens.html` |
| **Criar** | `public/dashboard/usuarios.html` |
| **Criar** | `public/dashboard/historias.html` |
| **Criar** | `public/css/dashboardListas.css` (CSS compartilhado das 3 telas) |
| **Alterar** | `public/dashboard/dashboard.html` (somente os `href` da sidebar + `Sair`; ver etapa 2) |
| **Criar** | `DOCUMENTOS_DE_APOIO/prompts/telas-dashboard.md` (registro do prompt/resposta, conforme AGENTS.md) |
| **Criar** | `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telasPersonagem).md` (este plano) |
| **Não alterar** | `public/css/dashboard.css`, `app.js`, `src/*`, `.env`, demais páginas/CSS |

Imagens necessárias já existem (sem novos assets):
- Thumb Robin: `public/assets/imgs/personagens/imgRobinDick.webp`
- Thumb história: `public/assets/imgs/historias/bannerBatmanCapuzVermelho.avif`
- Avatar de usuário: **SVG inline** no HTML (não há avatar genérico no projeto)

## 3. Componentes da página

### 3.1 Estrutura comum às 3 telas (espelhando `dashboard.html`)

1. **Sidebar** — cópia idêntica da `dashboard.html` (classes `divPaiDashboard`, `navBarAdm`, `imgNavDash`, `opcoesNavBar`, `opcaoNavBar`, `opcaoSelecionada`, `opcaoSair`), com `opcaoSelecionada` na rota atual e hrefs preenchidos:
   - `Dashboard → ./dashboard.html` · `Usuários → ./usuarios.html` · `Histórias → ./historias.html` · `Personagens → ./personagens.html` · `Sair → ./loginAdm.html`
2. **Card externo** (`.cardTela`) — container escuro arredondado (`#191d24`, borda `#23364d`, raio 10px) ocupando a altura da área de conteúdo, contendo:
   - **Título** (`h1`): `Personagens` / `Usuários` / `Histórias` (branco, bold, ~30px).
   - **Card interno** (`.cardLista`) — barra de ações + listagem (`#1a2230`, borda `#23364d`, raio 10px).
3. **Barra de ações** (`.barraAcoes`, flex space-between):
   - Esquerda: botão azul `+ Novo personagem` / `+ Nova história` — **ausente na tela de Usuários**.
   - Direita (`.grupoFiltros`): input `Buscar por nome...` + selects estáticos.
4. **Listagem em `div`s + CSS Grid** (substitui `<table>`):
   - `.tabelaListagem` (coluna) → `.linhaCabecalho` + `.linhaItem` (repetida por registro).
   - `.linhaCabecalho` e `.linhaItem` usam **o mesmo `grid-template-columns`** (definido por classe modificadora em cada tela) → colunas do cabeçalho e das linhas ficam perfeitamente alinhadas, como em uma tabela.
   - `.linhaCabecalho`: fundo `#22252a`, texto `#9aa5b1`, altura ~50px.
   - `.linhaItem`: altura ~90–110px, `align-items: center`, separador `border-bottom: 1px #23364d`, células em `div` (`.celula`), com `display: flex; align-items: center` na célula Nome (thumb/avatar + texto).

Estrutura-base (mesma nas 3 telas; só mudam colunas/conteúdo):

```html
<div class="tabelaListagem listaPersonagens">
    <div class="linhaCabecalho">
        <div class="celula colNome">Nome</div>
        <div class="celula colCategoria">Categoria</div>
        <div class="celula colDetalhes">Detalhes</div>
    </div>
    <div class="linhaItem">
        <div class="celula colNome">
            <img class="thumbLinha" src="../assets/imgs/personagens/imgRobinDick.webp" alt="Robin">
            <span class="nomeLinha">Robin (Dick Grayson)</span>
        </div>
        <div class="celula colCategoria">Herói</div>
        <div class="celula colDetalhes">
            <a class="botaoDetalhes" href="#">Detalhes</a>
        </div>
    </div>
</div>
```

### 3.2 Tela Personagens (`prototipoPersonagensDashboard.png`)
- Filtros: input `Buscar por nome...` + select `Mais Favoritados`.
- Grid: `grid-template-columns: 2fr 1fr 200px` → **Nome** (thumb retangular ~120×70px + nome em bold) · **Categoria** (texto simples, ex.: `Herói`) · **Detalhes** (botão azul).
- Dados estáticos (exatamente do protótipo): 1 linha — `Robin (Dick Grayson)` / `Herói` / thumb `imgRobinDick.webp`.

### 3.3 Tela Usuários (`prototipoUsuariosDashboard.png`)
- Filtros: input `Buscar por nome...` + select `Mais recentes`. **Sem botão de criação.**
- Grid: `grid-template-columns: 1.5fr 1fr 0.7fr` → **Nome** (avatar circular ~44px com SVG de pessoa + nome) · **Email** · **Detalhes** (botão azul).
- Dados estáticos: 2 linhas — `Rian` / `rian.crash@gmail.com` (avatar igual nas duas).

### 3.4 Tela Histórias (`prototipoHistoriasDashboard.png`)
- Filtros: input `Buscar por nome...` + selects `Todos os tipos` e `Mais recentes` (2 selects).
- Grid: `grid-template-columns: 2.2fr 1fr 1fr 1.3fr` → **Nome** (thumb retangular + nome) · **Tipo** (badge azul escuro: fundo `#23364d`, texto `#5b9bd5`, ex.: `Filme`) · **Nota** (ex.: `4.8`) · **Detalhes** (botão azul).
- Dados estáticos: 1 linha — `Batman Contra o Capuz Vermelho` / `Filme` / `4.8` / thumb `bannerBatmanCapuzVermelho.avif`.

## 4. Fluxo

Login em `loginAdm.html` → botão **Login** (já aponta para `dashboard.html`) → `dashboard.html` → clique na sidebar (hrefs agora preenchidos) → `express.static` (`app.js:27`) serve `/dashboard/usuarios.html`, `/dashboard/historias.html` ou `/dashboard/personagens.html` → usuário visualiza a listagem estática → clica em `Detalhes` ou `+ Novo ...` → `href="#"` (sem navegação) → retorna às demais telas pela sidebar → **Sair** volta para `loginAdm.html`. **Sem JavaScript, sem API, sem back-end, sem validação de sessão.**

## 5. Regras de negócio

Nenhuma — a especificação (seção 5) manda ignorar, pois somente o front-end está sendo produzido. Fora do escopo: CRUD real de usuários/histórias/personagens, busca e filtros funcionando, telas de criação/detalhe administrativas, ligação com MySQL/API, responsividade/media query.

## 6. Decisões técnicas

- **Só HTML+CSS** (escolha do usuário): `input`/`select` reais porém sem efeito (sem JS); todos os botões de ação com `href="#"`.
- **Listagem em `div`s com CSS Grid** (escolha do usuário, substitui `<table>`): `.linhaCabecalho` e `.linhaItem` compartilham o mesmo `grid-template-columns`, garantindo alinhamento de colunas idêntico ao de uma tabela e correspondência com os protótipos; template variável por tela via classe modificadora (`.listaPersonagens`, `.listaUsuarios`, `.listaHistorias`).
- **Arquivos novos em `public/dashboard/`** (padrão de `dashboard.html`/`loginAdm.html`), CSS em `public/css/`, referenciados como `../css/...` e `../assets/...`.
- **Um único CSS novo** (`dashboardListas.css`) para as 3 telas — são ~90% idênticas; regras da sidebar copiadas de `dashboard.css` (padrão de duplicação do projeto), que fica **intacto** (risco zero para a tela de KPIs existente).
- **Cores/fontes do projeto** (`#0b0b0d`, `#191d24`, `#1a2230`, `#22252a`, `#23364d`, `#f2f4f7`, `#9aa5b1`, Oswald/Inter) em vez dos hex exatos da spec — critério de aceitação 3 manda seguir o padrão já existente.
- **Azul vibrante `#0066ff`** (hover `#0052cc`) nos botões `Novo`/`Detalhes`: cor do protótipo e da spec (seção 6); não conflita com o CSS existente da dashboard, que não tem botões.
- **Sidebar `width: 15vw` + conteúdo fluido** (reutilizando o layout de `dashboard.css`) — atende à compatibilidade 1366x768/Full HD **sem** media queries (critério 5).
- **Conteúdo 100% estático** igual ao protótipo (sem query params), pois não existe back-end de listagem.
- **SVG inline** para o avatar padrão de usuário (nenhum asset novo; nenhum arquivo deletado).
- **Não incluir** o CDN do Chart.js nessas páginas (não há gráficos).
- Fora do escopo, registrado como conhecido: typo `..//historias.html` em `loginAdm.html` e link para `curiosidades.html` inexistente — **não serão tocados**.

## 7. Etapas numeradas e validação

1. **Registrar prompt e resposta** em `DOCUMENTOS_DE_APOIO/prompts/telas-dashboard.md` → *validar:* arquivo existe com prompt e resposta completos.
2. **Alterar `public/dashboard/dashboard.html`** — preencher os 5 hrefs da sidebar (Dashboard, Usuários, Histórias, Personagens, Sair) e remover o `</div>` excedente da linha 82 → *validar:* dashboard continua visualmente idêntica; links resolvem (as telas novas dão 404 até as etapas 3–5).
3. **Criar `public/dashboard/personagens.html`** (head com Google Fonts igual à `dashboard.html`, sidebar com `opcaoSelecionada` em Personagens, card externo com título, barra `+ Novo personagem` + busca + select, listagem em `div`s com grid 3 colunas e a linha do Robin) → *validar:* abre sem 404 de assets.
4. **Criar `public/dashboard/usuarios.html`** (mesma estrutura, **sem** botão de criação, grid 3 colunas com avatar SVG, 2 linhas) → *validar:* idem.
5. **Criar `public/dashboard/historias.html`** (botão `+ Nova história`, 2 selects, grid 4 colunas com badge `Filme`, 1 linha) → *validar:* idem.
6. **Criar `public/css/dashboardListas.css`** (reset `*`, `body #0b0b0d`, sidebar copiada do `dashboard.css`, `.cardTela`, `.tituloTela`, `.cardLista`, `.barraAcoes`, `.botaoNovo`/`.botaoDetalhes` com hover, `.campoBusca`/`.selectFiltro` com `appearance: none` + seta CSS, `.tabelaListagem`/`.linhaCabecalho`/`.linhaItem`/`.celula` em Grid, `grid-template-columns` por tela, `.thumbLinha`, `.avatarUsuario`, `.badgeTipo`) → *validar:* sem seletores órfãos; conferir no DevTools que cabeçalho e linhas compartilham o mesmo template de colunas.
7. **Rodar `npm i` e `npm start`** → *validar:* servidor sobe sem erro no console.
8. **Teste manual:** navegar pelas 4 telas da dashboard apenas pela sidebar; comparar **cada tela** com o seu protótipo (alinhamento das colunas, thumb/avatar, badge, botão `Detalhes`); confirmar que imagens carregam (sem 404), console do navegador limpo, hover nos botões azuis, teste em 1366x768 e Full HD (sidebar fixa, colunas sem quebrar) → *validar:* visual equivalente aos protótipos.
9. **Revisão final dos critérios de aceitação** da especificação (só HTML+CSS; protótipo como referência principal; CSS no padrão da dashboard existente; sem responsividade) → *validar:* checklist item a item marcado.
