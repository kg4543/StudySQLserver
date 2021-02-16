select u.userID,u.userName,u.birthYear,u.addr,u.height,b.prodName,b.price
  from userTbl as u
 inner join buyTbl as b
    on u.userID = b.userID
 where height > 170
   for json auto;