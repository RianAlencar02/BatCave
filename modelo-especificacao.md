# Titulo do documento

## 1. Contexto

A BatCave é um sistema voltado para os fãs de Batman e de seu universo. O sistema contempla criação de usuários e, após a realização de login, o usuário pode interagir com histórias e personagens daquele universo, realizando quizes, favoritando e avaliando.
O sistema atualmente, tem uma tela Home, Cadastro, Login e Histórias, uma tela de listagem de todas as histórias cadastradas. Ao clicar em "Ver Detalhes", o usuário deve conseguir visualizar as informações daquela história em especifico. Atualmente, ainda não existe uma tela para ver os detalhes da história.
## 2. Objetivo
Criar uma tela "detalhesHistoria", com informações e imagens daquela história em especifico, e no final, um bloco com "Comentário do editor", um comentário do desenvolvedor sobre aquela história em especifico.

## 3. Escopo

- **Dentro do escopo:** Criação de usuários, login, visualização de histórias e personagens, realizar quizes de ambos, avaliar uma história ou favoritar uma história ou personagem.
- **Fora do escopo:** Avaliação de personagens, blog com comentários dos usuários sobre a história, responder ao comentário do editor.

## 4. Funcionalidades

Criar uma tela de detalhes da história, com botões que futuramente (quando conectados ao back-end), darão a possibilidade de favoritar, avaliar e realizar um quiz daquela história. 

## 5. Regras de negócio
**Ignorar esta parte por agora, pois somente o front está sendo produzido**

## 6. Interface
## 1. Visual e Paleta
- **Tema:** Dark Mode moderno com foco em contraste entre preto, cinza chumbo e vermelho.
- **Cores:**
  - Fundo principal: `#0D0E10`
  - Cards / Navbar / Botões secundários: `#1C1E22` / `#22252A`
  - Destaque principal (títulos, botão Login, link ativo): `#C82333` (vermelho)
  - Textos: `#FFFFFF` (primário) e `#B0B3B8` (secundário)

---

## 2. Estrutura da Página (De cima para baixo)

### 2.1. Navbar (Barra Superior)
- **Esquerda:** Logo "BATCAVE" (símbolo do morcego) + links (`Home`, `Histórias`, `Personagens`, `Curiosidades`). O item `Histórias` fica ativo com texto e sublinhado vermelhos.
- **Direita:** Botão `Cadastre-se` (outline/borda fina) e botão `Login` (fundo vermelho sólido).

### 2.2. Banner Hero
- Imagem panorâmica de largura total (`object-fit: cover`) com ilustração em destaque do personagem/obra (~240px de altura).

### 2.3. Detalhes Principais (Layout em 2 Colunas)
- **Coluna Esquerda (~30%):** Capa vertical da obra (`Batman Absoluto`) em proporção ~2:3.
- **Coluna Direita (~70%):**
  - **Cabeçalho:** Tag `Quadrinho` (vermelho suave), título `Batman Absoluto` (grande, negrito, vermelho), metadados (`Ano: 2024`, `Gênero: Ação`) e nota (`★ 4.8`).
  - **Botões de Ação:** Linha horizontal com 3 botões escuros (`#22252A`) e ícones: `Favoritar`, `Avaliar` e `Fazer quiz`.
  - **Card "Informações:":** Box escuro com bordas arredondadas listando em 2 colunas internas:
    - `Nome:` Batman Absoluto
    - `Lançamento:` 2024
    - `Tipo:` Quadrinho
    - `Criador:` Scott Snyder
    - `Gênero:` Ação
    - `Universo:` Absoluto

### 2.4. Sinopse
- Separada por linhas horizontais sutis acima e abaixo.
- Título `Sinopse` em branco/negrito seguido pelo parágrafo descritivo da história.

### 2.5. Comentário do Editor
- Dividido por uma linha vertical sutil:
  - **Esquerda:** Título `Comentário do editor`, avatar circular e nome (`Rian Alencar Souza`) centralizados.
  - **Direita:** Área reservada para o texto do comentário.

## 3. Comportamento e Responsividade
- **Ações:** Efeito hover nos links/botões, estado ativo para `Favoritar`/`Avaliar` e navegação para o quiz em `Fazer quiz`.

## 7. Critérios de aceitação

Defina condições objetivas para verificar se as funcionalidades foram implementadas corretamente.

- Somente criar o front-end. Arquivo HTML e CSS.
- Levar a imagem que estará no diretório "DOCUMENTOS_DE_APOIO/telaDetalhesHistoria" em consideração para criar o front-end. Considere mais a imagem do que a interface descrita aqui.
- Usar em consideração os CSS das outras páginas para a criação desta. Faça com o padrão parecido com o que já foi criado. 
