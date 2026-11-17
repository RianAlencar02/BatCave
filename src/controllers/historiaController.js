var historiaModel = require("../models/historiaModel");

function buscarHistorias(req, res) {
    // Buscando todas as histórias cadastradas
    historiaModel.buscarHistorias().then((resultado) => {
        console.log('Buscando todas as histórias:', resultado);
        res.status(200).json(resultado);
 });
}

function buscarHistoriaEspecifica(req, res){
    let idHistoria = req.params.idHistoria;

    historiaModel.buscarHistoriaEspecifica(id).then((resultado) => {
        console.log("História encontrada:", resultado);
        res.status(200).json(resultado);
    })
}

module.exports = {
  buscarHistorias,
  buscarHistoriaEspecifica,
};
