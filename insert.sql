USE delievery;

INSERT INTO users_adresses (city, street, house, flat) VALUES ('Moscow', 'first street', 4, 22),('Moscow', 'The Red Square', 1, 1),('Moscow', 'Fedorova Nikolaya', 22, 12),('Petrozavodsk', 'Lugovaya ', 14, 59),('Voronezh', 'Lermontova', 17, 4),('Khabarovsk','Mukhina', 9, 61),('Moscow', 'Noybrandenburgskaya', 19, 6),('Khabarovsk', 'Tikhookeanskaya', 197, 413),('Petrozavodsk', 'Ukrainskaya', 18, 1);

INSERT INTO `users` VALUES (1,'Alexey','89998887766','alex_89@mail.ru',1,1000),(2,'Ivan','89999998899','ivan_77@mail.ru',5,2000),(3,'Elena','89997778899','elena_90@mail.ru',3,5000),(4,'Igor','89009998899','igor_89@mail.ru',6,3000),(5,'Vladimir','89009998888','vladimir@mail.ru',2,10000),(6,'Daria','89002223344','daria_99@mail.ru',4,100),(7,'Julia','89997776655','julia_88@mail.ru',7,500),(8,'Petr','89998889988','petr_95@mail.ru',8,2000),(9,'Sergey','89998881122','sergey_93@mail.ru',9,1000),(10,'Max','89991112233','max_99@mail.ru',5,5000);

INSERT INTO `categories` VALUES (1,'pizza'),(2,'hamburgers'),(3,'desserts'),(4,'sushi'),(5,'japonese food'),(6,'seafood'),(7,'vietnam food'),(8,'italian food'),(9,'vegetarian');

INSERT INTO `restaurant_adresses` VALUES (1,'Moscow','Molodezhnyy',20,NULL),(2,'Novosibirsk','Zorge',304,NULL),(3,'Vladivostok','Pikhtovaya',8,NULL),(4,'Moscow','Severnaya',40,NULL),(5,'Petrozavodsk','Stroiteley',16,NULL),(6,'Voronezh','Truda',89,NULL),(7,'Khabarovsk','Lebedeva',7,NULL),(8,'Moscow','Moskovskiy',56,NULL),(9,'Petrozavodsk','Bogatkova',190,NULL),(10,'Moscow','Makarova Admirala',32,NULL);

INSERT INTO `restaurant` VALUES (1,'Island Grill','img1.png','89990001122','restaurant',1),(2,'Masala','img2.png','89991110099','restaurant',2),(3,'Veganic Corner','img3.png','89001110011','restaurant',3),(4,'Grandma’s Sweets','img4.png','89009990000','restaurant',4),(5,'Street Deli','img5.png','89001119988','restaurant',5),(6,'Mediterra Seafood','img6.png','89008889900','restaurant',6),(7,'Flavoroso','img7.png','89991110011','restaurant',7),(8,'PRODUCTS 24','img8.png','89001112211','store',8),(9,'Daily store','img9.png','89990001100','store',9),(10,'the nearest store','img10.png','89110002200','store',10);

INSERT INTO `restaurant_categories` VALUES (1,1),(5,1),(5,2),(4,3),(2,4),(7,4),(2,5),(6,5),(7,5),(1,6),(6,6),(2,7),(6,7),(7,7),(1,8),(7,8),(3,9),(7,9);

INSERT INTO `favoirite_restorants` VALUES (1,1),(2,1),(8,1),(9,1),(4,2),(5,2),(6,2),(10,2),(2,3),(3,3),(7,3),(10,3),(1,4),(4,4),(6,4),(7,4),(8,4),(9,4),(8,5),(3,6),(4,6),(5,6),(6,6),(7,6),(10,6),(1,7),(2,8),(5,8),(9,8),(3,9),(4,9),(7,9),(8,9),(9,9),(10,9),(1,10),(3,10),(6,10),(8,10);

INSERT INTO `courier` VALUES (1,'Egor','available',5000),(2,'Mihail','delievers',1000),(3,'Evgeniy','available',250),(4,'Igor','not available',0);

INSERT INTO `items` VALUES (1,'pizza1','pizza1.png',500.00,NULL,10,1),(2,'seafood1','seafood1.png',700.00,NULL,15,1),(3,'italian food1','italianfood1.png',600.00,NULL,10,1),(4,'sushi1','sushi1.png',400.00,NULL,50,2),(5,'japonese food1','japonesefood1.png',450.00,NULL,30,2),(6,'vietnam food1','vietnamfood1.png',350.00,NULL,40,2),(7,'vegetarian food1','vegeterianfood1.png',400.00,NULL,20,3),(8,'vegetarian food2','vegeterianfood2.png',550.00,NULL,30,3),(9,'desert1','desert1.png',300.00,NULL,10,4),(10,'desert2','desert2.png',350.00,NULL,15,4),(11,'pizza2','pizza2.png',400.00,NULL,20,5),(12,'pizza3','pizza3.png',450.00,NULL,30,5),(13,'hamburger2','hamburger2.png',450.00,NULL,30,5),(14,'hamburger3','hamburger3.png',500.00,NULL,30,5),(15,'japonese food1','japonesefood1.png',700.00,NULL,5,6),(16,'seafood1','seafood1.png',650.00,NULL,10,6),(17,'seafood2','seafood2.png',800.00,NULL,10,6),(18,'vietnam food2','vietnam food2.png',500.00,NULL,15,6),(19,'sushi1','sushi1.png',400.00,NULL,50,7),(20,'sushi2','sushi2.png',450.00,NULL,40,7),(21,'japonese food1','japonesefood1.png',600.00,NULL,15,7),(22,'vietnam food1','vietnamfood1.png',500.00,NULL,10,7),(23,'italian food1','italianfood1.png',600.00,NULL,20,7),(24,'vegeterian food1','vegeterianfood1.png',600.00,NULL,15,7),(25,'goods1','goods1.png',100.00,NULL,100,8),(26,'goods2','goods2.png',150.00,NULL,100,8),(27,'goods1','goods1.png',99.00,NULL,200,9),(28,'goods3','goods3.png',300.00,NULL,200,9),(29,'goods2','goods2,png',150.00,NULL,300,10);

INSERT INTO `orders` VALUES (1,2,2,6,'in progress'),(2,1,1,9,'not paid'),(3,7,2,4,'not paid'),(4,3,4,5,'delievered');

INSERT INTO `items_in_order` VALUES (3,4,9),(4,5,11),(4,5,12),(4,5,13),(1,6,15),(1,6,16),(2,9,27),(2,9,28);

INSERT INTO `reviews` VALUES (1,5,'good restaurant','5'),(2,5,'','4'),(3,5,'','5'),(6,5,'long delivery','4'),(5,7,'long delivery','3'),(2,8,'','5');

INSERT INTO income(restaurant_id, income, score) VALUES (1, 0, '1234 5678 9012 3456'), (2, 1000, '0000 0000 0000 0000'), (3, 0, '1111 2222 3333 4444'), (4, 50, '1111 1111 1111 1111'), (5, 5000, '0000 9999 1111 2222'), (6, 10000, '0987 6543 2109 8765'), (7, 7000, '1234 1234 1234 1234'), (8, 9000, '9999 9999 9999 9999'), (9, 500, '1111 1111 1111 1112');

INSERT INTO receipts(order_id, total, income) VALUES (1, 1350, 270), (4, 1300, 260); 