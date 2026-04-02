-- кількість замовлень
SELECT COUNT(*) AS total_orders
FROM orders;

-- загальна сума продажів
SELECT SUM(buy_price) AS total_sales
FROM orders;

-- середня ціна товарів
SELECT AVG(price) AS avg_price
FROM products;

-- мінімальна і максимальна ціна
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;

-- кількість товарів
SELECT COUNT(*) AS total_products
FROM products;

-- кількість замовлень по клієнтах
SELECT client_id, COUNT(*) AS order_count
FROM orders
GROUP BY client_id;

-- сума витрат кожного клієнта
SELECT client_id, SUM(buy_price) AS total_spent
FROM orders
GROUP BY client_id;

-- кількість товарів по категоріях
SELECT category_id, COUNT(*) AS product_count
FROM products
GROUP BY category_id;

-- середня ціна по брендах
SELECT brand_id, AVG(price) AS avg_price
FROM products
GROUP BY brand_id;

-- клієнти, які витратили більше 1000
SELECT client_id, SUM(buy_price) AS total_spent
FROM orders
GROUP BY client_id
HAVING SUM(buy_price) > 1000;

-- бренди з більше ніж 1 товаром
SELECT brand_id, COUNT(*) AS product_count
FROM products
GROUP BY brand_id
HAVING COUNT(*) > 1;
-- INNER JOIN
-- клієнти та їх замовлення
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         JOIN orders o USING(client_id);
-- LEFT JOIN
-- всі клієнти навіть без замовлень
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id
FROM client c
         LEFT JOIN orders o USING(client_id);
-- RIGHT JOIN
-- вивести всі замовлення та відповідних клієнтів (навіть якщо клієнта немає)
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         RIGHT JOIN orders o USING(client_id);
-- товари + бренд + категорія
SELECT p.name AS product_name,
       b.name AS brand,
       c.name AS category,
       p.price
FROM products p
         JOIN brand b USING(brand_id)
         JOIN category c USING(category_id);
-- клієнти та куплені товари
SELECT cl.firstname || ' ' || cl.surname AS full_name,
       p.name AS product_name,
       oi.quantity
FROM client cl
         JOIN orders o USING(client_id)
         JOIN order_items oi USING(order_id)
         JOIN products p USING(product_id);
-- FULL JOIN
-- вивести всі клієнти і всі замовлення (навіть без відповідностей)
SELECT c.firstname || ' ' || c.surname AS full_name,
       o.order_id,
       o.buy_price
FROM client c
         FULL JOIN orders o USING(client_id);
-- замовлення + оплата
SELECT o.order_id,
       o.status,
       pay.type,
       pay.status AS payment_status
FROM orders o
         LEFT JOIN payment pay USING(order_id);
-- сума витрат кожного клієнта
SELECT c.firstname || ' ' || c.surname AS full_name,
       SUM(oi.quantity * oi.price) AS total_spent
FROM client c
         JOIN orders o USING(client_id)
         JOIN order_items oi USING(order_id)
GROUP BY c.client_id, c.firstname, c.surname
ORDER BY total_spent DESC;
-- кількість проданих товарів
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
         JOIN order_items oi USING(product_id)
GROUP BY p.name
ORDER BY total_sold DESC;
-- товари дорожчі за середню ціну
SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- найдорожчий товар
SELECT name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);
-- кількість замовлень кожного клієнта
SELECT firstname, surname,
       (SELECT COUNT(*)
        FROM orders o
        WHERE o.client_id = c.client_id) AS order_count
FROM client c;
-- клієнти, які витратили більше середнього
SELECT client_id, SUM(buy_price) AS total_spent
FROM orders
GROUP BY client_id
HAVING SUM(buy_price) >
       (SELECT AVG(buy_price) FROM orders);
-- замовлення дорожчі за середню суму
SELECT *
FROM orders
WHERE buy_price > (SELECT AVG(buy_price) FROM orders);






