let parametros = new URLSearchParams(location.search); // Procurando parametros na URL
let idHistoria = parametros.get("idHistoria"); // Selecionando o parametro do idHistoria na URL.
let jaAvaliado = false;
let idUsuario = sessionStorage.getItem("idUsuario");



function verificarAvaliacao(idHistoria) {

  if (!idUsuario) {
    console.log("Verificando avaliação: Usuário não logado.");
  } else {
    fetch(`/usuarios/verificarAvaliacao/${idUsuario}/${idHistoria}`)
      .then(function (resposta) {
        if (!resposta.ok) {
          throw ("ERRO NA VERIFICAÇÂO!", resposta.status);
        }
        return resposta.json();
      })
      .then(function (resultadoVerificacao) {
        console.log("Já avaliou? ", resultadoVerificacao.length > 0);
        if (resultadoVerificacao.length > 0) {
          jaAvaliado = true;
          textoBotaoAvaliar.innerHTML = "Alterar avaliação";
          abrirModalAvaliar.classList.add("botaoFavoritado");
        } else {
          jaAvaliado = false;
          textoBotaoAvaliar.innerHTML = "Avaliar";
        }
      })
      .catch(function (erro) {
        console.log("Algo deu errado:", erro);
      });
  }
}

function avaliar(idHistoria) {
  let opcaoSelecionada = document.querySelector(
    'input[name="valorAvaliacao"]:checked',
  );
  let notaAvaliacao = Number(opcaoSelecionada.value);

  if (!idUsuario) {
    // Caso o usuário não esteja logado, é redirecionado pra login
    window.location = "login.html";
    return;
  }

  if (jaAvaliado) {
    return fetch(
      `/usuarios/alterarAvaliacao/${notaAvaliacao}/${idUsuario}/${idHistoria}`,
      {
        method: "PUT",
      },
    );
  } else {
    textoBotaoAvaliar.innerHTML = "Alterar avaliação";
    abrirModalAvaliar.classList.add("botaoFavoritado");
    jaAvaliado = true; // Com isso, eu não preciso recarregar a página para avaliar novamente a história, pois a variavel jaAvaliado já é reatribuida aqui, sem necessidade de recarregar.

    return fetch(
      `/usuarios/avaliar/${notaAvaliacao}/${idUsuario}/${idHistoria}`,
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          notaAvaliacao: notaAvaliacao,
          idUsuario: idUsuario,
          idHistoria: idHistoria,
        }),
      },
    ).catch(function (erro) {
      console.log("Algo deu errado:", erro.code);
    });
  }
}

avaliarFechar.addEventListener("click", function () {
  // id do botão sendo referenciado para avaliar
  avaliar(idHistoria);
});
verificarAvaliacao(idHistoria);
