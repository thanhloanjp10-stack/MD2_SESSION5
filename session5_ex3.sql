CREATE DATABASE IF NOT EXISTS products;
USE products;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
product_id VARCHAR(100) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(100) NOT NULL,
price DECIMAL(10,2)
);
INSERT INTO products(product_id,product_name,category,price)VALUES
('SP001','chan_ga_sa_tac','food',20000),
('SP002','chan_ga_u_muoi','food',6500000),
('SP003','luoi_vit_tron_cay','food',30000),
('SP004','matcha_latte','drink',35000),
('SP005','ca_phe_muoi','drink',30000),
('SP006','ca_phe_trung','drink',40000),
('SP007','nuoc_loc','drink',11000),
('SP008','xoi_chien','take_out',25000),
('SP009','pha_lau','take_out',70000);
SELECT*FROM products;
-- Viết câu lệnh SQL để:
-- Hiển thị các sản phẩm có:
-- giá cao hơn giá trung bình của tất cả sản phẩm

SELECT product_id,product_name,category,price
FROM products
WHERE price>(SELECT AVG(price) FROM products);

-- Hiển thị sản phẩm có:
-- giá cao nhất trong từng loại sản phẩm
SELECT product_id,product_name,category,price
FROM products
WHERE (category,price) IN (
SELECT category,MAX(price)
FROM products
GROUP BY category
);
-- Hiển thị các sản phẩm thuộc loại:
-- có ít nhất một sản phẩm giá trên 20.000.000
SELECT product_id,product_name,category,price
FROM products
WHERE category IN (
SELECT category
FROM products
WHERE price > 20000
);