var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT id, nome, email, fk_empresa as empresaId FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function cadastrarmetricas(nomeSetor, temperaturaMax, temperaturaMin, umidadeMax, umidadeMin, fkclientesetor) {
    var instrucao =
   ` Insert into setor (nomeSetor, temperaturaMax, temperaturaMin, umidadeMax, umidadeMin, fkclientesetor) VALUES ('${nomeSetor}', '${temperaturaMax}', '${temperaturaMin}', '${umidadeMax}',  '${umidadeMin}', '${fkclientesetor}');`
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}



// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrarendereço(sigla, cidade, bairro, rua, cep, numero, complemento, fkcliente) {
    var instrucao =
   ` Insert into endereço (estadoSigla, cidade, bairro, rua, cep, numero, completo, fkClienteEndereço) VALUES ('${sigla}', '${cidade}', '${bairro}', '${rua}',  '${cep}', '${numero}', '${complemento}', '${fkcliente}');`
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function cadastrarUsuario(empresa, cnpj, email, senha) {
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    Insert into cliente (empresa, cnpj, email, senha) VALUES ('${empresa}', '${cnpj}', '${email}', '${senha}');`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function buscarfk(empresa, cnpj, email, senha) {
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    SELECT idcliente from Cliente where  empresa = '${empresa}' and cnpj = '${cnpj}' and email = '${email}' and senha = '${senha}';`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
module.exports = {
    autenticar,
    cadastrarUsuario,
    buscarfk, 
    cadastrarendereço,
    cadastrarmetricas
};