#STEP 1
CREATE DATABASE IF NOT EXISTS my_web_db;
USE my_web_db;

#STEP 2
#1
CREATE TABLE IF NOT EXISTS users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(100),
    first_name VARCHAR(45),
    last_name VARCHAR(45)
) ENGINE = InnoDB;

#2
CREATE TABLE IF NOT EXISTS products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(45)
) ENGINE = InnoDB;

#3
CREATE TABLE IF NOT EXISTS downloads (
	download_id INT PRIMARY KEY,
    user_id INT,
    download_date DATETIME,
    filename VARCHAR(50),
    product_id INT,
    CONSTRAINT fk_downloads_users
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT fk_downloads_products
    FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE = InnoDB;

#STEP 3
#1
INSERT INTO users VALUES (1,'saraa.riazi@gmail.com', 'Sara', 'Riazi');
INSERT INTO users VALUES (2,'johnsmith@gmail.com', 'John', 'Smith');

INSERT INTO users (email_address,first_name,last_name) 
VALUES ('janedoe@yahoo.com', 'Jane', 'Doe');
SELECT * FROM users;

INSERT INTO users (email_address,first_name,last_name) 
VALUES ('jackbown@msn.com', 'Jack', NULL);

#2
INSERT INTO products VALUES (1, 'Local Music Vol. 1');
INSERT INTO products VALUES (2, 'Local Music Vol. 2');

#3
INSERT INTO downloads VALUES (1, 1, NOW(), 'pedals_are_falling.mp3', 1),
 (2, 2, NOW(), 'turn_signal.mp3', 1),
 (3, 2, NOW(), 'one_horse_town.mp3', 2);
 
 #STEP 4
 UPDATE users SET email_address = 'john.smith@yahoo.com' WHERE user_id = 2;
 
 #STEP 5
 DELETE FROM users WHERE user_id=1;
 DELETE FROM downloads WHERE user_id = 1;