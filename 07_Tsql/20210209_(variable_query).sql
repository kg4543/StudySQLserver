use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10, 7); -- decimal(전체 길이, 소수점 길이)
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 3.141592;

select @myVar1;
select @myVar2 + @myVar3;
select '값은 ' + CAST(@myVar3 as varchar);

declare @myVar4 char(20);
set @myVar4 = '가수 이름==> ';

select @myVar4, userName from userTbl where height > 175;

declare @myVar5 tinyint; --255
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc;

--
select @@VERSION

-- 형 변환 함수
select convert(float, amount) as amount from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl; 
select AVG(convert(decimal, amount)) as [평균구매갯수] from buyTbl;

select price, amount, price/amount as [단가/수량] from buyTbl;

-- '1000' --> 숫자
-- Try: 값이 문제가 있을 경우 Null 값으로 함
select PARSE('2021년2월9일' as date);
select try_PARSE('2021년2월39일' as date); 

select parse('123.45' as int);
select parse('123.45' as decimal(5, 2));
select TRY_PARSE('123.45' as int) 

select CAST('11' )

-- 스카라 함수 (단일 리턴 함수)

--날짜 및 시간
select GETDATE() as '현재날짜';
select YEAR(GETDATE())as '금년';
select Month(GETDATE())as '이번달';
select day(GETDATE())as '날짜';

--수치 연산
select abs(-100.5);
select ROUND(3.1415, 3); 
select ROUND(123456, -2);
select round((RAND() * 100), 0);
select cast((RAND() * 100) as int);

--논리 함수
select iif(20 > 10, '참', '거짓');

--문자열 함수
select ASCII('a'),ASCII('A');
select char(98), char(66);
select UNICODE('걁');
select NCHAR(46002);

-- 많이 쓰는 함수들!!!
select concat('Microsoft ','SQL_','Server ',2019); -- 문자열로 결합시켜 표시해줌 , 이거아니면 covert 같은걸로 다 변환시켜야 됨
select CHARINDEX('server','SQL Server 2019'); -- 보통 개발툴과 다르게 index가 0이 아닌 1부터 시작 / 'Server'가 'SQL Server 2019'에서 몇번째?
select LEFT('SQL Server 2019', 3), RIGHT('SQL Server 2019', 4);
-- substring
select substring('hello world', 7, 5);
select substring('안녕하세요, SQL서버입니다.', 6, 5);
--len
select len('안녕하세요'), len('Hello world!');
--lower(소문자변환), upper(대문자변환)
select lower('abcdceFG'), upper('abcdeFG');
-- ltrim(왼쪽정렬), rtrim(오른쪽정렬), trim(양쪽 공백 없애기)
select ltrim('   Hello world   '),
       RTRIM('   Hello world   '),
	   trim('   Hello world   ');
	   
select REPLACE('(2016년 발표) SQL Server 2016', '2016', '2019');

-- 정말 많이 쓰느 함수!!!!!!!!!!!
select FORMAT(GETDATE(), ''); --기본
select FORMAT(GETDATE(), 'dd/MM/yyyy');
select FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss'); 
 