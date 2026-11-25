var quizModel = require("../models/quizModel");

function buscarPerguntas(req, res) {
  let tipo = req.params.tipo;
  let idHistoriaOuPersonagem = Number(req.params.idHistoriaOuPersonagem);

  if (
    (tipo != "historia" && tipo != "personagem") ||
    !Number.isInteger(idHistoriaOuPersonagem)
  ) {
    return res.status(400).send("Parâmetros inválidos.");
  }
  quizModel
    .buscarPerguntas(tipo, idHistoriaOuPersonagem)
    .then(function (resultado) {
      console.log("Perguntas encontradas: ", resultado);
      res.status(200).json(resultado);
    })
    .catch(function (erro) {
      console.log("Erro ao buscar perguntas:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    });
}

function contarQuizesConcluidos(req, res) {
  quizModel
    .contarQuizesConcluidos()
    .then(function (resultado) {
      res.status(200).json(resultado[0]);
    })
    .catch(function (erro) {
      console.log("Erro ao contar quizes concluidos:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    });
}

function buscarAlternativas(req, res) {
  let tipo = req.params.tipo;
  let idHistoriaOuPersonagem = Number(req.params.idHistoriaOuPersonagem);

  if (
    (tipo != "historia" && tipo != "personagem") ||
    !Number.isInteger(idHistoriaOuPersonagem)
  ) {
    return res.status(400).send("Parâmetros inválidos.");
  }
  quizModel
    .buscarAlternativas(tipo, idHistoriaOuPersonagem)
    .then(function (resultado) {
      console.log("Alternativas encontradas: ", resultado);
      res.status(200).json(resultado);
    })
    .catch(function (erro) {
      console.log("Erro ao buscar alternativas:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
  buscarPerguntas,
  buscarAlternativas,
  contarQuizesConcluidos
};
