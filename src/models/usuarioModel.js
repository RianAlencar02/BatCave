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
    console.log(
      tipo + "Executando a query de favoritar uma história: \n" + querySQL,
    );
    return database.executar(querySQL);
  }
}

function removerFavorito(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `DELETE FROM personagensFavoritados WHERE fkUsuario = ${idUsuario} AND fkPersonagem = ${idFavoritado};`;
    console.log(
      "Executando a query de remover um personagem favoritado: \n" + querySQL,
    );
    return database.executar(querySQL);
  } else {
    let querySQL = `DELETE FROM historiasFavoritadas WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idFavoritado};`;
    console.log(
      tipo + "Executando a query de favoritar uma história: \n" + querySQL,
    );
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

function avaliar(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `INSERT INTO avaliacaoHistoria (notaAvaliacao, fkUsuario, fkHistoria) VALUES (${notaAvaliacao},${idUsuario}, ${idHistoria})`;
  console.log("Executando query de avaliar uma história.");
  return database.executar(querySQL);
}

function avaliar(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `INSERT INTO avaliacaoHistoria (notaAvaliacao, fkUsuario, fkHistoria) VALUES (${notaAvaliacao},${idUsuario}, ${idHistoria})`;
  console.log("Executando query de avaliar uma história.");
  return database.executar(querySQL);
}

function alterarAvaliacao(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `UPDATE avaliacaoHistoria SET notaAvaliacao = ${notaAvaliacao} WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idHistoria}`;
  console.log("Executando query de alterar uma avaliação.");
  return database.executar(querySQL);
}

function verificarAvaliacao(idUsuario, idHistoria) {
  let querySQL = `SELECT 1 FROM avaliacaoHistoria WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idHistoria}`;
  console.log("Verificando se já avaliou.");
  return database.executar(querySQL);
}

function puxarInformacoesUsuario(idUsuario) {
  let querySQL = `SELECT * FROM usuario WHERE idUsuario = ${idUsuario}`;
  console.log("Executando a query de pegar todas as informações: \n" + querySQL);
  return database.executar(querySQL);
}

function inserirTentativa(pontuacao, idUsuario, idQuiz) {
  let querySQL = `INSERT INTO tentativa (pontuacao, fkUsuario, fkQuiz) VALUES (${pontuacao}, ${idUsuario}, ${idQuiz})`;
  console.log("Executando a query para registrar uma tentativa após o termino do quiz: \n" + querySQL);
  return database.executar(querySQL);
}

function inserirAlternativaEscolhida(idTentativa, idAlternativa) {
  let querySQL = `INSERT INTO alternativaEscolhida (fkTentativa, fkAlternativa) VALUES (${idTentativa}, ${idAlternativa})`;
  console.log("Registrando alternativa escolhida: \n" + querySQL);
  return database.executar(querySQL);
}

module.exports = {
  cadastrar,
  logar,
  favoritar,
  verificarFavoritado,
  removerFavorito,
  avaliar,
  verificarAvaliacao,
  alterarAvaliacao,
  puxarInformacoesUsuario,
  inserirTentativa,
  inserirAlternativaEscolhida
};
