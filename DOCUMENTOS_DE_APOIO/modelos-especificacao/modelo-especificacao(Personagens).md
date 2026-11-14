# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login e Histórias, uma tela de listagem de todas as histórias cadastradas. Ao clicar em "Ver Detalhes", o sistema tem uma tela de detalhes da história. Agora, assim como a navbar menciona, é necessário uma tela de Personagens. 
## 2. Objetivo
Criar uma tela de "personagens", seguindo a imagem "DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoPersonagens.png". 
## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar uma tela de personagens, onde haverá 3 cards para especificar o grupo de personagem. 

## 5. Regras de negócio
**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interface
# Especificação de Interface: Tela de Personagens

## 1. Visual e Paleta
- **Tema:** Dark Mode (`#0D0E10` fundo principal, `#1C1E22` navbar)[cite: 2].
- **Destaque:** Vermelho `#C82333` (título principal) e texto branco `#FFFFFF`[cite: 2].

## 2. Estrutura da Página
- **Navbar:** Logo "BATCAVE" + links (`Home`, `Histórias`, `Personagens` ativo, `Curiosidades`) à esquerda[cite: 2]; botões `Cadastre-se` (outline) e `Login` (vermelho) à direita[cite: 2]. *(Nota: no mockup o sublinhado ficou em `Histórias`, ajustar ativo para `Personagens`[cite: 2]).*
- **Cabeçalho Centralizado:** Título `PERSONAGENS` (vermelho, caixa alta, negrito) e subtítulo descritivo em 2 linhas abaixo[cite: 2].
- **Lista de Banners (3 cards empilhados):**
  - Largura total do container, cantos levemente arredondados, imagem de fundo temática escurecida e título centralizado em branco/negrito[cite: 2]:
    1. **Batman** (fundo vermelho com silhueta e morcego)[cite: 2]
    2. **Aliados** (fundo vermelho/preto com silhuetas de aliados e Gotham)[cite: 2]
    3. **Vilões** (faixas verticais ilustradas dos vilões)[cite: 2]

## 7. Critérios de aceitação

Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar a imagem que estará no diretório "DOCUMENTOS_DE_APOIO/imgs-referencia/prototipoPersonagens.png" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas para a criação desta. Faça com o padrão parecido com o que já foi criado. 

