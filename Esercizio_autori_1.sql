#l'operatore "IN" serve per confrontare i valori delle colonne con una lista di valori
SELECT *
FROM autore
WHERE eta IN (28, 32);

SELECT *
FROM autore
WHERE nome IN ('mattia', 'marco');

# la lista di valori di "IN" è il risultato di un'altra query
SELECT *
FROM autore
WHERE nome IN (
	SELECT nome
	FROM autore
	WHERE eta IN (28, 32)
);

#si può fare una ricerca per valori "null" con IS NULL
SELECT *
FROM autore
WHERE data_nascita IS NULL;

#si possono ordinare in maniera crescente o decrescente i risultati di una query con ORDER BY
SELECT *
FROM autore
ORDER BY eta DESC;

SELECT *
FROM autore
ORDER BY eta ASC;

#restituire la somma dei valori di una colonna SUM
SELECT SUM(eta) AS somma_età
FROM autore;

#restituire il valore minimo o massimo di una colonna MIN/MAX
SELECT MIN(eta) AS eta_minima
FROM autore;

SELECT MAX(eta) AS eta_massima
FROM autore;

#calcolare la media dei valori di una colonna AVG
SELECT AVG(eta) AS età_media
FROM autore;

#calcolare il numero di occorrenze di una colonna COUNT
SELECT COUNT(eta) AS conteggio_età
FROM autore
WHERE eta = 28;

#arrotondare un valore (anche di un'altra funzione)
SELECT ROUND(AVG(eta), 2) AS media_arrotondata
FROM AUTORE;

SELECT cognome, nome
FROM autore
GROUP BY cognome;

# Raggruppare tutti i valori per cognome e contarli
SELECT cognome, COUNT(*) AS occorrenze_cognome
FROM autore
GROUP BY cognome;

# Si può aggiungere una condizione
