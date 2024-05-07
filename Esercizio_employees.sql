CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    age INT,
    department VARCHAR (20),
    salary INT,
    experience INT
);

INSERT INTO employees VALUES 
	(1,   'John',     'Doe',        30,   'IT',        60000,   5),
	(2,   'Jane',     'Smith',      28,   'HR',        55000,   4),
	(3,   'Mike',     'Johnson',    35,   'Finance',   70000,   7),
	(4,   'Emily',    'Williams',   32,   'IT',        62000,   6),
	(5,   'David',    'Brown',      26,   'Finance',   50000,   3),
	(6,   'Maria',    'Rossi',      28,   'HR',        56000,   3),
	(7,   'Luca',     'Bianchi',    32,   'IT',        65000,   5),
	(8,   'Giulia',   'Verdi',      30,   'Finance',   72000,   6),
	(9,   'Marco',    'Gialli',     29,   'IT',        60000,   4),
	(10,  'Alessia',  'Neri',       27,   'HR',        54000,   2);

# 1. *Seleziona tutti i dati dalla tabella "employees".*
SELECT *
FROM employees;

# 2. *Trova la somma degli stipendi per dipartimento dalla tabella "employees".*
SELECT department, SUM(salary) AS somma_stipendi
FROM employees
GROUP BY department
ORDER BY salary ASC;

# 3. *Trova l'età minima e lo stipendio massimo dalla tabella "employees".*
SELECT MIN(age) AS eta_minima, MAX(salary) AS stipendio_massimo
FROM employees;

# 4. *Calcola la media degli stipendi per il dipartimento 'IT' dalla tabella "employees".*
SELECT department, AVG(salary) AS stipendio_medio
FROM employees
WHERE department LIKE "IT";

# 5. *Conta il numero totale di dipendenti nella tabella "employees".*
SELECT COUNT(employee_id) AS totale_dipendenti
FROM employees;

# 6. *Conta il numero di dipendenti per dipartimento nella tabella "employees" e seleziona solo quelli con più di 5 dipendenti.*
SELECT department, COUNT(employee_id) AS totale_dipendenti
FROM employees
GROUP BY department
HAVING totale_dipendenti > 3; # Ho messo 3 perché nessun dipartimento ha più di 4 dipendenti.

# 7. *Ordina i dipendenti per età in ordine decrescente dalla tabella "employees".*
SELECT *
FROM employees
ORDER BY age DESC;

# 8. *Concatena il nome e il cognome in un'unica colonna chiamata "full_name" dalla tabella "employees".*
SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees;

# 9. *Seleziona tutti i dati dei dipendenti nei dipartimenti 'HR' e 'Finance' dalla tabella "employees".*
SELECT *
FROM employees
WHERE department LIKE "HR" OR department LIKE "Finance";

# 10. *Seleziona i nomi e le età dei dipendenti con uno stipendio superiore a 50000 dalla tabella "employees".*
SELECT first_name, age, salary
FROM employees
WHERE salary > 50000;

# 11. *Calcola la media degli stipendi per dipartimento dalla tabella "employees" e seleziona solo quelli con una media superiore a 60000.*
SELECT department, AVG(salary) AS media_stipendi
FROM employees
GROUP BY department
HAVING media_stipendi > 60000;

# 12. *Conta il numero di dipendenti per dipartimento dalla tabella "employees" e ordina il risultato in ordine decrescente.*
SELECT department, COUNT(employee_id) AS conteggio_dipendenti
FROM employees
GROUP BY department
ORDER BY conteggio_dipendenti DESC;

# 13. *Esegui un'operazione matematica sommando l'età e l'esperienza per ogni dipendente dalla tabella "employees".*
SELECT *, SUM(age + experience) AS somma_eta_esperienza
FROM employees
GROUP BY employee_id;

# 14. *Seleziona i nomi e le età dei dipendenti con uno stipendio inferiore a 40000 nel dipartimento 'IT' dalla tabella "employees".*
SELECT first_name, age, department, salary
FROM employees
WHERE salary < 62000 AND department LIKE "IT"; # Ho messo 62000 perché non ci sono dipendenti del dipartimento "IT" con un salario minore di 40000.

# 15. *Trova lo stipendio massimo per dipartimento dalla tabella "employees" e seleziona solo quelli con uno stipendio massimo inferiore a 80000.*
SELECT first_name, last_name, department, MAX(salary) AS stipendio_massimo
FROM employees
GROUP BY department
HAVING stipendio_massimo < 80000;

# 16. *Seleziona i nomi e le età dei dipendenti nel dipartimento 'HR' dalla tabella "employees" e ordina il risultato in ordine crescente per età.*
SELECT first_name, last_name, department, age
FROM employees
WHERE department LIKE "HR"
ORDER BY age ASC;

# 17. *Concatena il nome e il cognome separati da un trattino nella colonna "username" dalla tabella "employees".*
SELECT first_name, last_name, CONCAT(first_name, "_", last_name) AS username
FROM employees;

# 18. *Seleziona i nomi e le età dei dipendenti con un'età compresa tra 25 e 35 dalla tabella "employees".*
SELECT first_name, last_name, age
FROM employees
WHERE age >= 25 AND age <= 35;

# 19. *Calcola la media degli stipendi per dipartimento dalla tabella "employees" e seleziona solo quelli con una media inferiore o uguale a 70000.*
SELECT department, AVG(salary) AS media_stipendi
FROM employees
GROUP BY department
HAVING media_stipendi <= 60000; # Ho inserito 60000 per fare una prova, dato che la media degli stipendi si assesta sui 55.000 - 60.000.

# 20. *Conta il numero di dipendenti per dipartimento dalla tabella "employees" e ordina il risultato in ordine crescente.*
SELECT department, COUNT(employee_id) AS numero_dipendenti
FROM employees
GROUP BY department
ORDER BY numero_dipendenti ASC;