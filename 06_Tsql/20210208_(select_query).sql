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
