var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

// Aqui, estamos recebendo as informações do HTML e enviando para a function cadastrar de usuarioController
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

module.exports = router;  