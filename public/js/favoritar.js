let jaFavoritado = false;
let params = new URLSearchParams(window.location.search); // Pegando a url e procurando os parametros
let categoria = undefined;
let idFavoritado = undefined;

if (params.get("idPersonagem")) { // Caso na URL encontrada tenha idPersonagem, transforma a categoria em personagem e o id no idPersonagem passada pelo parametro
  categoria = "personagem";
  idFavoritado = params.get("idPersonagem");
} else {
  categoria = "historia";
  idFavoritado = params.get("idHistoria");
}

function favoritar(tipo, idFavoritado) {
  let idUsuario = sessionStorage.getItem("idUsuario");

  if (!idUsuario) {
    window.location = "login.html";
    return;
  }

  if (jaFavoritado) {
    // Validação onde, se já estiver favoritado ao carregar a pagina, ele usa um fetch com DELETE para remover o favorito ao clicar no botao.
    textoBotaoFavoritar.innerHTML = "Favoritar";
    console.log("Desfavoritando");
    jaFavoritado = false;
    botaoFavoritar.classList.remove("botaoFavoritado");
    return fetch(
      `/usuarios/desfavoritar/${tipo}/${idFavoritado}/${idUsuario}`,
      {
        method: "DELETE",
      },
    );
  } else {
    textoBotaoFavoritar.innerHTML = "Já favoritado";
    console.log("Favoritando.");
    jaFavoritado = true;
    botaoFavoritar.classList.add("botaoFavoritado");
    return fetch(`/usuarios/favoritar/${tipo}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        idUsuario: idUsuario,
        idFavoritado: idFavoritado,
      }),
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
        textoBotaoFavoritar.innerHTML = "Já Favoritado";
        botaoFavoritar.classList.add("botaoFavoritado");
      } else {
        jaFavoritado = false;
        textoBotaoFavoritar.innerHTML = "Favoritar";
      }
    })
    .catch(function (erro) {
      console.log("Algo deu errado:", erro);
    });
}

botaoFavoritar.addEventListener("click", function () {
  favoritar(categoria, idFavoritado);
});
