CREATE DATABASE db_livraria;

USE db_livraria;

CREATE TABLE cliente (
	id_cli 		int primary key,
    nome_cli 	varchar(100) not null,
    tel_cli		numeric(11) not null
);

CREATE TABLE pedido (
	id_ped		int primary key,
    livro_ped	varchar(20) not null,
    data_pedido date,
    status_ped 	boolean,
    id_cli		int references cliente(id_cli)
);

CREATE TABLE estoque (
	id_est 				int primary key,
    livroTitulo_est 	varchar(20) not null,
	livroAutor_est 		varchar(20) not null,
	qtde_est	int
);

CREATE TABLE livro(
	id_liv		int primary key,
    titulo_liv	varchar(20) not null,
    data_liv	date,
    autor_liv	varchar(20),
    valor_liv	numeric(7,2),
    id_est 		int references estoque(id_est)
);


CREATE TABLE item_pedido (
	id_ped		int primary key,
    id_liv 		int references livro(id_liv),
    id_cli		int references cliente(id_cli)
);

CREATE TABLE nota_fiscal (
	id_not				int primary key,
    data_not			date,
    valor_total_not		numeric(7,2),
    status_not			boolean
);

CREATE TABLE pagamento (
	id_pag 		int primary key,
    id_not	 	int references nota_fiscal(id_not),
    tipo_pag 	varchar(20),
    data_pag	date,
    valor_pag	numeric(7,2)
);

CREATE TABLE nota_pag (
	id_nota_pag 	int primary key,
    id_not 			int references nota_fiscal(id_not),
    id_pag 			int references pagamento(id_pag)
);