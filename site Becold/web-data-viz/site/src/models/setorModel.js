var database = require("../database/config");

function buscarSetoresPorEmpresa(idCliente) {

  instrucaoSql = `select * from setor where fkClienteSetor = ${idCliente};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarSensoresPorSetor(idSetor) {

  instrucaoSql = `select * from sensor where fkSetor = ${idSetor};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function dadostemperatura(idSensor) {

  instrucaoSql = `select time(horario) as hora, temperatura from registros where fksensor = '${idSensor}' order by hora desc limit 11;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


function dadosumidade(idSensor) {

  instrucaoSql = `select time(horario) as hora, umidade from registros where fksensor = '${idSensor}' order by hora desc limit 11;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(idCliente, nomeSetor) {
  
  instrucaoSql = `insert into (nomeSetor, fkClienteSetor) setor values (${nomeSetor}, ${idCliente})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function atualizargrafico(idSensor) {

  instrucaoSql = `select time(horario) as hora, temperatura, umidade from registros where fksensor = '${idSensor}'  order by hora DESC limit 1;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


function limitetempsuperior (idSetor) {

  instrucaoSql = `select sensor.nomesensor, setor.idsetor, MAX(time (registros.horario)) as hora, registros.fksensor, MAX(registros.temperatura) as maxtemp, setor.temperaturamax from registros join sensor on idsensor = fksensor join setor on fksetor = idsetor where temperatura > temperaturamax and idsetor = ${idSetor} group by registros.fksensor order by hora desc;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}



module.exports = {
  buscarSetoresPorEmpresa,
  cadastrar,
  buscarSensoresPorSetor,
  dadostemperatura,
  dadosumidade,
  atualizargrafico,
  limitetempsuperior
}
