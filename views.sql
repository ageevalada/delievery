-- рестораны с лучшими отзывами(рейтинговые)
CREATE VIEW top_restaurants AS 
SELECT restaurant.*, avg(CONVERT(mark, UNSIGNED)) AS rating 
FROM reviews
INNER JOIN restaurant ON reviews.restoraunt_id = restaurant.id 
GROUP BY reviews.restoraunt_id
ORDER BY rating DESC;

SELECT * FROM top_restaurants;

-- итоговая сумма заказа
CREATE VIEW orders_and_prices AS
SELECT orders.*, prices.total 
FROM orders
INNER JOIN 
(SELECT items_in_order.order_id, sum(items.price) AS total
FROM items_in_order 
INNER JOIN items
ON items_in_order.items_id = items.id
GROUP BY items_in_order.order_id ) AS prices
ON orders.id = prices.order_id;

SELECT * FROM orders_and_prices;

-- популярные рестораны
CREATE VIEW popular_restaurants AS
SELECT restaurant.*, res.ammount
FROM restaurant 
INNER JOIN (SELECT favoirite_restorants.restoraunt_id, count(favoirite_restorants.restoraunt_id) AS ammount
FROM favoirite_restorants
GROUP BY favoirite_restorants.restoraunt_id) AS res ON restaurant.id = res.restoraunt_id
ORDER BY res.ammount DESC
LIMIT 5;

SELECT * FROM popular_restaurants ;