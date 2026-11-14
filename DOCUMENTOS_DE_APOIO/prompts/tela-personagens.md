# Prompts e Respostas — Tela de Personagens

## Prompt 1

> Leia "DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao.md" e gere um plano de implementação em "DOCUMENTOS_DE_APOIO/plano-implementacao/modelo-especificacao.md". Inclua: arquivos alterados ou criados, componentes, fluxo, regras de negócio, decisões técnicas e etapas numeradas com a forma de validar cada uma. Não implemente nada. Apenas planeje.

### Resposta 1

Plano gerado e gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/modelo-especificacao.md`, contendo:

- **Arquivos:** criação de `public/personagens.html` e `public/css/personagens.css`; nenhuma alteração em HTML existente, `app.js` ou `src/*` (a navbar das outras páginas já linka `./personagens.html`).
- **Componentes:** navbar padrão com `opcaoSelecionada` em Personagens, cabeçalho `PERSONAGENS` + subtítulo, 3 cards-banner empilhados (Batman, Aliados, Vilões) com imagem escurecida e título branco centralizado.
- **Fluxo:** clique na navbar → `express.static` serve a página → visualização estática; cards com `href="#"`.
- **Regras de negócio:** nenhuma (front-end apenas, conforme seção 5 da especificação).
- **Decisões técnicas:** CSS por página seguindo o padrão do projeto; cores/fontes do projeto; overlay via gradiente; mapeamento das imagens **pelo conteúdo**; `href="#"` nos cards.
- **Etapas numeradas (6)** com validação para cada uma: registro do prompt, criação do HTML, criação do CSS, `npm i` + `npm start`, teste manual contra o protótipo e revisão dos critérios de aceitação.

## Pergunta de esclarecimento (durante o planejamento)

**Pergunta:** As 3 imagens em `public/assets/imgs/personagens/` parecem ter conteúdo trocado em relação aos nomes. Como mapear nos cards? E os cards devem ser clicáveis?

**Resposta do usuário:** Mapear as imagens **pelo conteúdo**; cards clicáveis com **`href="#"`**.

## Prompt 2

> Sim, aprovo.

### Resposta 2

Plano gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/modelo-especificacao.md` e implementação da tela de personagens iniciada (`public/personagens.html` + `public/css/personagens.css`).
