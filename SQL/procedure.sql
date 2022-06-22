DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `catalog_get_mailbox_list`()
BEGIN
SELECT mailfolder_id, folder_name FROM mail_folder ORDER BY mailfolder_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pages`()
BEGIN
SELECT page_id, page_name, page_class, page_template FROM pages ORDER BY page_id;
END$$
DELIMITER ;
