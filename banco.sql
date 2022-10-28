drop database if exists bank;
create database if not exists bank;

use bank;

create table if not exists proprietario(
idproprietario int(3) primary key auto_increment,
nome varchar(30) not null,
email varchar(40) unique,
endereco varchar(100) not null,
nascimento varchar(10) not null
);

create table if not exists gerente(
idgerente int(3) primary key auto_increment,
nome varchar(30) not null,
salario float(3) not null
);

create table if not exists conta(
idconta int(3) primary key auto_increment,
saldo float(5) not null,
datadecriacao varchar(10) not null,
id_proprietario int(3) unique,
id_gerente int(3) unique,
foreign key (id_proprietario) references proprietario(idproprietario),
foreign key (id_gerente) references gerente(idgerente)
);

create table if not exists agencia(
idagencia int(3) primary key auto_increment,
id_conta int(3) unique not null,
endereco varchar(100) not null,
foreign key (id_conta) references conta(idconta)
);

create table if not exists banco(
id_agencia int(3) unique not null,
nome varchar(10),
foreign key(id_agencia) references agencia(idagencia)
);

insert into proprietario values(null, 'Rafaela Gomes', 'RafaGamaral@meucoracao.com', 'chacara santatao', '10/01/2002');
insert into proprietario values(null, 'Tiago Fernandes', 'TiagoFernandesRibeiro@yahoo.com.br', 'PQ. dos passaros', '15/02/1999');

insert into gerente values(null, 'Roger o Gerente', 1000.00);
insert into gerente values(null, 'Dj perera', 2000.00);

insert into conta values(null,10000.00,'27/10/2022',1,1);
insert into conta values(null,10000.00,'28/10/2022',2,2);

insert into agencia values(null,1,'Senac Santo Amaro');

insert into banco values(1,'Java Bank');


desc proprietario;
select * from proprietario;
desc gerente;
select * from gerente;
desc conta;
select * from conta;
desc agencia;
select * from agencia;
desc banco;
select * from banco; 