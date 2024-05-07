CREATE TABLE marca (
	id INT (3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    brand VARCHAR (25) NOT NULL,
    nazionalita VARCHAR (25) NOT NULL
);

INSERT INTO `marca` (`id`, `brand`, `nazionalita`) VALUES
	(1, 	'SAMSUNG', 		'KR'),
	(2, 	'ACER', 		'KR'),
	(3, 	'AMOI', 		'CH'),
	(4, 	'HTC', 			'KR'),
	(5, 	'APPLE', 		'US'),
	(6, 	'HP', 			'US'),
	(7, 	'LG', 			'KR'),
	(8, 	'SONY', 		'JP'),
	(9, 	'MOTOROLA', 	'US'),
	(10, 	'NOKIA', 		'SW'),
	(11, 	'BLACKBERRY', 	'CA'),
	(12, 	'BBK', 			'CH');
    
CREATE TABLE os (
	id INT (3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    descrizione VARCHAR (25) NOT NULL,
    company VARCHAR (25) NOT NULL,
    open_source INT (1) NOT NULL
);

INSERT INTO `os` (`id`, `descrizione`, `company`, `open_source`) VALUES
	(1, 	'Android', 			'Google', 		1),
	(3, 	'iOS', 				'Apple Inc.', 	0),
	(9, 	'Windows Phone 8', 	'Microsoft', 	0),
	(11, 	'BlackBerry', 		'BlackBerry', 	0);


CREATE TABLE smartphone (
	id INT (3) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR (25) NOT NULL,
    ram  VARCHAR (25) NOT NULL,
    cpuS VARCHAR (25) NOT NULL,
    display_ppi INT (3) NOT NULL,
    display_size VARCHAR (9) NOT NULL,
    display_resolution VARCHAR (25) NOT NULL,
    dimensioni VARCHAR (25) NOT NULL,
    peso INT (3) NOT NULL,
    note VARCHAR (25) NOT NULL,
    id_marca INT (2) NOT NULL,
    id_os INT (2) NOT NULL
);

INSERT INTO `smartphone` (`id`, `nome`, `ram`, `cpuS`, `display_ppi`, `display_size`, `display_resolution`, `dimensioni`, `peso`, `note`, `id_marca`, `id_os`) VALUES
	(1, 	'HTC One M8', 		'2Gb', 		'2.3 GHz quad-core CPU', 	468, 	'4.7', 		'1080x1920', 	'146x70x9', 				160, 	' ', 						4, 		1),
	(2, 	'Iphone 5S', 		'1Gb', 		'1.3 GHz dual-core CPU', 	326, 	'4', 		'640x1136', 	'123x58x8', 				112, 	' ', 						5,		3),
	(3, 	'Galaxy Note 3', 	'3Gb', 		'2.3 GHz Quad core CPU', 	386, 	'5.7', 		'1080x1920', 	'151x79x8', 				168, 	' ', 						1, 		1),
	(4, 	'Galaxy S4', 		'2Gb', 		'1.9 GHz Quad core CPU',	441, 	'5.0', 		'1080x1920', 	'136x69x8', 				130, 	' ', 						1, 		1),
	(5, 	'Galaxy S5', 		'2Gb', 		'2.5 GHz Quad core CPU', 	432, 	'5.1', 		'1080x1920', 	'142x72x8', 				145, 	'Water, Dust resistant', 	1, 		1),
	(6, 	'Galaxy S4 mini', 	'1.5Gb', 	'1.7 GHz dual-core CPU', 	256, 	'4.3', 		'540x960', 		'125x61x9', 				107, 	' ', 						1, 		1),
	(7, 	'Moto X', 			'2Gb', 		'1.7 GHz dual-core CPU', 	326, 	'4.7', 		'720x1280', 	'129x65x6', 				130, 	' ', 						9, 		1),
	(8, 	'Lumia 1020', 		'2Gb', 		'1.5 GHz dual-core CPU', 	386, 	'5.7', 		'768x1280', 	'130x71x10', 				158, 	' ', 						10, 	1),
	(9, 	'Nexus 5', 			'2Gb', 		'2.3 GHz Quad core CPU', 	445, 	'4.95', 	'1080x1920', 	'138x69x8', 				130, 	' ', 						7, 		1),
	(10, 	'G2', 				'2Gb', 		'2.26 GHz Quad core CPU', 	424, 	'5.2', 		'1080x1920', 	'138x71x9', 				143, 	'', 						7, 		1),
	(11, 	'Lumia 930', 		'2Gb', 		'2.2 GHz quad-core CPU', 	441, 	'5.0', 		'1080x1920', 	'137x71x10', 				167, 	' ', 						10, 	9),
	(12, 	'Galaxy S III', 	'2Gb', 		'1.5 Ghz dual-core', 		306, 	'4.8',		'720x1280', 	'136x70x8', 				133, 	'', 						1, 		1),
	(13, 	'Galaxy S II', 		'1Gb', 		'1.2 GHz dual-core', 		218, 	'4.3', 		'480x800', 		'123x66x8.5', 				116, 	'', 						1, 		1),
	(14, 	'Blackberry Z30', 	'2Gb', 		'1.7 Ghz', 					295, 	'5', 		'1280x768', 	'140x72x9.4', 				170, 	'', 						11, 	11),
	(15, 	'Vivo Xplay 3S', 	'3Gb', 		'2.3Ghz Quad core', 		490, 	'6.0', 		'1440x2560', 	'158x82x8', 				172, 	'', 						12, 	1),
	(16, 	'Lumia 520', 		'512Mb', 	'1 GHz dual-core ', 		235, 	'4', 		'480x800', 		'119x64x10',				124, 	'', 						10, 	9),
	(17, 	'8S', 				'512Mb', 	'1 GHz Dual-core', 			233, 	'4', 		'480x800', 		'120x63x10', 				113, 	'',							4, 		9),
	(18, 	'Ativ S Neo', 		'1Gb', 		'1.4 GHz dual-core', 		308, 	'4.77', 	'720x1280', 	'135x69x9', 				144, 	'', 						1, 		9),
	(19, 	'8X', 				'1Gb', 		'1.5 GHz dual-core', 		342, 	'4.3', 		'720x1280', 	'32,35 x 66,2 x 10,12', 	130, 	'', 						4, 		9);


# Dopo aver creato le tabelle aggiungere i vincoli di chiave esterna scegliendo i campi appropriati 
# (la tabella smartphone ha una relazione N:1 con marca e una relazione N:1 con os).

ALTER TABLE smartphone
ADD CONSTRAINT fk_mto_marca FOREIGN KEY smartphone(id_marca) REFERENCES marca(id);

ALTER TABLE smartphone
ADD CONSTRAINT fk_mto_os FOREIGN KEY smartphone(id_os) REFERENCES os(id);

# 1. Tutti gli smartphone presenti del database
# Esercizio extra: Provare a modificare la query per selezionare invece di tutti i campi (*) solo il nome, ram, dimensioni e cpu.
SELECT *
FROM smartphone;

SELECT nome, ram, dimensioni, cpuS
FROM smartphone;

# 2. Il nome degli smartphone con la risoluzione del display (display_resolution) uguale a 1080x1920
# Esercizio extra: Provare a trovare gli smartphone con il display 1080x1920 e 3Gb di ram.
SELECT nome
FROM smartphone
WHERE display_resolution = "1080x1920";

SELECT nome
FROM smartphone
WHERE display_resolution = "1080x1920" AND ram LIKE "3gb";

# 3. Tutti gli smartphone della serie 'Galaxy'
# Esercizio extra: Provare a modificare la query per selezionare gli smartphone che hanno la cpu 'dual-core'.
SELECT *
FROM smartphone
WHERE nome LIKE "Galaxy%";

SELECT *
FROM smartphone
WHERE cpuS LIKE "%dual-core%";

# 4. L'elenco di smartphone che hanno un peso maggiore di 150 grammi
# Esercizio extra: Modificare la query per trovare gli smartphone con il peso inferiore a 150 grammi.
SELECT *
FROM smartphone
WHERE peso > 150;

SELECT *
FROM smartphone
WHERE peso < 150;

# 5. L'elenco degli smartphone con CPU 'Quad core' ordinati secondo la densità dello schermo.
# Esercizio extra: Provare a modificare la query invertendo l'ordine. Per farlo basta inserire alla fine della query la clausola DESC.
SELECT *
FROM smartphone
WHERE cpuS LIKE "%Quad core%"
ORDER BY display_ppi ASC;

SELECT *
FROM smartphone
WHERE cpuS LIKE "%Quad core%"
ORDER BY display_ppi DESC;

# 6. Estrarre la ram e il conteggio degli smartphone con quella ram raggruppati per valore della ram
SELECT s.ram, COUNT(s.id) numero_smartphone
FROM smartphone s
GROUP BY s.ram;

# 7. Estrarre la ram e il conteggio degli smartphone con quella ram raggruppati per valore della ram e aventi conteggio degli smartphone per ram superiore a 2
SELECT ram, COUNT(id) totale_smartphone
FROM smartphone s
WHERE ram > 2;

# 8. Elenco degli smartphone e il loro sistema operativo.
# Esercizio extra: Ordinare la query per la descrizione del sistema operativo.
SELECT *
FROM smartphone s
INNER JOIN os ON os.id = s.id_os;

SELECT *
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
ORDER BY descrizione;

# 9. Elenco degli smartphone 'Android' ordinati per il peso.
# Esercizio extra: Modificare la query per trovare gli smartphone 'Samsung' ordinati per il peso.
SELECT *
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Android"
ORDER BY peso;

SELECT *
FROM smartphone s
INNER JOIN marca ON marca.id = s.id_os
WHERE marca.brand LIKE "Samsung"
ORDER BY peso;

# 10. L'elenco degli smartphone con la descrizione del sistema operativo e del brand
SELECT os.descrizione, marca.brand
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
INNER JOIN marca ON marca.id = s.id_os;


# 11. L’elenco degli smartphone con la descrizione del sistema operativo e del brand e il brand sia o Samsung o Apple
SELECT s.nome, os.descrizione, m.brand
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
INNER JOIN marca m ON m.id = s.id_os
WHERE m.brand LIKE "Samsung" OR m.brand LIKE "Apple";

# 12. Contare quanti smartphone hanno 2Gb di RAM.
SELECT COUNT(id) qta_smartphone
FROM smartphone
WHERE ram LIKE "2gb";

# 13. Contare quanti smartphone hanno 2Gb di Ram dividendoli per SO
SELECT os.descrizione, COUNT(s.id) qta_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE ram LIKE "2gb"
GROUP BY id_os;

# 14. Quanti smartphone hanno il Sistema Operativo Windows Phone 8
SELECT os.descrizione, COUNT(s.id) qta_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Windows Phone 8";

# 15. Quanti smartphone non hanno il Sistema Operativo Android
SELECT os.descrizione, COUNT(s.id) qta_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione NOT LIKE "Android"
GROUP BY os.descrizione;

# 16. Quanti smartphone ci sono per sistema operativo. 
# Esercizio extra: Ordinare la query per la descrizione del sistema operativo.
SELECT os.descrizione, COUNT(s.id) qta_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
GROUP BY os.descrizione;

SELECT os.descrizione, COUNT(s.id) qta_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
GROUP BY os.descrizione
ORDER BY os.descrizione;

# 17. Quanti smartphone con conteggio superiore a 5 ci sono per sistema operativo e che hanno ppi maggiore di 400
SELECT os.descrizione, COUNT(s.id) numero_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE display_ppi > 400
GROUP BY os.descrizione
HAVING numero_smartphone > 5;

# 18. La somma dei pesi degli smartphone superiore a 500 per sistema operativo
SELECT os.descrizione, COUNT(s.id) numero_smarthpone, SUM(s.peso) peso_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
GROUP BY os.descrizione
HAVING peso_smartphone > 500;

# 19. Lo smartphone 'Android' più leggero.
# Esercizio extra: Modificare la query per trovare lo smartphone 'Android' con la densità dello schermo maggiore.
SELECT s.nome, MIN(s.peso)
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Android";

SELECT s.nome, MAX(s.display_ppi)
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Android";

# 20. La media della dimensione dello schermo degli smartphone.
SELECT AVG(s.display_ppi) media_dimensioni_schermo
FROM smartphone s;

# 21. Il nome dello smartphone Windows Phone 8 più pesante
SELECT s.nome, MAX(s.peso)
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Windows Phone 8";

# 22. Il nome dello smartphone più pesante di tutti per ogni sistema operativo
SELECT s.nome, os.descrizione, MAX(s.peso) peso_maggiore
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
GROUP BY os.descrizione;

# 23. La media dei pesi degli smartphone suddivisi per sistemi operativi
SELECT os.descrizione, AVG(s.peso) media_peso
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
GROUP BY os.descrizione;

# 24. Il numero degli smartphone con risoluzione 1080x1920 divisi per brand
SELECT m.brand, COUNT(s.id) numero_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
INNER JOIN marca m ON m.id = s.id_os
WHERE s.display_resolution LIKE "1080x1920"
GROUP BY m.brand;

# 25. Il numero degli smartphone con sistema operativo Android diviso per brand
SELECT m.brand, COUNT(s.id) numero_smartphone
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
INNER JOIN marca m ON m.id = s.id_os
WHERE os.descrizione LIKE "Android"
GROUP BY m.brand;

# 26. Il nome dello smartphone con sistema operativo Android e cpu dual core più leggero
SELECT s.nome, MIN(s.peso)
FROM smartphone s
INNER JOIN os ON os.id = s.id_os
WHERE os.descrizione LIKE "Android" AND cpuS LIKE "%dual-core%";