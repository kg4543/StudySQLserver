use BookRentalShopDB
go

--���� ȸ�� ���� �ҷ����� (�̸���)
select memberID,memberName,levels,mobile,email 
  from memberTbl
 where levels <> 'S'
 order by levels, memberName;

--å ����
select cateidx, bookName, author,
	   interpreter, company, price 
  from booksTbl
 order by price desc;

select * from cateTbl;

--�ý��� �Լ� ��� ����
select memberID,
	   concat(right(memberName,2),' ',left(memberName,1)) as '�̸�',
	   dbo.ufn_getlevels(levels) as 'ȸ�����',
	   concat(substring(mobile,1,3),'-',substring(mobile,4,4),'-',substring(mobile,8,4)) as '��ȭ��ȣ',
	   upper(email) as 'email' 
  from memberTbl
 where levels <> 'S'
 order by levels, memberName;
 
--å ����, �Լ�
SELECT bookidx
      ,cateidx
      ,concat(N'���� > ',bookName) as 'BOOK NAME'
      ,author
      ,isnull(interpreter, '(���ھ���)') as '������'
      ,company
      ,format(releaseDate, 'yyyy�� MM�� dd��') as '������'
      ,ISBN
      ,format(price, '#,#��') as '����'
	  ,format((price/1100), '$ #,#.00') as '�޷�'
      ,regDate
  FROM dbo.booksTbl

-- å ���� (join)
SELECT b.bookidx
      ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
 FROM dbo.booksTbl as b
inner join cateTbl as c
   on b.cateidx = c.cateidx

-- �뿩 ����
select r.rentalidx
	  ,m.memberName
	  ,c.cateName
	  ,b.bookName
	  ,b.author
	  ,format(r.rentalDt,'yyyy�� MM�� dd��') as '�뿩��'
	  ,format((r.rentalDt+5),'yyyy�� MM�� dd��') as '�ݳ��Ⱓ'
	  --,format((getdate()-r.rentalDt+5),'dd') as '��ü��'
	  ,isnull(format(r.returnDt,'yyyy�� MM�� dd��'), ' ') as '�ݳ���' 
	  ,dbo.ufn_getState(rentalState) as '�뿩 ����'
  from rentalTbl as r
 inner join memberTbl as m
	on m.memberidx = r.memberIdx
 inner join booksTbl as b
	on b.bookidx = r.bookidx
 inner join cateTbl as c
	on c.cateidx = b.cateidx

-- å�� �Ⱥ��� ȸ�� ��ȸ
select m.memberName
	  ,dbo.ufn_getState(rentalState) as '�뿩 ����'
  from rentalTbl as r
 right outer join memberTbl as m
	on m.memberidx = r.memberIdx
 where r.rentalidx is null;
 
 -- �뿩���� ���� �帣
 select c.cateName
   from cateTbl as c
   left outer join booksTbl as b
     on c.cateidx = b.cateidx
  where b.cateidx is null
   
	