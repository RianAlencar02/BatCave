const botoesAba = document.querySelectorAll(".botaoAba");
const paineisAba = document.querySelectorAll(".abaPerfil");
let idUsuario = sessionStorage.getItem("idUsuario");

if(!idUsuario){
  console.log("ERRO! Você não deveria conseguir ver esta tela ao menos que esteja logado. idUsuario encontrado: ", idUsuario)
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

function puxarInformacoesUsuario (){
  
}
