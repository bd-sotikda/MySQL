-- Задание ко второму уроку часть 2
/*
 * Создайте базу данных example. 
 * Разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
 * 
 */
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(100) COMMENT 'Имя пользователя'
);

-- Задание ко второму уроку часть 3
/*
 * * Создайте дамп базы данных example из предыдущего задания. 
 * Разверните содержимое дампа в новую базу данных sample.
 * 
 * Командная строка для создания дампа базы example (но не получится восстановить в БД sample без правки в файле dump.sql)
 * mysqldump --user=root --password=12 --result-file=/home/dim/dump.sql --databases example
 * 
 * Второй вариант - создать дамп таблицы users
 * mysqldump --user=root --password=12 --result-file=/home/dim/dump2.sql example users
 * 
 */

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
/*
 * Командная строка для восстановления базы sample из дампа
 * mysql sample < ~/dump2.sql
 * 
 */

-- Задание ко второму уроку часть 4
/*
 * Создайте дамп единственной таблицы help_keyword базы данных mysql. 
 * Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
 * 
 * Командная строка для создания дампа базы mysql таблица help_keyword
 * mysqldump -u root -p --result-file=/home/dim/dump_k.sql mysql help_keyword --where="help_keyword_id<=100";
*/
