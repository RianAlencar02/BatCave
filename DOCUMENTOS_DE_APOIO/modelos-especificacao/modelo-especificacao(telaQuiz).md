# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login e Histórias, detalhes de uma história e Personagens. Para a historia ou o personagem, precisa existir uma tela generica para o usuário conseguir responder o quiz. 
## 2. Objetivo
Criar uma tela de "Quiz", seguindo a imagem "DOCUMENTOS_DE_APOIO/imgs-referencia/telaQuiz.png". 
## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar uma tela de quiz, com o numero da questao, categoria, texto da questoa e 5 alternativas, com um botão de proxima questão.

## 5. Regras de negócio
**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interfacer nos botões/links, toggle de favorito e redirecionamento ao quiz.
* **Cabeçalho de Progresso:** Alinhado ao topo, exibindo o identificador da questão `QUESTÃO 1/5` à esquerda em vermelho carmesim (`#C62839`) e o rótulo discreto `Categoria` à direita em cinza aço (`#9AA5B1`)[cite: 20].
* **Bloco do Enunciado:** Um grande container horizontal centralizado (`#191D24` com sutil borda `#23364D`) e cantos arredondados, exibindo em destaque o texto centralizado em branco gelo (`#F2F4F7`): `Enunciado da questão placeholder — texto ilustrativo da pergunta do quiz exibido neste bloco centralizado.`[cite: 20].
* **Opções de Resposta (Alternativas de A a E):** Uma pilha vertical de 5 linhas de altura média. Cada opção é um card horizontal em grafite (`#191D24`) com cantos arredondados e bordas suaves em azul gotham (`#23364D`)[cite: 20], contendo:
  * Um pequeno quadrado identificador escuro à esquerda com a letra em branco gelo (`A`, `B`, `C`, `D`, `E`)[cite: 20].
  * O texto descritivo da alternativa em branco gelo alinhado à esquerda (ex.: `Alternativa A — Texto placeholder da primeira opção de resposta.`)[cite: 20].
* **Ação de Navegação:** Botão de destaque no canto inferior direito, de cantos arredondados e preenchimento sólido em vermelho carmesim (`#C62839`), exibindo o texto em branco gelo `Próxima questão`[cite: 20].
* **Estilo do Fundo:** Fundo predominantemente em preto noturno (`#0A0C10`)[cite: 1] com leves texturas granuladas e sombras naturais nas extremidades para simular uma ambientação cinematográfica de caverna[cite: 20].

## 7. Critérios de aceitação
Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar a imagem que estará no diretório "DOCUMENTOS_DE_APOIO/imgs-referencia/telaQuiz.png" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas para a criação desta. Faça com o padrão parecido com o que já foi criado. 

