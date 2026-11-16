var database = require("../database/config");

function cadastrar(nomeUsuario, emailUsuario, senhaUsuario) {
  // Preparando a query para criar um usuário.
  let querySQL = `INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario) VALUES ('${nomeUsuario}', '${emailUsuario}', '${senhaUsuario}');`;
  console.log("Executando a query de inserção: \n" + querySQL);
  return database.executar(querySQL);
}

function logar(emailUsuario, senhaUsuario) {
  // Preparando a query para logar.
  let querySQL = `SELECT idUsuario, nomeUsuario, emailUsuario FROM usuario WHERE emailUsuario = '${emailUsuario}' AND senhaUsuario = '${senhaUsuario}'`;
  console.log("Executando a query de login (SELECT): \n" + querySQL);
  return database.executar(querySQL);
}

module.exports = {
  cadastrar,
  logar
};
