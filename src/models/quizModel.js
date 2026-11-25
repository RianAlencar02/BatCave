var database = require("../database/config");

function buscarPerguntas(tipo, idHistoriaOuPersonagem) {
  // Preparando a query para criar um usuário.
  if (tipo == "historia") {
    let querySQL = `SELECT q.idQuiz, p.idPergunta, p.textoPergunta FROM pergunta AS p JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkHistoria = ${idHistoriaOuPersonagem} ORDER BY p.idPergunta`;
    console.log(
      "Executando a query de buscar as perguntas de uma história: \n" +
        querySQL,
    );
    return database.executar(querySQL);
  } else {
    let querySQL = `SELECT  q.idQuiz, p.idPergunta, p.textoPergunta FROM pergunta AS p JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkPersonagem = ${idHistoriaOuPersonagem} ORDER BY p.idPergunta ASC`;
    console.log(
      "Executando a query de buscar as perguntas de um personagem: \n" +
        querySQL,
    );
    return database.executar(querySQL);
  }
}

function buscarAlternativas(tipo, idHistoriaOuPersonagem) {
  if (tipo == "historia") {
    let querySQL = `SELECT a.fkPergunta, a.idAlternativa, a.textoAlternativa, a.alternativaCorreta FROM alternativa AS a
    INNER JOIN pergunta AS p ON p.idPergunta = a.fkPergunta
    INNER JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkHistoria = ${idHistoriaOuPersonagem}
    ORDER BY a.fkPergunta ASC;`;
    console.log(
      "Executando a query de buscar as alternativas de um quiz: \n" + querySQL,
    );
    return database.executar(querySQL);
  } else {
    let querySQL = `SELECT a.fkPergunta, a.idAlternativa, a.textoAlternativa, a.alternativaCorreta FROM alternativa AS a
    INNER JOIN pergunta AS p ON p.idPergunta = a.fkPergunta
    INNER JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkPersonagem = ${idHistoriaOuPersonagem}
    ORDER BY a.fkPergunta ASC;`;
    console.log(
      "Executando a query de buscar as alternativas de um quiz: \n" + querySQL,
    );
    return database.executar(querySQL);
  }
}

function contarQuizesConcluidos(){
    let querySQL = `SELECT COUNT(idTentativa) AS qntQuizesConcluidos FROM tentativa;`;
    return database.executar(querySQL);
  
}
module.exports = {
  buscarPerguntas,
  buscarAlternativas,
  contarQuizesConcluidos
};
