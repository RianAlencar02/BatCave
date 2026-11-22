
let parametros = new URLSearchParams(window.location.search);
let categoria = parametros.get("idHistoria") ? "historia" : "personagem";
let idHistoriaOuPersonagem;

if(parametros.get("iHistoriaOuPersonagemdHistoria")){
  idHistoriaOuPersonagem = parametros.get("idHistoria")
}
else{
  idHistoriaOuPersonagem = parametros.get("idPersonagem")
}

Promise.all([ // O promise all é algo que consegue receber uma lista de fetch, e ele roda todas ao mesmo tempo, devolvendo uma unica promise 
  fetch(`/quiz/buscarPerguntas/${categoria}/${idHistoriaOuPersonagem}`).then(respostaPerguntas => respostaPerguntas.json()),
  fetch(`/quiz/buscarAlternativas/${categoria}/${idHistoriaOuPersonagem}`).then(respostaResultados => respostaResultados.json()),
]).then(function ([perguntas, alternativas])  { // ele devolve os dois itens da lista, o primeiro sendo o primeiro fetch e o segundo sendo o segundi
      iniciarQuiz(perguntas, alternativas); 
}).catch(function (erro) {
    console.log("Não foi possivel buscar as perguntas e alternativas. Erro:", erro);
  });;

function iniciar(perguntas, alternativas){
  let listaPerguntas = [];
  let listaAlernativas = [];
  let contador = 0;
  let respostasUsuario = {};
  perguntas.forEach(function (pergunta){
    listaPerguntas.push(pergunta)
  })
  alternativas.forEach(function (alternativa){
    listaAlernativas.push(alternativa);
  });

}

function carregarPerguntasAlternativas(){
  let pergunta = listaPerguntas[contador];
  
}