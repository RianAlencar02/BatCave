var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

// Aqui, estamos recebendo as informações do HTML e enviando para a function cadastrar de usuarioController
router.get(`/buscarPerguntas/:tipo/:idHistoriaOuPersonagem`, function (req, res) {
    quizController.buscarPerguntas(req, res);
})


module.exports = router;  