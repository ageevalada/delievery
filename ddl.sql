-- Р РµР°Р»РёР·Р°С†РёСЏ Р±Р°Р·С‹ РґР°РЅРЅС‹С… СЃР°Р№С‚Р° РґРѕСЃС‚Р°РІРєРё РµРґС‹ 
DROP DATABASE IF EXISTS delievery;
CREATE DATABASE IF NOT EXISTS delievery; 
USE delievery;

-- СЃРѕР·Р°РґРµРј С‚Р°Р±Р»РёС†Сѓ Р°РґСЂРµСЃРѕРІ РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№
CREATE TABLE IF NOT EXISTS users_adresses(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	city VARCHAR(255) NOT NULL COMMENT 'Р“РѕСЂРѕРґ', 
	street VARCHAR(255) NOT NULL COMMENT 'РЈР»РёС†Р°', 
	house decimal NOT NULL COMMENT 'Р”РѕРј', 
	flat decimal NOT NULL COMMENT 'РљРІР°СЂС‚РёСЂР°', 	
	flat_floor decimal COMMENT 'Р­С‚Р°Р¶',
	intercom varchar(255) COMMENT 'Р”РѕРјРѕС„РѕРЅ', 
	comment varchar(255) COMMENT 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ'
) COMMENT = 'РђРґСЂРµСЃР° РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№';

-- СЃРѕР·Р°РґРµРј С‚Р°Р±Р»РёС†Сѓ РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№
 CREATE TABLE IF NOT EXISTS users(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'Р�РјСЏ', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'РќРѕРјРµСЂ С‚РµР»РµС„РѕРЅР°',
	email VARCHAR(255) NOT NULL COMMENT 'Email',
	default_adress BIGINT UNSIGNED NOT NULL COMMENT 'РђРґСЂРµСЃ',
	balance BIGINT UNSIGNED COMMENT 'Р‘Р°Р»Р°РЅСЃ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ',
	FOREIGN KEY (default_adress) REFERENCES users_adresses(id)
) COMMENT = 'РџРѕР»СЊР·РѕРІР°С‚РµР»Рё';

-- Р°РґСЂРµСЃР° СЂРµСЃС‚РѕСЂР°РЅРѕРІ
CREATE TABLE IF NOT EXISTS restaurant_adresses(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	city VARCHAR(255) NOT NULL COMMENT 'Р“РѕСЂРѕРґ', 
	street VARCHAR(255) NOT NULL COMMENT 'РЈР»РёС†Р°', 
	house decimal NOT NULL COMMENT 'Р”РѕРј', 
	comment varchar(255) COMMENT 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ'
) COMMENT = 'РђРґСЂРµСЃР° СЂРµСЃС‚РѕСЂР°РЅРѕРІ';

-- СЂР°СЃС‚РѕСЂР°РЅС‹/РјР°РіР°Р·РёРЅС‹ 
 CREATE TABLE IF NOT EXISTS restaurant(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'РќР°Р·Р°РІР°РЅРёРµ СЂРµСЃС‚РѕСЂР°РЅР°\РјР°РіР°Р·РёРЅР°', 
	photo varchar(255) NOT NULL COMMENT 'РћСЃРЅРѕРІРЅРѕРµ С„РѕС‚Рѕ СЂРµСЃС‚РѕСЂР°РЅР°\РјР°РіР°Р·РёРЅР°', 
	phone_number VARCHAR(255) NOT NULL COMMENT 'РќРѕРјРµСЂ С‚РµР»РµС„РѕРЅР°',
	is_restaurant enum('restaurant','store') NOT NULL COMMENT 'Р РµСЃС‚РѕСЂР°РЅ РёР»Рё РјР°РіР°Р·РёРЅ',
	available_adress BIGINT UNSIGNED NOT NULL COMMENT 'РђРґСЂРµСЃ',
	FOREIGN KEY (available_adress) REFERENCES restaurant_adresses(id)
) COMMENT = 'Р РµСЃС‚РѕСЂР°РЅС‹/РњР°РіР°Р·РёРЅС‹';

-- РёР·Р±СЂР°РЅРЅРѕРµ
CREATE TABLE IF NOT EXISTS favoirite_restorants(
	user_id  BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(user_id, restoraunt_id),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
);

-- РєР°С‚РµРіРѕСЂРёРё РґР»СЏ СЂРµСЃС‚РѕСЂР°РЅРѕРІ Рё РјР°РіР°Р·РёРЅРѕРІ
CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'РљР°С‚РµРіРѕСЂРёРё СЂРµСЃС‚РѕСЂР°РЅРѕРІ'
) COMMENT = 'РљР°С‚РµРіРѕСЂРёРё РґР»СЏ СЂРµСЃС‚РѕСЂР°РЅРѕРІ Рё РјР°РіР°Р·РёРЅРѕРІ';

-- СЂРµСЃС‚РѕСЂР°РЅС‹ Рё РёС… РєР°С‚РµРіРѕСЂРёРё
CREATE TABLE IF NOT EXISTS restaurant_categories(
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	categories_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(restoraunt_id, categories_id),
	FOREIGN KEY (categories_id) REFERENCES categories (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
)COMMENT = 'Р РµСЃС‚РѕСЂР°РЅС‹ Рё РёС… РєР°С‚РµРіРѕСЂРёРё';

-- С‚РѕРІР°СЂРЅС‹Рµ РїРѕР·РёС†РёРё
 CREATE TABLE IF NOT EXISTS items (
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL COMMENT 'РќР°Р·РІР°РЅРёРµ РїРѕР·РёС†РёРё РјРµРЅСЋ\РїСЂРѕРґСѓРєС‚Р°\С‚РѕРІР°СЂР°', 
	photo VARCHAR(255) NOT NULL COMMENT 'Р¤РѕС‚Рѕ РїРѕР·РёС†РёРё РјРµРЅСЋ\РїСЂРѕРґСѓРєС‚Р°\С‚РѕРІР°СЂР°', 
	price DECIMAL (11,2) NOT NULL COMMENT 'Р¦РµРЅР°',
	desription TEXT COMMENT 'РћРїРёСЃР°РЅРёРµ',
	ammount INT UNSIGNED NOT NULL COMMENT 'РљРѕР»РёС‡РµСЃС‚РІРѕ',
	id_place BIGINT UNSIGNED NOT NULL COMMENT 'РњРµСЃС‚Рѕ',
	FOREIGN KEY (id_place) REFERENCES restaurant(id)
) COMMENT = 'РўРѕРІР°СЂРЅС‹Рµ РїРѕР·РёС†РёРё';

CREATE TABLE IF NOT EXISTS reviews(
	user_id BIGINT UNSIGNED NOT NULL,
	restoraunt_id BIGINT UNSIGNED NOT NULL,
	review text COMMENT 'РћС‚Р·С‹РІ', 
	mark enum('1','2','3','4','5') NOT NULL COMMENT 'РћС†РµРЅРєР°',
	PRIMARY KEY(restoraunt_id, user_id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
)COMMENT = 'РћС‚Р·С‹РІС‹';

-- таблица курьеров
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
