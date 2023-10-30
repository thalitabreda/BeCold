CREATE DATABASE Becold;
USE Becold;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
Empresa VARCHAR(50),
CNPJ Char(14) UNIQUE,
Email VARCHAR(45),
senha VARCHAR(10),
estadosigla char (2),
cidade varchar (30),
bairro varchar (30),
rua varchar (30),
numero int (10),
cep char (8),
complemento varchar (30)
);

INSERT INTO Cliente VALUES
(null, 'ColdTech', '12345678912345', 'coldtech@hotmail.com', '********', 'SP', 'São Paulo', 'Mooca', 'Avenida Doutor José Higino', 357, '03189040', null),
(null, 'SPTech', '36578024000172', 'sptech@sptech.school', '*********', 'MG', 'Teófilo Otoni', 'Taquara', 'Rua Libertação', 123, '39803600', 'quinto andar'),
(null, 'DataBasers', '98765432101234', 'databasers@gmail.com', '*********', 'RJ', 'Niterói', 'Santa Rosa', 'Rua B', 1200, '24330075', null);

SELECT * FROM Cliente;

CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
DiaInstalado DATE,
Localização VARCHAR(45),
fkCliente INT,
	CONSTRAINT FK_Cliente FOREIGN KEY (fkCliente) REFERENCES Cliente (idCliente)
);

INSERT INTO Sensor VALUES
(null,'2023-09-13', 'Rua Haddock Lobo 595', 1),
(null,'2023-09-14', 'Rua Centro de Dado 372', 3),
(null,'2023-09-15', 'Rua Haddock Lobo 595', 2),
(null, '2023-09-15', 'Rua Centro de Dado 372', 3);

SELECT * FROM Sensor;

CREATE TABLE Registros ( 
idRegistro INT AUTO_INCREMENT, 
Temperatura VARCHAR(5),
Umidade VARCHAR(5),
Horario DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT,
primary key(idRegistro, fkSensor),
	CONSTRAINT FK_Sensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);

INSERT INTO Registros (Temperatura, Umidade, fkSensor) VALUES
(25, 40, 3), 
(27, 52, 3), 
(24, 60, 1), 
(30, 38, 2), 
(20, 29, 4);

SELECT * FROM Registros;

select * from Cliente join Sensor on fkCliente = idCliente;
select * from Sensor join Registros on fkSensor = idSensor;