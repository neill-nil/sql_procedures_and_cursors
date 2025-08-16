DELIMITER //
 
CREATE procedure ListAllSubscribers()
BEGIN
	declare finished INT default false;
	declare subName varchar(100);
	
	declare curs cursor for
		select SubscriberName from Subscribers;
	declare continue handler for not found set finished = true;
	
	open curs;
	
	read_data: loop
		fetch  curs into subName;
		if finished then 
			leave read_data;
		end if;
		
	select subName as SubscriberName;
		end loop;
		
	close curs;
	end//
        
DELIMITER ;

call ListAllSubscribers();

