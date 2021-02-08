use sqlDB;
go


-- �̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
where userName = '���ȣ';

-- 1970�� ���� ����̰� Ű 182 �̻��� ��� ���̵�, �̸��� ��ȸ
select userID, userName, height, birthYear
	from userTbl
	where birthYear >= 1970
	and height >= 182;
	-- and userName like '��%'

-- 1970�� ���� ����̰ų� Ű 182 �̻��� ����� ��ȸ
select userID, userName, height, birthYear
	from userTbl
	where birthYear >= 1970
	or height >= 182;

-- Ű�� 180~183 ������ ����� ��ȸ
select userID, userName, height
	from userTbl
	where height >=180
	and height <=  183;
-- between ~ and
select userID, userName, height
	from userTbl
	where height between 180 and 183;

-- ������ �泲, ����, ���
select userID, userName, addr
	from userTbl
	where addr = '�泲'
	or addr = '����'
	or addr = '���';

select userID, userName, addr
	from userTbl
	where addr in ('�泲','����','���');

-- like��
select userID, userName
	from userTbl
	where userName like '��%';

select userID, userName
	from userTbl
	where userName like '_����';

-- Subquery
select userName, height
	from userTbl
	where height > 177;

select userName, height
	from userTbl
	where height > 
	(select height from userTbl where userName = '���ȣ');

select userName, height
	from userTbl
	where height in
	(select height from userTbl where userName = '���ȣ');

select userName, height
	from userTbl
	where height >= any -- any,some / all 
	(select height from userTbl where addr = '�泲');

-- order by ����
select userName, mdate
  from userTbl
 order by mdate asc; -- asc(��������) / desc(��������)

 select *
  from userTbl
 order by userID desc;

 -- distinct(�ߺ�����)
 select distinct addr
   from userTbl;

 -- top(n) ���� n��
 select top(5) *
   from userTbl
  order by mDate desc;

  -- offset �ռ� ������ŭ �پ���� �� ��ȸ
 select userID, userName, birthYear
	from userTbl
	order by birthYear
	offset 4 rows;

  -- ���� (PK�� ������� ����)
  select * into buyTbl2 from buyTbl;
  select userID, prodName into buyTbl3 from buyTbl;

  --group by
  select * from buyTbl;

  select userID, amount
  from buyTbl
  order by userID;

  select userID, sum(amount) as '�����հ�'
  from buyTbl
 group by userID;

 -- min, max
 select min(height) as '�ּ�Ű' 
 from userTbl;

 select max(height) as '�ִ�Ű' 
 from userTbl;

 select userID,height, min(height) as '����Ű', max(height) as 'ūŰ'
	from userTbl
group by userID, height;

 select userID,userName,height
	from userTbl
	where height = (select min(height) from userTbl)
	or height = (select max(height) from userTbl);

-- �� ������ ����
 select count(*) as 'ȸ����' from userTbl;
 select count(*) as '���ų�����' from buyTbl;

 -- �߸��� ���͸�
 select userID, sum(price * amount) as 'ID�� ���� �ݾ�'
	from buyTbl
	-- where sum(price * amount) > 1000 / where �� group by�� ���� ��� �ȵ�
	group by userID
	having sum(price * amount) > 1000 -- group by���� having ���� ����ؾ� ��
	order by sum(price * amount) desc;

 -- rollup / cube
 select num, groupName, sum(price * amount) as '���űݾ�',
		 Grouping_ID(groupName, num)
	from buyTbl
	group by rollup(groupName, num);

 -- userID, groupName ������ cube ������ �հ�
 select userID, groupName, sum(price * amount) as '���űݾ�'
	from buyTbl
	group by cube(groupName, userID);
	 
 select num, sum(price * amount) as '���űݾ�'
	from buyTbl
	group by rollup(num);
 select groupName, sum(price * amount) as '���űݾ�'
	from buyTbl
	group by rollup(groupName);

 -- widthout CTE
 select userID, sum(price * amount) as 'total'
	from buyTbl
	group by userID
	order by sum(price * amount) desc;

 -- with CTE : �ӽ��� ���̺��� ����
 with cte_tmp(userID, total)
 as
 (
	select userID, sum(price*amount) as 'total'
	from buyTbl
	group by userID
 )
 select * from cte_tmp order by total  desc;