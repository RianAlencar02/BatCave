function listarHistorias() {
  fetch(`/historias/`)
    .then(function (resposta) {
      if (!resposta.ok) {
        console.log("Erro ao buscar histórias. Detalhes: ", resposta.status);
      }
      return resposta.json();
    })
    .then(function (historias) {
      let cardsHistoria = "";
      historias.forEach(function (historia) { // Pegando todas as historias, e usando forEach, elas são percorridas e as informações de cada um são incrementadas no card.
        cardsHistoria += `
             <div class="cardHistoria">
            <div class="imgCard">
              <img src="${historia.bannerHistoria}" alt="Capa de ${historia.tituloHistoria}">
            </div>
            <div class="corpoCard">
              <div class="linhaTipoAno">
                <span class="spanTipoMidia">${historia.tipoHistoria}</span>
                <span class="spanAnoHistoria">${historia.anoHistoria}</span>
              </div>
              <div class="colunaTituloCriador">
                <span class="spanTitulo">${historia.tituloHistoria}</span>
                <span class="spanCriador">${historia.criadorHistoria}</span>
              </div>
              <span class="resumoHistoria">${historia.resumoHistoria}</span>
              <a class="botaoVerDetalhes" href="./detalhesHistoria.html?idHistoria=${historia.idHistoria}">
                <span class="textoVerDetalhes">Ver detalhes</span>
              </a>
            </div>
          </div>
            `;
      });
    containerCardsHistoria.innerHTML = cardsHistoria;
    }).catch(function (erro){
        console.log("Erro ao exibir cards de história. ", erro)
        containerCardsHistoria.innerHTML = "<h2 style='color:#f2f4f7'> Nenhuma histótira encontrada. </h2>"
    });
}

listarHistorias();
