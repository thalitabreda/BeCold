var express = require("express");
var router = express.Router();

var setorController = require("../controllers/setorController");

router.get("/:idCliente", function (req, res) {
  setorController.buscarSetoresPorEmpresa(req, res);
});

router.get("/limite/:idSetor", function (req, res) {
  setorController.limitesetor(req, res);
});

router.get("/sensores/:idSetor", function (req, res) {
  setorController.buscarSensoresPorSetor(req, res);
});

router.get("/temp/:idSensor", function (req, res) {
  setorController.dadosgraficotemp(req, res);
});

router.get("/umi/:idSensor", function (req, res) {
  setorController.dadosgraficoumi(req, res);
});

router.get("/update/:idSensor", function (req, res) {
  setorController.atualizacaografico(req, res);
});

router.post("/cadastrar", function (req, res) {
  setorController.cadastrar(req, res);
})

module.exports = router;