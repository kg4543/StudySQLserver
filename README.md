# Study_SQL_server
 
 - SSMS(SQL Server Management Studio) tool을 활용하여 DataBase 관리
--------------------------------------

## DDL(Data Definition Language)

### 1. Create
* Create table [table명](컬럼명1 데이터타입 제약조건,컬럼명2...)
* Create view [view명] as [조회 Query]
* Create index [index명] on [table명](컬럼명1,컬럼명2...)

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
```

### 2. Alter
* Alter table [table명] ADD 컬럼명 데이터타입 제약조건
* Alter table [table명] Modify 컬럼명 데이터타입 제약조건
* Alter table [table명] Drop 컬럼명

### 3. Drop
* Drop table [table명] [casecade | restrict]

### 4. Truncate
* Truncate table [table명]

-----------------------------------------
## DML(Data Manipulation Language)

### 1. Select
* Select [column명] from [table명] [where 조건] [Group by column명 having 조건] [Order by column명 Asc | Desc]

### 2. Insert
* Insert into [table명](컬럼명1,...) values (컬럼값1,...)

### 3. Update
* Update [table명] set [column명] = [column값] [where 조건]

### 4. Delete
* Delete from [table명] [where 조건]

-----------------------------------------
## DCL(Data Control Language)

### 1. Grant
* Grant [권한] On [table명] To [사용자]

### 2. Revoke
* Revoke [권한] On [table명] From [사용자]

------------------------------------------
## TSQL(Transact-SQL)
