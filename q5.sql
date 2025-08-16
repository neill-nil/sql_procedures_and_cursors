
DELIMITER //
 
CREATE procedure GetAllWatchHistoryBySubscriber()
begin

	declare finished int default false;
    declare subId int;
    
    declare curs cursor for
        select SubscriberID
        from Subscribers;
        
	declare continue handler for not found set finished=true;
    
    open curs;
	read_loop: loop
        fetch curs into subId;
        if finished then
            leave read_loop;
        end if;

        call GetWatchHistoryBySubscriber(subId); 
    end loop;
    
    close curs;
    
    
end//
DELIMITER ;


call GetAllWatchHistoryBySubscriber();