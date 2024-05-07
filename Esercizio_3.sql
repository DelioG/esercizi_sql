############## DDL DATABASE DEFINITION LANGUAGE ###########################

#creare una tabella con i suoi attributi
#UNICA PER TUTTE LE RIGHE DELLA TABELLA #QUESTA COLONNA NON PUO' AVERE VALORE NULL
CREATE TABLE Autore (
id_autore INT Primary Key AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL UNIQUE,
cognome VARCHAR(50) NOT NULL,
eta INT,
data_nascita DATETIME,
CONSTRAINT check_eta CHECK (eta > 18),
CONSTRAINT check_nome CHECK ( LENGTH(nome) >2 )
);

CREATE TABLE Libro (
id_libro INT PRIMARY KEY AUTO_INCREMENT,
titolo VARCHAR(100),
genere VARCHAR(50),
id_autore INT,
CONSTRAINT fk_libro_autore FOREIGN KEY (id_autore) REFERENCES Autore(id_autore)
);

ALTER TABLE Libro
ADD CONSTRAINT fk_libro_autore FOREIGN KEY (id_autore) REFERENCES Autore(id_autore);


CREATE TABLE Lbro_Autore(
id_libro_autore int PRIMARY KEY AUTO_INCREMENT,
id_libro int,
id_autore int,
FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
FOREIGN KEY (id_autore) REFERENCES Autore(id_autore)
);


#eliminare una tabella
DROP TABLE persona;

#aggiungere vincolo "constraint" dopo l'avvenuta creazione della tabella
ALTER TABLE anagrafica
ADD CONSTRAINT check_cognome CHECK (LENGTH(cognome) >2);

ALTER TABLE anagrafica
ADD CONSTRAINT check_eta CHECK (eta > 18);

#rimuovere vincolo "constraint"
ALTER TABLE anagrafica
DROP CONSTRAINT check_eta;

#aggiungere colonna
ALTER TABLE anagrafica
ADD COLUMN indirizzo VARCHAR(100);

#cancellare colonna
ALTER TABLE anagrafica
DROP COLUMN indirizzo;

#modificare tipo colonna esistente
ALTER TABLE anagrafica
MODIFY COLUMN indirizzo INT;

#rinominare colonna esistente
ALTER TABLE anagrafica
RENAME COLUMN indirizzo TO conto_corrente;

#rinominare la tabella
ALTER TABLE anagrafica
RENAME TO persona;

############## DML DATABASE MANIPULATION LANGUAGE (CRUD) ###########################

#inserire valori nella tabella specificando gli attributi (se ne vogliamo inserire solo alcuni valori)
INSERT INTO Autore (nome, cognome, eta)
VALUES ("mattia", "iovine", 28);

#inserire valori nella tabella NON specificando gli attributi (ma siamo costretti a mettere tutti i valori)
INSERT INTO Autore
VALUES (null, "luca", "palumbo", 32, '1995-04-04 12:13:53');

#SELECT mi mostra il valore delle colonne che specifico nella SELECT dalla tabella nel FROM
SELECT nome, cognome
FROM autore;

# "star" * indica TUTTE le colonne
SELECT *
FROM autore;

#DISTINCT serve per restituire i record senza duplicati
SELECT DISTINCT cognome
FROM Autore ;

#l'alias AS serve per dare un soprannome alle tabelle o alle colonne
#se lo metto nella SELECT andrà a modificare il nome della colonna durante l'output
#se lo metto per la tabella è buona norma utilizzare alias_tabella.nome_colonna anche nella SELECT
SELECT a.nome AS nome_Persona
FROM autore AS a;

#la "funzione/metodo" CONCAT() serve per "attaccare" una dopo l'altra delle stringhe
SELECT CONCAT("nome: ", nome, " cognome: ", cognome) AS Anagrafica_Persona
FROM autore;

#la clausola WHERE serve per filtrare ulteriormente i risultati della SELECT con condizioni booleane
#e permette l'utilizzo di AND, OR, NOT
SELECT nome, cognome
FROM autore
WHERE cognome = "palumbo";

SELECT nome, cognome
FROM autore
WHERE cognome = "palumbo" AND nome = "luca";

SELECT CONCAT("nome: ", a.nome, " cognome: ", a.cognome) AS anagrafica_Persona
FROM autore AS a
WHERE a.cognome = "palumbo" AND a.nome = "luca";

SELECT CONCAT("nome: ", a.nome, " cognome: ", a.cognome) AS anagrafica_Persona
FROM autore AS a
WHERE a.cognome = "palumbo" OR a.cognome = "iovine";

SELECT nome, eta
FROM autore
WHERE eta > 28 AND eta < 40;

#BETWEEN indica un "range" tra il quale prendere un valore (possibilmente numerico)
SELECT eta
FROM autore
WHERE eta BETWEEN 18 AND 34;

#LIKE serve per cercare una stringa (varchar) può utilizzare il simbolo % come "jolly per uno o più caratteri"
SELECT matricola
FROM studente
WHERE matricola LIKE 'NA46%';

#il simbolo _ indica che ci deve essere UN CARATTERE (per ogni _ ) ma con qualsiasi valore
SELECT nome
FROM autore
WHERE nome LIKE 'm__tti_a';