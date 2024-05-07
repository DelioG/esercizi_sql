INSERT INTO autore (cognome, nome) VALUES
	("Graziano", "Delio"),
    ("Iovine", "Mattia");

SELECT *
FROM autore;

INSERT INTO libro (prezzo, autore_id, genere, titolo_libro) VALUES
	(10, 1, "Fantasy", "Harry Potter"),
    (20, 2, "Fantascienza", "Interstellar");
    
SELECT *
FROM autore a 
JOIN libro l ON a.id = l.autore_id;

SELECT *
FROM autore a
INNER JOIN libro l ON l.autore_id = a.id;

SELECT l.* FROM libro l WHERE l.titolo_libro = "Interstellar";