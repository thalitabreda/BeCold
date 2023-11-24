var usuarioModel = require("../models/usuarioModel");
var setorModel = require("../models/setorModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        setorModel.buscarSetoresPorEmpresa(resultadoAutenticar[0].idCliente)
                            .then((resultadoSetores) => {
                                if (resultadoSetores.length > 0) {
                                    res.json({
                                        id: resultadoAutenticar[0].id,
                                        email: resultadoAutenticar[0].email,
                                        nome: resultadoAutenticar[0].nome,
                                        senha: resultadoAutenticar[0].senha,
                                        setores: resultadoSetores
                                    });
                                } else {
                                    res.status(204).json({ setores: [] });
                                }
                            })
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function fkClienteEndereco(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var cep = req.body.cepServer;
    var numero = req.body.numeroServer;
    var rua = req.body.ruaServer;
    var bairro = req.body.bairroServer;


    // Faça as validações dos valores
    if (cep == undefined) {
        res.status(400).send("Seu cep está undefined!");
    } else if (numero == undefined) {
        res.status(400).send("Seu numero está undefined!");
    } else if (rua == undefined) {
        res.status(400).send("Sua rua está undefined!");
    }else if (bairro == undefined) {
        res.status(400).send("Seu está undefined!");
    }else{

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarEnd( cep, numero, rua, bairro)
            .then(
                function (resultadobuscarclientefk) {
                    console.log(`\nResultados encontrados: ${resultadobuscarclientefk.length}`);
                    console.log(`Resultados:${JSON.stringify(resultadobuscarclientefk)}`);
                    if (resultadobuscarclientefk == 1) {
                        console.log(resultadobuscarclientefk);
                        res.json({id: resultadobuscarclientefk[0].idEndereço,});
                    }else if(resultadobuscarclientefk.length == 0){
                        res.status(403).send("Enderenço invalido");
                    }else{
                        res.status(403).send("Mais de um usuário com os mesmo endereço!");
                    }
                        
                    
                    
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao buscar o id do endereço! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}
function cadastrarEnd(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var cep = req.body.cepServer;
    var numero = req.body.numeroServer;
    var complemento = req.body.complementoServer;
    var rua = req.body.ruaServer;
    var bairro = req.body.bairroServer;
    var cidade = req.body.cidadeServer;
    var sigla = req.body.siglaServer;
    var fkcliente = req.body.fkclienteServer

    // Faça as validações dos valores
    if (cep == undefined) {
        res.status(400).send("Seu cep está undefined!");
    } else if (numero == undefined) {
        res.status(400).send("Seu numero está undefined!");
    } else if (complemento == undefined) {
        res.status(400).send("Seu complemento está undefined!");
    } else if (rua == undefined) {
        res.status(400).send("Sua rua está undefined!");
    }else if (bairro == undefined) {
        res.status(400).send("Seu está undefined!");
    }else if (cidade == undefined) {
        res.status(400).send("Sua cidade está undefined!");
    }else if (sigla == undefined) {
        res.status(400).send("Sua sigla de estado está undefined!");
    }else if (fkcliente == undefined) {
        res.status(400).send("Sua fkcliente está undefined!");
    }
    else{

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarendereço(sigla, cidade, bairro, rua, cep, numero, complemento, fkcliente)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro do endereço! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


function cadastrarMetr(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nomeSetor = req.body.nomeSetorServer;
    var temperaturaMax = req.body.temperaturaMaxServer;
    var temperaturaMin = req.body.temperaturaMinServer;
    var umidadeMax = req.body.umidadeMaxServer;
    var umidadeMin = req.body.umidadeMinServer;
    var fkClienteSetor = req.body.fkClienteSetorServer;


    // Faça as validações dos valores


        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarmetricas(nomeSetor, temperaturaMax, temperaturaMin, umidadeMax, umidadeMin, fkClienteSetor
            )
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro das métricas! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

function cadastrarUsu(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var empresa = req.body.empresaServer;
    var cnpj = req.body.cnpjServer;

    // Faça as validações dos valores
    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (empresa == undefined) {
        res.status(400).send("Sua empresa está undefined!");
    } else if (cnpj == undefined) {
        res.status(400).send("Seu cnpj está undefined!");
    }else{

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarUsuario(empresa, cnpj, email, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function acharfk(req, res) {
    var empresa = req.body.empresaServer
    var cnpj = req.body.cnpjServer
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    }
    else if (empresa == undefined) {
        res.status(400).send("Sua empresa está indefinida!");
    }
    else if (cnpj == undefined) {
        res.status(400).send("Seu cnpj está indefinido!");
    } else {

        usuarioModel.buscarfk(empresa, cnpj, email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                                    res.json({
                                        id: resultadoAutenticar[0].idcliente,

                                    });

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Usuário não encontrado");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao buscar a fk! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

module.exports = {
    autenticar,
    cadastrarUsu,
    cadastrarEnd,
    fkClienteEndereco, 
    acharfk,
    cadastrarMetr
}