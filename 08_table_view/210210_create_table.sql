/*
use sqlDB
go
*/
--create table testTbl (num int);
-- drop table testTbl; --�ִ��� ����

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
create table userTbl --�θ�
(
	userID		char(8)			not null	 primary key,		--���̵�
	userName	nvarchar(10)	not null,		--�̸�
	birthYear	int				not null,		--����⵵
	addr		nchar(2)		not null	 default '����',		--����
	mobile1		char(3)			null,			--�޴��� ����
	mobile2		char(8)			null,			--�޴��� ��ȣ
	height		smallint		null,			--Ű
	email		varchar(150)	unique,			--�̸���
	mdate		date			null		default getdate()		--ȸ�� ������
);
go
create table buyTbl --�ڽ�
(
	num			int				not null	identity(1,1)	primary key,		--����(PK)
	userID		char(8)			not null
		foreign key references userTbl(userID),		--���̵�
	prodName	nchar(6)		not null,		--ǰ��
	groupName	nchar(4)		null,			--�з�
	price		int				not null,		--�ܰ�
	amount		smallint		not null		--����
);
go

-- Alter: table���� ����