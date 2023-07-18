--#SET TERMINATOR @

create or replace procedure UPDATE_LEADERS_SCORE (in in_School_ID integer, in in_Leader_Score integer)

language sql 
modifies sql data 

BEGIN 
 
update chicago_public_schools 
set Leaders_Score = in_Leader_Score
where School_ID = in_School_ID; 

if in_Leader_Score >= 0 and in_Leader_Score < 20 then 
	update chicago_public_schools 
	set Leaders_Icon = 'Very weak'
	where School_ID = in_School_ID;

elseif in_Leader_Score < 40 then 
	update chicago_public_schools 
	set Leaders_Icon = 'Weak'
	where School_ID = in_School_ID;
	
elseif in_Leader_Score < 60 then 
	update chicago_public_schools 
	set Leaders_Icon = 'Average'
	where School_ID = in_School_ID;

elseif in_Leader_Score < 80 then 
	update chicago_public_schools 
	set Leaders_Icon = 'Strong'
	where School_ID = in_School_ID;

elseif in_Leader_Score < 100 then 
	update chicago_public_schools 
	set Leaders_Icon = 'Weak'
	where School_ID = in_School_ID;
	
else 
	ROLLBACK WORK;

end if;

COMMIT WORK;

END

@