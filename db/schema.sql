-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE category (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE product (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL NOT NULL,
    stock INTEGER NOT NULL DEFAULT 10,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE tag (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tag_name VARCHAR(255)
);

CREATE TABLE ProductTag (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    tag_id INT,
    FOREIGN KEY (tag_id) REFERENCES Tag(id)
);