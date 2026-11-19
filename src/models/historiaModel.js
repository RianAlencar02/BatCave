var database = require("../database/config");

function buscarHistorias() {
  // Preparando a query para criar um usuário.
  let querySQL = `SELECT * FROM historia;`;
  console.log("Executando a query para buscar todas as historias: \n" + querySQL);
  return database.executar(querySQL);
}

function buscarHistoriaEspecifica(idHistoria) {
  // Preparando a query para logar.
  let querySQL = `SELECT h.*, comenEditor.textoComentarioEditor FROM historia AS h LEFT JOIN comentarioEditor AS comenEditor ON comenEditor.fkHistoria = h.idHistoria WHERE idHistoria = ${idHistoria};`;
  return database.executar(querySQL);
}

module.exports = {
  buscarHistorias,
  buscarHistoriaEspecifica
};
