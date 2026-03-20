DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS brand CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS obd CASCADE;


-- ========================
-- CREATE TABLES
-- ========================

CREATE TABLE client (
                        client_id SERIAL PRIMARY KEY,
                        surname VARCHAR(100),
                        firstname VARCHAR(100),
                        email VARCHAR(100)
);

CREATE TABLE category (
                          category_id SERIAL PRIMARY KEY,
                          name VARCHAR(100)
);

CREATE TABLE brand (
                       brand_id SERIAL PRIMARY KEY,
                       name VARCHAR(100),
                       country VARCHAR(100)
);

CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          brand_id INT,
                          category_id INT,
                          name VARCHAR(100),
                          price DECIMAL(10,2),
                          model VARCHAR(100),
                          warranty_months INT,
                          stock_quantity INT,
                          FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
                          FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        client_id INT,
                        order_date DATE,
                        status VARCHAR(50),
                        buy_price DECIMAL(10,2),
                        FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE order_items (
                             item_id SERIAL PRIMARY KEY,
                             order_id INT,
                             product_id INT,
                             quantity INT,
                             price DECIMAL(10,2),
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),
                             FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payment (
                         payment_id SERIAL PRIMARY KEY,
                         order_id INT,
                         type VARCHAR(50),
                         status VARCHAR(50),
                         FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE obd (
    obd_id SERIAL PRIMARY KEY,
    order_id INT,
    type VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
