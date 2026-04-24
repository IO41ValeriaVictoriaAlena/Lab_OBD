DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS brand CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS client CASCADE;

CREATE TABLE client (
    client_id SERIAL PRIMARY KEY,
    surname VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    model VARCHAR(100) NOT NULL,
    warranty_months INT NOT NULL CHECK (warranty_months >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'completed', 'cancelled')),
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE (order_id, product_id)
);

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL CHECK (type IN ('card', 'cash')),
    status VARCHAR(50) NOT NULL CHECK (status IN ('paid', 'pending', 'cancelled')),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);
