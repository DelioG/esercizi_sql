CREATE TABLE clienti (
	codice_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	cognome VARCHAR(50) NOT NULL,
	eta INT,
    codice_fiscale VARCHAR(16) NOT NULL UNIQUE,
	data_nascita DATETIME NOT NULL,
	salario DOUBLE,
    CONSTRAINT checkEta CHECK (eta > 18),
    CONSTRAINT checkNome CHECK ( length(nome) > 2 )
);

ALTER TABLE clienti
DROP COLUMN data_nascita;

ALTER TABLE clienti
RENAME COLUMN codice_cliente TO id_cliente;