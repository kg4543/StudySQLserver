use BookRentalShopDB
go

--����� level �����Լ�
create or alter function dbo.ufn_getlevels(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5); --������/���ȸ��/�ǹ�ȸ��...
	set @result = case @levels
		when 'A' then '���ȸ��'
		when 'B' then '�ǹ�ȸ��'
		when 'C' then '�Ϲ�ȸ��'
		when 'D' then '��'
		when 'S' then '������'
		else '��ȸ��'
		end;
	return @result;
end;
