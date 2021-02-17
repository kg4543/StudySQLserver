use BookRentalShopDB
go

--실제 회원 정보 불러오기 (이름순)
select memberID,memberName,levels,mobile,email 
  from memberTbl
 where levels <> 'S'
 order by levels, memberName;

--책 정보
select cateidx, bookName, author,
	   interpreter, company, price 
  from booksTbl
 order by price desc;

select * from cateTbl;

--시스템 함수 사용 쿼리
select memberID,
	   concat(right(memberName,2),' ',left(memberName,1)) as '이름',
	   dbo.ufn_getlevels(levels) as '회원등급',
	   concat(substring(mobile,1,3),'-',substring(mobile,4,4),'-',substring(mobile,8,4)) as '전화번호',
	   upper(email) as 'email' 
  from memberTbl
 where levels <> 'S'
 order by levels, memberName;
 
--책 정보, 함수
SELECT bookidx
      ,cateidx
      ,concat(N'제목 > ',bookName) as 'BOOK NAME'
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가'
      ,company
      ,format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      ,ISBN
      ,format(price, '#,#원') as '가격'
	  ,format((price/1100), '$ #,#.00') as '달러'
      ,regDate
  FROM dbo.booksTbl

-- 책 정보 (join)
SELECT b.bookidx
      ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
 FROM dbo.booksTbl as b
inner join cateTbl as c
   on b.cateidx = c.cateidx

-- 대여 정보
select r.rentalidx
	  ,m.memberName
	  ,c.cateName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt,'yyyy년 MM월 dd일') as '대여일'
	  ,format((r.rentalDt+5),'yyyy년 MM월 dd일') as '반납기간'
	  --,format((getdate()-r.rentalDt+5),'dd') as '연체일'
	  ,isnull(format(r.returnDt,'yyyy년 MM월 dd일'), ' ') as '반납일' 
	  ,dbo.ufn_getState(rentalState) as '대여 상태'
  from rentalTbl as r
 inner join memberTbl as m
	on m.memberidx = r.memberIdx
 inner join booksTbl as b
	on b.bookidx = r.bookidx
 inner join cateTbl as c
	on c.cateidx = b.cateidx

-- 책을 안빌린 회원 조회
select m.memberName
	  ,dbo.ufn_getState(rentalState) as '대여 상태'
  from rentalTbl as r
 right outer join memberTbl as m
	on m.memberidx = r.memberIdx
 where r.rentalidx is null;
 
 -- 대여점에 없는 장르
 select c.cateName
   from cateTbl as c
   left outer join booksTbl as b
     on c.cateidx = b.cateidx
  where b.cateidx is null
   
	