
select * from booksTbl

--������ �Է�
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
		,'�������� �ʴ� ����'
		,'���ѳ�'
		,'������'
		,'2019-10-02'
		,'9791135445705'
		,12500	
	 )
-- ���� ����
begin tran;

  update booksTbl
	 set descriptions ='�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����. ������ �θ� �Ʒ��� �������̰� ��������� �ڶ�����, ���ϴ� �� ������ �տ� �־�� �ϴ� ������ ����. �׷� �׸� �ڲ� ���� �浿�� �ô޸��� �ϴ� ���ڰ� ��Ÿ����. �׳�� �ٷ� ���»� KJ �ű��� ��ǥ�� ������ ��, ������. ���� �� ����...' 
	     ,regDate = '2021-02-18'
   where bookidx = 14;

rollback;
commit;

--ī�װ��Է�
begin tran;
insert into cateTbl values ('I0001','��ȭ����')
						  ,('I0002','����/ó��')
						  ,('I0003','�ð�����')

select * from cateTbl

rollback;
commit;

delete from cateTbl where cateidx = 'I0003';