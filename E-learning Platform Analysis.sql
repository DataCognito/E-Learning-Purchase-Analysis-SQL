create database elearning;
use elearning;

CREATE TABLE learners (
    learner_id   INT PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    country      VARCHAR(50)  NOT NULL
);

CREATE TABLE courses (
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    category    VARCHAR(50)  NOT NULL,
    unit_price  DECIMAL(10,2) NOT NULL
);

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO learners (learner_id, full_name, country) VALUES
(1, 'Aarav Sharma', 'India'),
(2, 'Meera Nair', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Sophia Garcia', 'Spain'),
(5, 'Liu Wei', 'China');

select * from learners;

INSERT INTO courses (course_id, course_name, category, unit_price) VALUES
(101, 'SQL for Beginners', 'Data', 1999.00),
(102, 'Advanced Python', 'Programming', 2499.50),
(103, 'Power BI Dashboards', 'BI', 2999.00),
(104, 'Machine Learning Basics', 'Data', 3499.99),
(105, 'Excel for Business', 'Productivity', 1499.00);

select * from courses;

INSERT INTO purchases (purchase_id, learner_id, course_id, quantity, purchase_date) VALUES
(1001, 1, 101, 1, '2024-09-01'),
(1002, 1, 103, 1, '2024-09-10'),
(1003, 2, 101, 2, '2024-09-05'),
(1004, 2, 105, 1, '2024-09-15'),
(1005, 3, 104, 1, '2024-09-12'),
(1006, 4, 102, 1, '2024-09-20'),
(1007, 4, 103, 1, '2024-09-22'),
(1008, 5, 105, 2, '2024-09-25');

select * from purchases;

SELECT 
    l.full_name AS learner_name,
    l.country AS learner_country,
    c.course_name,
    c.category,
    p.quantity,
    ROUND(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT 
    l.full_name AS learner_name,
    l.country,
    COUNT(p.purchase_id) AS purchases_made,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM learners l
LEFT JOIN purchases p ON l.learner_id = p.learner_id
LEFT JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
ORDER BY learner_name;

SELECT 
    c.course_name,
    c.category,
    c.unit_price,
    COUNT(p.purchase_id) AS times_purchased,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_revenue
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_id, c.course_name, c.category, c.unit_price
ORDER BY total_revenue DESC;

SELECT 
    l.full_name AS learner_name,
    l.country,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses  c ON p.course_id  = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
ORDER BY total_spent DESC;

SELECT 
    c.course_name,
    SUM(p.quantity) AS total_quantity_sold
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity_sold DESC
limit 3;

SELECT
    c.category,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id)             AS unique_learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category
ORDER BY total_revenue DESC;

SELECT 
    l.full_name AS learner_name,
    COUNT(DISTINCT c.category) AS category_count
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses  c ON p.course_id  = c.course_id
GROUP BY l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC, learner_name;

SELECT 
    c.course_name,
    c.category,
    c.unit_price
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.course_id IS NULL;
