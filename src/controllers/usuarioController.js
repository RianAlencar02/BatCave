var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
  let nomeUsuario = req.body.nomeUsuarioServer;
  let emailUsuario = req.body.emailUsuarioServer;
  let senhaUsuario = req.body.senhaUsuarioServer;

  if (!nomeUsuario) {
    res.status(400).send("O nome está vazio (undefined).");
  } else if (!emailUsuario) {
    res.status(400).send("O email está vazio (undefined).");
  } else if (!senhaUsuario) {
    res.status(400).send("A senha está vazia (undefined).");
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

module.exports = {
  cadastrar,
};
