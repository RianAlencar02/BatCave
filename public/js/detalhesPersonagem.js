let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let idPersonagem = parametros.get("idPersonagem"); // Selecionando o parametro do idPersonagem na URL.
let jaFavoritado = false;

function favoritar(tipo, idPersonagem) {
  let idUsuario = sessionStorage.getItem("idUsuario");

  if (!idUsuario) {
    window.location = "login.html";
    return;
  }

  if (jaFavoritado) {
    // Validação onde, se já estiver favoritado ao carregar a pagina, ele usa um fetch com DELETE para remover o favorito ao clicar no botao.
    textoBotao.innerHTML = "Favoritar";
    console.log("Desfavoritando");
    jaFavoritado = false;
    botaoFavoritar.classList.remove("botaoFavoritado");
    return fetch(`/usuarios/desfavoritar/${tipo}/${idPersonagem}/${idUsuario}`, {
      method: "DELETE",
    });
  } else {
    textoBotao.innerHTML = "Já favoritado";
    console.log("Favoritando.");
    jaFavoritado = true;
    botaoFavoritar.classList.add("botaoFavoritado");
    return fetch(`/usuarios/favoritar/${tipo}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ idUsuario: idUsuario, idFavoritado: idPersonagem }),
    });
  }
}

function verificarFavoritado(tipo, idFavoritado) {
  // Função que é executada assim que a página carrega. Verifica se o usuário logado ja curtiu.
  let idUsuario = sessionStorage.getItem("idUsuario");

  if (!idUsuario) {
    console.log("Usuário não está logado.");
  }

  fetch(`/usuarios/verificarFavoritado/${tipo}/${idFavoritado}/${idUsuario}`)
    .then(function (resposta) {
      if (!resposta.ok) {
        throw "Erro ao verificar " + resposta.status;
      }
      return resposta.json();
    })
    .then(function (resultadoVerificacao) {
      console.log("Já favoritou?", resultadoVerificacao.length > 0);
      if (resultadoVerificacao.length > 0) {
        jaFavoritado = true;
        textoBotao.innerHTML = "Já Favoritado";
        botaoFavoritar.classList.add("botaoFavoritado");

      } else {
        jaFavoritado = false;
        textoBotao.innerHTML = "Favoritar";
      }
    })
    .catch(function (erro) {
      console.log("Algo deu errado:", erro);
    });
}


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
      verificarFavoritado("personagem", idPersonagem)
      bannerPersonagem.src = personagemEncontrado[0].bannerPersonagem;
      capaPersonagem.src = personagemEncontrado[0].capaPersonagem;
      botaoFavoritar.onclick = function () {
        favoritar("personagem", idPersonagem);
      };
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
