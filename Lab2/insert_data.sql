-- CATEGORY
INSERT INTO category (name) VALUES
                                ('Electronics'),
                                ('Accessories'),
                                ('Wearables');

-- BRAND
INSERT INTO brand (name, country) VALUES
                                      ('Apple', 'USA'),
                                      ('Samsung', 'South Korea'),
                                      ('Logitech', 'Switzerland'),
                                      ('Sony', 'Japan');

-- CLIENT
INSERT INTO client (surname, firstname, email) VALUES
                                                   ('Petrov', 'Ivan', 'ivan@gmail.com'),
                                                   ('Ivanova', 'Anna', 'anna@gmail.com'),
                                                   ('Shevchenko', 'Oleg', 'oleg@gmail.com'),
                                                   ('Kovalenko', 'Maria', 'maria@gmail.com'),
                                                   ('Bondarenko', 'Dmytro', 'dmytro@gmail.com');

-- PRODUCTS
INSERT INTO products (brand_id, category_id, name, price, model, warranty_months, stock_quantity) VALUES
                                                                                                      (1, 1, 'Laptop', 1200, 'MacBook Air', 12, 10),
                                                                                                      (2, 1, 'Smartphone', 800, 'Galaxy S', 12, 20),
                                                                                                      (4, 2, 'Headphones', 150, 'WH-1000XM', 12, 15),
                                                                                                      (1, 1, 'Tablet', 600, 'iPad', 12, 8),
                                                                                                      (2, 3, 'Smartwatch', 300, 'Galaxy Watch', 12, 12),
                                                                                                      (3, 2, 'Keyboard', 80, 'K120', 6, 25),
                                                                                                      (3, 2, 'Mouse', 50, 'M185', 6, 30),
                                                                                                      (2, 1, 'Monitor', 400, 'Odyssey', 24, 7);

-- ORDERS
INSERT INTO orders (client_id, order_date, status, buy_price) VALUES
                                                                  (1, '2026-03-01', 'completed', 1500),
                                                                  (2, '2026-03-02', 'completed', 880),
                                                                  (3, '2026-03-03', 'pending', 700),
                                                                  (4, '2026-03-04', 'completed', 700),
                                                                  (5, '2026-03-05', 'completed', 950);

-- ORDER ITEMS
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
                                                                    (1, 1, 1, 1200),
                                                                    (1, 3, 2, 150),
                                                                    (2, 2, 1, 800),
                                                                    (2, 6, 1, 80),
                                                                    (3, 4, 1, 600),
                                                                    (3, 7, 2, 50),
                                                                    (4, 5, 1, 300),
                                                                    (4, 8, 1, 400),
                                                                    (5, 2, 1, 800),
                                                                    (5, 3, 1, 150);

-- PAYMENT
INSERT INTO payment (order_id, type, status) VALUES
                                                 (1, 'card', 'paid'),
                                                 (2, 'cash', 'paid'),
                                                 (3, 'card', 'pending'),
                                                 (4, 'card', 'paid'),
                                                 (5, 'cash', 'paid');
