var database = require("../database/config");

function buscarHistorias() {
  // Preparando a query para criar um usuário.
  let querySQL = `SELECT * FROM historia;`;
  console.log("Executando a query para buscar todas as historias: \n" + querySQL);
  return database.executar(querySQL);
}

function buscarHistoriaEspecifica(idHistoria) {
  // Preparando a query para logar.
  let querySQL = `SELECT * FROM historia WHERE idHistoria = ${idHistoria};`;
  console.log(`Buscando uma história pelo idHistoria ${idHistoria}: \n`, querySQL);
  return database.executar(querySQL);
}

module.exports = {
  buscarHistorias,
  buscarHistoriaEspecifica
};
