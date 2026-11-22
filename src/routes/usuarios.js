var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

// Aqui, estamos recebendo as informações do HTML e enviando para a function cadastrar de usuarioController
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/logar", function(req, res) {
    usuarioController.logar(req, res)
})

router.post("/favoritar/:tipo", function(req, res){
    usuarioController.favoritar(req, res)
})

router.get("/verificarFavoritado/:tipo/:idFavoritado/:idUsuario", function (req, res) { // get com 3 parametros para verificar se o usuario ja favoritou o item.
  usuarioController.verificarFavoritado(req, res);
});

router.delete("/desfavoritar/:tipo/:idFavoritado/:idUsuario", function (req, res) {
  usuarioController.removerFavorito(req, res);
});

router.post("/avaliar/:notaAvaliacao/:idUsuario/:idHistoria", function (req, res) {
  usuarioController.avaliar(req, res);
});

router.put("/alterarAvaliacao/:notaAvaliacao/:idUsuario/:idHistoria", function (req, res) {
  usuarioController.alterarAvaliacao(req, res);
});
router.get("/verificarAvaliacao/:idUsuario/:idHistoria", function (req, res) {
  usuarioController.verificarAvaliacao(req, res);
});



module.exports = router;  