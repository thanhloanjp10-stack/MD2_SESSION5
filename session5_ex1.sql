-- Một hệ thống lưu thông tin sinh viên trong bảng students gồm các cột:

-- student_id - Khóa chính
-- full_name
-- birth_year
-- gender
-- score (điểm trung bình)
--  

-- Yêu cầu:

-- Viết các câu lệnh SELECT để:
-- Hiển thị:
-- mã sinh viên
-- họ tên (viết hoa toàn bộ) - Bạn đầu chưa in hoa hết
-- Hiển thị:
-- họ tên
-- số tuổi của sinh viên (dựa vào năm hiện tại)
-- Hiển thị:
-- điểm trung bình được làm tròn 1 chữ số thập phân
-- Hiển thị:
-- tổng số sinh viên
-- điểm cao nhất
-- điểm thấp nhất
CREATE DATABASE IF NOT EXISTS db_students ;
USE db_students ;
CREATE TABLE students (
student_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
birth_year INT,
gender VARCHAR(10),
score DECIMAL(4,2)
);

INSERT INTO students (student_id,full_name,birth_year,gender,score)VALUES
(01,'nguyen thi a',2002,'nu',8.25),
(02,'pham thi b',2000,'nu',8.35),
(03,'tran van c',1999,'nan',7.45),
(04,'ta van d',1992,'nam',9.45),
(05,'vu thi e',2002,'nu',8.50);
SELECT student_id,
UPPER(full_name) AS full_name_viet_hoa
FROM students;

SELECT full_name,
YEAR(NOW())-birth_year AS tuoi 
FROM students;

SELECT 
ROUND(score,1) AS diem_trung_binh_lam_tron
FROM students;

SELECT
COUNT(student_id) AS tong_so_sinh_vien
FROM students;

SELECT 
COUNT(student_id) AS tong_so_sinh_vien,
MAX(score) AS sinh_vien_co_diem_cao_nhat,
MIN(score) AS sinh_vien_co_diem_thap_nhat
FROM students;
