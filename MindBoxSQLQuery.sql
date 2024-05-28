CREATE TABLE Product (
	id BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(64) NOT NULL
);

INSERT INTO Product(id, name)
VALUES (1, 'Яблоко');
INSERT INTO Product(id, name)
VALUES (2, 'Огурец');
INSERT INTO Product(id, name)
VALUES (3, 'Малина');

CREATE TABLE Category (
	id BIGINT NOT NULL PRIMARY KEY,
	name VARCHAR(64) NOT NULL
);

INSERT INTO Category(id,name)
VALUES (1,'Овощи');
INSERT INTO Category(id,name)
VALUES (2,'Фрукты');
INSERT INTO Category(id,name)
VALUES (3,'Другое');

CREATE TABLE ProductCategory (
	productId BIGINT NOT NULL REFERENCES Product (id),
	categoryId BIGINT REFERENCES Category (id),
	
	PRIMARY KEY(productId, categoryId)
);

INSERT INTO ProductCategory(productId, categoryId)
VALUES (1,1);
INSERT INTO ProductCategory(productId, categoryId)
VALUES (2,2);
INSERT INTO ProductCategory(productId,categoryId)
VALUES (3,3);

SELECT p.name as ProductName,
	c.name as CategoryName
FROM Product p 
LEFT JOIN ProductCategory as pc
	ON pc.productId = p.id
LEFT JOIN Category as c 
	ON pc.categoryId = c.id
ORDER BY p.name, c.name
