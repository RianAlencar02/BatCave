var express = require("express");
var router = express.Router();

var personagemController = require("../controllers/personagemController");

// rota para buscar os batmans
router.get("/batmans", function (req, res) {
    personagemController.buscarPersonagensBatman(req, res);
})

// Rota para buscar os personagens aliados
router.get("/aliados", function(req, res) {
    personagemController.buscarPersonagensAliados(req, res);
})

router.get("/viloes", function(req, res) {
    personagemController.buscarPersonagensViloes(req, res);
})

router.get("/detalhesPersonagem/:idPersonagem", function(req,res){
    personagemController.buscarPersonagemEspecifico(req,res);
})

module.exports = router;  