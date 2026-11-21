var quizModel = require("../models/quizModel");

function buscarPerguntas(req, res) {
    let idHistoriaOuPersonagem = req.params.idHistoriaOuPersonagem;
    let tipo = req.params.idHistoriaOuPersonagem;

    quizModel.buscarPerguntas(tipo, idHistoriaOuPersonagem).then((resultado) =>
    {
        console.log("Perguntas encontradas: ", resultado)
        res.status(200).json(resultado);
    })
    
    
}


module.exports = {
    buscarPerguntas
};