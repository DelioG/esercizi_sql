CREATE TABLE anagrafica(
	nome VARCHAR(50),
	cognome VARCHAR(50),
	eta INT,
	data_nascita DATETIME
);

ALTER TABLE anagrafica
ADD COLUMN indirizzo VARCHAR(100);

ALTER TABLE anagrafica
DROP COLUMN indirizzo;

ALTER TABLE anagrafica
MODIFY COLUMN inidrizzo INT;

ALTER TABLE anagrafica
RENAME COLUMN indirizzo TO conto_corrente;

ALTER TABLE anagrafica
RENAME TO persona;