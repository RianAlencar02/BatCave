// Constantes para o modal de quiz
const abrirModalQuiz = document.getElementById("abrirQuiz");
const iniciarQuiz = document.getElementById("iniciarQuiz");
const modalQuiz = document.getElementById("modalIniciarQuiz");

abrirModalQuiz.addEventListener("click", () => {
  if (!idUsuario) {
    window.location = "login.html";
  } else {
    modalQuiz.showModal();
  }
});

iniciarQuiz.addEventListener("click", () => {
  window.location.href = "telaQuiz.html" + window.location.search;
  });

// Constantes para abrir o modal de avaliação.
const abrirModal = document.getElementById("abrirModalAvaliar");
const fecharModal = document.getElementById("avaliarFechar");
const modal = document.getElementById("modalAvaliacao");

abrirModal.addEventListener("click", () => {
  if (!idUsuario) {
    window.location = "login.html";
  } else {
    modal.showModal();
  }
});

fecharModal.addEventListener("click", () => {
  modal.close();
});
