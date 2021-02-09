-- Union
select clubName as bName, buildingNum as bLocation from clubtbl
union
select stdName, region from stdtbl;

-- Union All : 중복값 생략 안함
select stdName, region from stdtbl
union all
select stdName, region from stdtbl;

-- except 첫번째거 기준 공통사항 삭제 / intersect 뒤에거 기준 공통사항 삭제
select clubName as bName, buildingNum as bLocation from clubtbl
except
select stdName, region from stdtbl;

select clubName, buildingNum from clubtbl
intersect
select stdName, region from stdtbl;