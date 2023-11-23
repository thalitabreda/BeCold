var setorModel = require("../models/setorModel");

function buscarSetoresPorEmpresa(req, res) {
  var idCliente = req.params.idCliente;

  setorModel.buscarSetoresPorEmpresa(idCliente).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os aquarios: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function cadastrar(req, res) {
  var nomeSetor = req.body.nomeSetor;
  var idCliente = req.body.idCliente;

  if (descricao == undefined) {
    res.status(400).send("nomeSensor está undefined!");
  } else if (idUsuario == undefined) {
    res.status(400).send("idCliente está undefined!");
  } else {


    sensorModel.cadastrar(nomeSetor, idCliente)
      .then((resultado) => {
        res.status(201).json(resultado);
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  buscarSetoresPorEmpresa,
  cadastrar
}