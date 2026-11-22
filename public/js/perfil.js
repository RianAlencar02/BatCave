const botoesAba = document.querySelectorAll(".botaoAba");
const paineisAba = document.querySelectorAll(".abaPerfil");

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
