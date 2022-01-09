-- любимые рестораны пользователя 

CREATE PROCEDURE users_favoirite_restorants (IN value bigint)
BEGIN 
	SELECT *
	FROM favoirite_restorants
	INNER JOIN restaurant ON favoirite_restorants.restoraunt_id = restaurant.id 
	WHERE favoirite_restorants.user_id = value;
END

CALL users_favoirite_restorants(2)


-- вывод меню ресторана
CREATE PROCEDURE filter_menu(IN value bigint)
BEGIN 
	SELECT *
	FROM items
	WHERE items.id_place = value;
END

CALL filter_menu(5)

-- совершение покупки
CREATE PROCEDURE perform_payment(IN value bigint)
BEGIN 
	SELECT @uid := orders_and_prices.user_id FROM orders_and_prices WHERE orders_and_prices.id = value;
	SELECT @cid := orders_and_prices.courier_id FROM orders_and_prices WHERE orders_and_prices.id = value;
	SELECT @rid := orders_and_prices.restoraunt_id FROM orders_and_prices WHERE orders_and_prices.id = value;
	SELECT @total := orders_and_prices.total FROM orders_and_prices WHERE orders_and_prices.id = value;

	IF ((SELECT users.balance - @total FROM users WHERE users.id = @uid) >= 0 
	AND (SELECT orders.status FROM orders WHERE orders.id = value) = 'not paid') THEN 
		START TRANSACTION; 
		UPDATE users SET users.balance = users.balance - @total WHERE users.id = @uid;
		UPDATE income SET income.income = income.income + @total*0.7 WHERE income.restaurant_id = @rid;
		UPDATE courier SET courier.balance = courier.balance + @total*0.1 WHERE courier.id = @cid;		
		INSERT INTO receipts (order_id, total, income) VALUES (value, @total, @total*0.2);
		UPDATE orders SET orders.status = 'in progress' WHERE orders.id = value;
		UPDATE courier SET courier.status = 'delievers' WHERE courier.id = @cid;
		COMMIT;
	
	ELSE SELECT 'Недостаточно средств для оплаты';
	END IF; 
END 
	
CALL perform_payment(2);
SELECT * FROM orders; 
SELECT * FROM orders_and_prices;
SELECT * FROM users WHERE users.id = 1;
SELECT * FROM receipts; 
SELECT * FROM income WHERE income.restaurant_id = 9;
SELECT * FROM courier WHERE courier.id = 1;

-- вывод информации по заказу для курьера
CREATE PROCEDURE order_details(IN value bigint)
BEGIN 
	SELECT users.name, users.phone_number, users_adresses.*, restaurant.name, restaurant.phone_number, restaurant_adresses.*
	FROM orders
	INNER JOIN users ON orders.user_id = users.id 
	INNER JOIN users_adresses ON users_adresses.id = users.default_adress 
	INNER JOIN restaurant ON orders.restoraunt_id = restaurant.id 
	INNER JOIN restaurant_adresses ON restaurant_adresses.id = restaurant.available_adress
	WHERE orders.id = value;
END

CALL order_details(3);