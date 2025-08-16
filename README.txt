Steps to Execute all the scripts:

1. PreRequisite:
Create a database and add the tables Shows, Subscribers and WatchHistory with the following schema:

CREATE TABLE Shows (
ShowID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT
);
CREATE TABLE Subscribers (
SubscriberID INT PRIMARY KEY,
SubscriberName VARCHAR(100),
SubscriptionDate DATE
);
CREATE TABLE WatchHistory (
HistoryID INT PRIMARY KEY,
ShowID INT,
SubscriberID INT,
WatchTime INT, -- Duration in minutes
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (SubscriberID) REFERENCES
Subscribers(SubscriberID)
);

2. Add some rows of data into all the tables as you see fit (while sticking to the schema)

3. q1: run q1.sql then run this command : call ListAllSubscribers(); (also given in the file)
    this will return all subsciber names.

4. q2: run q2.sql then run this command : call GetWatchHistoryBySubscriber(<SubscriberID>); (also given in the file)
    this will return all watch history of a given subscriber.

5. q3: run q3.sql then run this command : call AddSubscriberIfNotExists(<SubscriberName>); (also given in the file)
    this will add a subscriber in the Subscribers table if the name does not exist already. 

6. q4: run q4.sql then run this command : call SendWatchTimeReport(); (also given in the file)
    this will return watch times of subscribers only if they have watched something.

7. q5: run q5.sql then run this command : call GetAllWatchHistoryBySubscriber(); (also given in the file)
    this will call GetWatchHistoryBySubscriber for all subscribers.


GITHUB REPO LINK: https://github.com/neill-nil/sql_procedures_and_cursors/tree/dev

