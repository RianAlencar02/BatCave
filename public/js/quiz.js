const contadorPergunta = document.getElementById("contadorPergunta"); // Parte onde, eu crio constantes com os elementos do HTML. Serve para eu usar novamente mais a frente no código sem ter que criar várias vezes.
const categoriaQuestao = document.getElementById("categoriaQuestao");
const textoPergunta = document.getElementById("textoPergunta");
const listagemAlternativas = document.getElementById("listagemAlternativas");
const botaoProximaQuestao = document.getElementById("botaoProximaQuestao");

let listaPerguntas = []; // Como o arquivo é um script que carrega assim que o quiz começa, a listaPerguntas do quiz começa vazia, afinal a função de separar as perguntas deste quiz ainda não aconteceu.
let listaAlternativas = [];
let contador = 0; // Contador usado para delimitar até onde vai o quiz. Como todo quiz tem somente 5 questões, esse contador sempre irá ir até o 4 (pois para percorrer a lista de perguntas, a gente vai usar ele começando em zero)
let respostasUsuario = []; // Vetor onde, após cada resposta do usuário, será guardado um objeto com idPergunta e idAlternativa, para representar quais perguntas o usuário está respondendo,
let acertos = 0;
let idUsuario = sessionStorage.getItem("idUsuario")
let parametros = new URLSearchParams(window.location.search); // Busca parametros na URL
let categoria = parametros.get("idHistoria") ? "historia" : "personagem"; // Define a categoria com um if ternário (? significa o if do contexto passado, : é o else.)
let idHistoriaOuPersonagem;
let idQuiz = undefined;

if (parametros.get("idHistoria")) {
  idHistoriaOuPersonagem = parametros.get("idHistoria");
} else {
  idHistoriaOuPersonagem = parametros.get("idPersonagem");
}

Promise.all([
  // O promise all é algo que consegue receber uma lista de fetch, e ele roda todas ao mesmo tempo, devolvendo uma unica promise
  fetch(`/quiz/buscarPerguntas/${categoria}/${idHistoriaOuPersonagem}`).then(
    (respostaPerguntas) => respostaPerguntas.json(),
  ),
  fetch(`/quiz/buscarAlternativas/${categoria}/${idHistoriaOuPersonagem}`).then(
    (respostaResultados) => respostaResultados.json(),
  ),
])
  .then(function ([perguntas, alternativas]) {
    // ele devolve os dois itens da lista, e eles são respectivamente o primeiro e segundo fetch
    organizarPerguntasAlternativas(perguntas, alternativas); // function que, após receber os parametros, percorre todos os objetos e os insere em suas respectivas listas
  })
  .catch(function (erro) {
    console.log(
      "Não foi possivel buscar as perguntas e alternativas. Erro:",
      erro,
    );
  });

function organizarPerguntasAlternativas(perguntas, alternativas) {
  // function que recebe os JSON e percorre eles com forEach
  perguntas.forEach(function (pergunta) {
    listaPerguntas.push(pergunta);
  });
  alternativas.forEach(function (alternativa) {
    listaAlternativas.push(alternativa);
  });
  idQuiz = listaPerguntas[0].idQuiz;
  carregarPerguntasAlternativas();
}

function carregarPerguntasAlternativas() {
  let objetoPergunta = listaPerguntas[contador]; // Especificando qual é a pergunta da vez baseado no número do conador
  let alternativasDaPerguntaAtual = [];
  for (let i = 0; i < listaAlternativas.length; i++) {
    if (objetoPergunta.idPergunta == listaAlternativas[i].fkPergunta) {
      // Percorrendo todas as alternativas na lista e comparando o fkPergunta com o idPergunta do objeto
      alternativasDaPerguntaAtual.push(listaAlternativas[i]);
    }
  }

  let pergunta = objetoPergunta.textoPergunta;
  contadorPergunta.innerHTML = contador + 1;
  categoriaQuiz.innerHTML = categoria == "historia" ? 'História' : 'Personagem';
  textoPergunta.innerHTML = pergunta;
  listagemAlternativas.innerHTML = ``; // limpando a div de cards para cada vez que a pergunta trocar, as alternativas também trocarem.
  let cardsAlternativa = "";

  if (contador == listaPerguntas.length - 1) {
    botaoProximaQuestao.innerHTML = "Finalizar quiz";
  } // Caso o contador chegue a 4 (que seria a última questão do quiz), o texto do botão troca

  for (let i = 0; i < alternativasDaPerguntaAtual.length; i++) {
    // Incrementando a variável com os cards.
    cardsAlternativa += ` 
  <label class="alternativaQuestao">
    <input type="radio" name="alternativa" value="${alternativasDaPerguntaAtual[i].idAlternativa}">
    <span class="textoAlternativa">${alternativasDaPerguntaAtual[i].textoAlternativa}</span>
  </label>`;
  }
  listagemAlternativas.innerHTML = cardsAlternativa;
}

botaoProximaQuestao.addEventListener("click", function () {
  let marcada = document.querySelector('input[name="alternativa"]:checked'); // Sempre que o botão é clicado, ele verifica qual input radio está preenchida.
  let acertou = false;

  if (!marcada) {
    alert("Escolha a alternativa."); // se nenhuma estiver, um alert aparece
    return;
  }

  // Percorrendo o vetor de alternativas e comparando a alternativa escolhida para que, quando encontra-la na lista, verificar se ela é a questao correta.
  for (let i = 0; i < listaAlternativas.length; i++) {
    if (marcada.value == listaAlternativas[i].idAlternativa) {
      if (listaAlternativas[i].alternativaCorreta == 1) {
        acertos++;
        acertou = true;
      }
    }
  }

  let labelEscolhida = marcada.closest("label");
  labelEscolhida.classList.add(acertou ? "alternativa-correta" : "alternativa-errada");


  let perguntaAlternativaEscolhida = {
    // criando um objeto com idPergunta e idAlternativa, que respectivamente, pertencem a qual pergunta o usuário respondeu.
    idPergunta: listaPerguntas[contador].idPergunta,
    idAlternativa: Number(marcada.value),
  };

  if (respostasUsuario.length <= 4) {
    respostasUsuario.push(perguntaAlternativaEscolhida); // Inserindo na lista de respostasUsuario o objeto (no final, terão 5 objetos, cada um representando uma questão e uma alternativa.)
  }

 setTimeout(function () {
    labelEscolhida.classList.remove("alternativa-correta", "alternativa-errada");

    if (contador < listaPerguntas.length - 1) {
      contador++;
      carregarPerguntasAlternativas();
    } else {
      finalizarQuiz();
    }
  }, 1000);
});

function finalizarQuiz() {
  let fraseFinal = undefined;
  if (acertos < 1){
     fraseFinal = "Basta um quiz ruim para um homem bom ficar louco..."
  }
  else if (acertos <= 2){
     fraseFinal = "Você é igual ao Robin, ainda tem muito a melhorar."
  }
  else if (acertos <=4){
     fraseFinal = "Um bom vigilante, Gotham City precisa de você."
  }
  else{
     fraseFinal = "Preparo absoluto. Você é o próprio cavaleiro das trevas."
  }
  let porcentagemAcerto = ((acertos / 5) * 100).toFixed();
  document.getElementById("acertos").textContent = acertos;
  document.getElementById("total").textContent = 5;
  document.getElementById("porcentagem").textContent = porcentagemAcerto;
  document.getElementById("resultado-quiz").classList.add("ativo"); // ativa o modal para exibir o resultado.
  document.getElementById("fraseFinalQuiz").textContent = fraseFinal;
  fetch("/usuarios/inserirTentativaAlternativas", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({
    pontuacao: acertos,
    idUsuario: idUsuario,
    idQuiz: idQuiz,
    respostas: respostasUsuario
  })
})
  .then(function (resposta) {
    if (!resposta.ok) throw new Error("Erro ao registrar tentativa");
    console.log("Tentativa salva");
  })
  .catch(function (erro) {
    console.log(erro);
  });

  if (categoria == "personagem"){
    let botao = document.getElementById("botao-voltar");
    botao.href = "personagens.html";
    botao.textContent = "Voltar para personagens";
  }
}
