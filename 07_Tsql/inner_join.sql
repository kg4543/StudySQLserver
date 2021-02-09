select * from userTbl;
select * from buyTbl;

/*
select *from userTbl where userID = 'JYP';
select *from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK';
*/

--INNER JOIN
select * from buyTbl 
	inner join userTbl 
	on buyTbl.userID = userTbl.userID
	where buyTbl.prodName = '운동화'
	and usertbl.userName = '바비킴';

select u.userID, u.userName, u.addr,
	CONCAT(u.mobile1, '-',left(u.mobile2,4), '-',right(u.mobile2,4)) as mobile,
	b.prodName,b.price,b.amount
	from buyTbl as b
	inner join userTbl as u
	on b.userID = u.userID
	where b.prodName = '운동화'
	and u.userName = '바비킴';
