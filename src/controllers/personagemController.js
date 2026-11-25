var personagemModel = require("../models/personagemModel");

function buscarPersonagensBatman(req, res) {
    // Buscando os Batmans.
    personagemModel.buscarPersonagensBatman().then((resultado) => {
        console.log('Buscando os batmans:', resultado);
        res.status(200).json(resultado);
 });
}

function contarPersonagens(req, res) {
  personagemModel.contarPersonagens()
    .then(function (resultado) {
      res.status(200).json(resultado[0]);
    })
    .catch(function (erro) {
      res.status(500).json(erro.sqlMessage);

    });
}


function buscarPersonagensAliados(req, res) {
    // Buscando os aliados e anti-heróis.
    personagemModel.buscarPersonagensAliados().then((resultado) => {
        console.log('Buscando os aliados/anti-heróis:', resultado);
        res.status(200).json(resultado);
 });
}
function buscarPersonagensViloes(req, res) {
    // Buscando os vilões.
    personagemModel.buscarPersonagensViloes().then((resultado) => {
        console.log('Buscando os vilões:', resultado);
        res.status(200).json(resultado);
 });
}

function buscarPersonagemEspecifico(req, res){
    let idPersonagem = req.params.idPersonagem;

    personagemModel.buscarPersonagemEspecifico(idPersonagem).then((resultado) => {
        console.log("Personagem encontrado com o id ", idPersonagem, ": ", resultado);
        res.status(200).json(resultado);
    })
}

function personagensMaisFavoritados(req,res){
    personagemModel.personagensMaisFavoritados().then(function (personagensMaisFavoritados){
        res.status(200).json(personagensMaisFavoritados);
    }).catch(function (erro){
        console.log("Erro ao buscar personagens mais favoritados:", erro.sqlMessage)
      res.status(500).json(erro.sqlMessage);

    })      
}

function selecionarTodosPersonagens(req,res){
    personagemModel.selecionarTodosPersonagens().then(function (personagensEncontrados){
        res.status(200).json(personagensEncontrados);
    }).catch(function (erro){
        console.log("Erro ao buscar todos os personagens:", erro.sqlMessage)
      res.status(500).json(erro.sqlMessage);

    })      
}


module.exports = {
  buscarPersonagensBatman,
  buscarPersonagensAliados,
  buscarPersonagensViloes,
  buscarPersonagemEspecifico,
  contarPersonagens,
  personagensMaisFavoritados,
  selecionarTodosPersonagens
};
