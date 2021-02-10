declare @i smallint = 0,
        @hap bigint = 0;
		
while (@i <= 100)
begin
	if(@i % 10 = 0) --10의 배수
	begin
		print concat('10의 배수, ', @i);
		set @i += 1;
		continue;
	end

	set @hap += @i;
	if (@hap > 1000) break;
	set @i +=1;
end

print @hap;