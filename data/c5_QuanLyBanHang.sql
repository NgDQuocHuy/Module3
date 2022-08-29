use c5_quanlybanhang;

-- 2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.

ALTER TABLE c5_quanlybanhang.sanpham
ADD GhiChu VARCHAR(20);

-- 3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.

ALTER TABLE c5_quanlybanhang.khachhang
ADD LoaiKH VARCHAR(100);

-- 4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).

ALTER TABLE c5_quanlybanhang.sanpham
MODIFY COLUMN GhiChu VARCHAR(100);

-- 5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.

ALTER TABLE c5_quanlybanhang.sanpham
DROP COLUMN GhiChu;

-- 6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang ai”, “Thuong xuyen”, “Vip”, …

SET SQL_SAFE_UPDATES = 0;
UPDATE c5_quanlybanhang.khachhang 
SET LoaiKH = 'Vip' 
WHERE (DoanhSo >= 10000000);

UPDATE c5_quanlybanhang.khachhang 
SET LoaiKH = 'Thuong Xuyen'
WHERE (DoanhSo < 10000000 AND DoanhSO >= 1000000);

UPDATE c5_quanlybanhang.khachhang
SET LoaiKH = 'Vang Ai'
WHERE (DoanhSo < 1000000);



-- III/ Viết các câu truy vấn
-- 1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.

SELECT MaSP, TenSP 
FROM sanpham
	WHERE NuocSX = 'Trung Quoc';

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.

SELECT MaSP, TenSP 
FROM sanpham
	WHERE DVT IN ('cay', 'quyen');

-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

SELECT MaSP, TenSP 
FROM sanpham
	WHERE MaSP LIKE 'B%01';

-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.

SELECT MaSP, TenSP 
FROM sanpham
	WHERE (NuocSX = 'Trung Quoc' 
    AND Gia BETWEEN 20000 AND 30000);

-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ 20.000 đến 30.000.

SELECT MaSP, TenSP 
FROM sanpham 
	WHERE (NuocSX IN ('Trung Quoc', 'Thai Lan') 
    AND (Gia BETWEEN 20000 AND 30000));

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

SELECT SoHoaDon, TriGia 
FROM hoadon
	WHERE ngaymuahang IN ('2007-01-01', '2007-01-02');

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).

SELECT SoHoaDon, TriGia, NgayMuaHang 
FROM hoadon
	WHERE ngaymuahang LIKE '2007-01-%'
ORDER BY ngaymuahang;

SELECT SoHoaDon, TriGia 
FROM hoadon
	WHERE ngaymuahang LIKE '2007-01-%'
ORDER BY TriGia DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT khachhang.MaKH, khachhang.HoTen 
FROM khachhang
LEFT JOIN hoadon ON khachhang.makh = hoadon.makh 
	WHERE (hoadon.ngaymuahang = '2007-01-01');

-- 9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006.

SELECT sp.MaSP, sp.TenSP 
FROM sanpham AS sp
JOIN cthd ON sp.MaSP = cthd.MaSP 
JOIN hoadon AS hd ON cthd.SoHD = hd.SoHoaDon  
JOIN khachhang AS kh ON hd.MaKH = kh.MaKH
	WHERE (kh.HoTen = 'Nguyen Van A' 
    AND hd.NgayMuaHang LIKE '2006-10-%');

-- 10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.

SELECT hoadon.SoHoaDon, hoadon.TriGia 
FROM hoadon
LEFT JOIN nhanvien ON nhanvien.manv = hoadon.manv 
	WHERE ( nhanvien.HoTen = 'Nguyen Van B' 
    AND hoadon.ngaymuahang = '2006-10-10');

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.

SELECT SoHD
FROM cthd
	WHERE cthd.MaSP IN ('BB01', 'BB02');

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.

SELECT SoHD
FROM cthd
	WHERE cthd.MaSP IN ('BB01', 'BB02') 
	AND cthd.SoLuong BETWEEN 10 AND 20;

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.

SELECT SoHD
FROM cthd
	WHERE cthd.SoLuong BETWEEN 10 AND 20 
	AND MaSP = 'BB01' 
	AND SoHD IN (SELECT SoHD 
		FROM cthd 
			WHERE MaSP = 'BB02');

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán a trong ngày 1/1/2007.

SELECT sp.MaSP, sp.TenSP 
FROM sanpham sp
JOIN cthd ON sp.MaSP = cthd.MaSP
JOIN hoadon hd ON cthd.SoHD = hd.SoHoaDon
	WHERE sp.NuocSX = 'Trung Quoc' 
    OR hd.NgayMuaHang = '2007-01-01'
GROUP BY sp.MaSP;

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

SELECT sp.MaSP, sp.TenSP
FROM sanpham sp
	WHERE sp.MaSP NOT IN (SELECT MaSP 
		FROM cthd);

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.

SELECT sp.MaSP, sp.TenSP
FROM sanpham sp
	WHERE sp.MaSP NOT IN (SELECT MaSP 
		FROM cthd 
        JOIN hoadon ON hoadon.SoHoaDon = cthd.SoHD 
        AND YEAR(NgayMuaHang) = '2006');

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.

SELECT sp.MaSP, sp.TenSP
FROM sanpham sp
	WHERE sp.NuocSX =  'Trung Quoc'
	AND sp.MaSP NOT IN (SELECT MaSP 
		FROM cthd JOIN hoadon ON hoadon.SoHoaDon = cthd.SoHD 
        AND YEAR(NgayMuaHang) = '2006');

-- 18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?

SELECT * FROM hoadon 
	WHERE ISNULL(MaKH);

SELECT EXISTS (SELECT * 
	FROM hoadon 
		WHERE ISNULL(MaKH)) AS NotKHDangKy;

-- 19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?

SELECT MIN(TriGia) AS GiaBeNhat, MAX(TriGia) AS GiaLonNhat 
FROM hoadon;

-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?

SELECT AVG(TriGia) 
FROM hoadon
	WHERE YEAR(NgayMuaHang) = '2006';

-- 21. Tính doanh thu bán hàng trong năm 2006.

SELECT SUM(TriGia) 
FROM hoadon
	WHERE YEAR(NgayMuaHang) = '2006';

-- 22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.

SELECT SoHoaDon 
FROM hoadon
	WHERE TriGia = (SELECT MAX(TriGia) 
		FROM hoadon);

-- 23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.

SELECT kh.HoTen 
FROM khachhang kh
JOIN hoadon hd ON hd.MaKH = kh.MaKH
	WHERE hd.TriGia = (SELECT MAX(TriGia) 
		FROM hoadon) 
	AND YEAR(hd.NgayMuaHang) = '2006';

-- 24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.

SELECT kh.MaKH, kh.HoTen
FROM khachhang kh
JOIN hoadon hd ON hd.MaKH = kh.MaKH
	WHERE kh.MaKH = hd.MaKH
GROUP BY kh.MaKH
ORDER BY SUM(hd.TriGia) DESC
LIMIT 3;

-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.

SELECT MaSP, TenSP
FROM sanpham
ORDER BY Gia DESC
LIMIT 3;

-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức Giá thấp nhất (của tất cả các sản phẩm).

SELECT MaSP, TenSP
FROM sanpham
JOIN (SELECT Gia 
	FROM sanpham ORDER BY Gia LIMIT 3) AS spnew ON sanpham.Gia = spnew.Gia
	WHERE sanpham.NuocSX = 'Trung Quoc';

-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức Giá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).

SELECT MaSP, TenSP
FROM sanpham
	WHERE NuocSX = 'Trung Quoc'
ORDER BY Gia
LIMIT 3;

-- 28. *In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).

SELECT kh.MaKH, kh.HoTen
FROM khachhang kh
JOIN hoadon hd ON hd.MaKH = kh.MaKH
	WHERE kh.MaKH = hd.MaKH
GROUP BY kh.MaKH
ORDER BY SUM(hd.TriGia) DESC
LIMIT 3;

-- 29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.

SELECT count(MaSP) AS TrungQuocSX 
FROM sanpham
	WHERE NuocSX = 'Trung Quoc';

-- 30. Tính tổng số sản phẩm của từng nước sản xuất.

SELECT NuocSX, COUNT(MaSP) AS TongTungNuocSX 
FROM sanpham
GROUP BY NuocSX;

-- 31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.

SELECT NuocSX, COUNT(MaSP) AS TongTungNuocSX, MAX(Gia) AS GiaLonNhat, MIN(Gia) AS GiaBeNhat, AVG(Gia) AS GiaTrungBinh 
FROM sanpham
GROUP BY NuocSX;

-- 32. Tính doanh thu bán hàng mỗi ngày.

SELECT NgayMuaHang, SUM(TriGia) AS DoanhThuTrongNgay 
FROM hoadon
GROUP BY NgayMuaHang;

-- 33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.

SELECT MaSP, SUM(SoLuong) AS TongSoLuong 
FROM cthd
JOIN hoadon ON cthd.SoHD = hoadon.SoHoaDon
	WHERE hoadon.NgayMuaHang = '2006-10-28'
GROUP BY MaSP;

-- 34. Tính doanh thu bán hàng của từng tháng trong năm 2006.

SELECT MONTH(NgayMuaHang) AS Thang, SUM(TriGia) AS DoanhThu 
FROM hoadon
	WHERE YEAR(NgayMuaHang) = '2006'
GROUP BY MONTH(NgayMuaHang)
ORDER BY NgayMuaHang;

-- 35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.

SELECT MaKH, COUNT(MaKH) AS SoLanMua 
FROM hoadon
GROUP BY MaKH
ORDER BY SoLanMua DESC
LIMIT 1;

-- 36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.

SELECT sp.MaSP, sp.TenSP
FROM sanpham sp
JOIN cthd ON sp.MaSP = cthd.MaSP
JOIN hoadon hd ON hd.SoHoaDon = cthd.SoHD
	WHERE YEAR(hd.NgayMuaHang) = '2006'
GROUP BY cthd.MaSP
ORDER BY SUM(cthd.SoLuong)
LIMIT 1;

-- 37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?

SELECT MONTH(NgayMuaHang) AS ThangBanItNhat 
FROM hoadon
	WHERE YEAR(NgayMuaHang) = '2006'
GROUP BY MONTH(NgayMuaHang)
ORDER BY SUM(TriGia)
LIMIT 1;

-- 38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.

SELECT NuocSX, MaSP, TenSP 
FROM sanpham spa
WHERE Gia = (SELECT MAX(Gia) 
	FROM sanpham spb 
		WHERE spa.NuocSX = spb.NuocSX)
ORDER BY Gia DESC;

-- 39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

SELECT kh.MaKH, kh.HoTen, SUM(hd.TriGia) AS DoanhSo, COUNT(hd.MaKH) AS SoLanMua
FROM khachhang kh
JOIN hoadon hd ON kh.MaKH = hd.MaKH
GROUP BY kh.MaKH
LIMIT 1;

-- 40. *Tìm nước sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.

SELECT NuocSX
FROM  sanpham
GROUP BY NuocSX
HAVING COUNT(DISTINCT Gia) >= 3




