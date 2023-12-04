var database = require("../database/config");

function buscarkpi1 (idsetor) {

    instrucao = `select max(registros.temperatura) as maior_temp, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '${idsetor}' and registros.horario >= now() - INTERVAL 1 HOUR group by sensores order by maior_temp desc limit 1`

    console.log("Executando a instrução SQL: \n", instrucao)
    return database.executar(instrucao)
}

function buscarkpi2 (idsetor) {

    instrucao = `select min(registros.temperatura) as menor_temp, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '${idsetor}' and registros.horario >= now() - INTERVAL 1 HOUR group by sensores order by menor_temp limit 1;`

    console.log("Executando a instrução SQL: \n", instrucao)
    return database.executar(instrucao)
}

function buscarkpi3 (idsetor) {

    instrucao = `select min(registros.umidade) as menor_umi, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '${idsetor}' and registros.horario >= now() - INTERVAL 1 HOUR group by sensores order by menor_umi limit 1;`

    console.log("Executando a instrução SQL: \n", instrucao)
    return database.executar(instrucao)
}

function buscarkpi4(idsetor) {

    instrucao = `select max(registros.umidade) as maior_umi, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '${idsetor}' and registros.horario >= now() - INTERVAL 1 HOUR group by sensores order by maior_umi limit 1;`

    console.log("Executando a instrução SQL: \n", instrucao)
    return database.executar(instrucao)
}

 module.exports = {

    buscarkpi1,
    buscarkpi2,
    buscarkpi3,
    buscarkpi4


}
