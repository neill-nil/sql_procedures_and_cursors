
DELIMITER //
 
CREATE procedure AddSubscriberIfNotExists(IN subName VARCHAR(100))
begin
	declare newId int;

	if not exists (
        select 1 
        from Subscribers 
        where SubscriberName = subName
    ) then
		select coalesce(MAX(SubscriberID), 0) + 1 INTO newId
			from Subscribers;
		insert into Subscribers 
		(SubscriberID, SubscriberName, SubscriptionDate) values
		(newId, subName, CURDATE());
    end if;
    
    
end//
DELIMITER ;

call AddSubscriberIfNotExists('Eren Yeager');
call AddSubscriberIfNotExists('Logan Roy');