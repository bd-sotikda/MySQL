-- Урок 9
-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
-- Используйте транзакции.
-- алгоритм: проверяем наличие id с номером 1, если нет, делаем встаку из сложного запроса, удалем строку из таблицы

-- Создали таблицу sample.users
USE sample;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';
/* Расскоментировать для выполнения при проверке
-- Создали и наполнили таблицу shop.users
USE shop;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';
 INSERT INTO users_new (name, birthday_at) 
 VALUES 
 	('Светлана', '1988-02-04'),  
 	('Олег', '1998-03-20'),  
 	('Юлия', '2006-07-12');
*/

USE shop;
START TRANSACTION;
INSERT INTO sample.users(name, birthday_at, created_at, updated_at) SELECT shop.users.name, shop.users.birthday_at, shop.users.created_at, shop.users.updated_at FROM shop.users WHERE id = 1;
SAVEPOINT users_1;
SELECT * FROM sample.users;
DELETE FROM shop.users WHERE id = 1;
SELECT * FROM shop.users;
COMMIT;
ROLLBACK TO SAVEPOINT users_1;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products 
-- и соответствующее название каталога name из таблицы catalogs.

USE shop;
CREATE VIEW cat_new AS
SELECT products.name, catalogs.name part FROM products JOIN catalogs ON products.catalog_id = catalogs.id;
SELECT * FROM cat_new;
DROP VIEW cat_new;


