# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login e Histórias, detalhes de uma história e Personagens. Para cada personagem, quando o usuário apertar o botão "Ver detalhes", é necessário que uma nova tela seja aberta, mostrando os detalhes daquele personagem.
## 2. Objetivo
Criar uma tela de "Detalhes do personagem", seguindo a imagem "DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoDetalhesPersonagem.png". 
## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar uma tela de detalhes de personagem, com botões para Favoritar e Fazer quiz, um bloco para informações, uma frase importante do personagem, uma sessão para biografia e uma sessão para o comentario do editor. 

## 5. Regras de negócio
**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interface
- **Tema:** Dark Mode (`#0D0E10` fundo principal, `#1C1E22` / `#22252A` navbar e cards)[cite: 3].
- **Destaque:** Vermelho `#C82333` (título e citação) e texto branco `#FFFFFF`[cite: 3].
- **Navbar:** Logo "BATCAVE" + links (`Home`, `Histórias`, `Personagens` ativo, `Curiosidades`) à esquerda[cite: 3]; botões `Cadastre-se` (outline) e `Login` (vermelho) à direita[cite: 3]. *(Nota: no mockup o sublinhado está em `Histórias`, ajustar ativo para `Personagens`[cite: 3]).*
- **Banner Hero:** Imagem panorâmica do personagem ocupando a largura total do container (~280px de altura)[cite: 3].
- **Detalhes Principais (2 Colunas):**
  - **Esquerda (~30%):** Imagem vertical de destaque do personagem[cite: 3].
  - **Direita (~70%):**
    - **Cabeçalho:** Nome do personagem (`Robin (Dick Grayson)`) em vermelho/negrito, seguido de `Identidade secreta: Dick Grayson` e `Herói` em texto pequeno[cite: 3].
    - **Botões:** `Favoritar` e `Fazer quiz` (fundo escuro, ícones à esquerda)[cite: 3].
    - **Card "Informações:":** Box escuro arredondado com dados alinhados à esquerda (`Primeira Aparição`, `Criadores`, `Gênero`, `Principais Afiliações` — *corrigir typo "Princiapais" do mockup*)[cite: 3].
    - **Citação:** Frase de efeito centralizada em vermelho e negrito abaixo do card[cite: 3].
- **Biografia:** Separada por linhas horizontais sutis; título `Biografia` seguido por parágrafos descritivos[cite: 3].
- **Comentário do Editor:** Card escuro dividido verticalmente; à esquerda avatar circular e nome (`Rian Alencar Souza`)[cite: 3], à direita área do texto[cite: 3].
- **Compatibilidade (Notebook e PC):** Utilizar container centralizado com `max-width` (ex: `1200px`–`1280px`) e margens laterais fluidas para evitar que o conteúdo estique excessivamente em monitores ultrawide/Full HD e não quebre o alinhamento em telas menores de notebook (`1366x768`).
- **Interação:** Hover nos botões/links, toggle de favorito e redirecionamento ao quiz.


## 7. Critérios de aceitação
Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar a imagem que estará no diretório "DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoDetalhesPersonagem.png" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas para a criação desta. Faça com o padrão parecido com o que já foi criado. 

