CREATE DATABASE pizza_sales;
use pizza_sales;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME
);

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);

CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (pizza_id)
    REFERENCES pizzas(pizza_id)
);

CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50),
    size VARCHAR(5),
    price DECIMAL(5,2),

    FOREIGN KEY (pizza_type_id)
    REFERENCES pizza_types(pizza_type_id)
);