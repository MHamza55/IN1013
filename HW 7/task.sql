CREATE TABLE bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    waiter_id INT,
    customer_id INT,
    room_id INT,
    bill_date DATE,
    bill_total DECIMAL(10, 2)
);
    

CREATE TABLE waiters (
    waiter_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    surname VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_name VARCHAR(100)
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50)
);


CREATE VIEW samsBills AS
SELECT 
    waiters.first_name, 
    waiters.surname, 
    bills.bill_date, 
    customers.cust_name, 
    bills.bill_total
FROM 
    bills
JOIN 
    waiters ON bills.waiter_id = waiters.waiter_id
JOIN 
    customers ON bills.customer_id = customers.customer_id
WHERE 
    waiters.first_name = 'Sam' AND waiters.surname = 'Pitt';


SELECT 
    first_name, 
    surname, 
    bill_date, 
    cust_name, 
    bill_total
FROM 
    samsBills
WHERE 
    bill_total > 400;


CREATE VIEW roomTotals AS
SELECT 
    rooms.room_name, 
    SUM(bills.bill_total) AS total_sum
FROM 
    bills
JOIN 
    rooms ON bills.room_id = rooms.room_id
GROUP BY 
    rooms.room_name;


CREATE VIEW teamTotals AS
SELECT 
    CONCAT(waiters.first_name, ' ', waiters.surname) AS headwaiter_name, 
    SUM(bills.bill_total) AS total_sum
FROM 
    bills
JOIN 
    waiters ON bills.waiter_id = waiters.waiter_id
GROUP BY 
    headwaiter_name;

