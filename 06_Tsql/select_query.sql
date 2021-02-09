use sqlDB;
go


-- 이름이 김경호인 사람 조회
select * from userTbl
where userName = '김경호';

-- 1970년 이후 출생이고 키 182 이상인 사람 아이디, 이름만 조회
select userID, userName, height, birthYear
	from userTbl
	where birthYear >= 1970
	and height >= 182;
	-- and userName like '성%'

-- 1970년 이후 출생이거나 키 182 이상인 사람들 조회
select userID, userName, height, birthYear
	from userTbl
	where birthYear >= 1970
	or height >= 182;

-- 키가 180~183 사이인 사람만 조회
select userID, userName, height
	from userTbl
	where height >=180
	and height <=  183;
-- between ~ and
select userID, userName, height
	from userTbl
	where height between 180 and 183;

-- 지역이 경남, 전남, 경북
select userID, userName, addr
	from userTbl
	where addr = '경남'
	or addr = '전남'
	or addr = '경북';

select userID, userName, addr
	from userTbl
	where addr in ('경남','전남','경북');

-- like문
select userID, userName
	from userTbl
	where userName like '김%';

select userID, userName
	from userTbl
	where userName like '_종신';
