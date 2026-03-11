CREATE TABLE client (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    client_id INT,
    order_date DATE,
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_the_moment DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
