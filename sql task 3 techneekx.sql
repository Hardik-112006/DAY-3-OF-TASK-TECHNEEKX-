CREATE DATABASE IF NOT EXISTS linkedin;

USE  linkedin;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Users VALUES
(1, 'Hardik', 'hardik@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com'),
(3, 'Amit', 'amit@gmail.com'),
(4, 'Neha', 'neha@gmail.com');

CREATE TABLE Companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50)
);

INSERT INTO Companies VALUES
(101, 'Google'),
(102, 'Amazon'),
(103, 'Microsoft');

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    content VARCHAR(200),
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

INSERT INTO Posts VALUES
(1, 'My first project', 1),
(2, 'Learning SQL', 2),
(3, 'Completed DSA', 1),
(4, 'Started internship', 3);


CREATE TABLE Connections (
    user_id INT,
    friend_id INT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(friend_id) REFERENCES Users(user_id)
);

INSERT INTO Connections VALUES
(1,2),
(1,3),
(2,4);

CREATE TABLE Company_Follow (
    user_id INT,
    company_id INT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(company_id) REFERENCES Companies(company_id)
);

INSERT INTO Company_Follow VALUES
(1,101),
(2,102),
(3,103);

SELECT *
FROM Posts
WHERE user_id = 1;

SELECT *
FROM Posts
WHERE user_id = 1
AND post_id > 1;

SELECT *
FROM Users
WHERE name = 'Hardik'
OR name = 'Rahul';

SELECT *
FROM Users
WHERE user_id IN (1,2,3);

SELECT *
FROM Posts
WHERE post_id BETWEEN 1 AND 3;

SELECT *
FROM Users
ORDER BY name ASC;

SELECT *
FROM Posts
ORDER BY post_id DESC;

SELECT *
FROM Users
LIMIT 3;

SELECT *
FROM Posts
WHERE user_id IN (1,2,3)
AND post_id BETWEEN 1 AND 4
ORDER BY post_id DESC
LIMIT 2;