CREATE DATABASE Becold;
USE Becold;
drop database Becold;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
Empresa VARCHAR(50),
CNPJ Char(14) UNIQUE,
Email VARCHAR(45),
senha VARCHAR(10));

desc Cliente;

CREATE TABLE endereço(
idEndereco int primary key auto_increment,
estadoSigla char(3),
cidade varchar(30),
bairro varchar(30),
rua varchar(30),
cep char (8),
completo varchar(30),
fkClienteEndereço int,
constraint fkClienteEndereço foreign key (fkClienteEndereço)
references Cliente (idCliente)
)auto_increment = 10;


desc endereço;

CREATE TABLE setor(
idSetor int primary key auto_increment,
nomeSetor varchar(25),
temperaturaMax decimal (4,2),
temperaturaMin decimal (4,2),
umidadeMax decimal (4,2),
umiadeMin decimal (4,2),
fkEndereco int,
fkClienteSetor int,
constraint fkEndereco foreign key (fkEndereco)
	references endereço(idEndereco),
constraint fkClienteSetor foreign key (fkClienteSetor)
	references cliente (idCliente)
)auto_increment = 200;

desc setor;


CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
DiaInstalado DATE,
Localização VARCHAR(45),
fkSetor INT,
CONSTRAINT FKSetor FOREIGN KEY (fkSetor)
	REFERENCES Setor (idSetor)
)auto_increment = 100;

desc Sensor;


CREATE TABLE Registros ( 
idRegistro INT AUTO_INCREMENT, 
Temperatura VARCHAR(5),
Umidade VARCHAR(5),
Horario DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT,
primary key(idRegistro, fkSensor),
	CONSTRAINT FK_Sensor FOREIGN KEY (fkSensor) 
    REFERENCES Sensor(idSensor)
)auto_increment = 300;

desc Registros;

-- select * from Cliente join Sensor on fkCliente = idCliente;
-- select * from Sensor join Registros on fkSensor = idSensor;