var personagemModel = require("../models/personagemModel");

function buscarPersonagensBatman(req, res) {
    // Buscando os Batmans.
    personagemModel.buscarPersonagensBatman().then((resultado) => {
        console.log('Buscando os batmans:', resultado);
        res.status(200).json(resultado);
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

module.exports = {
  buscarPersonagensBatman,
  buscarPersonagensAliados,
  buscarPersonagensViloes,
  buscarPersonagemEspecifico
};
