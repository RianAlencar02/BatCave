var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

// Recebendo um id para ir atrás das questões daquela historia ou personagem
router.get(`/buscarPerguntas/:tipo/:idHistoriaOuPersonagem`, function (req, res) {
    quizController.buscarPerguntas(req, res);
})

router.get(`/buscarAlternativas/:tipo/:idHistoriaOuPersonagem`, function (req, res) {
    quizController.buscarAlternativas(req, res);
})


module.exports = router;  