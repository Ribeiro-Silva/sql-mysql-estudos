CREATE DATABASE fornecedor;

use fornecedor;

create table fornecedor (
	id_for 			int not null,
    razao_social 	char(50),
    telefone 		numeric(11),
	constraint pk_id_for primary key (id_for)
);

create table categoria_produto (
	id_catp int not null,
    nome 	varchar(20),
	constraint pk_id_catp primary key (id_catp)
);

create table produto (
	id_pro 			int not null,
    nome 			varchar(100),
    descricao 		varchar(100),
    cod_fornecedor 	int,
    cod_categoria 	int,
	constraint pk_id_pro primary key (id_pro),
	constraint fk_id_for foreign key (cod_fornecedor) references fornecedor (id_for),
    constraint fk_id_catp foreign key (cod_categoria) references categoria_produto (id_catp)
);

insert into fornecedor values 
(1, 'Doceria Sonho Doce Eireli', 11912345678),
(2, 'Padaria Mar Morto', 11912437821),
(3, 'Restaunte Aldente', 11921451678),
(4, 'Água mineral ltda', 11922776541);


insert into categoria_produto values 
(1, 'Doce'),
(2, 'Salgado'),
(3, 'Bebida'),
(4, 'Massa');

insert into produto values 
(1, 'bolo de chocholate', 'bolo de 1kg de chocolate', 1, 1),
(2, 'espaguete', 'macarão de espaguete', 3, 4),
(3, 'pão de queijo', 'pacote pão de queijo congelado', 2, 2),
(4, 'torta de limão', 'torta holandesa de limão', 1, 1),
(5, 'água com gás', 'engradado de água com gás', 4, 3),
(6, 'massa de sorvete', "5l de massa de sorvete para milk shake", 1, 3);

select * from fornecedor;
select * from categoria_produto;
select * from produto;

drop table produtos;
