var express = require("express");
var router = express.Router();

var historiaController = require("../controllers/historiaController");

// Criando uma rota para buscar todas as histórias
router.get("/", function (req, res) {
    historiaController.buscarHistorias(req, res);
})

// Rota onde, quando um idHistoria é passado, os dados de uma história em especifico é buscado no banco.
router.get("/detalhesHistoria/:idHistoria", function(req, res) {
    historiaController.buscarHistoriaEspecifica(req, res);
})

module.exports = router;  