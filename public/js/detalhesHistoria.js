let parametros = new URLSearchParams(location.search);
let idHistoria = parametros.get("idHistoria");
console.log(idHistoria);
function historiaEspecifica(idHistoria) {
  fetch(`/historias/detalhesHistoria/${idHistoria}`)
    .then(function (resposta) {
      if (!resposta.ok) {
        console.log(
          "Algo aconteceu ao buscar as informações desta história. ",
          resposta.status,
        );
      }
      return resposta.json();
    })
    .then(function (historiaEncontrada) {
      console.log(`aaaaa `, historiaEncontrada);
      console.log(`aaaaaass `, historiaEncontrada[0].idHistoria);
    
      bannerHistoria.src = historiaEncontrada[0].bannerHistoria;
      capaHistoria.src = historiaEncontrada[0].capaHistoria;
      tituloHistoria.textContent = historiaEncontrada[0].tituloHistoria;
      nomeHistoria.textContent = historiaEncontrada[0].tituloHistoria;
      tipoHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      anoHistoria.textContent = historiaEncontrada[0].anoHistoria;
      tipoHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      criadorHistoria.textContent = historiaEncontrada[0].criadorHistoria;
      sinopseHistoria.textContent = historiaEncontrada[0].sinopseHistoria;
      universoHistoria.textContent = historiaEncontrada[0].universoHistoria;
      generoDaHistoria.textContent = historiaEncontrada[0].generoHistoria;
      midiaHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      lancamentoHistoria.textContent = historiaEncontrada[0].anoHistoria
      comenEditor.textContent = historiaEncontrada[0].textoComentarioEditor;
    })
    .catch(function (erro) {
      console.log("Erro ao ver detalhes da história: ", erro);
    });
}

historiaEspecifica(idHistoria);
