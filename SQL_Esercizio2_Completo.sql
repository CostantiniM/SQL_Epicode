-- CREO IL DATABASE

CREATE DATABASE GestioneOrdiniDB;

-- UTILIZZO I DATI DEL DATABASE CREATO

USE GestioneOrdiniDB;

-- CREO LA TABELLA PRODOTTI

CREATE TABLE Prodotti (
IDProdotto INT NOT NULL auto_increment,
NomeProdotto VARCHAR(100),
Prezzo DECIMAL(10,2),
PRIMARY KEY(IDProdotto));

-- INSERISCO I DATI NELLA TABELLA PRODOTTI

INSERT INTO Prodotti (IDProdotto, NomeProdotto, Prezzo) VALUES
(1, 'Tablet', 300.00),
(2, 'Mouse', 20.00),
(3, 'Tastiera', 25.00),
(4, 'Monitor', 180.00),
(5, 'HDD', 90.00),
(6, 'SSD', 200.00),
(7, 'RAM', 100.00),
(8, 'Router', 80.00),
(9, 'Webcam', 45.00),
(10, 'GPU', 1250.00),
(11, 'Trackpad', 500.00),
(12, 'Techmagazine', 5.00),
(13, 'Martech', 50.00);

-- CREO LA TABELLA CLIENTI

CREATE TABLE Clienti (
IDCliente INT NOT NULL auto_increment,
Nome VARCHAR(50),
Email VARCHAR(100),
PRIMARY KEY(IDCliente));

-- INSERISCO I DATI NELLA TABELLA CLIENTI

INSERT INTO Clienti (IDCliente, Nome, Email) VALUES
(1, 'Antonio', NULL),
(2, 'Battista', 'battista@mailmail.it'),
(3, 'Maria', 'maria@posta.it'),
(4, 'Franca', 'franca@lettere.it'),
(5, 'Ettore', NULL),
(6, 'Arianna', 'arianna@posta.it'),
(7, 'Piero', 'piero@lavoro.it');

-- CREO LA TABELLA ORDINI

CREATE TABLE Ordini (
    IDOrdine INT NOT NULL auto_increment,
    IDProdotto INT,
    IDCliente INT,
    Quantità INT,
    PRIMARY KEY(IDOrdine),
    FOREIGN KEY (IDProdotto) REFERENCES Prodotti(IDProdotto),
    FOREIGN KEY (IDCliente) REFERENCES Clienti(IDCliente));

-- INSERISCO I DATI NELLA TABELLA ORDINI

INSERT INTO Ordini (IDOrdine, IDProdotto, IDCliente, Quantità) VALUES
(1, 2, 1, 10),
(2, 6, 2, 2),
(3, 4, 3, 5),
(4, 9, 1, 1),
(5, 11, 6, 4),
(6, 10, 2, 2),
(7, 3, 3, 3),
(8, 1, 4, 1),
(9, 2, 5, 3),
(10, 1, 6, 2),
(11, 2, 7, 1);

-- CREO LA TABELLA DETTAGLIOORDINE (BONUS) 

CREATE TABLE DettaglioOrdine (
    IDOrdine INT,
    IDProdotto INT,
    IDCliente INT,
    PrezzoTotale DECIMAL(10, 2),
    PRIMARY KEY (IDOrdine, IDProdotto, IDCliente),
    FOREIGN KEY (IDOrdine) REFERENCES Ordini(IDOrdine),
    FOREIGN KEY (IDProdotto) REFERENCES Prodotti(IDProdotto),
    FOREIGN KEY (IDCliente) REFERENCES Clienti(IDCliente));
    
SELECT * FROM Prodotti;
SELECT * FROM Clienti;
SELECT * FROM Ordini;

/*
-- Calcolo del PrezzoTotale
SELECT d.IDOrdine, d.IDProdotto, d.IDCliente, 
    (o.Quantità * p.Prezzo) AS PrezzoTotale
FROM DettaglioOrdine d
JOIN Ordini o ON d.IDOrdine = o.IDOrdine
JOIN Prodotti p ON d.IDProdotto = p.IDProdotto;
*/

-- INSERISCO I DATI NELLA TABELLA DETTAGLIOORDINE

INSERT INTO DettaglioOrdine (IDOrdine, IDProdotto, IDCliente, PrezzoTotale) SELECT
ord.IDOrdine,
ord.IDProdotto,
ord.IDCliente,
prd.prezzo * ord.quantità as PrezzoTotale
FROM Ordini ord JOIN Prodotti prd ON ord.IDProdotto = prd.IDProdotto

-- SELECT * FROM DettaglioOrdine;


-- SELEZIONO TUTTI I PRODOTTI CON UN PREZZO SUPERIORE A 50 EURO DALLA TABELLA PRODOTTI

SELECT *
FROM prodotti 
WHERE Prezzo > 50;

-- SELEZIONO TUTTE LE EMAIL DEI CLIENTI IL CUI NOME INIZIA CON LA LETTERA "A" DALLA TABELLA CLIENTI

SELECT *
FROM clienti; 

SELECT Nome, Email
FROM clienti
WHERE Nome LIKE 'A%';

SELECT Email
FROM clienti
WHERE Email IN ('A%'); ???

SELECT Nome, Email
FROM clienti
WHERE Nome = 'A%'; ???

-- SELEZIONO TUTTI GLI ORDINI CON UNA QUANTITA' MAGGIORE DI 10 O CON UN IMPORTO TOTALE INFERIORE A 100 EURO DALLA TABELLA ORDINI

SELECT *
FROM ordini o
JOIN dettaglioordine do
ON o.IDOrdine = do.IDOrdine
WHERE o.Quantità > 10 OR do.PrezzoTotale < 100;

-- SELEZIONO TUTTI I PREZZI DEI PRODOTTI I CUI NOMI CONTIENE LA PAROLA "TECH" INDIPENDENTEMENTE DALLA POSIZIONE NELLA TABELLA PRODOTTI

SELECT Prezzo
FROM prodotti
WHERE NomeProdotto LIKE '%tech%';

-- SELEZIONO TUTTI I CLIENTI CHE NON HANNO UN INDIRIZZO EMAIL NELLA TABELLA CLIENTI

SELECT * 
FROM clienti
WHERE email = '' OR email IS NULL; 

SELECT * 
FROM clienti
WHERE email = '' OR email IS NULL; 

-- SELEZIONO TUTTI I PRODOTTI IL CUI NOME INIZIA CON 'M' E TERMINA CON 'e' INDIPENDENTEMENTE DALLA LUNGHEZZA DELLA PAROLA NELLA TABELLA PRODOTTI

SELECT *
FROM prodotti 
WHERE NomeProdotto LIKE 'M%' AND NomeProdotto LIKE '%e';

-- oppure 

SELECT *
FROM prodotti 
WHERE NomeProdotto LIKE 'M%e';














