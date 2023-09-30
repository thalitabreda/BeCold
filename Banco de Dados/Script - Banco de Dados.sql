CREATE DATABASE ColdTech;
USE ColdTech;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
Empresa VARCHAR(50),
CNPJ Char(14) UNIQUE,
Email VARCHAR(45),
Telefone VARCHAR(12),
Responsável VARCHAR(50),
Endereço VARCHAR(100)
);

INSERT INTO Cliente VALUES
(null, 'ColdTech', 12345678912345, 'coldtech@hotmail.com', 11987654321, 'Kaiqui', 'Rua Hadddock Lobo 595'),
(null, 'SPTech', 36578024000172, 'sptech@sptech.school', 1135894043, 'Goulart', 'Rua Hadddock Lobo 595'),
(null, 'DataBasers', 98765432101234, 'databasers@gmail.com', 11912345678, 'Murilo', 'Rua Centro de Dado 372');

SELECT * FROM Cliente;




CREATE TABLE Sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
Tipo VARCHAR(23),
DiaInstalado DATE,
Localização VARCHAR(45),
idCliente INT,
	CONSTRAINT FK_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

INSERT INTO Sensor VALUES
(null, 'Temperatura', '2023-09-13', 'Rua Haddock Lobo 595', 1),
(null,  'Umidade', '2023-09-14', 'Rua Centro de Dado 372', 3),
(null, 'Temperatura e Umidade', '2023-09-15', 'Rua Haddock Lobo 595', 2),
(null, 'Temperatura', '2023-09-15', 'Rua Centro de Dado 372', 3);

SELECT * FROM Sensor;
alter table sensor rename column idcliente to Fk_cliente;


CREATE TABLE Registros ( 
idRegistro INT PRIMARY KEY AUTO_INCREMENT, 
Temperatura VARCHAR(5),
Umidade VARCHAR(5),
Horario DATETIME DEFAULT CURRENT_TIMESTAMP,
idSensor INT,
	CONSTRAINT FK_Sensor FOREIGN KEY (idSensor) REFERENCES Sensor(idSensor)
);
alter table registros rename column idsensor to Fk_sensor;

INSERT INTO Registros (Temperatura, Umidade, idSensor) VALUES
(25, 40, 3), 
(27, 52, 3), 
(24, null, 1), 
(null, 38, 2), 
(20, null, 4);


SELECT * FROM Registros;

select * from cliente join sensor on idCliente = Fk_cliente;
select * from sensor join registros on fk_sensor = idsensor;