create database db_AgenciaAerea;

use db_AgenciaAerea;

create table clientes(
	cod_cli 	int,
    nome		varchar(40),
    cpf			varchar(11) unique,
    rua 		varchar(30),
    num 		varchar(10),
    bairro 		varchar(30),
    cidade 		varchar(35),
    uf			varchar(2),
    cep			varchar(8),
    Constraint pk_cliente primary key (cod_cli)
);

create table passagem (
	num 			int,
    valor 			numeric(5,2) not null,
    poltrona 		int not null,
    data_ccompra 	date,
    tipo_cartao 	int,
    num_cartao		varchar(30) not null,
    cod_cli			int,
    Constraint	pk_passagem primary key (num),
    Constraint	fk_passagem_cli	foreign key (cod_cli) references clientes(cod_cli)
);

create table rota (
	num_voo			varchar(30),
    rota			varchar(30) not null,
    num_passagem 	int,
    Constraint pk_rota primary key (num_voo),
    Constraint fk_rota_pass foreign key (num_passagem) references passagem(num)
);

INSERT INTO clientes (cod_cli, nome, cpf, rua, num, bairro, cidade, uf, cep) VALUES
(1, 'João Silva', '12345678901', 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01001000'),
(2, 'Maria Oliveira', '23456789012', 'Rua B', '200', 'Jardins', 'Rio de Janeiro', 'RJ', '20020000'),
(3, 'Carlos Souza', '34567890123', 'Av. C', '350', 'Paulista', 'Belo Horizonte', 'MG', '30130000'),
(4, 'Ana Paula Lima', '45678901234', 'Rua D', '45', 'Centro', 'Porto Alegre', 'RS', '90010000'),
(5, 'Pedro Santos', '56789012345', 'Rua E', '78', 'Moinhos', 'Curitiba', 'PR', '80020000');

INSERT INTO passagem (num, valor, poltrona, data_ccompra, tipo_cartao, num_cartao, cod_cli) VALUES
(101, 450, 12, '2024-03-15', 1, '11112', 1),
(102, 780, 25, '2024-03-20', 2, '555566', 2),
(103, 320, 8, '2024-04-01', 1, '99990', 3),
(104, 120, 45, '2024-04-05', 3, '33334', 4),
(105, 600, 18, '2024-04-10', 2, '77778', 5);

INSERT INTO rota (num_voo, rota, num_passagem) VALUES
('AA1001', 'São Paulo - Rio de Janeiro', 101),
('AA1002', 'Rio de Janeiro - Brasília', 102),
('AA1003', 'Belo Horizonte - Salvador', 103),
('AA1004', 'Porto Alegre - Curitiba', 104),
('AA1005', 'Curitiba - São Paulo', 105);

-- SELEÇÃO ESPECÍFICA:
-- 1. Selecione todos os códigos dos clientes que contém o nome EDUARDO.
select cod_cli
from clientes
where nome like '%EDUARDO%';

-- 2.Selecione todos os clientes com o código maior ou igual a 2.
select *
from clientes
where cod_cli >= 2;

-- 3.Selecione o número do voo de todas as rotas que contenham São Paulo.
select num_voo
from rota
where rota like '%São Paulo%';

-- 4.Selecionetodos os clientes que moram no estado de SP ou na ‘Rua Cecilia'
select *
from clientes
where uf like 'SP'or rua like "Rua Cecilia";

-- SELEÇÃO ESPECÍFICA com ORDENAÇÃO:
-- 5. Selecione o código e o nome dos clientes em ordem crescente pelo nome.
select cod_cli, nome
from clientes
order by nome;

-- 6. Selecione o código e o nome dos clientes em ordem decrescente pelo código
select cod_cli, nome
from clientes
order by cod_cli desc;

-- 7. Selecione todos os clientes que não moram no estado de SP em ordem crescente pelo estado e ordem decrescente pelo nome
select *
from clientes
where uf not like "SP"
order by uf, nome desc;


-- SELEÇÃO ESPECÍFICA COM FAICA DE VALORES E COMPARAÇÃO DE STRINGS
-- 8.Selecione os nomes dos clientes com código entre 2 e 5.
select nome
from clientes
where cod_cli between 2 and 5;

-- 9.Selecione os nomes de clientes que contenham a letra E.
select nome
from clientes
where nome like '%e%' or '%E%'; 

-- 10.Selecione os nomes de clientes que não comecem com a letra G.
select nome
from clientes
where nome not like 'G%' or 'g%'; 

-- 11.Selecione os nomes de estados que comecem com M e tenham qualquer outro caractere depois.
select cidade
from clientes
where cidade like 'M_%' or 'm_%'; 
