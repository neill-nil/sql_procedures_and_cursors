DELIMITER //
 
CREATE procedure GetWatchHistoryBySubscriber(IN sub_id INT)
begin
	select sh.Title,
			wh.WatchTime 
            from WatchHistory as wh
            inner join Shows as sh 
            on wh.ShowID=sh.ShowID
            where wh.SubscriberID = sub_id;
end//
DELIMITER ;

call GetWatchHistoryBySubscriber(4);