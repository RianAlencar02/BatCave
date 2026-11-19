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

function favoritar(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `INSERT INTO personagensFavoritados (fkUsuario, fkPersonagem) VALUES (${idUsuario}, ${idFavoritado})`;
    console.log("Executando a query de favoritar um personagem: \n" + querySQL);
    return database.executar(querySQL);
  } else {
    let querySQL = `INSERT INTO historiasFavoritadas (fkUsuario, fkHistoria) VALUES (${idUsuario}, ${idFavoritado})`;
    console.log( tipo + "Executando a query de favoritar uma história: \n" + querySQL);
    return database.executar(querySQL);
  }
}

function removerFavorito(idUsuario, tipo, idFavoritado){
    if (tipo == "personagem") {
    let querySQL = `DELETE FROM personagensFavoritados WHERE fkUsuario = ${idUsuario} AND fkPersonagem = ${idFavoritado};`;
    console.log("Executando a query de remover um personagem favoritado: \n" + querySQL);
    return database.executar(querySQL);
  } else {
    let querySQL = `DELETE FROM historiasFavoritadas WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idFavoritado};`;
    console.log( tipo + "Executando a query de favoritar uma história: \n" + querySQL);
    return database.executar(querySQL);
  }
}

function verificarFavoritado(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `SELECT 1 FROM personagensFavoritados WHERE fkUsuario = ${idUsuario} AND fkPersonagem = ${idFavoritado}`;
    return database.executar(querySQL);
  } else {
    let querySQL = `SELECT 1 FROM historiasFavoritadas WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idFavoritado}`;
    return database.executar(querySQL);
  }
}

module.exports = {
  cadastrar,
  logar,
  favoritar,
  verificarFavoritado,
  removerFavorito
};
