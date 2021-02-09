-- Union
select clubName as bName, buildingNum as bLocation from clubtbl
union
select stdName, region from stdtbl;

-- Union All : �ߺ��� ���� ����
select stdName, region from stdtbl
union all
select stdName, region from stdtbl;

-- except ù��°�� ���� ������� ���� / intersect �ڿ��� ���� ������� ����
select clubName as bName, buildingNum as bLocation from clubtbl
except
select stdName, region from stdtbl;

select clubName, buildingNum from clubtbl
intersect
select stdName, region from stdtbl;