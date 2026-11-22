var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

// Recebendo um id para ir atrás das questões daquele
router.get(`/buscarPerguntas/:tipo/:idHistoriaOuPersonagem`, function (req, res) {
    quizController.buscarPerguntas(req, res);
})


module.exports = router;  