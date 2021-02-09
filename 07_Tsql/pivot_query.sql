use sqlDB;
go

select ROW_NUMBER() over(order by height desc,userName asc) as 'Űū����', 
		userName, addr, height
		from userTbl;

-- ���� ��� ����		
select RANK() over(order by height desc) as 'Űū����', 
		userName, addr, height
		from userTbl;

select RANK() over(partition by addr order by height desc) as 'Űū����', 
		userName, addr, height
		from userTbl;

--PIVOT
/*
create table pivotTbl
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTbl values ('�����','�ܿ�',10),
							('������','����',15),
							('�����','����',25),
							('�����','��',3),
							('�����','��',37),
							('������','�ܿ�',40),
							('�����','����',14),
							('�����','�ܿ�',22),
							('������','����',40)
insert into pivotTbl values ('���ð�','����',30);
go
*/


select * from pivotTbl;

select * from pivotTbl
	pivot (sum(amount)
			for season
			in ([��],[����],[����],[�ܿ�])) as resultPivot;


--Json
select userID,userName,addr,height
	from userTbl
	where height > 180
	for json auto;



