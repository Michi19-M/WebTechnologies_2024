DROP DATABASE IF EXISTS	`phone_book`;

CREATE DATABASE `phone_book`;
USE `phone_book`;

CREATE TABLE contact (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64),
    company VARCHAR(256),
	photo VARCHAR(256),
    email VARCHAR(64),
    url VARCHAR(64),
    adress VARCHAR(256),
	birthday DATE,
    other_date DATE,
    note VARCHAR(256)
);

CREATE TABLE phone_number (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    phone_type ENUM('personal', 'business', 'home'),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    username VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL
);

CREATE TABLE social_media (
	id INT auto_increment PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    platform VARCHAR(32),
    username VARCHAR(64),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE user_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    contact_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

INSERT INTO user (username, password) VALUES 
('user_1', 'pass_1'), 
('user_2', 'pass_2'), 
('user_3', 'pass_3');

INSERT INTO contact (first_name, last_name, company, photo, email, url, adress, birthday, other_date, note) VALUES
('Име_1', 'Фам_1', 'Фирма_1', 'път_към_файл_1', 'email_1@gmail.com', 'http:\\example1.bg', 'гр.София, Студентски град 1', '2001-01-01', null, 'бележка_1'),
('Име_2', 'Фам_2', 'Фирма_2', 'път_към_файл_2', 'email_2@gmail.com', 'http:\\example2.bg', 'гр.София, Студентски град 2', '2021-12-05', '2023-05-07', 'бележка_2'),
('Име_3', 'Фам_3', 'Фирма_3', 'път_към_файл_3', 'email_3@gmail.com', 'http:\\example3.bg', 'гр.София, Студентски град 3', '1999-7-09', null, 'бележка_3');

INSERT INTO phone_number(contact_id , phone_number, phone_type) VALUES
(1, 0888130130, 'business'),
(2, '+359871234567', 'personal'),
(2, '0285756545', 'home');

INSERT INTO social_media(contact_id , platform, username) VALUES
(1, 'twitter', 'username_1'),
(2, 'linkedin', 'username_2'),
(3, 'facebook', 'username_3');

INSERT INTO user_contacts(user_id, contact_id) VALUES
(1, 1),
(2, 3),
(3, 2);