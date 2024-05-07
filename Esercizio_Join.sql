# E' un'operazione che combina le colonne di più tabelle.
# Si utilizza per mettere in relazione ed estrarre record da tabelle diverse.
# Esistono vari tipi di join, ognuno dei quali può essere schematizzato attraverso un'operazione insiemistica.
# Il legame tra due tabelle viene solitamente definito tramite una relazione logica, che nel linguaggio SQL è espressa attraverso una foreign-key.

CREATE TABLE cd (
	titolo VARCHAR (25) PRIMARY KEY,
    anno VARCHAR (4),
    tipo VARCHAR (15),
    costo INT (2)
);

CREATE TABLE canzone (
	titolo VARCHAR (25) PRIMARY KEY,
    cantante VARCHAR (25),
    durata INT (3)
);

INSERT INTO cd VALUES
	('Albachiara', 			1987, 	'italiano', 	15),
	('Emozioni', 			1985, 	'italiano', 	12),
	('Raccolta', 			2000, 	'misto', 		null),
	('Murmur', 				1992, 	'straniero',	14),
	('UP', 					2000, 	'straniero', 	17),
	('Pensieri, emozioni', 	1996, 	'italiano', 	22);

INSERT INTO canzone VALUES
	('Emozioni', 	'Battisti', 	220),
	('Albachiara', 	'Vasco', 		300),
	('La strega', 	'Vasco', 		245),
	('Catapult', 	'REM', 			235),
	('Lotus', 		'REM', 			290),
	('Hope', 		'REM', 			278);

CREATE TABLE cd_contiene (
	titolo_cd VARCHAR (25),
    titolo_canzone VARCHAR (25),
    PRIMARY KEY (titolo_cd, titolo_canzone),
    CONSTRAINT fk_titolo_cd FOREIGN KEY (titolo_cd) REFERENCES cd(titolo),
    CONSTRAINT fk_titolo_canzone FOREIGN KEY (titolo_canzone) REFERENCES canzone(titolo)
);

INSERT INTO CD_CONTIENE VALUES
	('Emozioni', 			'Emozioni'),
	('Raccolta', 			'Albachiara'),
	('Albachiara', 			'Albachiara'),
	('Albachiara', 			'La strega'),
	('Murmur', 				'Catapult'),
	('Raccolta', 			'Catapult'),
	('UP', 					'Lotus'),
	('UP', 					'Hope'),
	('Pensieri, emozioni', 	'Emozioni');

# 1) [qry07] tutte le informazioni dei cd che costano meno di 15euro.
SELECT * 
FROM cd
WHERE costo < 15;

# 2) [qry08] il titolo dei cd che contengono canzoni dei REM.
SELECT *
FROM cd_contiene
INNER JOIN canzone ON canzone.titolo = cd_contiene.titolo_canzone
INNER JOIN cd ON cd.titolo = cd_contiene.titolo_cd
WHERE canzone.cantante LIKE "REM";
    
# 3) [qry09] le informazioni relative ai cd che contengono la canzone “Albachiara”.
# cdc -> cd_contiene
# canzone -> ca
SELECT *
FROM cd_contiene cdc
INNER JOIN cd ON cd.titolo = cdc.titolo_cd
INNER JOIN canzone ca ON ca.titolo = cdc.titolo_canzone
WHERE cdc.titolo_canzone LIKE "Albachiara";

# 4) [qry10] la durata totale di tutte le canzoni contenute nel cd dal titolo “Albachiara”.
SELECT SUM(ca.durata) durata_totale
FROM cd_contiene cdc
INNER JOIN canzone ca ON ca.titolo = cdc.titolo_canzone
INNER JOIN cd ON cd.titolo = cdc.titolo_cd
WHERE cdc.titolo_cd = "Albachiara";

# 5) [qry11] il titolo e la durata di tutti i cd, ordinando in modo decrescente la durata.
SELECT cd.titolo, SUM(ca.durata) durata_cd
FROM cd_contiene cdc
INNER JOIN canzone ca ON ca.titolo = cdc.titolo_canzone
INNER JOIN cd ON cd.titolo = cdc.titolo_cd
GROUP BY cd.titolo
ORDER BY durata_cd DESC;

# 6) [qry12] il titolo dei cd che contengono sia canzoni di Vasco che dei REM. - Dovrebbe restituire Raccolta
SELECT DISTINCT cdc.titolo_cd
FROM cd_contiene cdc
INNER JOIN cd ON cd.titolo = cdc.titolo_cd
INNER JOIN canzone ca ON ca.titolo = cdc.titolo_canzone
WHERE ca.cantante IN ("Vasco", "REM");

# 7) [qry13] Seleziona il titolo delle canzoni che sono contenute in diversi cd. - Dovrebbe restituire Emozioni, Albachiara, Catapult,
SELECT cdc.titolo_canzone
FROM cd_contiene cdc
INNER JOIN canzone ca ON ca.titolo = cdc.titolo_canzone
INNER JOIN cd ON cd.titolo = cdc.titolo_cd
GROUP BY ca.titolo
HAVING COUNT(*) > 1;

# [qry14] Aumentare del 15% il costo dei cd stranieri.
UPDATE cd
SET costo = costo * 1.15
WHERE tipo LIKE "straniero";

# Costruire una tabella cdItaliani (titolo, anno) senza definire chiavi esterne [qry15].
CREATE TABLE cdItaliani (
	titolo VARCHAR (25) PRIMARY KEY,
    anno VARCHAR (4)
);

# [qry16] Aggiungere alla tabella l’attributo costo.
ALTER TABLE cdItaliani
ADD costo INT (2);

# [qry17] E popolarla attraverso l’utilizzo di una query che seleziona tutte leinformazioni necessarie relative ai cd di tipo italiano. 
INSERT INTO cdItaliani (titolo, anno, costo) 
	SELECT titolo, anno, costo FROM cd WHERE tipo = "italiano";

# [qry18] Infine, cancellare della tabella i cd con prezzo inferiore di 14.
DELETE FROM cdItaliani
WHERE costo < 14;