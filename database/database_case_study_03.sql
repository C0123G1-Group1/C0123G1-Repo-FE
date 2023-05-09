CREATE DATABASE ig1_store;
USE ig1_store;

CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE account_users(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
	role_id INT,
    account_id INT,
    PRIMARY KEY(role_id, account_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY(account_id) REFERENCES account_users(account_id)
);

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account_users(account_id)
);

CREATE TABLE product_type(
	product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NUll
);

CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
	product_type_id INT,
    `describe` TEXT NOT NULL,
    price LONG CHECK(price > 0),
    product_image_url TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);
CREATE TABLE accessory(
	accessory_id INT PRIMARY KEY AUTO_INCREMENT,
    accessory_name VARCHAR(50) NOT NULL,
    accessory_price DOUBLE CHECK(accessory_price > 0),
    image_accessory TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    product_id INT,
    price_order LONG ,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
	order_detail_date DATETIME,
    accessory_id INT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(accessory_id) REFERENCES accessory(accessory_id)
);

INSERT INTO account_users (user_name,`password`) VALUES ("khanh", "khanh123"), ("thien", "thien123"), ("khang", "khang123"), ("hai", "hai123"),("admin", "admin123");
INSERT INTO customers (customer_name, email,phone_number,address,account_id) 
VALUES ("khanh","khanh@gmail.com", "0123456789","Quang Nam", 1),
("khang","khang@gmail.com", "1123456789","Quang Nam", 3),
("thien","thien@gmail.com", "0223456789","Quang Nam", 2),
("hai","hai@gmail.com", "0123456789","Quang Nam", 4);
INSERT INTO product_type (product_type_name) VALUES ("Iphone"), ("SamSung"), ("Vivo"), ("Asus");






