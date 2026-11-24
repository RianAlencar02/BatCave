const botoesAba = document.querySelectorAll(".botaoAba");
const paineisAba = document.querySelectorAll(".abaPerfil");
let idUsuario = sessionStorage.getItem("idUsuario");

if (!idUsuario) {
  console.log(
    "ERRO! Você não deveria conseguir ver esta tela ao menos que esteja logado. idUsuario encontrado: ",
    idUsuario,
  );
  window.location = "index.html";
}

function mostrarAba(idAba) {
  paineisAba.forEach(function (painel) {
    painel.classList.toggle("abaAtiva", painel.id === idAba);
  });

  botoesAba.forEach(function (botao) {
    botao.classList.toggle("abaAtiva", botao.dataset.aba === idAba);
  });
}

botoesAba.forEach(function (botao) {
  botao.addEventListener("click", function () {
    mostrarAba(botao.dataset.aba);
  });
});

function carregarTelaPerfil() {
  Promise.all([
    // O promise all é algo que consegue receber uma lista de fetch, e ele roda todas ao mesmo tempo, devolvendo uma unica promise
    fetch(`/usuarios/puxarInformacoesUsuario/${idUsuario}`).then(
      (respostaInfos) => respostaInfos.json(),
    ),
    fetch(`/usuarios/puxarPersonagensFavoritados/${idUsuario}`).then(
      (personagensFavoritados) => personagensFavoritados.json(),
    ),
    fetch(`/usuarios/puxarHistoriasFavoritadas/${idUsuario}`).then(
      (historiasFavoritadas) => historiasFavoritadas.json(),
    ),
    fetch(`/usuarios/puxarAvaliacoesHistoria/${idUsuario}`).then(
      (avaliacoesHistoria) => avaliacoesHistoria.json(),
    ),
    fetch(`/usuarios/puxarTentativasUsuario/${idUsuario}`).then(
      (tentativasUsuario) => tentativasUsuario.json(),
    ),
  ])
    .then(function (informacoesPerfilUsuario) {
      let infoPerfil = informacoesPerfilUsuario[0];
      let personagensFavoritados = informacoesPerfilUsuario[1];
      let historiasFavoritadas = informacoesPerfilUsuario[2];
      let avaliacoesHistoria = informacoesPerfilUsuario[3];
      let tentativasUsuario = informacoesPerfilUsuario[4];
      mostrarInformacoesUsuario(infoPerfil, personagensFavoritados,historiasFavoritadas, avaliacoesHistoria, tentativasUsuario,);
    })
    .catch(function (erroCarregarTela) {
      console.log(
        "Algo deu errado em carregas as informações do perfil. Erro: ",
        erroCarregarTela,
      );
    });
}

function mostrarInformacoesUsuario(
  infoPerfil,
  personagensFavoritados,
  historiasFavoritadas,
  avaliacoesHistoria,
  tentativasUsuario,
) {
  document.getElementById("tituloNomeUsuario").textContent =
    infoPerfil[0].nomeUsuario;
  document.getElementById("cardNomeUsuario").textContent =
    infoPerfil[0].nomeUsuario;
  document.getElementById("cardEmailUsuario").textContent =
    infoPerfil[0].emailUsuario;
  document.getElementById("cardDataCriacao").textContent =
    infoPerfil[0].dataHoraCriacao;
  document.getElementById("metricaFavoritados").textContent =
    infoPerfil[0].qntFavoritos;
  document.getElementById("metricaAvaliados").textContent =
    infoPerfil[0].qntHistoriasAvaliadas;
  document.getElementById("metricaTentativas").textContent =
    infoPerfil[0].qntQuizesConcluidos;
  qntFavoritados.innerHTML = `Favoritos (${personagensFavoritados.length + historiasFavoritadas.length})`;
  qntAvaliados.innerHTML = `Histórias avaliadas (${avaliacoesHistoria.length})`;
  qntQuizes.innerHTML = `${tentativasUsuario.length}`;
  qntTentativas.innerHTML = `Tentativas (${tentativasUsuario.length})`
  personagensFavoritados.forEach(function (personagem) {
    listaFavoritos.innerHTML += `
                    <div class="itemFavorito">
                    <img class="miniaturaItem" src="${personagem.bannerPersonagem}" alt="">
                    <span class="tituloItem">${personagem.nomePersonagem}</span>
                    <span class="tagCategoria">Personagem</span>
                    <a class="botaoVerDetalhesSolido" href="./detalhesPersonagem.html?idPersonagem=${personagem.idPersonagem}">Ver detalhes</a>
                </div>
                `;
  });
  historiasFavoritadas.forEach(function (historia) {
    listaFavoritos.innerHTML += `<div class="itemFavorito">
                    <img class="miniaturaItem" src="${historia.bannerHistoria}" alt="">
                    <span class="tituloItem">${historia.tituloHistoria}</span>
                    <span class="tagCategoria">História</span>
                    <a class="botaoVerDetalhesSolido" href="./detalhesHistoria.html?idHistoria=${historia.idHistoria}">Ver detalhes</a>
                </div>`;
  });

  avaliacoesHistoria.forEach(function (avaliacao) {
    listaAvaliados.innerHTML += `<div class="itemAvaliacao">
                    <div class="celulaPrincipal">
                        <img class="miniaturaItem" src="${avaliacao.bannerHistoria}" alt="">
                        <div class="infoItem">
                            <span class="categoriaItem">${avaliacao.tipoHistoria}</span>
                            <span class="nomeItem">${avaliacao.tituloHistoria}</span>
                            <span class="dataItem">Avaliada em ${avaliacao.dataAvaliacao}</span>
                        </div>
                    </div>
                    <div class="celulaNota">
                        <span class="notaGrande">${avaliacao.notaAvaliacao}/ 5</span>
                        <span class="textoNota">Nota atribuída</span>
                    </div>
                    <a class="botaoVerDetalhesEscuro" href="./detalhesHistoria.html?idHistoria=${avaliacao.fkHistoria}">Ver detalhes</a>
                </div>`;
  });
  tentativasUsuario.forEach(function (tentativa) {
    let caminho;
    if (tentativa.tipo == "historia") {
      caminho = `./detalhesHistoria.html?idHistoria=${tentativa.idItem}`;
    } else {
      caminho = `./detalhesPersonagem.html?idPersonagem=${tentativa.idItem}`;
    }
    listaTentativas.innerHTML += `<div class="itemQuiz">
                    <div class="celulaPrincipal">
                        <img class="miniaturaItem" src="${tentativa.banner}" alt="">
                        <div class="infoItem">
                            <span class="tagConcluido">CONCLUÍDO</span>
                            <span class="nomeItem">${tentativa.titulo}</span>
                            <span class="dataItem">Concluído em ${tentativa.dataTentativa}</span>
                        </div>
                    </div>
                    <div class="celulaNota">
                        <span class="notaGrande">${tentativa.pontuacao} / 5</span>
                        <span class="textoNota">${(tentativa.pontuacao / 5) * 100}% de acertos</span>
                    </div>
                    <a class="botaoVerDetalhesEscuro" href="${caminho}">Ver detalhes</a>
                </div>`;
  });
}

// Função para deslogar ao clicar no botão de sair. 
document.getElementById("botaoSair").addEventListener("click", function () {
  sessionStorage.clear(); // apaga todos os dados do usuário logado
  window.location.href = "index.html";
});

carregarTelaPerfil();
