
select * from booksTbl

--데이터 입력
insert into booksTbl
	 (
		cateidx
		,bookName
		,author
		,company
		,releaseDate
		,ISBN
		,price
	 )
	 values
	 (
		'N0002'
		,'순수하지 않는 감각'
		,'요한나'
		,'로코코'
		,'2019-10-02'
		,'9791135445705'
		,12500	
	 )
-- 내용 수정
begin tran;

  update booksTbl
	 set descriptions ='부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석. 교육자 부모 아래서 보수적이고 모범적으로 자랐지만, 원하는 건 무조건 손에 넣어야 하는 집요한 남자. 그런 그를 자꾸 낯선 충동에 시달리게 하는 여자가 나타났다. 그녀는 바로 협력사 KJ 신기주 대표의 유능한 비서, 임정은. 감히 내 옆에...' 
	     ,regDate = '2021-02-18'
   where bookidx = 14;

rollback;
commit;

--카테고리입력
begin tran;
insert into cateTbl values ('I0001','대화협상')
						  ,('I0002','성공/처세')
						  ,('I0003','시간관리')

select * from cateTbl

rollback;
commit;

delete from cateTbl where cateidx = 'I0003';