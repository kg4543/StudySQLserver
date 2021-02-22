  -- 3-1
select  b.Idx as '��ȣ'
		,b.Division as '�帣��ȣ'
		,d.Names as '�帣'
		,b.Names as 'å����'
		,b.Author as '����'
  from bookstbl as b
 inner join divtbl as d
    on d.Division = b.Division
 where d.Division = 'B002'
 
 -- 3-1-1 (No use join)
select b.Idx as '��ȣ'
	   ,b.Division as '�帣 ��ȣ'
	   ,d.Names as '�帣'
	   ,b.Names as 'å����'
	   ,b.Author as '����'
  from bookstbl as b
	   ,divtbl as d
 where d.Division = b.Division
   and d.Division = 'B002'

    -- 3-1-2 (��������)
select  b.Idx as '��ȣ'
		,b.Division as '�帣��ȣ'
		--,d.Names as '�帣'
		,(select Names from divtbl where Division = b.Division) as '�帣'
		,b.Names as 'å����'
		,b.Author as '����'
  from bookstbl as b
 where b.Division = 'B002'

-- 3-2
 select m.Names
	   ,m.Levels
	   ,m.Addr
	   ,r.rentalDate
  from rentaltbl as r
 right outer join membertbl as m
	on r.memberIdx = m.Idx
 where r.Idx is null

 -- 3-2-1 (No use join)
 select m.Names
	   ,m.Levels
	   ,m.Addr
	   --rentalDate: ���� Null���� �ƴϸ� �Ұ���
	   ,(select rentalDate from rentaltbl where memberIdx not in (select idx from membertbl)) as 'rentalDate'
	   --,(select rentalDate from rentaltbl where (select memberIdx from rentaltbl) in (select idx from membertbl)) as 'rentalDate'
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r)
