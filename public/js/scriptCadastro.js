function cadastrar() {
  let nomeUsuario = inputNome.value;
  let emailUsuario = inputEmail.value;
  let senhaUsuario = inputSenha.value;
  let confirmarSenha = inputConfirmarSenha.value;

  if (nomeUsuario == "") {
    erroNome.innerHTML = "O nome não pode ser vazio.";
    return false;
  } else {
    erroNome.innerHTML = "";
  }

  if (!validarEmail()) {
    return false;
  }

  if (senhaUsuario == "") {
    erroSenha.innerHTML = "A senha não pode estar vazia.";
    return false;
  } else {
    erroSenha.innerHTML = "";
  }

  if (senhaUsuario != confirmarSenha) {
    erroSenha.innerHTML = "As senhas estão diferentes.";
    erroConfirmar.innerHTML = "As senhas estão diferentes.";
    return false;
  } else {
    erroSenha.innerHTML = "";
    erroConfirmar.innerHTML = "";
  }

  fetch("/usuarios/cadastrar", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      // Transformando os valores recuperados em um JSON para enviar ao usuarioController
      nomeUsuarioServer: nomeUsuario,
      emailUsuarioServer: emailUsuario,
      senhaUsuarioServer: senhaUsuario,
    }),
  })
    .then(function (resposta) {
      console.log(resposta); // Aqui, a resposta é o resultado, enviado lá do usuarioController para cá.
      if (resposta.ok) {
        alert(
          "Cadastro realizado com sucesso! Redirecionando para tela de Login...",
        );
        setTimeout(() => {
          window.location = "login.html";
        }, "1000");
      } else {
        throw "Houve um erro ao tentar realizar o cadastro!";
      }
    })
    .catch(function (resposta) {
      console.log(`Erro. Informação do erro: ${resposta}`);
    });
  return false;
}

function validarEmail() {
  let emailUsuario = inputEmail.value.trim(); // trim() serve para tirar espaços desnecessários.
  if (emailUsuario == "") {
    erroEmail.innerHTML = `Insira um e-mail.`;
    return false;
  }

  // Vetor que contém vários caracteres especiais para impedir que um email contenha algo que não possa.
  let caracteresEspeciais = [
    "!",
    "#",
    "$",
    "%",
    "¨",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "=",
    "+",
    "[",
    "]",
    "{",
    "}",
    ";",
    ":",
    "/",
    "?",
    ",",
    "<",
    ">",
    "\\",
    "|",
    "'",
    '"',
    "`",
    "~",
    "^",
  ];
  for (let i = 0; i < caracteresEspeciais.length; i++) {
    if (emailUsuario.includes(caracteresEspeciais[i])) { // Percorrendo o email digitado e verificando cada caracter, comparando com um caracter especial que não é permitido;
      erroEmail.innerHTML = `O únicos caracteres especiais permitidos é @ e .`;
      return false;
    } else if (!emailUsuario.includes("@")) {
      erroEmail.innerHTML = `O e-mail precisa conter @`;
    } else if (!emailUsuario.includes(".")) {
      erroEmail.innerHTML = `O e-mail precisa conter .`;
    } else {
      erroEmail.innerHTML = "";
      return true;
    }
  }
}
