-- Реализация базы данных сайта доставки еды 
DROP DATABASE IF EXISTS delievery;
CREATE DATABASE IF NOT EXISTS delievery; 
USE delievery;

-- созадем таблицу адресов пользователей
CREATE TABLE IF NOT EXISTS users_adresses(
	id SERIAL PRIMARY KEY,
	city VARCHAR(255) NOT NULL COMMENT 'Город', 
	street VARCHAR(255) NOT NULL COMMENT 'Улица', 
	house decimal NOT NULL COMMENT 'Дом', 
	flat decimal NOT NULL COMMENT 'Квартира', 	
	flat_floor decimal COMMENT 'Этаж',
	intercom varchar(255) COMMENT 'Домофон', 
	comment varchar(255) COMMENT 'Дополнительная информация'
) COMMENT = 'Адреса пользователей';

-- созадем таблицу пользователей
 CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT 'Имя', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'Номер телефона',
	email VARCHAR(255) NOT NULL COMMENT 'Email',
	default_adress BIGINT UNSIGNED NOT NULL COMMENT 'Адрес',
	balance BIGINT UNSIGNED COMMENT 'Баланс пользователя',
	FOREIGN KEY (default_adress) REFERENCES users_adresses(id)
) COMMENT = 'Пользователи';

-- адреса ресторанов
CREATE TABLE IF NOT EXISTS restaurant_adresses(
	id SERIAL PRIMARY KEY,
	city VARCHAR(255) NOT NULL COMMENT 'Город', 
	street VARCHAR(255) NOT NULL COMMENT 'Улица', 
	house decimal NOT NULL COMMENT 'Дом', 
	comment varchar(255) COMMENT 'Дополнительная информация'
) COMMENT = 'Адреса ресторанов';

-- растораны/магазины 
 CREATE TABLE IF NOT EXISTS restaurant (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT 'Назавание ресторана\магазина', 
	photo varchar(255) NOT NULL COMMENT 'Основное фото ресторана\магазина', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'Номер телефона',
	is_restaurant enum('restaurant','store') NOT NULL COMMENT 'Ресторан или магазин',
	available_adress BIGINT UNSIGNED NOT NULL COMMENT 'Адрес',
	FOREIGN KEY (available_adress) REFERENCES restaurant_adresses(id)
) COMMENT = 'Рестораны/Магазины';

-- избранное
CREATE TABLE IF NOT EXISTS favoirite_restorants(
	user_id  BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(user_id, restoraunt_id),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
);

-- категории для ресторанов и магазинов
CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT 'Категории ресторанов'
) COMMENT = 'Категории для ресторанов и магазинов';

-- рестораны и их категории
CREATE TABLE IF NOT EXISTS restaurant_categories(
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	categories_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(restoraunt_id, categories_id),
	FOREIGN KEY (categories_id) REFERENCES categories (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
)COMMENT = 'Рестораны и их категории';

-- товарные позиции
 CREATE TABLE IF NOT EXISTS items (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT 'Название позиции меню\продукта\товара', 
	photo varchar(255) NOT NULL COMMENT 'Фото позиции меню\продукта\товара', 
	price DECIMAL (11,2) NOT NULL COMMENT 'Цена',
	desription TEXT COMMENT 'Описание',
	ammount INT UNSIGNED NOT NULL COMMENT 'Количество',
	id_place BIGINT UNSIGNED NOT NULL COMMENT 'Место',
	FOREIGN KEY (id_place) REFERENCES restaurant(id)
) COMMENT = 'Товарные позиции';

CREATE TABLE IF NOT EXISTS reviews(
	user_id BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	review text COMMENT 'Отзыв', 
	mark enum('1','2','3','4','5') NOT NULL COMMENT 'Оценка',
	PRIMARY KEY(restoraunt_id, user_id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
)COMMENT = 'Отзывы';


