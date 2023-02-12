-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

CREATE TABLE menu (
  menu_id INT UNIQUE,
  menu_name TEXT,
  menu_price INT,
 PRIMARY KEY (menu_id)
);

CREATE TABLE customer (
  cus_id INT UNIQUE,
  cus_name TEXT,
  cus_email TEXT,
  PRIMARY KEY (cus_id)
);

CREATE TABLE employee (
  emp_id INT UNIQUE,
  emp_name TEXT,
  emp_performance TEXT,
  emp_salary INT,
  PRIMARY KEY (emp_id)
);

CREATE TABLE seat (
  seat_id INT UNIQUE,
  seat_pos TEXT,
  seat_amount INT,
  PRIMARY KEY (seat_id)
);

CREATE TABLE orders (
  orders_id INT UNIQUE,
  orders_date date,
  menu_id INT,
  cus_id INT,
  emp_id INT,
  seat_id INT ,
  PRIMARY KEY (orders_id),
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
  FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
  FOREIGN KEY (seat_id) REFERENCES seat(seat_id)
);

INSERT INTO menu VALUES
  (1, 'Aglio Olio', 13),
  (2, 'Alle Vongole', 15),
  (3, 'Bolognese', 18),
  (4, 'Carbonara', 20),
  (5, 'Ripeye Steak', 50),
  (6, 'T-Bone Steak', 55),
  (7, 'Flat Iron Steak', 58),
  (8, 'Tenderloin Steak', 60),
  (9, 'Wagyu Cubes', 45),
  (10, 'Pork Jowls', 20);

INSERT INTO customer VALUES
  (1, 'Shun', 'shunnieshunjai@hotmail.com'),
  (2, 'Jeng', 'guayjeng@gmail.com'),
  (3, 'Am', 'amempty@gmail.com'),
  (4, 'Tee', 'boonchana@outlook.com'),
  (6, 'Tam', 'tamtam@hotmail.com')
;

INSERT INTO employee VALUES 
  (1, 'Toy', 'Good', 10000),
  (2, 'Kat', 'Good', 8000),
  (3, 'Palm', 'Good', 7000),
  (4, 'Ping', 'Good', 7000),
  (5, 'Aon', 'Average', 4500),
  (6, 'Gun', 'Average', 4500)
;

INSERT INTO seat VALUES 
  (1, 'counter_1', 1),
  (2, 'counter_2', 1),
  (3, 'counter_3', 1),
  (4, 'window_1', 2),
  (5, 'window_2', 2),
  (6, 'window_3', 4),
  (7, 'indoor_1', 4),
  (8, 'indoor_2', 4)
;

INSERT INTO orders VALUES 
  (01, '2022-08-01', 1, 2, 6, 3),
  (02, '2022-08-01', 8, 2, 3, 1),
  (03, '2022-08-24', 5, 3, 2, 5),
  (04, '2022-08-01', 7, 4, 5, 4),
  (05, '2022-08-09', 3, 6, 4, 2),
  (06, '2022-09-20', 1, 1, 1, 2),
  (07, '2022-09-15', 7, 4, 5, 8),
  (08, '2022-09-15', 2, 3, 3, 7),
  (09, '2022-09-13', 5, 4, 1, 4),
  (10, '2022-09-28', 2, 6, 5, 3)
;

.mode markdown
.header on 



.print Customer amount in 2022-08-01
SELECT
  orders_date,
  seat_amount AS amount_customer,
  sum(seat_amount)
FROM orders AS o
JOIN menu AS m ON o.menu_id = m.menu_id
JOIN seat AS s ON o.seat_id = s.seat_id
WHERE orders_date = '2022-08-01';

.print Create position by base salary
SELECT
  emp_name,
  emp_salary,   
  CASE
    WHEN emp_salary > 8000 THEN 'Head Waiter'
    WHEN emp_salary <= 8000 AND emp_salary >= 7000 THEN 'Waiter'
    ELSE 'Trainee'
  END AS Position,
  emp_performance,
  orders_id
FROM orders AS o
JOIN employee AS e ON o.emp_id = e.emp_id;


.print Find Top Spender
WITH OMC AS(
  SELECT *
  FROM orders AS o
  JOIN menu AS m ON o.menu_id = m.menu_id
  JOIN customer AS c ON o.cus_id = c.cus_id)
  SELECT
  cus_name,
  sum(menu_price) AS total
FROM OMC
GROUP BY cus_name
ORDER BY sum(menu_price) DESC
LIMIT 3;
  



  
