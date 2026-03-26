-- 1. SELECT - отримання даних


-- 1.1. Перегляд усіх клієнтів
SELECT client_id, surname, firstname, email
FROM client;

-- 1.2. Перегляд усіх категорій
SELECT category_id, name
FROM category;

-- 1.3. Перегляд усіх брендів
SELECT brand_id, name, country
FROM brand;

-- 1.4. Перегляд усіх товарів
SELECT product_id, name, model, price, stock_quantity
FROM products;

-- 1.5. Вибір товарів дорожче 500
SELECT product_id, name, model, price
FROM products
WHERE price > 500;

-- 1.6. Вибір товарів, яких на складі менше 10
SELECT product_id, name, model, stock_quantity
FROM products
WHERE stock_quantity < 10;

-- 1.7. Перегляд усіх замовлень зі статусом completed
SELECT order_id, client_id, order_date, status, buy_price
FROM orders
WHERE status = 'pending';

-- 1.8. Перегляд замовлень на суму більше 900
SELECT order_id, client_id, buy_price
FROM orders
WHERE buy_price > 900;

-- 1.9. Об'єднання таблиць: клієнти та їхні замовлення
SELECT o.order_id,
       c.surname,
       c.firstname,
       o.order_date,
       o.status,
       o.buy_price
FROM orders o
JOIN client c ON o.client_id = c.client_id;

-- 1.10. Об'єднання таблиць: товари, бренди, категорії
SELECT p.product_id,
       p.name,
       p.model,
       b.name AS brand,
       c.name AS category,
       p.price
FROM products p
JOIN brand b ON p.brand_id = b.brand_id
JOIN category c ON p.category_id = c.category_id;

-- 1.11. Деталі замовлень з назвами товарів
SELECT oi.item_id,
       oi.order_id,
       p.name,
       p.model,
       oi.quantity,
       oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 1.12. Перегляд оплат зі статусом paid
SELECT payment_id, order_id, type, status
FROM payment
WHERE status = 'paid';



-- 2. INSERT - додавання нових даних

-- 2.1. Додавання нового клієнта
INSERT INTO client (client_id, surname, firstname, email)
VALUES (1, 'Shevchenko', 'Petro', 'petro@gmail.com');

-- Перевірка
SELECT client_id, surname, firstname, email
FROM client
WHERE email = 'andrii@gmail.com';

-- 2.2. Додавання нового бренду
INSERT INTO brand (name, country) VALUES
('Apple', 'USA'),
('Samsung', 'South Korea'),
('Dell', 'USA'),
('HP', 'USA'),
('Lenovo', 'China'),
('Asus', 'Taiwan'),
('Acer', 'Taiwan'),
('Sony', 'Japan'),
('LG', 'South Korea'),
('Logitech', 'Switzerland'),
('Microsoft', 'USA'),
('Huawei', 'China');

-- Перевірка
SELECT brand_id, name, country
FROM brand
WHERE name = 'Dell';

-- 2.3. Додавання нового товару
INSERT INTO products (brand_id, category_id, name, price, model, warranty_months, stock_quantity) VALUES
(1, 1, 'Laptop', 1300, 'MacBook Pro', 12, 5),
(3, 1, 'Laptop', 1100, 'Inspiron 15', 24, 14),
(4, 1, 'Laptop', 1000, 'Pavilion 14', 12, 10),
(5, 1, 'Laptop', 900, 'IdeaPad 3', 12, 18),
(6, 1, 'Laptop', 950, 'ZenBook', 12, 9),

(2, 1, 'Smartphone', 900, 'Galaxy S23', 12, 20),
(1, 1, 'Smartphone', 1200, 'iPhone 14', 12, 15),
(12, 1, 'Smartphone', 700, 'Huawei P50', 12, 12),

(8, 2, 'Headphones', 200, 'WH-1000XM5', 12, 10),
(9, 2, 'Headphones', 150, 'LG Tone', 12, 13);

-- Перевірка
SELECT product_id, name, model, price, stock_quantity
FROM products
WHERE model = 'Inspiron 15';

-- 2.4. Додавання нового замовлення
INSERT INTO orders (client_id, order_date, status, buy_price)
VALUES (10, '2026-03-26', 'pending', 100),
(9, '2026-03-26', 'pending', 1155),
(10, '2026-03-26', 'pending', 8000);



-- Перевірка
SELECT order_id, client_id, order_date, status, buy_price
FROM orders
WHERE client_id = 6;

-- 2.5. Додавання позиції до замовлення
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (6, 9, 1, 1100);

-- Перевірка
SELECT item_id, order_id, product_id, quantity, price
FROM order_items
WHERE order_id = 6;

-- 2.6. Додавання інформації про оплату
INSERT INTO payment (order_id, type, status)
VALUES (6, 'card', 'pending');

-- Перевірка
SELECT payment_id, order_id, type, status
FROM payment
WHERE order_id = 6;




-- 3. UPDATE - зміна існуючих даних


-- 3.1. Перевірка товару перед оновленням
SELECT product_id, name, model, price, stock_quantity
FROM products
WHERE product_id = 7;

-- 3.2. Оновлення кількості товару на складі для product_id = 12
UPDATE products
SET stock_quantity = 5
WHERE product_id =12;

-- Перевірка після оновлення
SELECT product_id, name, model, price, stock_quantity
FROM products
WHERE product_id = 12;

-- 3.3. Перевірка клієнта перед оновленням email
SELECT client_id, surname, firstname, email
FROM client
WHERE client_id = 1;

-- 3.4. Оновлення email клієнта
UPDATE client
SET email = 'ivan.petrov@gmail.com'
WHERE client_id = 1;

-- Перевірка після оновлення
SELECT client_id, surname, firstname, email
FROM client
WHERE client_id = 1;

-- 3.5. Перевірка замовлення перед оновленням статусу
SELECT order_id, status, buy_price
FROM orders
WHERE order_id = 3;

-- 3.6. Оновлення статусу замовлення
UPDATE orders
SET status = 'completed'
WHERE order_id = 3;

-- Перевірка після оновлення
SELECT order_id, status, buy_price
FROM orders
WHERE order_id = 3;

-- 3.7. Перевірка оплати перед оновленням
SELECT payment_id, order_id, type, status
FROM payment
WHERE order_id = 3;

-- 3.8. Оновлення статусу оплати
UPDATE payment
SET status = 'paid'
WHERE order_id = 3;

-- Перевірка після оновлення
SELECT payment_id, order_id, type, status
FROM payment
WHERE order_id = 3;




-- 4. DELETE - видалення даних

-- 4.1. Перевірка рядка перед видаленням з order_items
SELECT item_id, order_id, product_id, quantity, price
FROM order_items
WHERE order_id = 6 AND product_id = 9;

-- 4.2. Видалення позиції замовлення
DELETE FROM order_items
WHERE order_id = 6 AND product_id = 9;

-- Перевірка після видалення
SELECT item_id, order_id, product_id, quantity, price
FROM order_items
WHERE order_id = 6 AND product_id = 9;

-- 4.3. Перевірка оплати перед видаленням
SELECT payment_id, order_id, type, status
FROM payment
WHERE order_id = 6;

-- 4.4. Видалення інформації про оплату
DELETE FROM payment
WHERE order_id = 6;

-- Перевірка після видалення
SELECT payment_id, order_id, type, status
FROM payment
WHERE order_id = 6;

-- 4.5. Перевірка замовлення перед видаленням
SELECT order_id, client_id, order_date, status, buy_price
FROM orders
WHERE order_id = 6;

-- 4.6. Видалення замовлення
DELETE FROM orders
WHERE order_id = 6;

-- Перевірка після видалення
SELECT order_id, client_id, order_date, status, buy_price
FROM orders
WHERE order_id = 6;

--Видалити клієнта
DELETE FROM client
WHERE client_id = 11;
--Видалити бренд
DELETE FROM brand
WHERE brand_id = 14;
-- 5. ПЕРЕВІРКА ДАНИХ У ТАБЛИЦЯХ

SELECT * FROM client;
SELECT * FROM category;
SELECT * FROM brand;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payment;
