CREATE DATABASE QLBH
-----------------------------------------------------
-----------------------------------------------------
---------------------------------------------
USE QLBH;
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
   CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
--1.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) do ???Trung Quoc??? s???n xu???t.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--2.	In ra danh s??ch c??c s???n ph???m (MASP, TENSP) c?? ????n v??? t??nh l?? ???cay???, ???quyen???.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN('CAY', 'QUYEN')
--3.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) c?? m?? s???n ph???m b???t ?????u l?? ???B??? v?? k???t th??c l?? ???01???.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE'B%01'
--4.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) do ???Trung Qu???c??? s???n xu???t c?? gi?? t??? 30.000 ?????n 40.000.
SELECT MASP,TENSP,NUOCSX
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
AND GIA BETWEEN 30000 AND 40000
--5.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) do ???Trung Quoc??? ho???c ???Thai Lan??? s???n xu???t c?? gi?? t??? 30.000 ?????n 40.000.
SELECT MASP, TENSP, NUOCSX
FROM SANPHAM
WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'THAI LAN') AND GIA BETWEEN 30000 AND 40000
--6.	In ra c??c s??? h??a ????n, tr??? gi?? h??a ????n b??n ra trong ng??y 1/1/2007 v?? ng??y 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD >= '1/1/2007' AND NGHD <= '1/2/2007'
--7.	In ra c??c s??? h??a ????n, tr??? gi?? h??a ????n trong th??ng 1/2007, s???p x???p theo ng??y (t??ng d???n) v?? tr??? gi?? c???a h??a ????n (gi???m d???n).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC
--8.	In ra danh s??ch c??c kh??ch h??ng (MAKH, HOTEN) ???? mua h??ng trong ng??y 1/1/2007.
SELECT K.MAKH, HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE NGHD = '1/1/2007'
--9.	In ra s??? h??a ????n, tr??? gi?? c??c h??a ????n do nh??n vi??n c?? t??n ???Nguyen Van B??? l???p trong ng??y 28/10/2006.
SELECT SOHD, TRIGIA
FROM HOADON H INNER JOIN NHANVIEN N
ON H.MANV = N.MANV
WHERE NGHD = '10/28/2006'
AND HOTEN = 'NGUYEN VAN B'
--10.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) ???????c kh??ch h??ng c?? t??n ???Nguyen Van A??? mua trong th??ng 10/2006.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
AND EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)
--11.	T??m c??c s??? h??a ????n ???? mua s???n ph???m c?? m?? s??? ???BB01??? ho???c ???BB02???.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
--12.	T??m c??c s??? h??a ????n ???? mua s???n ph???m c?? m?? s??? ???BB01??? ho???c ???BB02???, m???i s???n ph???m mua v???i s??? l?????ng t??? 10 ?????n 20.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
AND SL BETWEEN 10 AND 20
--13.	T??m c??c s??? h??a ????n mua c??ng l??c 2 s???n ph???m c?? m?? s??? ???BB01??? v?? ???BB02???, m???i s???n ph???m mua v???i s??? l?????ng t??? 10 ?????n 20.
SELECT SOHD
FROM CTHD A
WHERE A.MASP = 'BB01'
AND SL BETWEEN 10 AND 20
AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02'
AND SL BETWEEN 10 AND 20
AND A.SOHD = B.SOHD)
--14.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) do ???Trung Quoc??? s???n xu???t ho???c c??c s???n ph???m ???????c b??n ra trong ng??y 1/1/2007.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC'
AND C.SOHD IN(SELECT DISTINCT C2.SOHD
FROM CTHD C2 INNER JOIN HOADON H
ON C2.SOHD = H.SOHD
WHERE NGHD ='1/1/2007')
--15.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) kh??ng b??n ???????c.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NOT EXISTS(SELECT * 
FROM SANPHAM S2 INNER JOIN CTHD C
ON S2.MASP = C.MASP
AND S2.MASP = S.MASP)
--16.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) kh??ng b??n ???????c trong n??m 2006.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)

--17.	In ra danh s??ch c??c s???n ph???m (MASP,TENSP) do ???Trung Quoc??? s???n xu???t kh??ng b??n ???????c trong n??m 2006.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NUOCSX = 'TRUNG QUOC' AND S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
--18.	T??m s??? h??a ????n ???? mua t???t c??? c??c s???n ph???m do Singapore s???n xu???t.
SELECT H.SOHD 
FROM HOADON H
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))

SELECT DISTINCT CT.SOHD 
FROM CTHD CT
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = CT.SOHD
AND C.MASP = S.MASP))

--19.	T??m s??? h??a ????n trong n??m 2006 ???? mua ??t nh???t t???t c??? c??c s???n ph???m do Singapore s???n xu???t.
SELECT H.SOHD 
FROM HOADON H
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))
--20.	C?? bao nhi??u h??a ????n kh??ng ph???i c???a kh??ch h??ng ????ng k?? th??nh vi??n mua?
SELECT COUNT(*)
FROM HOADON H
WHERE MAKH NOT IN(SELECT MAKH
FROM KHACHHANG K 
WHERE K.MAKH = H.MAKH)
--21.	C?? bao nhi??u s???n ph???m kh??c nhau ???????c b??n ra trong n??m 2006.
SELECT COUNT(DISTINCT MASP)
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006
--22.	Cho bi???t tr??? gi?? h??a ????n cao nh???t, th???p nh???t l?? bao nhi??u ?
SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON
--23.	Tr??? gi?? trung b??nh c???a t???t c??? c??c h??a ????n ???????c b??n ra trong n??m 2006 l?? bao nhi??u?
SELECT AVG(TRIGIA) TB
FROM HOADON
--24.	T??nh doanh thu b??n h??ng trong n??m 2006.
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
--25.	T??m s??? h??a ????n c?? tr??? gi?? cao nh???t trong n??m 2006.
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
FROM HOADON)
--26.	T??m h??? t??n kh??ch h??ng ???? mua h??a ????n c?? tr??? gi?? cao nh???t trong n??m 2006.
SELECT HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH 
AND SOHD = (SELECT SOHD
			FROM HOADON
			WHERE TRIGIA = (SELECT MAX(TRIGIA)
							FROM HOADON))
--27.	In ra danh s??ch 3 kh??ch h??ng (MAKH, HOTEN) c?? doanh s??? cao nh???t.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--28.	In ra danh s??ch c??c s???n ph???m (MASP, TENSP) c?? gi?? b??n b???ng 1 trong 3 m???c gi?? cao nh???t.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA
			  FROM SANPHAM
			  ORDER BY GIA DESC)
--29.	In ra danh s??ch c??c s???n ph???m (MASP, TENSP) do ???Thai Lan??? s???n xu???t c?? gi?? b???ng 1 trong 3 m???c gi?? cao nh???t (c???a t???t c??? c??c s???n ph???m).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC)
--30.	In ra danh s??ch c??c s???n ph???m (MASP, TENSP) do ???Trung Quoc??? s???n xu???t c?? gi?? b???ng 1 trong 3 m???c gi?? cao nh???t (c???a s???n ph???m do ???Trung Quoc??? s???n xu???t).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC)
--31.	* In ra danh s??ch 3 kh??ch h??ng c?? doanh s??? cao nh???t (s???p x???p theo ki???u x???p h???ng).
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--32.	T??nh t???ng s??? s???n ph???m do ???Trung Quoc??? s???n xu???t.
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--33.	T??nh t???ng s??? s???n ph???m c???a t???ng n?????c s???n xu???t.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX
--34.	V???i t???ng n?????c s???n xu???t, t??m gi?? b??n cao nh???t, th???p nh???t, trung b??nh c???a c??c s???n ph???m.
SELECT NUOCSX, MAX(GIA) AS MAX, MIN(GIA) AS MIN, AVG(GIA) AS AVG
FROM SANPHAM
GROUP BY NUOCSX
--35.	T??nh doanh thu b??n h??ng m???i ng??y.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD
--36.	T??nh t???ng s??? l?????ng c???a t???ng s???n ph???m b??n ra trong th??ng 10/2006.
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SANPHAM
WHERE MASP IN(SELECT MASP
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP
--37.	T??nh doanh thu b??n h??ng c???a t???ng th??ng trong n??m 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
--38.	T??m h??a ????n c?? mua ??t nh???t 4 s???n ph???m kh??c nhau.
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD
WHERE SL >= 4)
--39.	T??m h??a ????n c?? mua 3 s???n ph???m do ???Viet Nam??? s???n xu???t (3 s???n ph???m kh??c nhau).
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD C INNER JOIN SANPHAM S
ON C.MASP = S.MASP
WHERE NUOCSX = 'VIET NAM' AND SL >= 3)
--40.	T??m kh??ch h??ng (MAKH, HOTEN) c?? s??? l???n mua h??ng nhi???u nh???t. 
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH
FROM HOADON
GROUP BY MAKH
ORDER BY COUNT(DISTINCT SOHD) DESC)
--41.	Th??ng m???y trong n??m 2006, doanh s??? b??n h??ng cao nh???t ?
SELECT TOP 1 MONTH(NGHD) AS THANG_DOANHSO_MAX
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC
--42.	T??m s???n ph???m (MASP, TENSP) c?? t???ng s??? l?????ng b??n ra th???p nh???t trong n??m 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (SELECT TOP 1 MASP
FROM CTHD
GROUP BY MASP
ORDER BY SUM(SL) DESC)
--43.	*M???i n?????c s???n xu???t, t??m s???n ph???m (MASP,TENSP) c?? gi?? b??n cao nh???t.

--CAU NAY KHO. DAU TIEN TIM MAX GIA CUA NUOCSX
SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX

--SAU DO DAT TEN BANG VUA ROI LA B, ROI THUC HIEN KET TRAI. OI HK THANH' VAI~ :))

SELECT B.NUOCSX, MASP, TENSP
FROM (SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX) AS B LEFT JOIN SANPHAM S 
ON S.GIA = B.MAX 
WHERE B.NUOCSX = S.NUOCSX
--44.	T??m n?????c s???n xu???t s???n xu???t ??t nh???t 3 s???n ph???m c?? gi?? b??n kh??c nhau.

--45.	*Trong 10 kh??ch h??ng c?? doanh s??? cao nh???t, t??m kh??ch h??ng c?? s??? l???n mua h??ng nhi???u nh???t.
-- DAU TIEN LA TIM 10 KHACH HANG CO DOANH SO CAO NHAT
SELECT TOP 10 MAKH
FROM KHACHHANG
ORDER BY DOANHSO DESC

--DAY LA BANG KHACH HANG VA SO LAN MUA
SELECT MAKH, COUNT(SOHD)
FROM HOADON
GROUP BY MAKH

/*KET TRAI 2 BANG LAI VOI NHAU ROI SAP XEP THEO SO LAN MUA GIAM DAN. TA CHON DUOC KHACH HANG TRONG 10 NGUOI
MA CO DOANH SO CAO NHAT MA CO SO LAN MUA NHIEU NHAT. LAY DUOC MAKH ROI THI LAY THONG TIN THOI
*/
SELECT TOP 1 A.MAKH
FROM (SELECT TOP 10 MAKH
FROM KHACHHANG
ORDER BY DOANHSO DESC) AS A
LEFT JOIN 
(SELECT MAKH, COUNT(SOHD) AS SL
FROM HOADON
GROUP BY MAKH) AS B
ON A.MAKH = B.MAKH
ORDER BY SL DESC

--DAP SO
SELECT *
FROM KHACHHANG
WHERE MAKH = (SELECT TOP 1 A.MAKH
FROM (SELECT TOP 10 MAKH
FROM KHACHHANG
ORDER BY DOANHSO DESC) AS A
LEFT JOIN 
(SELECT MAKH, COUNT(SOHD) AS SL
FROM HOADON
GROUP BY MAKH) AS B
ON A.MAKH = B.MAKH
ORDER BY SL DESC)
