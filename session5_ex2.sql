-- Bảng employees lưu thông tin nhân viên:

-- emp_id - Khóa chính
-- full_name
-- department
-- salary

CREATE DATABASE IF NOT EXISTS database_session5;
USE database_session5 ;
CREATE TABLE employees(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(100),
salary INT
);

INSERT INTO employees (emp_id,full_name,department,salary)VALUES
(001,'Nguyen Van Anh','IT',10000000),
(002,'Nguyen Van Bao','HR',5000000),
(003,'Tran Thuy Duong','Design',15000000),
(004,'Pham Thi My','General',10000000),
(005,'Dinh Cam Ky','IT',20000000),
(006,'Hua Lan Huong','IT',15000000),
(007,'Han Van Luong','Design',20000000),
(008,'Trinh Tinh Duong','HR',10000000),
(009,'Nguy Anh Dai ','HR',5000000),
(010,'Ha Thi Vinh','General',9000000);
SELECT*FROM employees;
-- Viết câu lệnh SQL để:
-- Thống kê:
-- mỗi phòng ban có bao nhiêu nhân viên
SELECT department,COUNT(*) AS tong_so_nhan_vien
FROM employees
GROUP BY department;

-- Tính:
-- mức lương trung bình của từng phòng ban
SELECT department,AVG(salary) AS luong_trung_binh
FROM employees
GROUP BY department;

-- Chỉ hiển thị:
-- các phòng ban có trên 3 nhân viên
SELECT department,COUNT(*) AS tong_so_nhan_vien
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- Chỉ hiển thị:
-- các phòng ban có lương trung bình lớn hơn 12.000.000
SELECT department,AVG(salary) AS luong_trung_binh
FROM employees
GROUP BY department
HAVING AVG(salary)  > 12000000;



