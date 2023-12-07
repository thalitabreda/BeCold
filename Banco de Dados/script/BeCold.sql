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
SELECT * FROM registros limit 2000 ; 


update sensor set idSensor = '5' where idsensor = '7'; 
select * from sensor;

insert into sensor values 
(null, '01-SetorB', '2');

select max(registros.temperatura) as maior_temp, registros.fkSensor as sensores, sensor.nomesensor from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '1' and registros.horario >= now() - INTERVAL 1 HOUR group by sensores order by maior_temp desc limit 1;


select setor.idsetor, registros.temperatura, setor.temperaturamin from registros join sensor on idsensor = fksensor join 
setor on fksetor = idsetor where temperatura < temperaturamin;

select temperaturamax, temperaturamin, umidademin, umidademax from setor where idsetor = '1';



select setor.idsetor, MAX(time (registros.horario)) as hora, registros.fksensor, MAX(registros.temperatura), setor.temperaturamax from registros join 
sensor on idsensor = fksensor join setor on fksetor = idsetor where temperatura > temperaturamax and idsetor = '1' 
group by registros.fksensor order by hora desc;

select setor.idsetor, setor.fkclientesetor, registros.umidade, setor.umidademax from registros join sensor
 on idsensor = fksensor join setor on fksetor = idsetor where umidade > umidademax limit 1000;

select setor.idsetor, setor.fkclientesetor, registros.umidade, setor.umidademin from registros join sensor on idsensor = fksensor join
setor on fksetor = idsetor where umidade < umidademin;


insert into sensor values 
(4, '01-SetorA', 3);


insert into sensor values 
(null, '2023-12-02', 'Tatuapé', 3);

insert into registros values
(null, RAND()*81, RAND()*100, now()-interval 10 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 9 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 8 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 7 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 6 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 5 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 4 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 3 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 2 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now()-interval 1 MINUTE, '1'),
(null,  RAND()*81, RAND()*100, now(), '2'),
(null,  RAND()*81, RAND()*100, now()-interval 10 MINUTE, '2'),
(null,  RAND()*81, RAND()*100,now()-interval 9 MINUTE, '2'),
(null,  RAND()*81, RAND()*100, now()-interval 8 MINUTE, '2'),
(null,  RAND()*81,RAND()*100, now()-interval 7 MINUTE, '2'),
(null,  RAND()*81,RAND()*100, now()-interval 6 MINUTE, '2'),
(null,  RAND()*81, RAND()*100,now()-interval 5 MINUTE, '2'),
(null,  RAND()*81, RAND()*100,now()-interval 4 MINUTE, '2'),
(null,  RAND()*81, RAND()*100,now()-interval 3 MINUTE, '2'),
(null,  RAND()*81,RAND()*100,now()-interval 2 MINUTE, '2'),
(null,  RAND()*81, RAND()*100,now()-interval 1 MINUTE, '2'),
(null,  RAND()*81, RAND()*100, now(), '2'),
(null,  RAND()*81, RAND()*100, now()-interval 10 MINUTE, '3'),
(null,  RAND()*81, RAND()*100,now()-interval 9 MINUTE, '3'),
(null,  RAND()*81, RAND()*100, now()-interval 8 MINUTE, '3'),
(null, RAND()*81, RAND()*100, now()-interval 7 MINUTE, '3'),
(null,  RAND()*81, RAND()*100, now()-interval 6 MINUTE, '3'),
(null,  RAND()*81, RAND()*100,now()-interval 5 MINUTE, '3'),
(null,  RAND()*81, RAND()*100,now()-interval 4 MINUTE, '3'),
(null,  RAND()*81, RAND()*100,now()-interval 3 MINUTE, '3'),
(null,  RAND()*81, RAND()*100,now()-interval 2 MINUTE, '3'),
(null, RAND()*81,RAND()*100,now()-interval 1 MINUTE, '3'),
(null,  RAND()*81, RAND()*100, now(), '3');


insert into registros values
(null, RAND()*81, RAND()*100, now()-interval 10 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 9 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 8 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 7 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 6 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 5 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 4 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 3 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 2 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now()-interval 1 MINUTE, '5'),
(null,  RAND()*81, RAND()*100, now(), '5');
insert into registros values 
(null,  (RAND()*20)+20, (RAND()*20)+20, now(), '5');
(null,  RAND()*81, RAND()*100, now(), '2'),
(null,  RAND()*81, RAND()*100, now(), '3'),
(null,  RAND()*81, RAND()*100, now(), '4');

select time(horario) as hora, temperatura from registros where fksensor = '8' order by hora desc limit 11;

truncate table registros;

select * from sensor where fkSetor = '3';

select max(registros.temperatura) as maior_temp, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '3' and registros.horario >= SYSDATE() - INTERVAL 1 HOUR group by sensores order by maior_temp desc ;

select min(registros.temperatura) as menor_temp, registros.fkSensor as sensores from registros join sensor on registros.fksensor=sensor.idsensor join setor on sensor.fksetor = setor.idsetor where fksetor = '3' and registros.horario >= SYSDATE() - INTERVAL 1 HOUR group by sensores order by menor_temp limit 1;

select time(horario) as hora, temperatura from registros where fksensor = '4' and horario>=now()-interval 10 minute order by hora desc Limit 10;

select time(horario) as hora, temperatura from registros where fksensor = '7' and horario>=now()-interval 10 minute order by hora;


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

insert into sensor values
(null, '01-SetorA', 1);

insert into sensor values
(null, '02-SetorA', 1),
(null, '03-SetorA', 1);

CREATE TABLE Registros ( 
idRegistro INT AUTO_INCREMENT, 
Temperatura decimal (10,2),
Umidade decimal (10,2),
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