var historiaModel = require("../models/historiaModel");

function buscarHistorias(req, res) {
    var filtro = req.params.filtro;
    var tipo = req.params.tipo;

    // Buscando todas as histórias cadastradas
    historiaModel.buscarHistorias(filtro, tipo).then((resultado) => {
        console.log('Buscando todas as histórias:', resultado);
        res.status(200).json(resultado);
 }).catch(function (erro) {
      console.log(erro);
      res.status(500).json(erro.sqlMessage);
    });;
}


function contarHistorias(req, res) {
  historiaModel.contarHistorias()
    .then(function (resultado) {
      res.status(200).json(resultado[0]);
    })
    .catch(function (erro) {
      console.log("Erro ao contar histórias:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    });
}
function buscarHistoriaEspecifica(req, res){
    let idHistoria = req.params.idHistoria;
    
    historiaModel.buscarHistoriaEspecifica(idHistoria).then((resultado) => {
        console.log("História encontrada:", resultado);
        res.status(200).json(resultado);
    })
}

function top3MelhoresAvaliadas(req,res){
    historiaModel.top3MelhorAvaliadas().then(function (top3){
        res.status(200).json(top3)
    }).catch(function (erro){
    console.log("Erro ao puxar top 3:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    })
}

function favoritosPorTipo(req,res){
    historiaModel.favoritosPorTipo().then(function (favoritosPorTipo){
        res.status(200).json(favoritosPorTipo)
    }).catch(function (erro){
    console.log("Erro ao puxar favoritos por tipo:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    })
}

function selecionarTodasHistorias(req,res){
      historiaModel.selecionarTodasHistorias().then(function (historiasSelecionadas){
        res.status(200).json(historiasSelecionadas)
    }).catch(function (erro){
    console.log("Erro ao puxar todas as histórias:", erro.sqlMessage || erro);
      res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
  buscarHistorias,
  buscarHistoriaEspecifica,
  contarHistorias,
  top3MelhoresAvaliadas,
  favoritosPorTipo,
  selecionarTodasHistorias
};
