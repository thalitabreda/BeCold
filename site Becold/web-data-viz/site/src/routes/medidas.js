var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.post("/maxtemp", function (req, res) {
    medidaController.maxtemp(req, res);
});

router.post("/mintemp", function (req, res) {
    medidaController.mintemp(req, res);
});

router.post("/minumi", function (req, res) {
    medidaController.minumi(req, res);
});

router.post("/maxumi", function (req, res) {
    medidaController.maxumi(req, res);
});


router.get("/ultimas/:idSetor", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idSetor", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;