DROP DATABASE IF EXISTS delievery;
CREATE DATABASE IF NOT EXISTS delievery; 
USE delievery;


CREATE TABLE IF NOT EXISTS users_adresses(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	city VARCHAR(255) NOT NULL COMMENT 'Город', 
	street VARCHAR(255) NOT NULL COMMENT 'Улица', 
	house decimal NOT NULL COMMENT 'Дом', 
	flat decimal NOT NULL COMMENT 'Квартира', 	
	flat_floor decimal COMMENT 'Этаж',
	intercom varchar(255) COMMENT 'Домофон', 
	comment varchar(255) COMMENT 'Коментарий для курьера'
) COMMENT = 'Таблица адресов пользователей';

CREATE TABLE IF NOT EXISTS users(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'Имя пользователя', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'Номер телефона',
	email VARCHAR(255) NOT NULL COMMENT 'Email',
	default_adress BIGINT UNSIGNED NOT NULL COMMENT 'Выбранный адрес',
	balance BIGINT UNSIGNED COMMENT 'Баланс пользователя',
	FOREIGN KEY (default_adress) REFERENCES users_adresses(id)
) COMMENT = 'Таблица пользователей';

CREATE TABLE IF NOT EXISTS restaurant_adresses(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	city VARCHAR(255) NOT NULL COMMENT 'Город', 
	street VARCHAR(255) NOT NULL COMMENT 'Улица', 
	house decimal NOT NULL COMMENT 'Дом', 
	comment varchar(255) COMMENT 'Коментарии'
) COMMENT = 'Таблица адресов ресторанов';

CREATE TABLE IF NOT EXISTS restaurant(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'Название ресторана или магазина', 
	photo varchar(255) NOT NULL COMMENT 'Фото ресторана или магазина', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'Номер телефона',
	is_restaurant enum('restaurant','store') NOT NULL COMMENT 'Чем является заведение - рестораном или магазином',
	available_adress BIGINT UNSIGNED NOT NULL COMMENT 'Выбранный адрес',
	FOREIGN KEY (available_adress) REFERENCES restaurant_adresses(id)
) COMMENT = 'Таблица ресторанов или магазинов';

CREATE TABLE IF NOT EXISTS favoirite_restorants(
	user_id  BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(user_id, restoraunt_id),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
) COMMENT = 'Таблица избранного пользователей';

CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'Название категории'
) COMMENT = 'Таблица категорий для ресторанов или магазинов';

CREATE TABLE IF NOT EXISTS restaurant_categories(
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	categories_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(restoraunt_id, categories_id),
	FOREIGN KEY (categories_id) REFERENCES categories (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
)COMMENT = 'Таблица соотношения категорий и ресторанов\магазинов';

 CREATE TABLE IF NOT EXISTS items (
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'Название позиции меню\продукта', 
	photo VARCHAR(255) NOT NULL COMMENT 'Фотография', 
	price DECIMAL (11,2) NOT NULL COMMENT 'Цена',
	desription TEXT COMMENT 'Описание',
	ammount INT UNSIGNED NOT NULL COMMENT 'Количество',
	id_place BIGINT UNSIGNED NOT NULL COMMENT 'id ресторана\магазина',
	FOREIGN KEY (id_place) REFERENCES restaurant(id)
) COMMENT = 'Таблица позиций меню';

CREATE TABLE IF NOT EXISTS reviews(
	user_id BIGINT UNSIGNED NOT NULL,
	restoraunt_id BIGINT UNSIGNED NOT NULL,
	review text COMMENT 'Текст отзыва', 
	mark enum('1','2','3','4','5') NOT NULL COMMENT 'Оценка',
	PRIMARY KEY(restoraunt_id, user_id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
)COMMENT = 'Таблица отзывов';

CREATE TABLE IF NOT EXISTS courier(
	id SERIAL PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(255) NOT NULL COMMENT 'Имя курьера', 
	status ENUM('available', 'delievers', 'not available') COMMENT 'Статус курьера', 
	balance BIGINT UNSIGNED COMMENT 'Баланс счета курьера'
)COMMENT = 'Таблица курьеров';

CREATE TABLE IF NOT EXISTS orders(
	id SERIAL PRIMARY KEY AUTO_INCREMENT, 
	user_id BIGINT UNSIGNED NOT NULL,
	courier_id BIGINT UNSIGNED NOT NULL, 
	restoraunt_id BIGINT UNSIGNED NOT NULL, 
	status ENUM('not paid', 'in progress', 'delievered') COMMENT 'Статус заказа', 
	FOREIGN KEY (user_id) REFERENCES users (id), 
	FOREIGN KEY (courier_id) REFERENCES courier (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
)COMMENT = 'Таблица заказов';

CREATE TABLE IF NOT EXISTS items_in_order(
	order_id BIGINT UNSIGNED NOT NULL, 
	restoraunt_id BIGINT UNSIGNED NOT NULL, 
	items_id BIGINT UNSIGNED NOT NULL, 
	PRIMARY KEY (order_id, restoraunt_id, items_id), 
	FOREIGN KEY (order_id) REFERENCES orders (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id),
	FOREIGN KEY (items_id) REFERENCES items (id)
)COMMENT = 'Таблица позиций в заказе'; 

CREATE TABLE IF NOT EXISTS income(
	restaurant_id BIGINT UNSIGNED NOT NULL PRIMARY KEY, 
	income BIGINT UNSIGNED, 
	score VARCHAR(255) NOT NULL,
	FOREIGN KEY (restaurant_id) REFERENCES restaurant (id)	
)COMMENT = 'Таблица баланса и реквезитов ресторанов'; 

CREATE TABLE IF NOT EXISTS receipts(
	order_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	total BIGINT UNSIGNED NOT NULL,
	income BIGINT UNSIGNED NOT NULL COMMENT = 'Прибыль системы', 
	FOREIGN KEY (order_id) REFERENCES orders (id)	
) COMMENT = 'Таблица чеков по заказам';
