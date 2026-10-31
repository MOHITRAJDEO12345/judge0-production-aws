USE test_db;

DROP TABLE IF EXISTS demo;
CREATE TABLE demo (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO demo VALUES 
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');
