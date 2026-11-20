let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let idHistoria = parametros.get("idHistoria"); // Selecionando o parametro do idHistoria na URL.

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
      // Pegando o resultado (que vem como um array que contém um objeto) e selecionando as informações que devem aparecer.
      verificarFavoritado("historia", historiaEncontrada[0].idHistoria); // function do outro arquivo JS acontecendo dentro desta

      bannerHistoria.src = historiaEncontrada[0].bannerHistoria;
      capaHistoria.src = historiaEncontrada[0].capaHistoria;

      tituloHistoria.textContent = historiaEncontrada[0].tituloHistoria;
      nomeHistoria.textContent = historiaEncontrada[0].tituloHistoria;
      tipoHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      notaHistoria.textContent = historiaEncontrada[0].notaAvaliacao;
      anoHistoria.textContent = historiaEncontrada[0].anoHistoria;
      tipoHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      criadorHistoria.textContent = historiaEncontrada[0].criadorHistoria;
      sinopseHistoria.textContent = historiaEncontrada[0].sinopseHistoria;
      universoHistoria.textContent = historiaEncontrada[0].universoHistoria;
      generoDaHistoria.textContent = historiaEncontrada[0].generoHistoria;
      midiaHistoria.textContent = historiaEncontrada[0].tipoHistoria;
      lancamentoHistoria.textContent = historiaEncontrada[0].anoHistoria;
      if (historiaEncontrada[0].textoComentarioEditor == undefined) {
        containerEditor.innerHTML = "";
        containerEditor.classList.remove("containerEditor");
      } else {
        comenEditor.textContent = historiaEncontrada[0].textoComentarioEditor;
      }
    })
    .catch(function (erro) {
      console.log("Erro ao ver detalhes da história: ", erro);
    });
}
historiaEspecifica(idHistoria);
