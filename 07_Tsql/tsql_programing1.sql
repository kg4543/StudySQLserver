declare @Var1 int; -- ��������
set @Var1 = 100; -- ������ ����

if @Var1 = 100
	begin
		print '@Var1 = 100';
		select '@Var1 = 100';
	end
else
	begin
		print '@Var1 != 100';
		select '@Var1 = 100';
	end