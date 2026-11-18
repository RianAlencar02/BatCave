let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let categoria = parametros.get("categoria"); // Selecionando o parametro da categoria na URL.


function listarPersonagens() {
  fetch(`/personagens/${categoria}`)
    .then(function (resposta) {
      if (!resposta.ok) {
        console.log("Erro ao buscar personagens. Detalhes: ", resposta.status);
      }
      return resposta.json();
    })
    .then(function (personagens) {
      let cardPersonagens = "";
      personagens.forEach(function (personagem) { // Pegando todas os personagens e percorrendo cada um para criar um card com informações
        cardPersonagens += `
                <div class="cardPersonagem">
                    <div class="divImgCard">
                        <img src="${personagem.bannerPersonagem}" id="imgPersonagem" class="imgCard" alt="">
                    </div>
                    <div class="infosPersonagem">
                        <span id="nomePersonagem" class="nomePersonagem">${personagem.nomePersonagem}</span>
                        <span id="descPersonagem" class="descPersonagem">${personagem.resumoPersonagem}</span>
                        <a id="linkDetalhes" class="botaoVerDetalhes" href="detalhesPersonagem.html?idPersonagem=${personagem.idPersonagem}"><span>Ver Detalhes</span></a>
                    </div>
                </div>
            `;
      });
    divParaCards.innerHTML = cardPersonagens;
    }).catch(function (erro){
        console.log("Erro ao exibir cards de personagem. ", erro)
        divParaCards.innerHTML = "<h2 style='color:#f2f4f7'> Nenhum personagem encontrado.</h2>"
    });
}


listarPersonagens();