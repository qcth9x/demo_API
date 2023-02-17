create database Phim;
use Phim;

CREATE TABLE User(
	id int  primary key,
	hoTen varchar(255),
	SDT varchar(255),
	gioiTinh varchar(255)
);

CREATE TABLE Category(
	id varchar(255) primary key,
	tenDanhMuc varchar(255)
);
create table theLoai (
	id varchar(255) primary key,
	tenTheLoai varchar(255)
);

CREATE TABLE Movie(
	id int(255)  primary key,
	tenPhim varchar(255),
	idTheLoai varchar(255),
	idDanhMuc varchar(255),
	ngaySanXuat varchar(255),
	giaPhim varchar(255),
	foreign key (idDanhMuc) references Category(id),
    foreign key (idTheLoai) references theLoai(id)
);


CREATE TABLE Rent(
	id varchar(255) primary key,
	thoiGianThue datetime,
	idNguoiThue int,
	idPhim int,
	idDanhMuc varchar(255),
	soTien varchar(255),
	thoiGianTra datetime,
	foreign key (idDanhMuc) references Category(id),
	foreign key (idPhim) references Movie(id),
	foreign key (idNguoiThue) references User(id)
);

INSERT INTO User (id , hoTen , SDT , gioiTinh)
VALUES 
	(1,'Le Van A','0987654321','Nam'), 
	(2,'Le Van D','00987654322','Nam'), 
	(3, 'Le Van C', '0987654311', 'Nam');
INSERT INTO theLoai (id , tenTheLoai)
VALUES 
  ('tl01' , 'phim co trang')
  ;
    
INSERT INTO Category(id , tenDanhMuc)
VALUES 
	('dm01','Phim 18+'),
	('dm02','Phim 16+');


INSERT INTO Movie(id , tenPhim , idTheLoai , idDanhMuc , ngaySanXuat , giaPhim )
 VALUES 
	(1,'tam quoc chi','tl01', 'dm01', '10/8/2010', '350000'),
	(2,'hong lau mong', 'tl01', 'dm01', '10/7/2010', '200000'),
	(3,'thuy huu', 'tl01', 'dm01', '10/8/2010', '100000'),
	(4,'tay du ky', 'tl01','dm01' ,'10/8/2010', '150000');

INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('mtp01','2023-01-31 10:00:00', 1 , 1, 'dm01' , '200000' , '2023-01-31 11:00:00')
	;
INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('mtp02','2023-01-31 10:00:00', 2 , 1, 'dm01' , '200000' , '2023-01-31 11:00:00')
	;
INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('mtp03','2023-01-31 10:00:00', 3 , 1, 'dm02' , '200000' , '2023-01-31 11:00:00')
	;
INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('mtp04','2023-01-31 11:00:00', 1 , 2, 'dm01' , '200000' , '2023-01-31 12:00:00')
	;
    INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('mtp05','2023-01-31 11:00:00', 3 , 2, 'dm01' , '200000' , '2023-01-31 12:00:00')
	;
    select * from Rent;
    select * from Movie;
    select * from Category;
    select * from User;
    




-- cau 1:
select count(idPhim) as soLan,  hoTen , SDT , gioiTinh 
from Rent
inner join User on Rent.idNguoiThue = User.id
group by idNguoiThue
order by count(idPhim) desc limit 3;


-- cau 3:
select count(thoiGianThue) as soLan , tenPhim
from Rent
inner join Movie on Rent.idPhim = Movie.id
group by idPhim
order by count(thoiGianThue) desc limit 3;


-- cau 4:
select tenPhim , tenTheLoai , tenDanhMuc , ngaySanXuat 
from Movie
inner join theLoai on Movie.idTheLoai = theLoai.id
inner join Category on Movie.idDanhMuc= Category.id;