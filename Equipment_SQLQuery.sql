

create database Equipment
on primary (name = Equipment_data,
filename='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Equipmeng.mdf',
size = 5 mb,
maxsize = 20 mb,
filegrowth = 10%)
log on (name = Equipment_log,
filename='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Equipmeng.ldf',
size = 1 mb,
maxsize = 10 mb,
filegrowth = 10%)


use Equipment
create table "User"
(User_ID nvarchar(12) primary key,
Name nvarchar(80),
Branch nvarchar(50),
Faculty nvarchar(50),
"Add" nvarchar(100),
Email nvarchar(50))

use Equipment
create table Tel_User
(User_ID nvarchar(12) primary key,
Tell nvarchar(10),
foreign key (User_ID) references "User"(User_ID))

use Equipment
create table Admin
(Admin_ID nvarchar(12) primary key,
Name nvarchar(80),
"Add" nvarchar(100),
Email nvarchar(50),
Position nvarchar(50))

use Equipment
create table Tel_Admin 
(Admin_ID nvarchar(12) primary key,
Tell nvarchar(10),
foreign key (Admin_ID) references Admin(Admin_ID))

use Equipment
create table Borrow
(Borrow_ID int identity(1,1) primary key,
Borrow_Date Datetime,
Return_Date Datetime,
Status nvarchar(1),
User_ID nvarchar(12),
Admin_ID nvarchar(12),
foreign key (User_ID) references "User"(User_ID),
foreign key (Admin_ID) references Admin(Admin_ID))

use Equipment
create table Equipment 
(Equipment_ID nvarchar(6) primary key,
Name nvarchar(100),
Number integer,
Total integer)

use Equipment
create table Borrow_Equipment 
(Borrow_ID int,
Equipment_ID nvarchar(6),
Borrow_Num integer,
primary key (Borrow_ID,Equipment_ID) ,
foreign key (Borrow_ID) references Borrow(Borrow_ID),
foreign key (Equipment_ID) references Equipment(Equipment_ID))


select * from "User"

insert into "User"
values ('601102064113','กชนิภา ต้องใจ','วิทยาการคอมพิวเตอร์','วิทยาศาสตร์และเทคโนโลยี','ท่าพล','Tong1@hotmail.com')
insert into "User"
values ('591102064107','จีรณา พลวดี','ชีววิทยา','วิทยาศาสตร์และเทคโนโลยี','เมือง','Ooy5@hotmail.com')
insert into "User"
values ('601102064118','ชลกร คำหมู่','เคมี','วิทยาศาสตร์และเทคโนโลยี','เมือง','Mon1@hotmail.com')

select * from Tel_User

select Name,Tell
from "User",Tel_User
where "User".User_ID = Tel_User.User_ID

insert into Tel_User
values ('601102064113','0845773407')
insert into Tel_User
values ('591102064107','0881556725')
insert into Tel_User
values ('601102064118','0957173580')

select * from Admin order by Admin_ID desc

update Admin set Name = 'ทีปกร  โพภา' where Admin_ID = 'A00000000002'
insert into Admin
values ('A00000000001','ตุลยา ทาดี','เมือง','Tata1@hotmail.com','พนักงาน')
insert into Admin
values ('A00000000002','ตุลยา ทาดี','เมือง','Teem7@hotmail.com','ข้าราชการ')
insert into Admin
values ('A00000000003','สุวีรา แก่นสารี','ท่าพล','Salee1@hotmail.com','พนักงาน')

select * from Tel_Admin order by Admin_ID desc

insert into Tel_Admin
values ('A00000000001','0879859657')
insert into Tel_Admin
values ('A00000000002','0821682375')
insert into Tel_Admin
values ('A00000000003','0991452369')

select * from Borrow

insert into Borrow
values ('2018/10/30','2018/10/31','1','601102064113','A00000000001')
insert into Borrow
values ('2018/10/30','2018/10/31','1','601102064113','A00000000001')
insert into Borrow
values ('2018/11/02','2018/11/03','0','591102064107','A00000000002')
insert into Borrow
values ('2018/11/02','2018/11/03','0','591102064107','A00000000002')
insert into Borrow
values ('2018/11/04','2018/11/05','1','601102064118','A00000000003')

select * from Equipment


insert into Equipment
values ('E00001','โต๊ะ','100','45')
insert into Equipment
values ('E00002','เก้าอี้','100','30')
insert into Equipment
values ('E00003','ไมโครโฟน','6','3')
insert into Equipment
values ('E00004','ลำโพง','3','1')
insert into Equipment
values ('E00005','โปรเจคเตอร์','2','1')

select * from Borrow_Equipment 

insert into Borrow_Equipment 
values ('1','E00001','50')
insert into Borrow_Equipment 
values ('1','E00002','50')
insert into Borrow_Equipment 
values ('2','E00003','2')
insert into Borrow_Equipment 
values ('3','E00004','2')
insert into Borrow_Equipment 
values ('4','E00005','1')
insert into Borrow_Equipment 
values ('1','E00003','1')
insert into Borrow_Equipment 
values ('5','E00002','10')
insert into Borrow_Equipment 
values ('5','E00001','5')
insert into Borrow_Equipment 
values ('4','E00002','10')


select U.Name as ชื่อ,E.Name as อุปกรณ์,B.Borrow_Date as วันที่ยืม,A.Name as ชื่อผู้อนุญาต,BE.Borrow_Num as จำนวนที่ยืม 
from "User" U,Admin A,Equipment E,Borrow B,Borrow_Equipment BE
where U.User_ID = '601102064118' and B.User_ID = U.User_ID and B.Admin_ID = A.Admin_ID and BE.Borrow_ID = B.Borrow_ID and E.Equipment_ID = BE.Equipment_ID 