CREATE DATABASE IF NOT EXISTS cybersoft_shop;
USE cybersoft_shop;


CREATE TABLE IF NOT EXISTS loaiSanPham (
    maLoaiSp INT PRIMARY KEY AUTO_INCREMENT,
    tenLoaiSp NVARCHAR(255)
);


CREATE TABLE IF NOT EXISTS sanPham (
    maSp INT PRIMARY KEY AUTO_INCREMENT,
    tenSp NVARCHAR(255),
    gia DECIMAL(10,2),
    moTa NVARCHAR(255),
    maLoaiSp INT
);


CREATE TABLE IF NOT EXISTS khachHang (
    maKh INT PRIMARY KEY AUTO_INCREMENT,
    ho NVARCHAR(255),
    ten NVARCHAR(255),
    soDT VARCHAR(255),
    email VARCHAR(255),
    diaChi NVARCHAR(255)
);


CREATE TABLE IF NOT EXISTS hoaDon (
    maHoaDon INT PRIMARY KEY AUTO_INCREMENT,
    ngayMua TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    maKH INT
);


CREATE TABLE IF NOT EXISTS chiTietHoaDon (
    maHoaDon INT,
    maSP INT,
    soLuong INT,
    giaBan DECIMAL(10,2),
    PRIMARY KEY (maHoaDon, maSP)
);


ALTER TABLE sanPham
    ADD CONSTRAINT FK_sanPham_loaiSanPham
        FOREIGN KEY (maLoaiSp) REFERENCES loaiSanPham(maLoaiSp);

ALTER TABLE hoaDon
    ADD CONSTRAINT FK_hoaDon_khachHang
        FOREIGN KEY (maKh) REFERENCES khachHang(maKh);

ALTER TABLE chiTietHoaDon
    ADD CONSTRAINT FK_chiTietHoaDon_hoaDon
        FOREIGN KEY (maHoaDon) REFERENCES hoaDon(maHoaDon);

ALTER TABLE chiTietHoaDon
    ADD CONSTRAINT FK_chiTietHoaDon_sanPham
        FOREIGN KEY (maSP) REFERENCES sanPham(maSp);

INSERT INTO loaiSanPham (tenLoaiSp) VALUES
    ('Điện thoại'),
    ('Máy tính'),
    ('Thiết bị gia dụng');

INSERT INTO sanPham (tenSp, gia, moTa, maLoaiSp) VALUES
    ('iPhone 15', 25000000, 'Điện thoại Apple cao cấp', 1),
    ('Samsung Galaxy S24', 23000000, 'Điện thoại Samsung mới nhất', 1),
    ('MacBook Air M2', 30000000, 'Máy tính xách tay mỏng nhẹ', 2),
    ('Nồi cơm điện Sharp', 1500000, 'Nấu cơm tự động', 3);

INSERT INTO khachHang (ho, ten, soDT, email, diaChi) VALUES
    ('Nguyễn', 'An', '0912345678', 'ngan@gmail.com', 'Cần Thơ'),
    ('Trần', 'Bình', '0987654321', 'binhtran@yahoo.com', 'Hà Nội'),
    ('Lê', 'Thảo', '0909090909', 'lethao@hotmail.com', 'Đà Nẵng');

INSERT INTO hoaDon (maKH) VALUES
    (1),
    (2),
    (1);

INSERT INTO chiTietHoaDon (maHoaDon, maSP, soLuong, giaBan) VALUES
    (1, 1, 1, 24900000),
    (1, 4, 2, 1400000),

    (2, 2, 1, 22900000),
    (2, 3, 1, 29900000),

    (3, 4, 1, 1500000);

