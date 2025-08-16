
DELIMITER //
 
CREATE procedure SendWatchTimeReport()
begin

	declare finished int default false;
    declare subId int;
    
    declare curs cursor for
        select distinct su.SubscriberID
        from Subscribers su
        join WatchHistory wh on su.SubscriberID = wh.SubscriberID;
        
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


call SendWatchTimeReport();