let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let idPersonagem = parametros.get("idPersonagem"); // Selecionando o parametro do idPersonagem na URL.

function personagemEspecifico(idPersonagem) {
  fetch(`/personagens/detalhesPersonagem/${idPersonagem}`)
    .then(function (resposta) {
      if (!resposta.ok) {
        console.log(
          "Algo aconteceu ao buscar as informações deste personagem. ",
          resposta.status,
        );
      }
      return resposta.json();
    })
    .then(function (personagemEncontrado) {
      // Pegando o resultado (que vem como um array que contém um objeto) e selecionando as informações que devem aparecer.

      bannerPersonagem.src = personagemEncontrado[0].bannerPersonagem;
      capaPersonagem.src = personagemEncontrado[0].capaPersonagem;
      tituloPersonagem.textContent = personagemEncontrado[0].nomePersonagem;
      identidadePersonagem.textContent = personagemEncontrado[0].identidadeSecreta;
      categoriaPersonagem.textContent = personagemEncontrado[0].categoriaPersonagem;
      primeiraAparicao.textContent = personagemEncontrado[0].primeiraAparicaoPersonagem;
      criadorPersonagem.textContent = personagemEncontrado[0].criadoresPersonagem;
      generoPersonagem.textContent = personagemEncontrado[0].generoPersonagem;
      afiliacaoPersonagem.textContent = personagemEncontrado[0].afiliacoesPersonagem;
      citacaoPersonagem.textContent = personagemEncontrado[0].fraseMarcantePersonagem;
      biografiaPersonagem.textContent = personagemEncontrado[0].biografiaPersonagem;
      if (personagemEncontrado[0].textoComentarioEditor == undefined) {
        containerEditor.innerHTML = "";
        containerEditor.classList.remove("containerEditor");
      } else {
        comenEditor.textContent = personagemEncontrado[0].textoComentarioEditor;
      }
    })
    .catch(function (erro) {
      console.log("Erro ao ver detalhes da história: ", erro);
    });
}

personagemEspecifico(idPersonagem);
