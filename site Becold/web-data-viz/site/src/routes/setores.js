var express = require("express");
var router = express.Router();

var setorController = require("../controllers/setorController");

router.get("/:idCliente", function (req, res) {
  setorController.buscarSetoresPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  setorController.cadastrar(req, res);
})

module.exports = router;