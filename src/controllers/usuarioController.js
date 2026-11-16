var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
  let nomeUsuario = req.body.nomeUsuarioServer;
  let emailUsuario = req.body.emailUsuarioServer;
  let senhaUsuario = req.body.senhaUsuarioServer;

  if (!nomeUsuario) {
    res
      .status(400)
      .send(
        "O nome está undefined. Verifique o passo a passo até chegar aqui.",
      );
  } else if (!emailUsuario) {
    res
      .status(400)
      .send(
        "O e-mail está undefined. Verifique o passo a passo até chegar aqui.",
      );
  } else if (!senhaUsuario) {
    res
      .status(400)
      .send(
        "A senha está undefined. Verifique o passo a passo até chegar aqui.",
      );
  } else {
    usuarioModel
      .cadastrar(nomeUsuario, emailUsuario, senhaUsuario)
      .then(function (resultado) {
        // Aqui, o resultado é preparado para ser enviado de volta ao scriptCadastro
        res.json(resultado);
      })
      .catch(function (erro) {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage,
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

function logar(req, res) {
  let emailUsuario = req.body.emailUsuarioServer;
  let senhaUsuario = req.body.senhaUsuarioServer;

  if (!emailUsuario) {
    res
      .status(400)
      .send(
        "O e-mail está undefined. Verifique o passo a passo até chegar aqui.",
      );
  } else if (!senhaUsuario) {
    res
      .status(400)
      .send(
        "A senha está undefined. Verifique o passo a passo até chegar aqui.",
      );
  } else {
    usuarioModel
      .logar(emailUsuario, senhaUsuario)
      .then(function (resultadoLogin) {
        console.log(`\nResultados encontrados: ${resultadoLogin.length}`);
        console.log(`De JSON para String: ${JSON.stringify(resultadoLogin)}`);
        if (resultadoLogin.length == 1) {
          console.log(`Login encontrado:${resultadoLogin}`);
          console.log(`Login encontrado:${resultadoLogin}`);

          res.json({
            idUsuario: resultadoLogin[0].idUsuario,
            nomeUsuario: resultadoLogin[0].nomeUsuario,
            emailUsuario: resultadoLogin[0].emailUsuario,
            senhaUsuario: resultadoLogin[0].senhaUsuario,
          });
        } else if (resultadoLogin == 0) {
          res
            .status(403)
            .send("E-mail e/ou senha incorretos. Verifique novamente.");
        } else {
          res.status(403).send("Mais de um usuário com o mesmo login e senha!");
        }
      })
      .catch(function (erro) {
        console.log(erro);
        console.log(
          "Houve um erro ao tentar realizar o login! Erro: ",
          erro.sqlMessage,
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  cadastrar,
  logar,
};
