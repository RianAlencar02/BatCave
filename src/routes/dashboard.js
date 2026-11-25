var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");
var historiasController = require("../controllers/historiaController");
var quizController = require("../controllers/quizController");
var personagemController = require("../controllers/personagemController");

router.post("/logarAdm", (req, res) =>
  usuarioController.logarAdm(req, res),
);


router.get("/personagensMaisFavoritados", function (req, res) {
  personagemController.personagensMaisFavoritados(req, res);
});

router.get("/top3MelhorAvaliadas", function (req, res) {
  historiasController.top3MelhoresAvaliadas(req, res);
});

router.get("/contarHistorias", function (req, res) {
  historiasController.contarHistorias(req, res);
});

router.get("/favoritosPorTipo", function (req, res) {
  historiasController.favoritosPorTipo(req, res);
});

router.get("/contarQuizesConcluidos", function (req, res) {
  quizController.contarQuizesConcluidos(req, res);
});

router.get("/contarUsuarios", function (req, res) {
  usuarioController.contarUsuarios(req, res);
});


router.get("/contarPersonagens", function (req, res) {
  personagemController.contarPersonagens(req, res);
});

router.get("/selecionarTodosUsuarios", function (req, res) {
  usuarioController.selecionarTodosUsuarios(req, res);
});

router.get("/selecionarTodasHistorias", function (req, res) {
  historiasController.selecionarTodasHistorias(req, res);
});

router.get("/selecionarTodosPersonagens", function (req, res) {
  personagemController.selecionarTodosPersonagens(req, res);
});
 
module.exports = router;
