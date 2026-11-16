let idUsuarioLogado = sessionStorage.getItem("idUsuario");
let nomeUsuarioLogado = sessionStorage.getItem("nomeUsuario");
if (idUsuarioLogado) {
  console.log(idUsuarioLogado);
  console.log(nomeUsuarioLogado);

  deslogado.style.display = "none";
  logado.style.display = "flex";
  nomeUsuario.innerHTML += `${nomeUsuarioLogado}`;
}
