function logar() {
  let emailUsuario = inputEmail.value;
  let senhaUsuario = inputSenha.value;

  if (!emailUsuario) {
    erroEmail.innerHTML = `O email não pode estar vazio.`;
    return false;
  } else {
    erroEmail.innerHTML = ``;
  }

  if (!senhaUsuario) {
    erroSenha.innerHTML = `A senha não pode estar vazia.`;
    return false;
  } else {
    erroSenha.innerHTML = ``;
  }

  fetch("/usuarios/logar", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      // Transformando os valores da input em um JSON para enviar ao usuarioController
      emailUsuarioServer: emailUsuario,
      senhaUsuarioServer: senhaUsuario,
    }),
  })
    .then(function (resposta) {
      console.log("Resposta recebida, function está executando.");
      if (resposta.ok) {
        console.log("Resposta recebida:", resposta);
        resposta.json().then((json) => {
          console.log("JSON atualmente:", json);
          console.log("JSON em texto:", JSON.stringify(json));
          sessionStorage.idUsuario = json.idUsuario; // Salvando as informações recebidas no JSON na sessionStorage
          sessionStorage.nomeUsuario = json.nomeUsuario;
          sessionStorage.emailUsuario = json.emailUsuario;
          alert(
            `Login realizado com sucesso! Seja bem vindo, ${json.nomeUsuario}!`,
          );
          setTimeout(function () {
            // Após o login funcionar, envia para a home.
            window.location = "index.html";
          }, 1000);
        });
      } else {
        resposta.text().then((texto) => {
          alert(texto); // Exibindo mensagem de email ou senha incorretos
          console.error(texto);
        });
      }
    })
    .catch(function (erro) {
      console.log("Erro do catch:", erro);
    });
  return false;
}
