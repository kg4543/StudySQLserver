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

-- Subquery
select userName, height
	from userTbl
	where height > 177;

select userName, height
	from userTbl
	where height > 
	(select height from userTbl where userName = '김경호');

select userName, height
	from userTbl
	where height in
	(select height from userTbl where userName = '김경호');

select userName, height
	from userTbl
	where height >= any -- any,some / all 
	(select height from userTbl where addr = '경남');

-- order by 정렬
select userName, mdate
  from userTbl
 order by mdate asc; -- asc(오름차순) / desc(내림차순)

 select *
  from userTbl
 order by userID desc;

 -- distinct(중복제거)
 select distinct addr
   from userTbl;

 -- top(n) 상위 n명
 select top(5) *
   from userTbl
  order by mDate desc;

  -- offset 앞선 갯수만큼 뛰어넘은 후 조회
 select userID, userName, birthYear
	from userTbl
	order by birthYear
	offset 4 rows;

  -- 복사 (PK는 복사되지 않음)
  select * into buyTbl2 from buyTbl;
  select userID, prodName into buyTbl3 from buyTbl;

  --group by
  select * from buyTbl;

  select userID, amount
  from buyTbl
  order by userID;

  select userID, sum(amount) as '구매합계'
  from buyTbl
 group by userID;

 -- min, max
 select min(height) as '최소키' 
 from userTbl;

 select max(height) as '최대키' 
 from userTbl;

 select userID,height, min(height) as '작은키', max(height) as '큰키'
	from userTbl
group by userID, height;

 select userID,userName,height
	from userTbl
	where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

-- 총 데이터 갯수
 select count(*) as '회원수' from userTbl;
 select count(*) as '구매내역수' from buyTbl;