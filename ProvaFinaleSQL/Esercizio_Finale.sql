# CANCELLLAZIONE DEL DATABASE (SE ESISTENTE)
DROP DATABASE IF EXISTS toysgroupdb;

# CREAZIONE DEL DATABASE
CREATE DATABASE toysgroupdb;

# UTILIZZO DEL DATABASE
USE toysgroupdb;

# CANCELLAZIONE DELLE TABELLE (SE ESISTENTI)
DROP TABLE IF EXISTS category; 


# CREAZIONE TABELLA CATEGORY
# Contiene le categorie di appartenenza dei prodotti venduti
CREATE TABLE categories(
    CategoryID INT AUTO_INCREMENT,
    CategoryName VARCHAR(40),
    PRIMARY KEY(CategoryID)
);

# INSERIMENTO DATI NELLA TABELLA CATEGORY
INSERT INTO categories (CategoryName) VALUES
('Giochi educativi'),
("Giochi all'aperto"),
('Giochi di società'),
('Giochi elettronici'),
('Peluche'),
('Costruzioni'),
('Modellismo'),
('Giochi di ruolo'),
('Puzzle'),
('Arte e creatività'),
('Veicoli giocattolo'),
('Action figure'),
('Giochi musicali'),
('Robotica'),
('Giochi da tavolo'),
('Videogiochi'),
('Giocattoli vintage'),
('Giochi scientifici'),
('Giochi per neonati'),
('Giochi di magia');

# VERIFICA 
SELECT * FROM categories;

# CREAZIONE TABELLA PRODUCTS
# Contiene l'anagrafica dei prodotti in vendita
CREATE TABLE products (
    ProductID CHAR(4) NOT NULL,
    ProductName VARCHAR(40) NOT NULL,
    CategoryID INT DEFAULT NULL,
	Price DECIMAL(10,2),
    PRIMARY KEY (ProductID),
	FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

# INSERIMENTO DATI NELLA TABELLA PRODUCTS
INSERT INTO products (ProductID, ProductName, CategoryID, Price) VALUES
('P001', 'Lego City', 6, 49.95),
('P002', 'Monopoly', 3, 24.99),
('P003', 'Orso Peluche', 5, 15.90),
('P004', 'Playstation 5', 16, 499.99),
('P005', 'Drone Modellismo', 7, 120.50),
('P006', 'Kit Robotica', 14, 89.95),
('P007', 'Puzzle 1000 pezzi', 9, 22.75),
('P008', 'Kit Pittura', 10, 35.30),
('P009', 'Macchinina telecomandata', 11, 40.20),
('P010', 'Barbie', 12, 19.99),
('P011', 'Flauto giocattolo', 13, 12.80),
('P012', 'Treno elettrico', 4, 59.95),
('P013', 'Set Magia', 20, 25.60),
('P014', 'Cubo di Rubik', 9, 9.99),
('P015', 'Scacchi', 15, 30.49),
('P016', 'Tamburello', 13, 8.50),
('P017', 'Bambole antiche', 17, 55.70),
('P018', 'Microscopio giocattolo', 18, 28.40),
('P019', 'Giochi sensoriali', 19, 21.99),
('P020', 'Giochi in legno', 1, 17.95),
('P021', 'Scivolo per bambini', 2, 45.99),
('P022', 'Set da giardinaggio giocattolo', 2, 14.25),
('P023', 'Trampolino', 3, 89.99),
('P024', 'Guitar Hero', 4, 60.40),
('P025', 'Cucina giocattolo', 1, 29.99),
('P026', 'Binocolo per bambini', 1, 18.50),
('P027', 'Orsacchiotto gigante', 5, 24.99),
('P028', 'Set di trenini', 11, 35.75),
('P029', 'Bambola parlante', 12, 27.90),
('P030', 'Kit di magia per bambini', 20, 22.60),
('P031', 'Puzzle 3D', 9, 18.30),
('P032', 'Pistola ad acqua', 3, 10.99),
('P033', 'Yo-yo luminoso', 18, 6.99),
('P034', 'Giochi di prestigio', 20, 24.50),
('P035', 'Bicicletta senza pedali', 2, 49.95),
('P036', 'Matrioska', 9, 20.70),
('P037', 'Giochi da spiaggia', 2, 15.99),
('P038', 'Tenda da gioco', 2, 30.40),
('P039', 'Globo interattivo', 1, 45.80),
('P040', 'Gioco delle emozioni', 1, 32.99);

# VERIFICA 
SELECT * FROM products;

# CREAZIONE TABELLA STATES
# Contiene tutti gli stati appartenenti al mercato di riferimento
	CREATE TABLE states (
    StateID INT,
    StateName VARCHAR(50) NOT NULL,
    PRIMARY KEY (StateID)
);

# INSERIMENTO DATI NELLA TABELLA STATES 
INSERT INTO states (StateID, StateName) VALUES
(1, 'Italia'),
(2, 'Francia'),
(3, 'Germania'),
(4, 'Grecia'),
(5, 'USA'),
(6, 'Canada'),
(7, 'Brasile'),
(8, 'Argentina'),
(9, 'Cina'),
(10, 'Giappone'),
(11, 'India'),
(12, 'Russia'),
(13, 'Australia'),
(14, 'Nuova Zelanda'),
(15, 'Sudafrica'),
(16, 'Egitto'),
(17, 'Marocco'),
(18, 'Turchia'),
(19, 'Regno Unito'),
(20, 'Spagna');

# VERIFICA 
SELECT * FROM states;

# CREAZIONE TABELLA REGIONS
# Contiene le regioni di vendita in cui è suddiviso il mercato di riferimento con i relativi stati 
CREATE TABLE regions (
    RegionID INT AUTO_INCREMENT,
    RegionName VARCHAR(50) NOT NULL,
    StateID INT,
    PRIMARY KEY (RegionID),
	FOREIGN KEY (StateID) REFERENCES states(StateID)
);

# INSERIMENTO DATI NELLA TABELLA REGIONS
INSERT INTO regions (RegionName, StateID) VALUES
('Europa Occidentale', 1),
('Europa Occidentale', 2),
('Europa Occidentale', 3),
('Europa Meridionale', 4),
('Europa Meridionale', 1),
('Nord America', 5),
('Nord America', 6),
('Sud America', 7),
('Sud America', 8),
('Asia Orientale', 9),
('Asia Orientale', 10),
('Asia Meridionale', 11),
('Europa Orientale', 12),
('Oceania', 13),
('Oceania', 14),
('Africa', 15),
('Africa', 16),
('Medio Oriente', 17),
('Europa Occidentale', 19),
('Europa Meridionale', 20);

# VERIFICA 
SELECT * FROM regions;
 
# CREAZIONE DELLA TABELLA SALES
# Contiene i dati relativi agli acquisti dei clienti
CREATE TABLE sales (
    SaleID INT,
    SaleDate DATE,
    ProductID VARCHAR(5),
    RegionID INT,
    PRIMARY KEY (SaleID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID),
    FOREIGN KEY (RegionID) REFERENCES regions(RegionID)
);

# INSERIMENTO DATI NELLA TABELLA SALES
INSERT INTO sales (SaleID, SaleDate, ProductID, RegionID) VALUES
(1, '2022-03-15', 'P001', 1),
(2, '2022-04-20', 'P002', 2),
(3, '2022-05-10', 'P003', 3),
(4, '2022-06-22', 'P004', 4),
(5, '2022-07-30', 'P005', 1),
(6, '2022-08-14', 'P006', 2),
(7, '2022-09-05', 'P007', 3),
(8, '2022-10-21', 'P008', 4),
(9, '2022-11-11', 'P009', 1),
(10, '2022-12-23', 'P010', 2),
(11, '2023-01-15', 'P011', 3),
(12, '2023-02-17', 'P012', 4),
(13, '2023-03-20', 'P001', 1),
(14, '2023-04-25', 'P002', 2),
(15, '2023-05-30', 'P003', 3),
(16, '2023-06-18', 'P004', 4),
(17, '2023-07-22', 'P005', 1),
(18, '2023-08-09', 'P006', 2),
(19, '2023-09-15', 'P007', 3),
(20, '2023-10-30', 'P008', 4),
(21, '2022-04-05', 'P010', 5),
(22, '2022-05-25', 'P012', 6),
(23, '2022-07-11', 'P009', 7),
(24, '2022-08-20', 'P011', 8),
(25, '2022-09-30', 'P014', 9),
(26, '2022-10-14', 'P015', 10),
(27, '2022-11-29', 'P017', 11),
(28, '2022-12-10', 'P019', 12),
(29, '2023-01-20', 'P020', 13),
(30, '2023-02-28', 'P016', 14),
(31, '2023-03-15', 'P018', 15),
(32, '2023-04-09', 'P013', 16),
(33, '2023-05-22', 'P014', 17),
(34, '2023-06-30', 'P015', 18),
(35, '2023-07-19', 'P017', 19),
(36, '2023-08-05', 'P019', 20),
(37, '2023-09-10', 'P020', 1),
(38, '2023-10-15', 'P016', 2),
(39, '2023-11-20', 'P018', 3),
(40, '2023-12-25', 'P013', 4);

# VERIFICA 
SELECT * FROM sales;

# DOMANDA 1
# Verificare che i campi definiti come PK siano univoci. 

#1
SELECT COUNT(CategoryID) FROM categories; 
SELECT DISTINCT COUNT(CategoryID) FROM categories; 

#2
SELECT COUNT(ProductID) FROM products; 
SELECT DISTINCT COUNT(ProductID) FROM products;

#3
SELECT COUNT(RegionID) FROM regions; 
SELECT DISTINCT COUNT(RegionID) FROM regions;

#4
SELECT COUNT(saleID) FROM sales; 
SELECT DISTINCT COUNT(saleID) FROM sales;

#5
SELECT COUNT(StateID) FROM states; 
SELECT DISTINCT COUNT(StateID) FROM states;

# DOMANDA 2
# Esporre l’elenco dei soli prodotti venduti e 
# per ognuno di questi il fatturato totale per anno.  

SELECT
    p.ProductName,
    YEAR(sa.SaleDate) AS SaleYear,
    SUM(p.Price) AS TotalRevenue
FROM sales sa
JOIN products p ON sa.ProductID = p.ProductID
GROUP BY p.ProductName, SaleYear
ORDER BY p.ProductName, SaleYear;

# Oppure:
SELECT 
	s.ProductID AS PrdID,
    p.ProductName AS PrdName,
	YEAR(SaleDate) AS Year,
	COUNT(s.ProductID) AS QtaSales,
	p.Price*COUNT(s.ProductID) AS Revenue
FROM sales s
LEFT JOIN products p on p.ProductID = s.ProductID
WHERE YEAR(SaleDate) = '2022' OR YEAR(SaleDate) = '2023'
GROUP BY s.ProductID, p.Price, YEAR(SaleDate)
ORDER BY s.ProductID, Year;
    
    
# DOMANDA 3
# Esporre il fatturato totale per stato per anno. 
# Ordina il risultato per data e per fatturato decrescente. 

SELECT
    s.StateName,
    YEAR(sa.SaleDate) AS SaleYear,
    SUM(p.Price) AS TotalRevenue
FROM sales sa
JOIN products p ON sa.ProductID = p.ProductID
JOIN regions r ON sa.RegionID = r.RegionID
JOIN states s ON r.StateID = s.StateID
GROUP BY s.StateName, SaleYear
ORDER BY SaleYear DESC, TotalRevenue DESC;


# DOMANDA 4
# Qual è la categoria di articoli maggiormente richiesta dal mercato? 

SELECT 
    c.CategoryName AS CatName,
    COUNT(s.SaleID) AS TotSales
FROM sales s
JOIN products p USING (ProductID)
JOIN categories c USING (CategoryID)
GROUP BY c.CategoryName
ORDER BY TotSales DESC
LIMIT 2; # VEDI NOTA

/* 
NOTA: utilizzo LIMIT 2 invece di LIMIT 1 in quanto dall'analisi è
emerso che le categorie più richieste sono due (puzzle e giochi musicali)
*/


# DOMANDA 5
# Quali sono, se ci sono, i prodotti invenduti? 
# Proponi due approcci risolutivi differenti. 

# Soluzione 1
SELECT 
	ProductID,
	ProductName
FROM products
WHERE ProductID NOT IN 
	(SELECT DISTINCT
		p.ProductID
	FROM sales s
	LEFT JOIN products p USING (ProductID));

# Soluzione 2
SELECT DISTINCT
	p.ProductID,
	p.ProductName
FROM products p
LEFT JOIN sales s USING (ProductID)
WHERE s.SaleID IS NULL;

# domanda 6
# Esporre l’elenco dei prodotti con la rispettiva 
# ultima data di vendita (la data di vendita più recente)

SELECT 
	p.ProductID AS PrdID, 
    p.ProductName AS PrdID, 
	MAX(s.SaleDate) as 'Last Sale Date'
FROM products p
JOIN sales s USING (ProductID) 
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID, MAX(s.SaleDate) DESC;

/* 
NOTA: Ho considerato solo i prodotti venduti (non tutti i prodotti) in quanto 
ho ritenuto che per la richiesta non fosse necessario far vedere quelli invenduti.
*/





