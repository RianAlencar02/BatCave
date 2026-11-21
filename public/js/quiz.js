

function buscarQuestoes(tipo, idHistoriaOuPersonagem) {

  fetch(`/quiz/buscarPerguntas/${tipo}/${idHistoriaOuPersonagem}`).then(
    function (resposta) {
      if (!resposta.ok) {
        console.log("Algo aconteceu ao buscar as perguntas. ", resposta.status);
      }
      return resposta.json();
    },
  );
}
