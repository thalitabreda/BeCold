CREATE DATABASE Becold;
USE Becold;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
Empresa VARCHAR(50),
CNPJ Char(14) UNIQUE,
Email VARCHAR(45),
senha VARCHAR(45));

select * from cliente;
select * from endereço;
SELECT * FROM setor;

CREATE TABLE endereço(
idEndereco int primary key auto_increment,
estadoSigla char(3),
cidade varchar(30),
bairro varchar(30),
rua varchar(30),
cep char (8),
numero varchar (10),
completo varchar(30),
fkClienteEndereço int,
constraint fkClienteEndereço foreign key (fkClienteEndereço)
references Cliente (idCliente)
);


CREATE TABLE setor(
idSetor int primary key auto_increment,
nomeSetor varchar(25),
temperaturaMax decimal (4,2),
temperaturaMin decimal (4,2),
umidadeMax decimal (4,2),
umidadeMin decimal (4,2),
fkClienteSetor int,
constraint fkClienteSetor foreign key (fkClienteSetor)
	references cliente (idCliente)
);

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR(45),
fkSetor INT,
CONSTRAINT FKSetor FOREIGN KEY (fkSetor)
	REFERENCES Setor (idSetor)
);

CREATE TABLE Registros ( 
idRegistro INT AUTO_INCREMENT, 
Temperatura VARCHAR(5),
Umidade VARCHAR(5),
Horario DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT,
primary key(idRegistro, fkSensor),
	CONSTRAINT FK_Sensor FOREIGN KEY (fkSensor) 
    REFERENCES Sensor(idSensor)
);

INSERT INTO cliente VALUES
	(null, 'teste', '12345678910121', 'teste@gmail.com', 'teste1234');
    
INSERT INTO endereço VALUES
	(null, 'AB', 'Testelandia', 'Testelandia', 'Testelandia', "12345678", 'Testelandia', 1);

INSERT INTO setor VALUES
	(null, 'Testelandia', 20.6, 50.5, 30.4, 40.3, 1, 1);
    
INSERT INTO Sensor VALUES
	(null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1),
    (null, '2023-04-04', "Testelandia", 1);
    

SELECT * FROM Sensor;
SELECT * FROM registros;

-- select * from Cliente join Sensor on fkCliente = idCliente;
-- select * from Sensor join Registros on fkSensor = idSensor;


SELECT idcliente from Cliente where  empresa = 'wedfghjk' and cnpj = 'sdfghj' and email = 'asdfghjk' and senha = 'asdfghjk';