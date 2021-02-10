declare @Var1 int; -- 변수선언
set @Var1 = 100; -- 변수값 대입

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