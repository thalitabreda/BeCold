var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrarUsu", function (req, res) {
    usuarioController.cadastrarUsu(req, res);
})
router.post("/cadastrarMetr", function (req, res) {
    usuarioController.cadastrarMetr(req, res);
})


router.post("/acharfk", function (req, res) {
    usuarioController.acharfk(req, res);
})

router.post("/cadastrarEnd", function (req, res) {
    usuarioController.cadastrarEnd(req, res);
})
router.post("/fkClienteEndereco", function (req, res) {
    usuarioController.fkClienteEndereco(req, res);
})
router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

module.exports = router;