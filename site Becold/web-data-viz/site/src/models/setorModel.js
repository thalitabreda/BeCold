var database = require("../database/config");

function buscarSetoresPorEmpresa(idCliente) {

  instrucaoSql = `select * from setor where fkClienteSetor = ${idCliente}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(idCliente, nomeSetor) {
  
  instrucaoSql = `insert into (nomeSetor, idCliente) setor values (${nomeSetor}, ${idCliente})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarSetoresPorEmpresa,
  cadastrar
}
