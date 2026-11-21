var database = require("../database/config");

function buscarPerguntas(tipo, idHistoriaOuPersonagem) {
  // Preparando a query para criar um usuário.
  if(tipo == 'historia'){
    let querySQL = `SELECT p.idPergunta, p.textoPergunta FROM pergunta AS p JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkHistoria = ${idHistoriaOuPersonagem} `;
    console.log("Executando a query de buscar as perguntas de uma história: \n" + querySQL);
    return database.executar(querySQL);
  }
  else{
    let querySQL = `SELECT p.idPergunta, p.textoPergunta FROM pergunta AS p JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkPersonagem = ${idHistoriaOuPersonagem} `;
    console.log("Executando a query de buscar as perguntas de um personagem: \n" + querySQL);
    return database.executar(querySQL);
  }
}

function buscarAlternativas(idQuiz){
    let querySQL = `SELECT a.idAlternativa, a.textoAlternativa FROM alternativa AS a
    INNER JOIN pergunta AS p ON p.idPergunta = a.fkPergunta
    WHERE p.fkQuiz = ${idQuiz}
    ORDER BY a.fkPergunta;`
    console.log("Executando a query de buscar as alternativas de um quiz: \n" + querySQL);
    return database.executar(querySQL);
}

module.exports = {
  buscarPerguntas,
  buscarAlternativas
};
