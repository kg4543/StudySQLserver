use sqlDB
go

/*
select * from stdTbl;
select * from clubTbl;
select * from clubRegTbl;
*/

 -- inner join(��������) ���Ĵٵ�
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s
 inner join clubRegTbl as r
	on s.id = r.std_id
 inner join clubTbl as c
	on r.club_id = c.id
 order by s.id;
 
 -- inner join ���
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s, clubRegTbl as r, clubTbl as c
 where s.id = r.std_id
   and r.club_id = c.id;

 -- outer join(�ܺ�����)
 -- right join�� ���� ���̺� / left�� �ݴ� / full�� ����
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl as s
  left outer join clubRegTbl as r  
	on s.id = r.std_id
  left outer join clubTbl as c
	on r.club_id = c.id
  
select *
  from stdTbl as s
  left outer join ClubRegTbl as r
    on s.id = r.std_id
  full outer join ClubTbl as c
    on r.club_id = c.id

 select *
  from stdTbl as s
  left outer join ClubRegTbl as r
    on s.id = r.std_id

 -- userTbl / buyTbl
 select u.userName, u.addr, b.prodName, b.price
   from userTbl as u
   left outer join buyTbl as b 
     on u.userID = b.userID
  where b.prodName is null;
