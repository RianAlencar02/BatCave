let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let idHistoria = parametros.get("idHistoria"); // Selecionando o parametro do idHistoria na URL.
let jaFavoritado = false;

function favoritar(tipo, idHistoria) {
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
    return fetch(`/usuarios/desfavoritar/${tipo}/${idHistoria}/${idUsuario}`, {
      method: "DELETE",
    });
  } else {
    textoBotaoFavoritar.innerHTML = "Já favoritado";
    console.log("Favoritando.");
    jaFavoritado = true;
    botaoFavoritar.classList.add("botaoFavoritado");
    return fetch(`/usuarios/favoritar/${tipo}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ idUsuario: idUsuario, idFavoritado: idHistoria }),
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
      verificarFavoritado("historia", historiaEncontrada[0].idHistoria);

      bannerHistoria.src = historiaEncontrada[0].bannerHistoria;
      capaHistoria.src = historiaEncontrada[0].capaHistoria;
      botaoFavoritar.onclick = function () {
        favoritar("historia", idHistoria);
      };
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
