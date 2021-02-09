# Study_SQL_server
SQL server에 관련된 교육사항
--------------------------------------

## 1. Create
* DB 생성 및 Table 설계
```
create table userTbl -- 회원 테이블
(
	userID	char(8) not null primary key, -- 사용자 아이디
	userName	nvarchar(10) not null, -- 이름
	birthYear	int not null, -- 출생년도
	addr	nchar(2) not null, -- 지역
	mobile1	char(3), -- 휴대폰의 국번(010~019)
	mobile2	char(8), -- 휴대폰 나머지 (하이픈-제외)
	height	smallint, -- 키
	mDate	date -- 회원 가입일 / 마지막 필드여서 ',' 없슴
);
go
create table buyTbl -- 회원 구매 테이블
(
	num	int identity not null primary key,	-- 순번(PK)
	userID	char(8)	not null	-- 아이디(FK)
	foreign key references userTbl(userID),
	prodName nvarchar(20) not null,	-- 물품명
	groupName nchar(4),	-- 분류
	price int not null,	-- 단가
	amount smallint not null	-- 수량
);
go
```
---------------------------------------

## 2. Insert

---------------------------------------

## 3. Select

---------------------------------------

## 4. Update

---------------------------------------

## 5. Delete

---------------------------------------

## 6. Join

---------------------------------------
