# Prompts e Respostas — Tela de Quiz

## Prompt 1

> Leia "DOCUMENTOS_DE_APOIO/modelos-especificacao/modelo-especificacao(telaQuiz).md" e gere um plano de implementação em "DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telaQuiz).md". Inclua: arquivos alterados ou criados, componentes, fluxo, regras de negócio, decisões técnicas e etapas numeradas com a forma de validar cada uma. Não implemente nada. Apenas planeje.

### Resposta 1

Plano gerado (aprovado pelo usuário) e gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telaQuiz).md`, contendo:

- **Arquivos:** criação de `public/telaQuiz.html` (recriado do zero — o antigo, que era cópia da página de detalhes, foi deletado), `public/css/telaQuiz.css`, `DOCUMENTOS_DE_APOIO/prompts/tela-quiz.md` e do próprio plano; nada em `app.js`, `src/*`, `.env`, `quiz.js`, `scriptModals.js` ou demais páginas.
- **Componentes:** navbar padrão (com `navBar.js`, sem `opcaoSelecionada`), cabeçalho de progresso (`QUESTÃO 1/5` em vermelho carmesim à esquerda + `Categoria` em cinza à direita), bloco do enunciado centralizado, 5 alternativas A–E em cards com badge de letra e botão `Próxima questão` alinhado à direita no rodapé.
- **Fluxo:** `detalhesHistoria.html?idHistoria=X` → modal "Iniciar Quiz" → `telaQuiz.html?idHistoria=X` (redirect já previsto em `scriptModals.js`, sem alteração) → navbar para navegar → `Próxima questão` sem ação (futuro: `quiz.js` via API). Botão do `detalhesPersonagem.html` não ligado nesta etapa.
- **Regras de negócio:** nenhuma funcional (front-end apenas, conforme seção 5 da spec); contador estático `1/5`; alternativas não selecionáveis; sem pontuação; sem chamadas de API.
- **Decisões técnicas:** CSS dedicado no padrão do projeto; paleta do projeto (`#0b0b0d`, `#1a2230`, `#23364d`, `#c62839`, `#f2f4f7`) nos hex da spec (`#0A0C10`, `#191D24`), `#9aa5b1` só no rótulo "Categoria"; sem JS de lógica (só `navBar.js`, `quiz.js` não linkado e não deletado); só a questão 1 no markup; **sem media query**; fundo com `radial-gradient` sutil (sem novo asset).
- **Etapas numeradas (8)** com validação para cada uma.

## Perguntas de esclarecimento (durante o planejamento)

**Pergunta 1:** A imagem de referência da telaQuiz não mostra navbar, mas todas as outras páginas do projeto têm. A tela de quiz deve ter navbar ou não?

**Resposta do usuário:** **Com navbar (padrão do projeto).**

**Pergunta 2:** A spec manda somente HTML + CSS (sem regras de negócio). O botão "Próxima questão" e o contador "QUESTÃO 1/5" devem funcionar ou ficar apenas visuais?

**Resposta do usuário:** **Apenas visual (HTML+CSS)** — conteúdo estático como na imagem (1/5 sempre), botão existe mas não avança, sem JS.

**Pergunta 3:** A spec menciona "redirecionamento ao quiz". Hoje o botão "Fazer quiz" de `detalhesHistoria.html` já redireciona para `telaQuiz.html` (`scriptModals.js`, alteração não commitada), mas o de `detalhesPersonagem.html` não está ligado. O que fazer?

**Resposta do usuário:** **Só detalhesHistoria** — o personagem fica para depois; foco apenas na tela de quiz conforme a spec.

**Pergunta 4:** O arquivo `public/js/quiz.js` (com alterações WIP não commitadas, buscando perguntas na API) estava linkado na antiga `telaQuiz.html`. O que fazer com esse script na nova tela?

**Resposta do usuário:** **A telaQuiz.html antiga está deletada. Agora, não existe problema no endpoint.** (A nova tela é estática, sem `quiz.js` linkado; o arquivo permanece intacto no projeto para a fase dinâmica.)

## Prompt 2

> Pronto, somente grave o plango de implementação

### Resposta 2

Plano gravado em `DOCUMENTOS_DE_APOIO/plano-implementacao/plano-implementacao(telaQuiz).md`, sem alterar nenhum outro arquivo.

## Prompt 3

> Pronto, pode seguir o plano de implementação.

### Resposta 3

Implementação iniciada conforme as 8 etapas do plano: registro de prompts, criação de `public/css/telaQuiz.css` e `public/telaQuiz.html`, conferência dos pontos de entrada, instalação de dependências e validação dos critérios de aceitação.
