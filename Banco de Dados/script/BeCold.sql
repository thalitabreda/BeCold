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

CREATE TABLE endereco(
idEndereco int primary key auto_increment,
estadoSigla char(3),
cidade varchar(30),
bairro varchar(30),
rua varchar(30),
cep char (8),
completo varchar(30),
fkCliente int,
constraint fkCliente foreign key (fkCliente)
references Cliente (idCliente)
)auto_increment = 10;


desc endereço;


CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
DiaInstalado DATE,
Localização VARCHAR(45),
fkCliente INT,
CONSTRAINT FK_Cliente FOREIGN KEY (fkCliente)
	REFERENCES Cliente (idCliente)
)auto_increment = 100;

desc Sensor;

CREATE TABLE setor(
idSetor int primary key auto_increment,
nomeSetor varchar(25),
andar int,
temperaturaMax decimal (4,2),
temperaturaMin decimal (4,2),
umidadeMax decimal (4,2),
umiadeMin decimal (4,2),
fkEndereco int,
fkCliente int,
constraint fkEndereco foreign key (fkEndereco)
	references endereço(idEndereco),
constraint fkClienteSetor foreign key (fkCliente)
	references cliente (idCliente)
)auto_increment = 200;

desc setor;

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
<<<<<<< HEAD

-- select * from Cliente join Sensor on fkCliente = idCliente;
-- select * from Sensor join Registros on fkSensor = idSensor;


=======

-- select * from Cliente join Sensor on fkCliente = idCliente;
-- select * from Sensor join Registros on fkSensor = idSensor;
>>>>>>> bc29f152b6ab9bedf91ecaa4ae970a4bc93e6981
