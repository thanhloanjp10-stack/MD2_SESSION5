DROP DATABASE IF EXISTS customers_db;
CREATE DATABASE customers_db;
USE customers_db;

CREATE TABLE customers (
    customer_id VARCHAR(100) PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_name VARCHAR(100),
    order_date DATETIME,
    customer_id VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    customer_id VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_id, customer_name) VALUES
('KH01', 'Nguyen van a'),
('KH02', 'Tran thi b'),
('KH03', 'Phan van c'),
('KH04', 'Dinh thi d');

INSERT INTO orders (order_id, order_name, order_date, customer_id) VALUES
(101, 'khoai tay chien', '2026-10-25', 'KH01'),
(102, 'tom sot bo toi', '2026-10-26', 'KH02'),
(103, 'bo luc lac', '2026-10-25', 'KH03'),
(104, 'ga ran', '2026-10-27', 'KH04');

INSERT INTO items (order_id, customer_id, quantity, price) VALUES
(101, 'KH01', 1, 10000),
(102, 'KH02', 2, 15000),
(103, 'KH03', 5, 20000),
(104, 'KH04', 2, 30000);

-- YÊU CẦU 1: HIỂN THỊ DANH SÁCH SẢN PHẨM TRONG MỖI ĐƠN HÀNG
SELECT 
    o.order_id AS 'ma don hang',
    o.order_name AS 'ten san pham',
    i.customer_id AS 'ma khach hang',
    i.quantity AS 'so luong san pham',
    i.price AS 'gia ban'
FROM orders o
JOIN items i ON o.order_id = i.order_id;
-- YÊU CẦU 2: TINH TONG TIEN CUA MOI DON HANG
SELECT
o.order_id AS'ma don hang',
o.order_name AS'ten san pham',
SUM(i.quantity*i.price) AS 'tong tien'
FROM orders o
JOIN items i ON o.order_id=i.order_id
GROUP BY o.order_id,o.order_name;

-- Hiển thị:
-- các đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT
o.order_id AS'ma don hang',
o.order_name AS'ten san pham',
SUM(i.quantity*i.price) AS 'tong tien'
FROM orders o
JOIN items i ON o.order_id=i.order_id
GROUP BY o.order_id,o.order_name
HAVING SUM(i.quantity*i.price) > 100000;

 