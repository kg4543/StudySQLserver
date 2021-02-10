/*
use sqlDB
go
*/
--create table testTbl (num int);
-- drop table testTbl; --최대한 주의

use tempdb;
go
/*
drop database tableDB;
go
create database tableDB;
*/

use tableDB;
go
drop table buyTbl;
drop table userTbl;
go
create table userTbl --부모
(
	userID		char(8)			not null	 primary key,		--아이디
	userName	nvarchar(10)	not null,		--이름
	birthYear	int				not null,		--출생년도
	addr		nchar(2)		not null	 default '서울',		--지역
	mobile1		char(3)			null,			--휴대폰 국번
	mobile2		char(8)			null,			--휴대폰 번호
	height		smallint		null,			--키
	email		varchar(150)	unique,			--이메일
	mdate		date			null		default getdate()		--회원 가입일
);
go
create table buyTbl --자식
(
	num			int				not null	identity(1,1)	primary key,		--순번(PK)
	userID		char(8)			not null
		foreign key references userTbl(userID),		--아이디
	prodName	nchar(6)		not null,		--품명
	groupName	nchar(4)		null,			--분류
	price		int				not null,		--단가
	amount		smallint		not null		--수량
);
go

-- Alter: table내용 변경