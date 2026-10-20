CREATE DATABASE  DB_CONDOMINIO;
USE DB_CONDOMINIO;

CREATE TABLE Edificio (
	id_edi 		int not null,
    edereco 	varchar(150)
);

CREATE TABLE Apartamento (
	id_apa 		int not null,
    numero	 	int,
    area		varchar(10),
    id_edi		int
);

ALTER TABLE Edificio
	ADD CONSTRAINT pk_id_edi PRIMARY KEY (id_edi);

ALTER TABLE Apartamento
	ADD CONSTRAINT pk_id_apa PRIMARY KEY (id_apa);

ALTER TABLE Apartamento
	ADD CONSTRAINT fk_id_edi
    FOREIGN KEY (id_edi) REFERENCES Edificio(id_edi);

INSERT INTO Edificio values
(1, "Rua dos maribondos, 187"),
(2, "Rua das abelhas, 781"),
(3, "Rua das moscas, 871");

INSERT INTO Apartamento values
(1, 23, "80m²", 3),
(2, 37, "120m²", 1),
(3, 15, "200m²", 1);

DELETE from Apartamento;

Delete from Edificio where id_edi = 1;
