# SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE TABLE Dipendenti (
	dipcod INT (2) NOT NULL,
    dipnome VARCHAR (20),
    replav VARCHAR (4),
    attivita VARCHAR (8),
    stipendio INT (10),
    provvigione INT (10)
);

INSERT INTO Dipendenti (dipcod, dipnome, replav, attivita, stipendio, provvigione) VALUES 
	(10, "Rossi", "R1", "RAPPR", 2000000, 1000000),
    (20, "Bianchi", "R2", "IMPIEGAT", 1500000, null),
	(30, "Rossi", "R1", "MGR", 3000000, 2000000),
    (40, "Rossini", "R2", "PROGRAMM", 1500000, null),
    (50, "Rossetti", "R3", "RAPPR", 1500000, 500000),
    (60, "Verdi", "R3", "MGR", 4000000, 1000000);

CREATE TABLE Reparti (
	replav VARCHAR (4) NOT NULL,
    repdes VARCHAR (20),
    repstaff INT (3),
    repmgr INT (2)
);

INSERT INTO Reparti (replav, repdes, repstaff, repmgr) VALUES
	("R1", "VENDITE", 10, 30),
    ("R2", "CONTAB", 20, 60),
    ("R3", "PRODUZ", 50, 60);

CREATE TABLE Ordini (
	numord INT (3) NOT NULL,
    dataord DATE,
    codcli INT (3)
);

#yyyy-mm-dd
INSERT INTO Ordini (numord, dataord, codcli) VALUES
	(121, "1997-01-01", 426),
    (122, "1997-01-08", 427),
    (123, "1997-01-12", 422),
    (124, "1997-01-18", 426),
    (125, "1997-02-03", 427),
    (126, "1997-02-05", 426),
    (127, "1997-03-01", 427),
    (128, "1997-03-08", 427),
    (129, "1997-03-10", 426),
    (130, "1997-03-12", 430),
    (131, "1997-03-19", 428);

CREATE TABLE Righeord (
	numord INT (3) NOT NULL,
    numriga INT (1),
    prodcod INT (3),
    qtaord INT (3)
);

INSERT INTO Righeord (numord, numriga, prodcod, qtaord) VALUES
	(121, 1, 50, 300),
	(121, 2, 51, 250),
    (121, 3, 52, 175),
    (122, 1, 50, 300),
    (122, 2, 53, 220),
    (123, 1, 54, 145),
    (124, 1, 50, 300),
    (124, 2, 53, 220),
    (124, 3, 54, 145),
    (125, 1, 55, 210),
    (126, 1, 56, 205),
    (127, 1, 57, 185),
    (128, 1, 53, 220),
    (128, 2, 54, 145),
    (129, 1, 58, 190),
    (130, 1, 50, 300),
    (130, 2, 51, 250),
    (130, 3, 52, 175);
    
CREATE TABLE Prodotti (
	prodcod INT (2) NOT NULL,
    prodes VARCHAR (25),
    produm CHAR (2),
    prezzo INT (5)
);

INSERT INTO Prodotti (prodcod, prodes, produm, prezzo) VALUES
	(50, "Blatte Fritte", "DZ", 150),
    (51, "Bulloni 35 mm.", "KG", 120),
    (52, "Chiodi di garofano", "KG", 230),
    (53, "Coleotteri amianto", "DZ", 750),
    (54, "Caramelle acciaio", "KG", 1000),
    (55, "Ceffoni metallici", "DZ", 320),
    (56, "Spille di gomma", "KG", 600),
    (57, "Carciofi finti", "DZ", 350),
    (58, "Asparagi da guerra", "KG", 500),
    (59, "Spillatrici avariate", "DZ", 325);

# FINE DELLA CREAZIONE DELLE TABELLE E DEGLI INSERT
# INZIO ESERCIZI

# 1. VISUALIZZARE TUTTE LE INFORMAZIONI DI TUTTI I PRODOTTI.
SELECT *
FROM prodotti;

# 2. VISUALIZZARE TUTTE LE INFORMAZIONI DI TUTTI I REPARTI.
SELECT *
FROM reparti;

# 3. VISUALIZZARE TUTTE LE INFORMAZIONI DI TUTTI I DIPENDENTI.
SELECT *
FROM dipendenti;

# 4. VISUALIZZARE TUTTE LE INFORMAZIONI DI TUTTI GLI ORDINI.
SELECT *
FROM ordini;

# 5. VISUALIZZARE NUMORD , DATAORD DELLA TABELLA ORDINI.
SELECT numord, dataord
FROM ordini;

# 6. VISUALIZZARE TUTTI I PRODOTTI DELLA TABELLA PRODOTTI CON IL PREZZO > 400.
SELECT *
FROM prodotti
WHERE prezzo > 400;

# 7. VISUALIZZARE DALLA TABELLA RIGHEORD SOLO GLI ORDINI N° 130 E SOLO LE COLONNE PRODCOD E QTAORD.
SELECT prodcod, qtaord
FROM RIGHEORD
WHERE numord = 130;

# 8. VISUALIZZARE IL CODICE E LA DESCRIZIONE DI TUTTI I REPARTI.
SELECT replav, repdes
FROM reparti;

# 9. VISUALIZZARE IL NOME ED IL GUADAGNO TOTALE(STIPENDIO+PROVVIGIONI) DI TUTTI I DIPENDENTI.
SELECT dipnome, CONCAT("STIPENDIO: [", stipendio, "] PROVVIGIONI: [", provvigione, "]", " GUADAGNO TOTALE: [", stipendio + provvigione ,"]") AS guadagno_totale
FROM dipendenti;

# 10.VISUALIZZARE TUTTE LE INFORMAZIONI DI TUTTI I DIPENDENTI SENZA PROVIGGIONE.
SELECT *
FROM dipendenti
WHERE provvigione IS NULL;

# 11.VISUALIZZARE IL NOME ED IL GUADAGNO TOTALE DI TUTTI I DIPENDENTI CON LE PROVVIGIONI.
SELECT dipnome, CONCAT("GUADAGNO TOTALE: [", stipendio + provvigione ,"]") AS guadagno_totale
FROM dipendenti
WHERE provvigione IS NOT NULL;

# IFNULL(STIPENDIO,0)+IFNULL(PROVVIGIONE,0) AS GUADAGNO_TOTALE

# 12.VISUALIZZARE IL NOME ED IL GUADAGNO TOTALE DI TUTTI I DIPENDENTI CON LE PROVVIGIONI E CHE HANNO LO STIPENDIO > 2.000.000.
SELECT dipnome,  CONCAT("GUADAGNO TOTALE: [", stipendio + provvigione ,"]") AS guadagno_totale
FROM dipendenti
WHERE stipendio > 2000000;

# 13.VISUALIZZARE IL NOME, IL CODICE ED IL REPLAV DEI DIPENDENTI IL CUI NOME INIZI CON ‘VER’.
SELECT dipnome, dipcod, replav
FROM dipendenti
WHERE dipnome LIKE "VER%";

# 14.VISUALIZZARE TUTTI I DIPENDENTI CHE LAVORANO NEI REPARTI R1 E R2 IL CUI STIPENDIO E’ >1.000.000.
SELECT *
FROM dipendenti
WHERE replav = "R1" OR replav = "R2" 
	  AND stipendio > 1000000;

# 15.VISUALIZZARE TUTTI I DIPENDENTI IN ORDINE DECRESCENTE DI REPARTO.
SELECT *
FROM dipendenti
ORDER BY replav DESC;

# 16.VISUALIZZARE TUTTI I DIPENDENTI ORDINANDO PER PROVVIGIONE ASCENDENTE E NOME DECRESCENTE.
SELECT *
FROM dipendenti
ORDER BY provvigione ASC, dipnome DESC;

# 17.VISUALIZZARE IL NOME E L’ATTIVITA DEI DIPENDENTI CHE HANNO UNO STIPENDIO COMPRESO TRA 1000000 E 3000000 ORDINANDO IN ORDINE DECRESCENTE DI STIPENDIO.
SELECT dipnome, attivita
FROM dipendenti
WHERE stipendio > 1000000 AND stipendio < 3000000
ORDER BY stipendio DESC;

# 18.VISUALIZZARE SOLO I DIPENDENTI PROGRAMMATORI E IMPIEGATI.
SELECT *
FROM dipendenti
WHERE attivita LIKE "PROGRAMM" OR attivita LIKE "IMPIEGAT";

# 19.VISUALIZZARE I PRODOTTI LA CUI DESCRIZIONE CONTIENE LA STRINGA ‘DI’.
SELECT *
FROM prodotti
WHERE prodes LIKE "%di%";

# 20.VISUALIZZARE IL CODICE E IL PREZZO DEI PRODOTTI CHE HANNO UN PREZZO COMPRESO TRA 150 E 400 E IL PRODUM =’DZ’, ORDINANDO IN ORDINE CRESCENTE DI PREZZO.
SELECT prodcod, prezzo
FROM prodotti
WHERE prezzo > 150 AND prezzo < 400
	  AND produm = "DZ"
ORDER BY prezzo ASC;

# 1) dalla tabella dipendenti, visualizzare lo stipendio medio;
SELECT AVG(stipendio) AS stipendio_medio
FROM dipendenti;

# 2) visualizzare lo stipendio medio per ogni reparto;
SELECT DISTINCT replav, AVG(stipendio) AS stipendio_medio
FROM dipendenti
GROUP BY replav;

# 3) visualizzare lo stipendio medio per i reparti R1 e R2;
SELECT DISTINCT replav, AVG(stipendio) AS stipendio_medio
FROM dipendenti
WHERE replav LIKE "R1" OR replav LIKE "R2"
GROUP BY replav;

# 4) visualizzare il codice del reparto e la media degli stipendi, solo dei reparti che hanno uno stipendio medio >= 2000000;
SELECT replav, AVG(stipendio) AS stipendio_medio
FROM dipendenti
GROUP BY replav HAVING stipendio_medio >= 2000000;

# 5) dalla tabella prodotti, visualizzare il prodotto più costoso e il meno costoso
SELECT MIN(prezzo) AS meno_costoso, MAX(prezzo) AS piu_costoso
FROM prodotti;

# 1) visualizzare il numero di dipendenti per ogni reparto, ordinati per stipendio
SELECT replav, COUNT(dipcod) AS numero_dipendenti
FROM dipendenti
GROUP BY replav
ORDER BY stipendio;

SELECT replav, COUNT(*), stipendio
FROM dipendenti
GROUP BY replav, stipendio
ORDER BY stipendio, replav;

# 2) visualizzare il numero di prodotti presente per ogni unità di misura
SELECT produm, COUNT(DISTINCT prodcod) AS numero_prodotti
FROM prodotti
GROUP BY produm;

# 3) visualizzare il prezzo medio dei prodotti misurati in KG;
SELECT AVG(prezzo) AS prezzo_medio
FROM prodotti
WHERE produm LIKE "KG";

# 4) dalla tabella righeord, visualizzare il numero di ordini effettuati per ogni codice prodotto
SELECT prodcod, COUNT(prodcod) as ordini_effettuati
FROM righeord
GROUP BY prodcod;

# 5) dalla tabella righeord, visualizzare il numero di ordini effettuati per ogni codice prodotto con almeno 2 ordini
SELECT prodcod, COUNT(prodcod) AS ordini_effettuati
FROM righeord
GROUP BY prodcod HAVING ordini_effettuati >= 2;