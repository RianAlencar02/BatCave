const botaoSair = document.getElementById("botaoSairDashboard");
botaoSair.addEventListener("click", sair);

function sair() {
  (sessionStorage.clear(), (window.location = "loginAdm.html"));
}
function logarAdm() {
  let emailAdm = inputLoginAdm.value;
  let senhaAdm = inputSenhaAdm.value;

  if (!emailAdm || !senhaAdm) {
    alert("Email ou senha vazios. Por favor, preencher os campos.");
  } else {
    fetch("/dashboard/logarAdm", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        emailAdm: emailAdm,
        senhaAdm: senhaAdm,
      }),
    })
      .then(function (resposta) {
        if (resposta.ok) {
          resposta.json().then((json) => {
            sessionStorage.idAdm = json.idAdm;
            sessionStorage.nomeAdm = json.nomeAdm;
            sessionStorage.emailAdm = json.emailAdm;
            alert(
              "Login realizado com sucesso. Bem-vindo de volta",
              json.nomeAdm,
            );
            setTimeout(function () {
              window.location = "dashboard.html";
            }, 1000);
          });
        } else {
          resposta.text().then((texto) => {
            alert(texto);
            console.log(texto);
          });
        }
      })
      .catch(function (erro) {
        console.log("Erro do catch", erro);
      });
  }
  return false;
}

function puxarInformacoesDashboard() {
  Promise.all([
    // O promise all é algo que consegue receber uma lista de fetch, e ele roda todas ao mesmo tempo, devolvendo uma unica promise
    fetch(`/dashboard/contarUsuarios`).then((qntUsuarios) =>
      qntUsuarios.json(),
    ),
    fetch(`/dashboard/contarHistorias`).then((qntHistorias) =>
      qntHistorias.json(),
    ),
    fetch(`/dashboard/contarPersonagens`).then((qntPersonagens) =>
      qntPersonagens.json(),
    ),
    fetch(`/dashboard/contarQuizesConcluidos`).then((qntQuizesConcluidos) =>
      qntQuizesConcluidos.json(),
    ),
    fetch(`/dashboard/personagensMaisFavoritados`).then(
      (personagensFavoritados) => personagensFavoritados.json(),
    ),
    fetch(`/dashboard/top3MelhorAvaliadas`).then((top3MelhorAvaliadas) =>
      top3MelhorAvaliadas.json(),
    ),
    fetch(`/dashboard/favoritosPorTipo`).then((favoritosPorTipo) =>
      favoritosPorTipo.json(),
    ),fetch(`/dashboard/selecionarTodosUsuarios`).then((usuariosEncontrados) =>
      usuariosEncontrados.json(),
    ),
    fetch(`/dashboard/selecionarTodasHistorias`).then((historiasEncontradas) =>
      historiasEncontradas.json(),
    ),
    fetch(`/dashboard/selecionarTodosPersonagens`).then((personagensEncontrados) =>
      personagensEncontrados.json(),
    )
  ])
    .then(function (informacoesDashboard) {
      let qntUsuarios = informacoesDashboard[0].qntUsuarios;
      let qntHistorias = informacoesDashboard[1].qntHistorias;
      let qntPersonagens = informacoesDashboard[2].qntPersonagens;
      let qntQuizesConcluidos = informacoesDashboard[3].qntQuizesConcluidos;
      let personagensFavoritados = informacoesDashboard[4];
      let top3MelhorAvaliadas = informacoesDashboard[5];
      let favoritosPorTipo = informacoesDashboard[6];
      let usuariosEncontrados = informacoesDashboard[7];
      let historiasEncontradas = informacoesDashboard[8];
      let personagensEncontrados = informacoesDashboard[9];


      if (document.getElementById("telaDashboard")) {carregarDashboard({qntUsuarios,qntHistorias,qntPersonagens,qntQuizesConcluidos,personagensFavoritados,top3MelhorAvaliadas,favoritosPorTipo})};
      if (document.getElementById("telaUsuarios")) {carregarTelaUsuarios(usuariosEncontrados)};
      if (document.getElementById("telaHistorias")) {carregarTelasHistorias(historiasEncontradas)};
      if (document.getElementById("telaPersonagens")) {carregarTelaPersonagens(personagensEncontrados)};

    })
    .catch(function (erroCarregarTela) {
      console.log(
        "Algo deu errado em carregas as informações da dashboard. Erro: ",
        erroCarregarTela,
      );
    });
}

function carregarDashboard(objetoDashboard) {
  console.log(objetoDashboard);
  document.getElementById("qntUsuarios").textContent =
    objetoDashboard.qntUsuarios;
  document.getElementById("qntHistorias").textContent =
    objetoDashboard.qntHistorias;
  document.getElementById("qntPersonagens").textContent =
    objetoDashboard.qntPersonagens;
  document.getElementById("qntQuizesConcluidos").textContent =
    objetoDashboard.qntQuizesConcluidos;
  objetoDashboard.top3MelhorAvaliadas.forEach(function (avaliado) {
    divCardAvaliados.innerHTML += `
                              <div class="item">
                            <img src=".${avaliado.bannerHistoria}" class="imgItem" alt="">
                            <span class="textoCard">${avaliado.tituloHistoria}</span>
                            <div class="colunaAvaliacao">
                                <span class="textoCard">${avaliado.notaHistoria}</span>
                                <span class="textoAvaliacoes">Avaliações:${avaliado.qntAvaliacoes}</span>
                            </div>
                        </div>`;
  });
  const ctx = document.getElementById("graficoTipo");
  const tipos = [
    `${objetoDashboard.favoritosPorTipo[0].tipoHistoria}`,
    `${objetoDashboard.favoritosPorTipo[1].tipoHistoria}`,
    `${objetoDashboard.favoritosPorTipo[2].tipoHistoria}`,
  ];
  const favoritos = [
    objetoDashboard.favoritosPorTipo[0].qntAvaliacoes,
    objetoDashboard.favoritosPorTipo[1].qntAvaliacoes,
    objetoDashboard.favoritosPorTipo[2].qntAvaliacoes,
  ];
  Chart.defaults.font.family = "Inter, sans-serif";
  Chart.defaults.color = "#9aa5b1";
  new Chart(ctx, {
    type: "bar",
    data: {
      labels: tipos,
      datasets: [
        {
          label: "Favoritados",
          data: favoritos,
          backgroundColor: ["#c62839", "#3a6ea5", "#9aa5b1"],
          borderRadius: 8,
        },
      ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: { display: false },
        tooltip: {
          backgroundColor: "#0b0b0d",
          borderColor: "#23364d",
          borderWidth: 1,
          padding: 12,
        },
      },
      scales: {
        x: {
          grid: { display: false },
          ticks: { color: "#f2f4f7", font: { size: 14 } },
        },
        y: {
          beginAtZero: true,
          grid: { color: "#23364d" },
        },
      },
    },
  });
  objetoDashboard.personagensFavoritados.forEach(function (personagem) {
    divPersonagensFavoritados.innerHTML += `
        <div class="itemFavoritos">
        <img src=".${personagem.bannerPersonagem}" class="imgItem" alt="">
        <span class="textoCard">${personagem.nomePersonagem}</span>
        <span class="textoAvaliacoes">${personagem.qntFavoritos} favoritos</span>

        </div>`;
  });
}

function carregarTelaUsuarios(usuarios){
    let usuariosEncontrados = usuarios;

    usuariosEncontrados.forEach(function (usuario){
        listaUsuarios.innerHTML += `
        <div class="linhaItem">
        <div class="celula colNome">
        <span class="avatarUsuario">
        <svg viewBox="0 0 24 24" aria-hidden="true">
        <circle cx="12" cy="8" r="4" fill="#0b0b0d"></circle>
        <path d="M4 20c0-4 3.6-6 8-6s8 2 8 6" fill="#0b0b0d"></path>
        </svg>
        </span>
        <span class="nomeLinha">${usuario.nomeUsuario}</span>
        </div>
        <div class="celula colEmail">${usuario.emailUsuario}</div>
        <div class="celula colDetalhes">
        <a class="botaoDetalhes" href="#">Detalhes</a>
        </div>
        </div>`
    })
}


function carregarTelasHistorias(historias){
    let historiasEncontradas = historias;

    historiasEncontradas.forEach(function (historia){
        console.log(historia);
        listaHistorias.innerHTML += `
                        <div class="linhaItem">
                            <div class="celula colNome">
                                <img class="thumbLinha" src=".${historia.bannerHistoria}">
                                <span class="nomeLinha">${historia.tituloHistoria}</span>
                            </div>
                            <div class="celula colTipo">
                                <span class="badgeTipo">${historia.tipoHistoria}</span>
                            </div>
                            <div class="celula colNota">${historia.notaHistoria}</div>
                            <div class="celula colDetalhes">
                                <a class="botaoDetalhes" href="#">Detalhes</a>
                            </div>
                        </div>`
    })
}

function carregarTelaPersonagens(personagens){
    let personagensEncontrados = personagens;
    personagensEncontrados.forEach(function (personagem){
        listaPersonagens.innerHTML += `                       
                            <div class="linhaItem">
                            <div class="celula colNome">
                                <img class="thumbLinha" src=".${personagem.bannerPersonagem}">
                                <span class="nomeLinha">${personagem.nomePersonagem}</span>
                            </div>
                            <div class="celula colCategoria">${personagem.categoriaPersonagem}</div>
                            <div class="celula colDetalhes">
                                <a class="botaoDetalhes" href="#">Detalhes</a>
                            </div>
                        </div>`
    })
}

puxarInformacoesDashboard();
