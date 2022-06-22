
/* CREATE trigger 'hm_message_trigger' after insert on 'hmailserver.hm_messages'

select a.messageaccountid, a.messagecreatetime, a.messagefilename 
from hmailserver.hm_messages a 
insert into mypost.hm_messages(*)

END;

insert into mypost.hm_messages(messagefilename, messagefrom, messageuid) select messagefilename, messagefrom, messageuid from hmailserver.hm_messages;

 CREATE TRIGGER `after_insert_cart_items`
AFTER INSERT ON `trigger_cart_items` FOR EACH ROW
BEGIN
INSERT INTO trigger_cart_log (cart_id, item_id)
VALUES (NEW.cart_id, NEW.item_id);
END

CREATE TRIGGER `after_insert_message_items`
AFTER INSERT ON `hmailserver.hm_messages` FOR EACH ROW
BEGIN
INSERT INTO mypost.hm_messages (messagefilename, messagefrom, messageuid)
VALUES (NEW.messagefilename,NEW.messagefrom, NEW.messageuid);
END

DELIMITER |
CREATE TRIGGER `after_insert_message_items`
AFTER INSERT ON `hmailserver.hm_messages` FOR EACH ROW
BEGIN
INSERT INTO `mypost.hm_messages` (messagefilename, messagefrom, messageuid)
VALUES (new.messagefilename, new.messagefrom, new.messageuid);
END;
|
DELIMITER ; */

USE hmailserver;
CREATE TRIGGER after_insert_message_items 
AFTER INSERT 
ON hmailserver.hm_messages 
FOR EACH ROW 
INSERT INTO mypost.hm_messages 
    SET mypost.hm_messages.messageaccountid  = NEW.messageaccountid,
        mypost.hm_messages.messagefolderid = NEW.messagefolderid,
        mypost.hm_messages.messagefilename  = NEW.messagefilename,
		mypost.hm_messages.messagetype  = NEW.messagetype,
		mypost.hm_messages.messagefrom  = NEW.messagefrom,
		mypost.hm_messages.messagesize  = NEW.messagesize,
		mypost.hm_messages.messagecurnooftries  = NEW.messagecurnooftries,
		mypost.hm_messages.messagenexttrytime  = NEW.messagenexttrytime,
		mypost.hm_messages.messageflags  = NEW.messageflags,
		mypost.hm_messages.messagecreatetime  = NEW.messagecreatetime,
		mypost.hm_messages.messagelocked  = NEW.messagelocked,
		mypost.hm_messages.messageuid  = NEW.messageuid;



select messagefrom from hm_messages;
INSERT INTO table2 (a, b, c)
    SELECT a, b, c FROM table1 
    WHERE c = 333;
	
INSERT INTO table_name
    SELECT table_name FROM information_schema.tables
        WHERE table_schema = 'your_database_name';	
	
select messagefilename,messagecreatetime,messagefrom,messagesize from hm_messages order by messageid desc limit 1 ;
INSERT INTO table_name 
    SELECT table_name FROM information_schema.tables
        WHERE table_schema = 'your_database_name';
		
SELECT folder_name
from mail_folder
left join hm_messages on hm_messages.messagefrom=mail_folder.sender_name
limit 1;

CREATE PROCEDURE catalog_get_mailbox_list()
BEGIN
SELECT mailbox_id, folder_name FROM mail_folder ORDER BY mailbox_id;
END$$







