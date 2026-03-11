INSERT INTO client (name, email) VALUES
('Ivan Petrenko', 'ivan@gmail.com'),
('Olena Shevchenko', 'olena@gmail.com'),
('Mykola Bondar', 'mykola@gmail.com'),
('Anna Kovalenko', 'anna@gmail.com'),
('Petro Melnyk', 'petro@gmail.com');

INSERT INTO products (name, price) VALUES
('Laptop', 1500),
('Phone', 800),
('Keyboard', 50),
('Mouse', 30),
('Monitor', 400);

INSERT INTO orders (client_id, order_date) VALUES
(1, '2026-03-01'),
(2, '2026-03-02'),
(3, '2026-03-03'),
(4, '2026-03-04'),
(5, '2026-03-05');

INSERT INTO order_items (order_id, product_id, quantity, price_at_the_moment) VALUES
(1, 1, 1, 1500),
(1, 3, 2, 50),
(2, 2, 1, 800),
(3, 4, 1, 30),
(4, 5, 1, 400),
(5, 1, 1, 1500),
(2, 3, 1, 50),
(3, 5, 2, 400),
(4, 2, 1, 800),
(5, 4, 3, 30);
