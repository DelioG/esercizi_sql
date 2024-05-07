CREATE TABLE Clienti (
	cod_cliente INT(3) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    citta VARCHAR(15),
    salario INT(4),
    eta INT (3)
);

INSERT INTO Clienti (cod_cliente, cognome, nome, citta, salario, eta) VALUES 
	(10, "Bianchi", "Mario", "Rimini", 1000, 20),
	(20, "Bianchi", "Ettore", "Milano", 0, 15),
	(30, "Casadei", "Mario", "Rimini", 3000, 35),
	(40, "Rossi", "Mario", "Bologna", 1500, 50),
	(50, "Rossi", "Fabio", "Firenze", 8000, 40),
	(60, "Bianchi", "Ettore", "Rimini", 4500, 35),
	(80, "Neri", "Fabio", "Arezzo", 3500, 35);
    
# 1 - RESTITUIRE COGNOMI PRESENTI SENZA DUPLICATI
SELECT DISTINCT cognome
FROM Clienti;

# 2 - RESTITUIRE I NOMI PRESENTI
SELECT nome
FROM Clienti;

# 3 - RESTITUIRE COGNOMI E NOMI VISUALIZZANDOLI IN UN'UNICA COLONNA
SELECT CONCAT("NOME: [", p.nome, "] COGNOME: [", p.cognome, "]") AS anagrafica_persona
FROM CLIENTI AS p;

# 4 - RESTITUIRE COGNOME, NOME, CITTA DI TUTTI I CLIENTI
SELECT cognome, nome, citta
FROM Clienti;

# 5 - RESTITUIRE TUTTI I CAMPI DI OGNI CLIENTE #
SELECT *
FROM Clienti;

# 6 - ELIMINARE I CLIENTI CON ETA' MINORE DI 18 (<18)
DELETE
FROM Clienti
WHERE eta < 18;

# 7 - MODIFICARE I CLIENTI IL CUI SALARIO E' MAGGIORE DI 1000 E INFERIORE DI 3000 IMPOSTANDOLO A 1500
UPDATE Clienti
SET salario = 1500
WHERE salario > 1000 AND salario < 3000;
# WHERE salario BETWEEN 1000 AND 3000;

# 8 - RESTITUIRE CLIENTI CON SALARIO INFERIORE A 3000
SELECT *
FROM Clienti
WHERE salario < 3000;

# 9 - RESTITUIRE NOME CLIENTI CON ETA INFERIORE AI 50
SELECT nome
FROM Clienti
WHERE eta < 50;

# 10 - RESTITUIRE NOME E COGNOME DEI CLIENTI CON SALARIO DIVERSO DA 1500
SELECT *
FROM Clienti
WHERE salario <> 1500;