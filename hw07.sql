-- hw 07

-- Подготовительные работы
-- Заполним таблицу заказы
/*
INSERT INTO `orders` (user_id, created_at, updated_at)
VALUES
	('1', NOW(), NOW()),
	('2', NOW(), NOW()),
	('1', NOW(), NOW()),
	('1', NOW(), NOW()),
	('2', NOW(), NOW())
;

-- Заполним таблицу состава заказа
INSERT INTO `orders_products` (order_id, product_id, total)
VALUES
	(1, 1, 2),
	(1, 4, 1),
	(1, 5, 1),
	(2, 3, 1),
	(2, 7, 1),
	(3, 4, 10),
	(4, 2, 11),
	(4, 6, 11),
	(5, 1, 1),
	(5, 2, 1),
	(5, 3, 1),
	(5, 4, 1),
	(5, 5, 1),
	(5, 6, 2),
	(5, 7, 1),
	(6, 5, 8),
	(7, 2, 6),
	(8, 1, 3),
	(8, 2, 3),
	(8, 4, 4),
	(8, 5, 3),
	(8, 5, 3),
	(8, 5, 4)
;	
-- Удалил изначально добавленные заказы несуществующего пользователя и сделал, что один пользователь не заказывает ничего (для проверки)
SELECT * FROM orders;
SELECT * FROM orders_products;
DELETE FROM orders_products WHERE order_id IN (4, 6, 8);
*/

-- Задание №1 Составьте список пользователей users, 
-- которые осуществили хотя бы один заказ orders в интернет магазине.
	
SELECT name FROM users 
RIGHT JOIN orders ON users.id = orders.user_id GROUP BY users.id

-- Задание № 2
-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name, c.name FROM products AS p
JOIN catalogs AS c
WHERE c.id = p.catalog_id;

SELECT * FROM catalogs;
	
	
-- задание 3
-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.
	
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255),
	`to` VARCHAR(255)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	`label` VARCHAR(255) PRIMARY KEY,
	`name` VARCHAR(255)
);

INSERT INTO flights (`from`, `to`)
VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
SELECT * FROM flights;

INSERT INTO cities (`label`, `name`)
VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
SELECT * FROM cities;

SELECT `from` FROM flights; 
SELECT name, `from` FROM flights 
RIGHT JOIN cities ON label = `from`;

SELECT id, (SELECT name FROM flights 
RIGHT JOIN cities SOME 'label' = `from`) FROM flights;

SELECT id, `from`, name FROM flights 
JOIN cities
SOME (SELECT name FROM flights 
RIGHT JOIN cities ON 'label' = `from` WHERE 'label' = 'moscow');

SELECT name FROM flights 
RIGHT JOIN cities ON 'label' = `from`;


SELECT `from` FROM cities
RIGHT JOIN flights ON `from` = 'label';









	
	