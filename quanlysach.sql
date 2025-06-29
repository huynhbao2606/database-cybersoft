CREATE DATABASE IF NOT EXISTS quanlysach;

USE quanlysach;

CREATE TABLE IF NOT EXISTS tacgia
(
    ma INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(100) NOT NULL,
    quocTich VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sach
(
    ma INT PRIMARY KEY AUTO_INCREMENT,
    tieuDe VARCHAR(200) NOT NULL,
    namXuatBan INT NULL,
    maTacGia INT NOT NULL
);

ALTER TABLE sach
    ADD CONSTRAINT FK_sach_tacgia
        FOREIGN KEY (maTacGia) REFERENCES tacgia(ma);

INSERT INTO tacgia (ten, quocTich)
VALUES
    ('Nguyễn Nhật Ánh','Việt Nam'),
    ('Haruki Murakami', 'Nhật Bản'),
    ('J.K. Rowling', 'Anh');

INSERT INTO sach (tieude, namXuatBan, maTacGia)
VALUES
    ('Mắt Biếc', 1990, 1),
    ('Tôi thấy hoa vàng trên cỏ xanh', 2005, 1),
    ('Rừng Na Uy', 1987, 2),
    ('Harry Potter và Hòn đá Phù thủy', 1997, 3);


# 1. Lấy danh sách tất cả sách trong hệ thống
SELECT * FROM sach;

# 2. Lấy danh sách tất cả tác giả có quốc tịnh là "Việt Nam"
SElECT * FROM tacgia
WHERE quocTich = 'Việt Nam';

# 3. Lấy tên sách và tên tác giả tương ứng (JOIN 2 bảng)
SELECT
    sach.tieuDe,
    tacgia.ten
FROM sach
         JOIN tacgia ON sach.maTacGia = tacgia.ma;

# 4. Lấy danh sách các sách xuất bản sau năm 1990
SELECT *
FROM sach
WHERE namXuatBan > 1990;

# 5. Đếm số lượng sách của mỗi tác giả
SELECT
    tacgia.ten AS TenTacGia,
    COUNT(sach.ma) AS SoLuongSach
FROM tacgia
         JOIN sach ON tacgia.ma = sach.maTacGia
GROUP BY tacgia.ten;

# 6. Tìm tác giả có nhiều sách nhất
SELECT
    tacgia.ten TenTacGia,
    COUNT(sach.ma) SoLuongSach
FROM tacgia
         JOIN sach ON tacgia.ma = sach.maTacGia
GROUP BY tacgia.ten
HAVING COUNT(sach.ma) = (SELECT MAX(SoLuong)
                         FROM (SELECT COUNT(*) SoLuong
                               FROM sach
                               GROUP BY maTacGia) SachTacGia);



