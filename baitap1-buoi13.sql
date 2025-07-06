CREATE DATABASE IF NOT EXISTS baitap_13;

USE baitap_13;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name NVARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    age INT,
    city NVARCHAR(255),
    weight DECIMAL
);

INSERT INTO students (full_name, gender, age, city, weight) VALUES
                                                                ('Nguyễn Thanh Nhân', 'Nam', 19, N'Cần Thơ', 56.5674),
                                                                ('Phạm Thu Hương', 'Nữ', 20, 'Vĩnh Long', 72.4560),
                                                                ('Nguyễn Như Ngọc', 'Nữ', 20, 'Sóc Trăng', 85.3870),
                                                                ('Bùi Thanh Bảo', 'Nam', 19, 'Sóc Trăng', 49.3000),
                                                                ('Lê Mỹ Nhân', 'Nữ', 22, 'Cần Thơ', 62.9630),
                                                                ('Tấn Thức Bảo', 'Nam', 35, 'An Giang', 55.5678),
                                                                ('Trịnh Giao Kim', 'Nam', 44, 'Bạc Liêu', 67.3400);

