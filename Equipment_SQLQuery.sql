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
create table User
(ID_User nvarchar(12) primary key,
U_fname nvarchar(30),
U_lname nvarchar(30),
U_Sex nvarchar(1),
U_Email nvarchar(50))

create table Tel_User
(ID_User nvarchar(12) primary key,
U_tel nvarchar(10),
foreign key (ID_User) references User(ID_User))

create table Admin 
(ID_Admin nvarchar(12) primary key,
A_fname nvarchar(30),
A_lname nvarchar(30),
A_Sex nvarchar(1),
A_Email nvarchar(50)0\)

create table Tel_Admin 
(ID_Admin nvarchar(12) primary key,
A_Tel nvarchar(10),
foreign key (ID_Admin) references Admin(ID_Admin))

create table Equipment 
(ID_Equipment nvarchar(10),
Name nvarchar(30),
Total nvarchar(20)
ID)