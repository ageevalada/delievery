-- ���������� ���� ������ ����� �������� ��� 
DROP DATABASE IF EXISTS delievery;
CREATE DATABASE IF NOT EXISTS delievery; 
USE delievery;

-- ������� ������� ������� �������������
CREATE TABLE IF NOT EXISTS users_adresses(
	id SERIAL PRIMARY KEY,
	city VARCHAR(255) NOT NULL COMMENT '�����', 
	street VARCHAR(255) NOT NULL COMMENT '�����', 
	house decimal NOT NULL COMMENT '���', 
	flat decimal NOT NULL COMMENT '��������', 	
	flat_floor decimal COMMENT '����',
	intercom varchar(255) COMMENT '�������', 
	comment varchar(255) COMMENT '�������������� ����������'
) COMMENT = '������ �������������';

-- ������� ������� �������������
 CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT '���', 
	phone_number VARCHAR(255) NOT NULL COMMENT '����� ��������',
	email VARCHAR(255) NOT NULL COMMENT 'Email',
	default_adress BIGINT UNSIGNED NOT NULL COMMENT '�����',
	balance BIGINT UNSIGNED COMMENT '������ ������������',
	FOREIGN KEY (default_adress) REFERENCES users_adresses(id)
) COMMENT = '������������';

-- ������ ����������
CREATE TABLE IF NOT EXISTS restaurant_adresses(
	id SERIAL PRIMARY KEY,
	city VARCHAR(255) NOT NULL COMMENT '�����', 
	street VARCHAR(255) NOT NULL COMMENT '�����', 
	house decimal NOT NULL COMMENT '���', 
	comment varchar(255) COMMENT '�������������� ����������'
) COMMENT = '������ ����������';

-- ���������/�������� 
 CREATE TABLE IF NOT EXISTS restaurant (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT '��������� ���������\��������', 
	photo varchar(255) NOT NULL COMMENT '�������� ���� ���������\��������', 
	phone_number VARCHAR(255) NOT NULL COMMENT '����� ��������',
	is_restaurant enum('restaurant','store') NOT NULL COMMENT '�������� ��� �������',
	available_adress BIGINT UNSIGNED NOT NULL COMMENT '�����',
	FOREIGN KEY (available_adress) REFERENCES restaurant_adresses(id)
) COMMENT = '���������/��������';

-- ���������
CREATE TABLE IF NOT EXISTS favoirite_restorants(
	user_id  BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(user_id, restoraunt_id),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
);

-- ��������� ��� ���������� � ���������
CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT '��������� ����������'
) COMMENT = '��������� ��� ���������� � ���������';

-- ��������� � �� ���������
CREATE TABLE IF NOT EXISTS restaurant_categories(
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	categories_id  BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(restoraunt_id, categories_id),
	FOREIGN KEY (categories_id) REFERENCES categories (id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id)
)COMMENT = '��������� � �� ���������';

-- �������� �������
 CREATE TABLE IF NOT EXISTS items (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL COMMENT '�������� ������� ����\��������\������', 
	photo varchar(255) NOT NULL COMMENT '���� ������� ����\��������\������', 
	price DECIMAL (11,2) NOT NULL COMMENT '����',
	desription TEXT COMMENT '��������',
	ammount INT UNSIGNED NOT NULL COMMENT '����������',
	id_place BIGINT UNSIGNED NOT NULL COMMENT '�����',
	FOREIGN KEY (id_place) REFERENCES restaurant(id)
) COMMENT = '�������� �������';

CREATE TABLE IF NOT EXISTS reviews(
	user_id BIGINT UNSIGNED NOT NULL,
	restoraunt_id  BIGINT UNSIGNED NOT NULL,
	review text COMMENT '�����', 
	mark enum('1','2','3','4','5') NOT NULL COMMENT '������',
	PRIMARY KEY(restoraunt_id, user_id),
	FOREIGN KEY (restoraunt_id) REFERENCES restaurant (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
)COMMENT = '������';


