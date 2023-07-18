--#SET TERMINATOR @

create procedure transaction_rose

LANGUAGE SQL 
modifies sql data 

begin

	declare sqlcode integer default 0; 
	declare retcode integer default 0;
	declare continue handler for sqlexception 
	set retcode = sqlcode;
	
	update bankaccounts 
	set balance = balance - 200
	where accountname = 'Rose';
	
	update bankaccounts 
	set balance = balance + 200
	where accountname = 'Shoe Shop';
	
	update shoeshop 
	set stock = stock-1 
	where product = 'Boots';
	
	update bankaccounts 
	set balance = balance - 300 
	where accountname = 'Rose';
	
	if retcode < 0 then 
		rollback work;
	
	else 
		commit work; 
		
	end if; 
	
end

@