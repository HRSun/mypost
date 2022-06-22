-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 07 2022 г., 16:08
-- Версия сервера: 8.0.28
-- Версия PHP: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hmailserver`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `catalog_get_mailbox_list` (IN `user_email` VARCHAR(255))   SELECT `mailfolder_id`,`folder_name`, `sender_email` 
FROM `mail_folder`
INNER JOIN `hm_accounts`
ON `mail_folder`.`accountid`=`hm_accounts`.`accountid`
WHERE `hm_accounts`.`accountaddress`=user_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `check_contactid_via_accountid` (IN `account_id` INT, IN `contact_id` INT)   SELECT `contacts`.`contact_id`
FROM `contacts`
WHERE `contacts`.`account_id`=account_id 
AND `contacts`.`contact_id`=contact_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account` (IN `account_email` VARCHAR(255), IN `account_password` VARCHAR(255))   INSERT INTO `hm_accounts` (`accountdomainid`, `accountadminlevel`, `accountaddress`, `accountpassword`, `accountactive`, `accountisad`, `accountaddomain`, `accountadusername`, `accountmaxsize`, `accountvacationmessageon`, `accountvacationmessage`, `accountvacationsubject`, `accountpwencryption`, `accountforwardenabled`, `accountforwardaddress`, `accountforwardkeeporiginal`, `accountenablesignature`, `accountsignatureplaintext`, `accountsignaturehtml`, `accountlastlogontime`, `accountvacationexpires`, `accountvacationexpiredate`, `accountpersonfirstname`, `accountpersonlastname`) VALUES
(1, 0, account_email, account_password, 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', CURRENT_TIMESTAMP(), 0, CURRENT_TIMESTAMP(), '', '')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_folder_name` (IN `account_id` INT, IN `user_email` VARCHAR(255), IN `folder_name` VARCHAR(255))   INSERT INTO `contacts` (`contacts`.`account_id`, `contacts`.`contact_email`, `contacts`.`folder_name`, `contacts`.`contact_name`)
VALUES (account_id, user_email, folder_name, folder_name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_imapfolder_id` (IN `account_id` INT)   INSERT INTO `hm_imapfolders` (`folderaccountid`, `folderparentid`, `foldername`, `folderissubscribed`, `foldercreationtime`, `foldercurrentuid`) VALUES
(account_id, -1, 'INBOX', 1, CURRENT_TIMESTAMP(), 1)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_accountid_via_user_email` (IN `user_email` VARCHAR(255))   SELECT `hm_accounts`.`accountid`
FROM `hm_accounts`
WHERE `hm_accounts`.`accountaddress`=user_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_account_id_via_contactid` (IN `contact_id` INT)   SELECT `contacts`.`contact_id`, `contacts`.`account_id`
FROM `contacts`
WHERE `contacts`.`contact_id`=contact_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_account_id_via_email` (IN `user_email` VARCHAR(255))   SELECT `hm_accounts`.`accountid`
FROM `hm_accounts`
WHERE `hm_accounts`.`accountaddress`=user_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_email_user` (IN `user_email` VARCHAR(255))   select `hm_messages`.`messagefilename`, `hm_messages`.`messagefrom`, `hm_messages`.`messagecreatetime`
from `hm_messages` 
inner join `hm_accounts` on `hm_messages`.`messageaccountid`=`hm_accounts`.`accountid` 
where `hm_accounts`.`accountaddress`=user_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_contactemail_via_contactid` (IN `contact_id` INT)   SELECT `contacts`.`contact_email`
FROM `contacts`
WHERE `contacts`.`contact_id`=contact_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_emails_current_folder` (IN `account_id` INT, IN `contact_email` VARCHAR(255))   SELECT `hm_messages`.`messagefilename`, `hm_messages`.`messagefrom`,
`hm_messages`.`messagesize`, `hm_messages`.`messagecreatetime`
FROM `hm_messages`
WHERE `hm_messages`.`messageaccountid`=account_id AND `hm_messages`.`messagefrom`=contact_email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_email_user_folder` (IN `email_user` VARCHAR(255))   select `hm_messages`.`messagefilename`, `hm_messages`.`messagefrom`, `hm_messages`.`messagecreatetime`,
`hm_messages`.`messagesize`, `contacts`.`folder_name`, `contacts`.`contact_id`
from `hm_messages` 
inner join `hm_accounts` on `hm_messages`.`messageaccountid`=`hm_accounts`.`accountid`
left join `contacts` on `hm_messages`.`messagefrom`=`contacts`.`contact_email` and `hm_accounts`.`accountid`=`contacts`.`account_id`
where `hm_accounts`.`accountaddress`=email_user
order by `hm_messages`.`messagecreatetime`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_folder_name_if_exist` (IN `account_id` BIGINT, IN `folder_name` VARCHAR(255))   SELECT `contacts`.`folder_name`, `contacts`.`contact_email`
FROM `contacts`
WHERE `contacts`.`account_id`=account_id AND `contacts`.`folder_name`=folder_name$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_mailbox_folder_contacts` (IN `user_email` VARCHAR(255))   SELECT `contacts`.`contact_id`, `contacts`.`folder_name`, `contacts`.`contact_email`, `contacts`.`contact_name`
FROM `contacts`
INNER JOIN `hm_accounts`
ON `contacts`.`account_id`=`hm_accounts`.`accountid`
WHERE `hm_accounts`.`accountaddress`=user_email
order by `contacts`.`folder_name`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_message_date_time_by_messageid` (IN `message_id` VARCHAR(255))   SELECT hm_messages.messagecreatetime
FROM hm_messages
WHERE hm_messages.messagefilename=message_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pages` ()   BEGIN
SELECT page_id, page_name, page_class, page_template FROM pages ORDER BY page_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mailuser_get_login_info` (IN `inEmail` VARCHAR(255))   BEGIN
SELECT hm_accounts.accountid, hm_accounts.accountpassword
FROM hm_accounts
WHERE hm_accounts.accountaddress=inEmail;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `return_folder_name_for_user_if_exist` (IN `folder_name` VARCHAR(255), IN `user_email` VARCHAR(255))   SELECT `contacts`.`contact_id`, `contacts`.`folder_name`, `contacts`.`contact_email`, `contacts`.`contact_name`,
(SELECT `hm_accounts`.`accountid` 
FROM `hm_accounts`
WHERE `hm_accounts`.`accountaddress`=user_email) AS em1
FROM `contacts`
INNER JOIN `hm_accounts`
ON `contacts`.`account_id`=`hm_accounts`.`accountid`
WHERE `contacts`.`folder_name`=folder_name$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_contact_info` (IN `c_id` INT, IN `c_name` VARCHAR(255), IN `c_email` VARCHAR(255), IN `c_folder` VARCHAR(255))   UPDATE `contacts`
SET `contacts`.`contact_name`=c_name, `contacts`.`contact_email`=c_email, `contacts`.`folder_name`=c_folder
WHERE `contacts`.`contact_id`=c_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`contact_id`, `account_id`, `contact_email`, `folder_name`, `contact_name`) VALUES
(1, 1, 'henry@email.ru', 'Henry', NULL),
(2, 1, 'dan@mypost.xy', 'Dan', 'Dan Kyle'),
(3, 1, 'tom_bourne@mypost.xy', 'Bourne2', 'Tom Bourne'),
(4, 2, 'fill_hugh@mypost.xy', 'Hugh2', 'Fill Hugh'),
(5, 2, 's_veron@mypost.xy', 'Veron S.Sally', 'Sally Veron Douglas II'),
(6, 2, 'b_sheppard@mypost.xy', 'Sheppard', 'Bill Sheppard'),
(11, 2, 'dan@mypost.xy', 'Dan', ''),
(19, 2, 'user1@mypost.xy', 'user1', 'user1'),
(20, 2, 'tom_bourne@mypost.xy', 'Bourne', NULL),
(59, 1, 'user2@mypost.xy', 'user2', 'user2'),
(60, 1, 'fill_hugh@mypost.xy', 'fill_hugh', 'fill_hugh'),
(61, 14, 'user1@mypost.xy', 'user1', 'user1'),
(62, 15, 'user1@mypost.xy', 'user1', 'user1');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_accounts`
--

CREATE TABLE `hm_accounts` (
  `accountid` int NOT NULL,
  `accountdomainid` int NOT NULL,
  `accountadminlevel` tinyint NOT NULL,
  `accountaddress` varchar(255) NOT NULL,
  `accountpassword` varchar(255) NOT NULL,
  `accountactive` tinyint NOT NULL,
  `accountisad` tinyint NOT NULL,
  `accountaddomain` varchar(255) NOT NULL,
  `accountadusername` varchar(255) NOT NULL,
  `accountmaxsize` int NOT NULL,
  `accountvacationmessageon` tinyint NOT NULL,
  `accountvacationmessage` text NOT NULL,
  `accountvacationsubject` varchar(200) NOT NULL,
  `accountpwencryption` tinyint NOT NULL,
  `accountforwardenabled` tinyint NOT NULL,
  `accountforwardaddress` varchar(255) NOT NULL,
  `accountforwardkeeporiginal` tinyint NOT NULL,
  `accountenablesignature` tinyint NOT NULL,
  `accountsignatureplaintext` text NOT NULL,
  `accountsignaturehtml` text NOT NULL,
  `accountlastlogontime` datetime NOT NULL,
  `accountvacationexpires` tinyint UNSIGNED NOT NULL,
  `accountvacationexpiredate` datetime NOT NULL,
  `accountpersonfirstname` varchar(60) NOT NULL,
  `accountpersonlastname` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_accounts`
--

INSERT INTO `hm_accounts` (`accountid`, `accountdomainid`, `accountadminlevel`, `accountaddress`, `accountpassword`, `accountactive`, `accountisad`, `accountaddomain`, `accountadusername`, `accountmaxsize`, `accountvacationmessageon`, `accountvacationmessage`, `accountvacationsubject`, `accountpwencryption`, `accountforwardenabled`, `accountforwardaddress`, `accountforwardkeeporiginal`, `accountenablesignature`, `accountsignatureplaintext`, `accountsignaturehtml`, `accountlastlogontime`, `accountvacationexpires`, `accountvacationexpiredate`, `accountpersonfirstname`, `accountpersonlastname`) VALUES
(1, 1, 0, 'user1@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-04 17:47:44', 0, '2022-05-15 00:00:00', '', ''),
(2, 1, 0, 'user2@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-30 19:22:51', 0, '2022-05-15 00:00:00', '', ''),
(5, 1, 0, 'user3@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-14 21:50:03', 0, '2022-05-15 00:00:00', '', ''),
(6, 1, 0, 'user4@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-15 02:46:33', 0, '2022-05-15 00:00:00', '', ''),
(8, 1, 0, 'user5@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-15 07:17:15', 0, '2022-05-15 00:00:00', '', ''),
(9, 1, 0, 'user11@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-31 00:06:00', 0, '2022-05-15 00:00:00', '', ''),
(14, 1, 0, 'dsfsdf@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-02 01:03:28', 0, '2022-06-02 00:00:00', '', ''),
(15, 1, 0, 'felix@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-02 01:32:19', 0, '2022-06-02 01:32:19', '', ''),
(25, 1, 0, 'sever@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-02 13:03:13', 0, '2022-06-02 00:00:00', '', ''),
(26, 1, 0, 'qwer@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-02 13:08:03', 0, '2022-06-02 00:00:00', '', ''),
(27, 1, 0, 'qwer2@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-06-02 13:12:18', 0, '2022-06-02 13:12:18', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_acl`
--

CREATE TABLE `hm_acl` (
  `aclid` bigint NOT NULL,
  `aclsharefolderid` bigint NOT NULL,
  `aclpermissiontype` tinyint NOT NULL,
  `aclpermissiongroupid` bigint NOT NULL,
  `aclpermissionaccountid` bigint NOT NULL,
  `aclvalue` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_aliases`
--

CREATE TABLE `hm_aliases` (
  `aliasid` int NOT NULL,
  `aliasdomainid` int NOT NULL,
  `aliasname` varchar(255) NOT NULL,
  `aliasvalue` varchar(255) NOT NULL,
  `aliasactive` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_blocked_attachments`
--

CREATE TABLE `hm_blocked_attachments` (
  `baid` bigint NOT NULL,
  `bawildcard` varchar(255) NOT NULL,
  `badescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_blocked_attachments`
--

INSERT INTO `hm_blocked_attachments` (`baid`, `bawildcard`, `badescription`) VALUES
(1, '*.bat', 'Batch processing file'),
(2, '*.cmd', 'Command file for Windows NT'),
(3, '*.com', 'Command'),
(4, '*.cpl', 'Windows Control Panel extension'),
(5, '*.csh', 'CSH script'),
(6, '*.exe', 'Executable file'),
(7, '*.inf', 'Setup file'),
(8, '*.lnk', 'Windows link file'),
(9, '*.msi', 'Windows Installer file'),
(10, '*.msp', 'Windows Installer patch'),
(11, '*.pif', 'Program Information file'),
(12, '*.reg', 'Registration key'),
(13, '*.scf', 'Windows Explorer command'),
(14, '*.scr', 'Windows Screen saver');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_dbversion`
--

CREATE TABLE `hm_dbversion` (
  `value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_dbversion`
--

INSERT INTO `hm_dbversion` (`value`) VALUES
(5601);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_distributionlists`
--

CREATE TABLE `hm_distributionlists` (
  `distributionlistid` int NOT NULL,
  `distributionlistdomainid` int NOT NULL,
  `distributionlistaddress` varchar(255) NOT NULL,
  `distributionlistenabled` tinyint NOT NULL,
  `distributionlistrequireauth` tinyint NOT NULL,
  `distributionlistrequireaddress` varchar(255) NOT NULL,
  `distributionlistmode` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_distributionlistsrecipients`
--

CREATE TABLE `hm_distributionlistsrecipients` (
  `distributionlistrecipientid` int NOT NULL,
  `distributionlistrecipientlistid` int NOT NULL,
  `distributionlistrecipientaddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_dnsbl`
--

CREATE TABLE `hm_dnsbl` (
  `sblid` int NOT NULL,
  `sblactive` tinyint NOT NULL,
  `sbldnshost` varchar(255) NOT NULL,
  `sblresult` varchar(255) NOT NULL,
  `sblrejectmessage` varchar(255) NOT NULL,
  `sblscore` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_dnsbl`
--

INSERT INTO `hm_dnsbl` (`sblid`, `sblactive`, `sbldnshost`, `sblresult`, `sblrejectmessage`, `sblscore`) VALUES
(1, 0, 'zen.spamhaus.org', '127.0.0.2-8|127.0.0.10-11', 'Rejected by Spamhaus.', 3),
(2, 0, 'bl.spamcop.net', '127.0.0.2', 'Rejected by SpamCop.', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_domains`
--

CREATE TABLE `hm_domains` (
  `domainid` int NOT NULL,
  `domainname` varchar(80) NOT NULL,
  `domainactive` tinyint NOT NULL,
  `domainpostmaster` varchar(80) NOT NULL,
  `domainmaxsize` int NOT NULL,
  `domainaddomain` varchar(255) NOT NULL,
  `domainmaxmessagesize` int NOT NULL,
  `domainuseplusaddressing` tinyint NOT NULL,
  `domainplusaddressingchar` varchar(1) NOT NULL,
  `domainantispamoptions` int NOT NULL,
  `domainenablesignature` tinyint NOT NULL,
  `domainsignaturemethod` tinyint NOT NULL,
  `domainsignatureplaintext` text NOT NULL,
  `domainsignaturehtml` text NOT NULL,
  `domainaddsignaturestoreplies` tinyint NOT NULL,
  `domainaddsignaturestolocalemail` tinyint NOT NULL,
  `domainmaxnoofaccounts` int NOT NULL,
  `domainmaxnoofaliases` int NOT NULL,
  `domainmaxnoofdistributionlists` int NOT NULL,
  `domainlimitationsenabled` int NOT NULL,
  `domainmaxaccountsize` int NOT NULL,
  `domaindkimselector` varchar(255) NOT NULL,
  `domaindkimprivatekeyfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_domains`
--

INSERT INTO `hm_domains` (`domainid`, `domainname`, `domainactive`, `domainpostmaster`, `domainmaxsize`, `domainaddomain`, `domainmaxmessagesize`, `domainuseplusaddressing`, `domainplusaddressingchar`, `domainantispamoptions`, `domainenablesignature`, `domainsignaturemethod`, `domainsignatureplaintext`, `domainsignaturehtml`, `domainaddsignaturestoreplies`, `domainaddsignaturestolocalemail`, `domainmaxnoofaccounts`, `domainmaxnoofaliases`, `domainmaxnoofdistributionlists`, `domainlimitationsenabled`, `domainmaxaccountsize`, `domaindkimselector`, `domaindkimprivatekeyfile`) VALUES
(1, 'mypost.xy', 1, '', 0, '', 0, 0, '', 0, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_domain_aliases`
--

CREATE TABLE `hm_domain_aliases` (
  `daid` int NOT NULL,
  `dadomainid` int NOT NULL,
  `daalias` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_fetchaccounts`
--

CREATE TABLE `hm_fetchaccounts` (
  `faid` int NOT NULL,
  `faactive` tinyint NOT NULL,
  `faaccountid` int NOT NULL,
  `faaccountname` varchar(255) NOT NULL,
  `faserveraddress` varchar(255) NOT NULL,
  `faserverport` int NOT NULL,
  `faservertype` tinyint NOT NULL,
  `fausername` varchar(255) NOT NULL,
  `fapassword` varchar(255) NOT NULL,
  `faminutes` int NOT NULL,
  `fanexttry` datetime NOT NULL,
  `fadaystokeep` int NOT NULL,
  `falocked` tinyint NOT NULL,
  `faprocessmimerecipients` tinyint NOT NULL,
  `faprocessmimedate` tinyint NOT NULL,
  `faconnectionsecurity` tinyint NOT NULL,
  `fauseantispam` tinyint NOT NULL,
  `fauseantivirus` tinyint NOT NULL,
  `faenablerouterecipients` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_fetchaccounts_uids`
--

CREATE TABLE `hm_fetchaccounts_uids` (
  `uidid` int NOT NULL,
  `uidfaid` int NOT NULL,
  `uidvalue` varchar(255) NOT NULL,
  `uidtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_greylisting_triplets`
--

CREATE TABLE `hm_greylisting_triplets` (
  `glid` bigint NOT NULL,
  `glcreatetime` datetime NOT NULL,
  `glblockendtime` datetime NOT NULL,
  `gldeletetime` datetime NOT NULL,
  `glipaddress1` bigint NOT NULL,
  `glipaddress2` bigint DEFAULT NULL,
  `glsenderaddress` varchar(255) NOT NULL,
  `glrecipientaddress` varchar(255) NOT NULL,
  `glblockedcount` int NOT NULL,
  `glpassedcount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_greylisting_whiteaddresses`
--

CREATE TABLE `hm_greylisting_whiteaddresses` (
  `whiteid` bigint NOT NULL,
  `whiteipaddress` varchar(255) NOT NULL,
  `whiteipdescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_groups`
--

CREATE TABLE `hm_groups` (
  `groupid` bigint NOT NULL,
  `groupname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_group_members`
--

CREATE TABLE `hm_group_members` (
  `memberid` bigint NOT NULL,
  `membergroupid` bigint NOT NULL,
  `memberaccountid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_imapfolders`
--

CREATE TABLE `hm_imapfolders` (
  `folderid` int NOT NULL,
  `folderaccountid` int UNSIGNED NOT NULL,
  `folderparentid` int NOT NULL,
  `foldername` varchar(255) NOT NULL,
  `folderissubscribed` tinyint UNSIGNED NOT NULL,
  `foldercreationtime` datetime NOT NULL,
  `foldercurrentuid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_imapfolders`
--

INSERT INTO `hm_imapfolders` (`folderid`, `folderaccountid`, `folderparentid`, `foldername`, `folderissubscribed`, `foldercreationtime`, `foldercurrentuid`) VALUES
(1, 1, -1, 'INBOX', 1, '2022-05-09 15:40:12', 36),
(2, 2, -1, 'INBOX', 1, '2022-05-09 15:40:24', 49),
(7, 5, -1, 'INBOX', 1, '2022-05-14 21:50:03', 0),
(8, 6, -1, 'INBOX', 1, '2022-05-15 02:46:33', 1),
(10, 8, -1, 'INBOX', 1, '2022-05-15 07:17:15', 0),
(11, 14, -1, 'INBOX', 1, '2022-06-02 01:03:28', 1),
(12, 15, -1, 'INBOX', 1, '2022-06-02 01:32:19', 3),
(22, 25, -1, 'INBOX', 1, '2022-06-02 13:03:14', 1),
(23, 26, -1, 'INBOX', 1, '2022-06-02 13:08:04', 1),
(24, 27, -1, 'INBOX', 1, '2022-06-02 13:12:18', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_incoming_relays`
--

CREATE TABLE `hm_incoming_relays` (
  `relayid` int NOT NULL,
  `relayname` varchar(100) NOT NULL,
  `relaylowerip1` bigint NOT NULL,
  `relaylowerip2` bigint DEFAULT NULL,
  `relayupperip1` bigint NOT NULL,
  `relayupperip2` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_logon_failures`
--

CREATE TABLE `hm_logon_failures` (
  `ipaddress1` bigint NOT NULL,
  `ipaddress2` bigint DEFAULT NULL,
  `failuretime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_messagerecipients`
--

CREATE TABLE `hm_messagerecipients` (
  `recipientid` bigint NOT NULL,
  `recipientmessageid` bigint NOT NULL,
  `recipientaddress` varchar(255) NOT NULL,
  `recipientlocalaccountid` int NOT NULL,
  `recipientoriginaladdress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_messages`
--

CREATE TABLE `hm_messages` (
  `messageid` bigint NOT NULL,
  `messageaccountid` int NOT NULL,
  `messagefolderid` int NOT NULL DEFAULT '0',
  `messagefilename` varchar(255) NOT NULL,
  `messagetype` tinyint NOT NULL,
  `messagefrom` varchar(255) NOT NULL,
  `messagesize` bigint NOT NULL,
  `messagecurnooftries` int NOT NULL,
  `messagenexttrytime` datetime NOT NULL,
  `messageflags` tinyint NOT NULL,
  `messagecreatetime` datetime NOT NULL,
  `messagelocked` tinyint NOT NULL,
  `messageuid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_messages`
--

INSERT INTO `hm_messages` (`messageid`, `messageaccountid`, `messagefolderid`, `messagefilename`, `messagetype`, `messagefrom`, `messagesize`, `messagecurnooftries`, `messagenexttrytime`, `messageflags`, `messagecreatetime`, `messagelocked`, `messageuid`) VALUES
(1, 2, 2, '{78A591FB-6F48-437B-BD27-6BDFA8FBA41C}.eml', 2, 'user1@mypost.xy', 430, 0, '1901-01-01 00:00:00', 96, '2022-05-09 15:41:28', 1, 1),
(2, 2, 2, '{4758C266-448E-4B77-8720-C1A0EEE9AECB}.eml', 2, 'user1@mypost.xy', 431, 0, '1901-01-01 00:00:00', 96, '2022-05-09 15:48:01', 1, 2),
(3, 1, 1, '{D02FA7E0-DA61-4073-B4A6-86625E400DF4}.eml', 2, 'user2@mypost.xy', 616, 0, '1901-01-01 00:00:00', 65, '2022-05-09 15:48:15', 1, 1),
(4, 2, 2, '{82F24BBB-A5E7-43B3-8CBB-1C50A6D7668F}.eml', 2, 'user1@mypost.xy', 431, 0, '1901-01-01 00:00:00', 96, '2022-05-09 18:12:50', 1, 3),
(5, 1, 1, '{4A8DE2F3-5019-4188-AD30-6BBC12B380C7}.eml', 2, 'user2@mypost.xy', 622, 0, '1901-01-01 00:00:00', 65, '2022-05-09 18:14:23', 1, 2),
(6, 2, 2, '{73C7D0A1-04E6-4441-9B94-168C0EFBEF10}.eml', 2, 'user1@mypost.xy', 438, 0, '1901-01-01 00:00:00', 96, '2022-05-11 01:29:32', 1, 4),
(7, 2, 2, '{733ADA91-35B0-4938-8C49-BD51FA8FF314}.eml', 2, 'user1@mypost.xy', 440, 0, '1901-01-01 00:00:00', 96, '2022-05-11 01:38:13', 1, 5),
(13, 2, 2, '{6CC40373-11A2-4EAB-9901-1EF1534E8682}.eml', 2, 'user1@mypost.xy', 441, 0, '1901-01-01 00:00:00', 96, '2022-05-11 02:31:38', 1, 6),
(15, 1, 1, '{44EC7D0D-CFAA-4D5A-A5DD-60A55C3109BC}.eml', 2, 'user2@mypost.xy', 623, 0, '1901-01-01 00:00:00', 65, '2022-05-11 02:33:21', 1, 3),
(25, 2, 2, '{8E25FE74-3B78-47D9-87C3-964E6298A462}.eml', 2, 'user1@mypost.xy', 438, 0, '1901-01-01 00:00:00', 96, '2022-05-11 02:43:06', 1, 7),
(32, 1, 1, '{F6A74C6B-5D71-4ABF-B41E-A38C4E272A14}.eml', 2, 'user2@mypost.xy', 620, 0, '1901-01-01 00:00:00', 65, '2022-05-11 03:03:32', 1, 4),
(35, 2, 2, '{DF7CA2C6-0B4B-4F18-9DCE-ECC89437C1E9}.eml', 2, 'user1@mypost.xy', 739, 0, '1901-01-01 00:00:00', 96, '2022-05-11 03:07:14', 1, 8),
(36, 1, 1, '{9D1C9538-26D1-4342-B0D9-33B43A822CAE}.eml', 2, 'user2@mypost.xy', 620, 0, '1901-01-01 00:00:00', 65, '2022-05-11 03:08:13', 1, 5),
(37, 2, 2, '{03282458-D769-4489-8E30-6739376D2081}.eml', 2, 'user1@mypost.xy', 741, 0, '1901-01-01 00:00:00', 96, '2022-05-11 03:24:28', 1, 9),
(38, 2, 2, '{221627DB-45F1-4737-A55A-97F052A35292}.eml', 2, 'user1@mypost.xy', 336, 0, '1901-01-01 00:00:00', 96, '2022-05-11 15:21:24', 1, 10),
(39, 1, 1, '{07EE3661-37BA-475B-91FB-B18915D3C57F}.eml', 2, 'cfr@cc.vb', 197, 0, '1901-01-01 00:00:00', 65, '2022-05-12 10:09:11', 1, 6),
(40, 1, 1, '{C32B20A9-A6FB-494C-AAE6-BFE4C48C5239}.eml', 2, 'dan@mypost.xy', 200, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:10:11', 1, 7),
(41, 1, 1, '{A80223D0-B4BE-4F89-A5F2-827A531DAB5E}.eml', 2, 'tom_bourne@mypost.xy', 196, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:12:19', 1, 8),
(42, 1, 1, '{CCE0E9C2-C56B-465C-A582-8FA9B30888C2}.eml', 2, 'fill_hugh@mypost.xy', 194, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:13:28', 1, 9),
(43, 1, 1, '{6B806AF4-5142-43E8-93C0-D349EA033ACF}.eml', 2, 's_veron@mypost.xy', 199, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:14:23', 1, 10),
(44, 1, 1, '{44610996-2FCB-4B14-8F28-371E9B5DCE22}.eml', 2, 'b_sheppard@mypost.xy', 199, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:15:28', 1, 11),
(45, 2, 2, '{5F3F3390-02E4-46CE-ADFA-00F10CCBA225}.eml', 2, 'dan@mypost.xy', 202, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:16:25', 1, 11),
(46, 2, 2, '{DA92CC2D-F6C5-4260-914C-1842F6B6E491}.eml', 2, 'tom_bourne@mypost.xy', 208, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:17:35', 1, 12),
(47, 2, 2, '{CBA45E49-593E-4A10-A5DE-1CA783B1A194}.eml', 2, 'fill_hugh@mypost.xy', 219, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:19:26', 1, 13),
(48, 2, 2, '{ED3B9A83-9387-423F-AAA4-5BF369C709D5}.eml', 2, 's_veron@mypost.xy', 264, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:22:16', 1, 14),
(49, 2, 2, '{00D5721A-3742-43F3-BCBF-3FBD6B344837}.eml', 2, 'b_sheppard@mypost.xy', 250, 0, '1901-01-01 00:00:00', 96, '2022-05-21 03:24:11', 1, 15),
(50, 2, 2, '{FBD9190E-7D2F-45B3-B63D-696497F62FB0}.eml', 2, 'user1@mypost.xy', 454, 0, '1901-01-01 00:00:00', 96, '2022-05-22 03:02:49', 1, 16),
(51, 2, 2, '{0FECC13B-503F-4416-9C76-F0C37D7E6A0D}.eml', 2, 'user1@mypost.xy', 2695, 0, '1901-01-01 00:00:00', 96, '2022-05-22 04:24:06', 1, 17),
(52, 2, 2, '{8F041DC5-2D5A-4129-9067-895273FEC052}.eml', 2, 'user1@mypost.xy', 464, 0, '1901-01-01 00:00:00', 96, '2022-05-22 13:21:13', 1, 18),
(53, 1, 1, '{55836B28-84EF-47CE-827F-898D1DD678B6}.eml', 2, 'dfsf@dsf.vv', 218, 0, '1901-01-01 00:00:00', 96, '2022-05-24 12:55:32', 1, 12),
(54, 2, 2, '{E45ACBF9-CA32-43DA-9839-F6DA1E67DD67}.eml', 2, 'Errors@example.com', 331, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:18:53', 1, 19),
(55, 1, 1, '{30A95522-341D-4BF6-82A0-ACA771E7B0FF}.eml', 2, 'Errors@example.com', 333, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:32:21', 1, 13),
(56, 1, 1, '{157D7706-25D2-4756-8912-BA0F0DD58CC5}.eml', 2, 'Errors@example.com', 329, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:37:02', 1, 14),
(57, 1, 1, '{07C7AB49-A7E8-499E-BBFD-DFC034FFDA9E}.eml', 2, 'Errors@example.com', 336, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:39:53', 1, 15),
(58, 1, 1, '{DB95D3F1-DA05-4AB5-A3BC-FD05E258BD15}.eml', 2, 'Errors@example.com', 338, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:44:20', 1, 16),
(59, 1, 1, '{C0D17EBD-309F-40F4-B800-D23F4054FDEF}.eml', 2, 'Errors@example.com', 372, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:47:43', 1, 17),
(60, 1, 1, '{066D58CF-8978-4A90-9721-7AC1D2F4161D}.eml', 2, 'Errors@example.com', 373, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:49:56', 1, 18),
(61, 2, 2, '{D362B9B6-392A-4E6B-B86A-1C9AFB76C965}.eml', 2, 'Errors@example.com', 379, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:53:03', 1, 20),
(62, 2, 2, '{B28D1357-A7CC-4F14-A9FF-71150D7039AA}.eml', 2, 'Errors@example.com', 372, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:54:47', 1, 21),
(63, 2, 2, '{C1184E32-3DFD-45CB-B2D7-5B8BE15CB839}.eml', 2, 'Errors@example.com', 379, 0, '1901-01-01 00:00:00', 96, '2022-05-30 17:57:48', 1, 22),
(64, 2, 2, '{C4E4D6A6-E781-4446-A3A2-EDCC0D526DD1}.eml', 2, 'Errors@example.com', 403, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:02:32', 1, 23),
(65, 2, 2, '{79F02199-8B68-456C-A0DF-29BAE648F65D}.eml', 2, 'Errors@example.com', 406, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:03:07', 1, 24),
(66, 2, 2, '{197A1E10-C73E-4CF3-8EC3-A7A9D4CEBF69}.eml', 2, 'Errors@example.com', 399, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:06:29', 1, 25),
(67, 2, 2, '{032951FF-ADF6-478D-AAAB-ECCA217F5BC0}.eml', 2, 'Errors@example.com', 399, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:11:07', 1, 26),
(68, 2, 2, '{1A9549C4-986C-4165-8E5E-3FBBB56383A1}.eml', 2, 'Errors@example.com', 399, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:14:54', 1, 27),
(69, 1, 1, '{E1966B17-B890-469D-9287-1EC830B4E3F9}.eml', 2, 'Errors@example.com', 399, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:15:05', 1, 19),
(70, 1, 1, '{2ED77B32-08D5-44CF-844A-08392A56B460}.eml', 2, 'Errors@example.com', 401, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:22:25', 1, 20),
(71, 1, 1, '{6CECDA24-3311-452B-9765-EAC5F350659A}.eml', 2, 'Errors@example.com', 400, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:22:35', 1, 21),
(72, 1, 1, '{9E3B209C-37C4-4625-B62C-66DDD2A4F872}.eml', 2, 'Errors@example.com', 400, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:30:50', 1, 22),
(73, 2, 2, '{02800F07-F9C0-4299-B573-EE090A750BD5}.eml', 2, 'Errors@example.com', 403, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:31:04', 1, 28),
(74, 2, 2, '{725F3521-8238-44CE-A3A1-19D293BA995A}.eml', 2, 'Errors@example.com', 397, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:34:48', 1, 29),
(75, 2, 2, '{AD2771B6-CA7C-4230-9E60-0F7270F3828F}.eml', 2, 'Errors@example.com', 396, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:35:13', 1, 30),
(76, 2, 2, '{B23D62F5-E726-437B-A8A9-0D251C747272}.eml', 2, 'Errors@example.com', 396, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:39:04', 1, 31),
(77, 2, 2, '{24802A45-2FEB-47D8-B683-5B8E90D3E1AF}.eml', 2, 'Errors@example.com', 396, 0, '1901-01-01 00:00:00', 96, '2022-05-30 18:40:34', 1, 32),
(78, 2, 2, '{40968CD8-D9C3-4C0F-82DD-E8EA650B7B76}.eml', 2, 'Errors@example.com', 392, 0, '1901-01-01 00:00:00', 96, '2022-05-30 19:01:06', 1, 33),
(79, 2, 2, '{45AFDA19-CBB2-43DF-AAE8-086F259B0453}.eml', 2, 'Errors@example.com', 393, 0, '1901-01-01 00:00:00', 96, '2022-05-30 19:04:22', 1, 34),
(80, 2, 2, '{A6A33AF9-31F9-45E5-A57B-43E29EBD4440}.eml', 2, 'Errors@example.com', 374, 0, '1901-01-01 00:00:00', 96, '2022-05-30 19:08:30', 1, 35),
(81, 2, 2, '{675C51FF-40CF-4B6D-8CEF-59164449BDC1}.eml', 2, 'Errors@example.com', 386, 0, '1901-01-01 00:00:00', 96, '2022-05-30 19:16:09', 1, 36),
(82, 2, 2, '{791F49E7-2281-490D-8175-DA39B6681A3C}.eml', 2, 'Errors@example.com', 380, 0, '1901-01-01 00:00:00', 96, '2022-05-30 19:16:22', 1, 37),
(83, 2, 2, '{C56358FA-CB99-4591-A1A2-40DC36A4D892}.eml', 2, 'Errors@example.com', 379, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:23:09', 1, 38),
(84, 2, 2, '{F5454159-D231-4F42-A55E-9578DA6F433A}.eml', 2, 'Errors@example.com', 379, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:25:54', 1, 39),
(85, 2, 2, '{1DC15A00-5C0A-4F4E-8D3B-E50C9264F78C}.eml', 2, 'Errors@example.com', 384, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:34:49', 1, 40),
(86, 2, 2, '{C29CCD4D-245D-486B-9AB4-11948535E1CD}.eml', 2, 'Errors@example.com', 424, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:40:07', 1, 41),
(87, 2, 2, '{AC9FAF86-9645-4435-BE6F-CD6C3DB0D42C}.eml', 2, 'Errors@example.com', 424, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:45:15', 1, 42),
(88, 2, 2, '{84446E50-C192-4AFA-8910-63D5BB62ADD2}.eml', 2, 'Errors@example.com', 427, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:46:51', 1, 43),
(89, 2, 2, '{5C83CA13-95C0-4BF6-A8A9-E0FB8CFB2BB4}.eml', 2, 'Errors@example.com', 431, 0, '1901-01-01 00:00:00', 96, '2022-05-30 22:47:53', 1, 44),
(90, 1, 1, '{1AB1F04E-C35B-44A7-B678-1C01DDA74532}.eml', 2, 'user2@mypost.xy', 423, 0, '1901-01-01 00:00:00', 96, '2022-05-30 23:38:25', 1, 23),
(91, 2, 2, '{F9F998DF-CC3E-4A30-BF5B-659B24CA1539}.eml', 2, 'user1@mypost.xy', 431, 0, '1901-01-01 00:00:00', 96, '2022-05-30 23:39:08', 1, 45),
(92, 2, 2, '{7D74AE41-F175-4E6D-8813-285BAA1D633B}.eml', 2, 'user1@mypost.xy', 416, 0, '1901-01-01 00:00:00', 96, '2022-05-30 23:43:54', 1, 46),
(93, 1, 1, '{FB08F7F2-302E-4D48-B38E-7E6FA736B875}.eml', 2, 'user4@mypost.xy', 426, 0, '1901-01-01 00:00:00', 96, '2022-05-31 00:06:00', 1, 24),
(94, 2, 2, '{79BABFEC-604E-4C31-B75E-B17472D157CC}.eml', 2, 'user1@mypost.xy', 431, 0, '1901-01-01 00:00:00', 96, '2022-06-01 21:03:43', 1, 47),
(95, 1, 1, '{3748B759-C182-42E1-9AD5-BD152883EFF4}.eml', 2, 'dsfsdf@mypost.xy', 426, 0, '1901-01-01 00:00:00', 96, '2022-06-02 00:03:15', 1, 25),
(101, 1, 1, '{4B07DBA3-54AB-4EDD-9F73-1340E0A1E415}.eml', 2, 'user4@mypost.xy', 426, 0, '1901-01-01 00:00:00', 96, '2022-06-02 00:53:13', 1, 26),
(102, 6, 8, '{1AEB1E24-9067-4D6B-BCD2-C597ABD0B772}.eml', 2, 'user1@mypost.xy', 424, 0, '1901-01-01 00:00:00', 96, '2022-06-02 00:54:19', 1, 1),
(104, 14, 11, '{C00211E0-890D-4F2F-B30B-6E6D3C357BBA}.eml', 2, 'user1@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:04:45', 1, 1),
(105, 1, 1, '{99E2BF29-08A0-4548-9277-B07A0BA4D5E2}.eml', 2, 'felix@mypost.xy', 422, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:32:59', 1, 27),
(106, 15, 12, '{4627B5F1-ED0D-4C3A-A5E3-BA17FC69EC98}.eml', 2, 'user1@mypost.xy', 421, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:33:46', 1, 2),
(107, 15, 12, '{BDD520DF-1D74-482A-A8E2-B3E9B9192DD7}.eml', 2, 'user1@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:49:16', 1, 3),
(108, 1, 1, '{4D7D73F4-031E-4B2E-9D3C-933432034E16}.eml', 2, 'sever@nn.ru', 414, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:00:06', 1, 28),
(112, 1, 1, '{F8F85E13-09FE-476A-B536-4B6252187E0C}.eml', 2, 'sever@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:05:13', 1, 29),
(113, 26, 23, '{7210C84E-49D3-451D-8CF0-0504265BE517}.eml', 2, 'sever@mypost.xy', 427, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:10:03', 1, 1),
(114, 25, 22, '{CB3425BA-85A4-40A1-ADF7-D1F580D55E1E}.eml', 2, 'qwer@mypost.xy', 426, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:10:56', 1, 1),
(115, 27, 24, '{20F4B9A9-1E38-44A8-8883-39C7EFDB7AFA}.eml', 2, 'user1@mypost.xy', 429, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:13:40', 1, 2),
(116, 1, 1, '{261119E0-FC44-4E85-AE64-4863771D5D49}.eml', 2, 'qwer2@mypost.xy', 420, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:14:19', 1, 30),
(118, 1, 1, '{E590F255-F0B4-4A88-B339-ECC9397CC541}.eml', 2, '', 612, 0, '1901-01-01 00:00:00', 32, '2022-06-03 19:07:14', 1, 31),
(119, 2, 2, '{4DC0980E-09F7-4402-8B3F-0F476A6C474B}.eml', 2, 'user1@mypost.xy', 437, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:12:58', 1, 48),
(120, 1, 1, '{65189B74-BA9A-4E2F-BB57-4634BC462CCD}.eml', 2, 'user2@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:17:29', 1, 32),
(121, 1, 1, '{55A8C7E9-9849-4FB3-99FD-A76270DABA52}.eml', 2, 'user2@mypost.xy', 422, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:23:44', 1, 33),
(122, 1, 1, '{302EC682-4A4B-45BD-B894-FA38758B1613}.eml', 2, 'user2@mypost.xy', 391, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:25:04', 1, 34),
(123, 1, 1, '{C0E67BA2-F9D8-49D1-A279-243C204E0E25}.eml', 2, 'user2@mypost.xy', 397, 0, '1901-01-01 00:00:00', 96, '2022-06-04 17:47:44', 1, 35),
(124, 2, 2, '{07978A33-4F2E-40C2-BB82-C6AB9B5B64D1}.eml', 2, 'user1@mypost.xy', 403, 0, '1901-01-01 00:00:00', 96, '2022-06-04 19:54:59', 1, 49),
(125, 1, 1, '{1A868123-FF19-423F-89A8-6CF4CAAACA97}.eml', 2, 'user2@mypost.xy', 406, 0, '1901-01-01 00:00:00', 96, '2022-06-05 05:21:45', 1, 36);

--
-- Триггеры `hm_messages`
--
DELIMITER $$
CREATE TRIGGER `after_insert_message_items` AFTER INSERT ON `hm_messages` FOR EACH ROW INSERT INTO mypost.hm_messages 
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
		mypost.hm_messages.messageuid  = NEW.messageuid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_message_metadata`
--

CREATE TABLE `hm_message_metadata` (
  `metadata_id` bigint NOT NULL,
  `metadata_accountid` int NOT NULL,
  `metadata_folderid` int NOT NULL,
  `metadata_messageid` bigint NOT NULL,
  `metadata_dateutc` datetime DEFAULT NULL,
  `metadata_from` varchar(255) NOT NULL,
  `metadata_subject` varchar(255) NOT NULL,
  `metadata_to` varchar(255) NOT NULL,
  `metadata_cc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_routeaddresses`
--

CREATE TABLE `hm_routeaddresses` (
  `routeaddressid` mediumint NOT NULL,
  `routeaddressrouteid` int NOT NULL,
  `routeaddressaddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_routes`
--

CREATE TABLE `hm_routes` (
  `routeid` int NOT NULL,
  `routedomainname` varchar(255) NOT NULL,
  `routedescription` varchar(255) NOT NULL,
  `routetargetsmthost` varchar(255) NOT NULL,
  `routetargetsmtport` int NOT NULL,
  `routenooftries` int NOT NULL,
  `routeminutesbetweentry` int NOT NULL,
  `routealladdresses` tinyint UNSIGNED NOT NULL,
  `routeuseauthentication` tinyint NOT NULL,
  `routeauthenticationusername` varchar(255) NOT NULL,
  `routeauthenticationpassword` varchar(255) NOT NULL,
  `routetreatsecurityaslocal` tinyint NOT NULL,
  `routeconnectionsecurity` tinyint NOT NULL,
  `routetreatsenderaslocaldomain` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_rules`
--

CREATE TABLE `hm_rules` (
  `ruleid` int NOT NULL,
  `ruleaccountid` int NOT NULL,
  `rulename` varchar(100) NOT NULL,
  `ruleactive` tinyint NOT NULL,
  `ruleuseand` tinyint NOT NULL,
  `rulesortorder` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_rule_actions`
--

CREATE TABLE `hm_rule_actions` (
  `actionid` int NOT NULL,
  `actionruleid` int NOT NULL,
  `actiontype` tinyint NOT NULL,
  `actionimapfolder` varchar(255) NOT NULL,
  `actionsubject` varchar(255) NOT NULL,
  `actionfromname` varchar(255) NOT NULL,
  `actionfromaddress` varchar(255) NOT NULL,
  `actionto` varchar(255) NOT NULL,
  `actionbody` text NOT NULL,
  `actionfilename` varchar(255) NOT NULL,
  `actionsortorder` int NOT NULL,
  `actionscriptfunction` varchar(255) NOT NULL,
  `actionheader` varchar(80) NOT NULL,
  `actionvalue` varchar(255) NOT NULL,
  `actionrouteid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_rule_criterias`
--

CREATE TABLE `hm_rule_criterias` (
  `criteriaid` int NOT NULL,
  `criteriaruleid` int NOT NULL,
  `criteriausepredefined` tinyint NOT NULL,
  `criteriapredefinedfield` tinyint NOT NULL,
  `criteriaheadername` varchar(255) NOT NULL,
  `criteriamatchtype` tinyint NOT NULL,
  `criteriamatchvalue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_securityranges`
--

CREATE TABLE `hm_securityranges` (
  `rangeid` int NOT NULL,
  `rangepriorityid` int NOT NULL,
  `rangelowerip1` bigint NOT NULL,
  `rangelowerip2` bigint DEFAULT NULL,
  `rangeupperip1` bigint NOT NULL,
  `rangeupperip2` bigint DEFAULT NULL,
  `rangeoptions` int NOT NULL,
  `rangename` varchar(100) NOT NULL,
  `rangeexpires` tinyint NOT NULL,
  `rangeexpirestime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_securityranges`
--

INSERT INTO `hm_securityranges` (`rangeid`, `rangepriorityid`, `rangelowerip1`, `rangelowerip2`, `rangeupperip1`, `rangeupperip2`, `rangeoptions`, `rangename`, `rangeexpires`, `rangeexpirestime`) VALUES
(1, 10, 0, NULL, 4294967295, NULL, 96203, 'Internet', 0, '2001-01-01 00:00:00'),
(2, 15, 2130706433, NULL, 2130706433, NULL, 71627, 'My computer', 0, '2001-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_servermessages`
--

CREATE TABLE `hm_servermessages` (
  `smid` int NOT NULL,
  `smname` varchar(255) NOT NULL,
  `smtext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_servermessages`
--

INSERT INTO `hm_servermessages` (`smid`, `smname`, `smtext`) VALUES
(1, 'VIRUS_FOUND', 'Virus found'),
(2, 'VIRUS_ATTACHMENT_REMOVED', 'Virus found:\r\nThe attachment(s) of this message was removed since a virus was detected in at least one of them.\r\n\r\n'),
(3, 'VIRUS_NOTIFICATION', 'The message below contained a virus and did not\r\nreach some or all of the intended recipients.\r\n\r\n   From: %MACRO_FROM%\r\n   To: %MACRO_TO%\r\n   Sent: %MACRO_SENT%\r\n   Subject: %MACRO_SUBJECT%\r\n\r\nhMailServer\r\n'),
(4, 'SEND_FAILED_NOTIFICATION', 'Your message did not reach some or all of the intended recipients.\r\n\r\n   Sent: %MACRO_SENT%\r\n   Subject: %MACRO_SUBJECT%\r\n\r\nThe following recipient(s) could not be reached:\r\n\r\n%MACRO_RECIPIENTS%\r\n\r\nhMailServer\r\n'),
(5, 'MESSAGE_UNDELIVERABLE', 'Message undeliverable'),
(6, 'MESSAGE_FILE_MISSING', 'The mail server could not deliver the message to you since the file %MACRO_FILE% does not exist on the server.\r\n\r\nThe file may have been deleted by anti virus software running on the server.\r\n\r\nhMailServer'),
(7, 'ATTACHMENT_REMOVED', 'The attachment %MACRO_FILE% was blocked for delivery by the e-mail server. Please contact your system administrator if you have any questions regarding this.\r\n\r\nhMailServer\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `hm_settings`
--

CREATE TABLE `hm_settings` (
  `settingid` int NOT NULL,
  `settingname` varchar(30) NOT NULL,
  `settingstring` varchar(4000) NOT NULL,
  `settinginteger` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_settings`
--

INSERT INTO `hm_settings` (`settingid`, `settingname`, `settingstring`, `settinginteger`) VALUES
(1, 'maxpop3connections', '', 0),
(2, 'maxsmtpconnections', '', 0),
(3, 'mirroremailaddress', '', 0),
(4, 'relaymode', '', 2),
(5, 'authallowplaintext', '', 0),
(6, 'allowmailfromnull', '', 1),
(7, 'logging', '', 23),
(8, 'logdevice', '', 0),
(9, 'smtpnoofretries', '', 4),
(10, 'smtpminutesbetweenretries', '', 60),
(11, 'protocolimap', '', 1),
(12, 'protocolsmtp', '', 1),
(13, 'protocolpop3', '', 1),
(14, 'welcomeimap', '', 0),
(15, 'welcomepop3', '', 0),
(16, 'welcomesmtp', '', 0),
(17, 'smtprelayer', 'smtp.yandex.ru', 0),
(18, 'maxdelivertythreads', '', 10),
(19, 'logformat', '', 0),
(20, 'avclamwinenable', '', 0),
(21, 'avclamwinexec', '', 0),
(22, 'avclamwindb', '', 0),
(23, 'avnotifysender', '', 0),
(24, 'avnotifyreceiver', '', 0),
(25, 'avaction', '', 0),
(26, 'sendstatistics', '', 0),
(27, 'hostname', 'mypost.xy', 0),
(28, 'smtprelayerusername', 'derfty99@yandex.ru', 0),
(29, 'smtprelayerpassword', 'c303540adb335ab2ced015e386d37884', 0),
(30, 'usesmtprelayerauthentication', '', 1),
(31, 'smtprelayerport', '', 587),
(32, 'usecustomvirusscanner', '', 0),
(33, 'customvirusscannerexecutable', '', 0),
(34, 'customviursscannerreturnvalue', '', 0),
(35, 'usespf', '', 0),
(36, 'usemxchecks', '', 0),
(37, 'usescriptserver', '', 0),
(38, 'scriptlanguage', 'VBScript', 0),
(39, 'maxmessagesize', '', 20480),
(40, 'usecache', '', 1),
(41, 'domaincachettl', '', 60),
(42, 'accountcachettl', '', 60),
(43, 'awstatsenabled', '', 0),
(44, 'rulelooplimit', '', 5),
(45, 'backupoptions', '', 3),
(46, 'backupdestination', 'm:\\www\\mypost\\hmail\\backup\\', 0),
(47, 'defaultdomain', '', 0),
(48, 'avmaxmsgsize', '', 0),
(49, 'smtpdeliverybindtoip', '', 0),
(50, 'enableimapquota', '', 1),
(51, 'enableimapidle', '', 1),
(52, 'enableimapacl', '', 1),
(53, 'maximapconnections', '', 0),
(54, 'enableimapsort', '', 1),
(55, 'workerthreadpriority', '', 0),
(56, 'ascheckhostinhelo', '', 0),
(57, 'tcpipthreads', '', 15),
(58, 'smtpallowincorrectlineendings', '', 1),
(59, 'usegreylisting', '', 0),
(60, 'greylistinginitialdelay', '', 30),
(61, 'greylistinginitialdelete', '', 24),
(62, 'greylistingfinaldelete', '', 864),
(63, 'antispamaddheaderspam', '', 1),
(64, 'antispamaddheaderreason', '', 1),
(65, 'antispamprependsubject', '', 0),
(66, 'antispamprependsubjecttext', '[SPAM]', 0),
(67, 'enableattachmentblocking', '', 0),
(68, 'maxsmtprecipientsinbatch', '', 100),
(69, 'disconnectinvalidclients', '', 0),
(70, 'maximumincorrectcommands', '', 100),
(71, 'aliascachettl', '', 60),
(72, 'distributionlistcachettl', '', 60),
(73, 'smtprelayerconnectionsecurity', '', 1),
(74, 'adddeliveredtoheader', '', 0),
(75, 'groupcachettl', '', 60),
(76, 'imappublicfoldername', '#Public', 0),
(77, 'antispamenabled', '', 0),
(78, 'usespfscore', '', 3),
(79, 'ascheckhostinheloscore', '', 2),
(80, 'usemxchecksscore', '', 2),
(81, 'spammarkthreshold', '', 5),
(82, 'spamdeletethreshold', '', 20),
(83, 'spamassassinenabled', '', 0),
(84, 'spamassassinscore', '', 5),
(85, 'spamassassinmergescore', '', 0),
(86, 'spamassassinhost', '127.0.0.1', 0),
(87, 'spamassassinport', '', 783),
(88, 'antispammaxsize', '', 1024),
(89, 'ASDKIMVerificationEnabled', '', 0),
(90, 'ASDKIMVerificationFailureScore', '', 5),
(91, 'AutoBanOnLogonFailureEnabled', '', 1),
(92, 'MaxInvalidLogonAttempts', '', 3),
(93, 'LogonAttemptsWithinMinutes', '', 30),
(94, 'AutoBanMinutes', '', 60),
(95, 'IMAPHierarchyDelimiter', '.', 0),
(96, 'MaxNumberOfAsynchronousTasks', '', 15),
(97, 'MessageIndexing', '', 0),
(98, 'BypassGreylistingOnSPFSuccess', '', 1),
(99, 'BypassGreylistingOnMailFromMX', '', 0),
(100, 'MaxNumberOfMXHosts', '', 15),
(101, 'ClamAVEnabled', '', 0),
(102, 'ClamAVHost', 'localhost', 0),
(103, 'ClamAVPort', '', 3310),
(104, 'SmtpDeliveryConnectionSecurity', '', 2),
(105, 'VerifyRemoteSslCertificate', '', 1),
(106, 'SslCipherList', 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:ECDHE-RSA-RC4-SHA:ECDHE-ECDSA-RC4-SHA:AES128:AES256:RC4-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!3DES:!MD5:!PSK;', 0),
(107, 'SslVersions', '', 14);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_sslcertificates`
--

CREATE TABLE `hm_sslcertificates` (
  `sslcertificateid` bigint NOT NULL,
  `sslcertificatename` varchar(255) NOT NULL,
  `sslcertificatefile` varchar(255) NOT NULL,
  `sslprivatekeyfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `hm_surblservers`
--

CREATE TABLE `hm_surblservers` (
  `surblid` int NOT NULL,
  `surblactive` tinyint NOT NULL,
  `surblhost` varchar(255) NOT NULL,
  `surblrejectmessage` varchar(255) NOT NULL,
  `surblscore` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_surblservers`
--

INSERT INTO `hm_surblservers` (`surblid`, `surblactive`, `surblhost`, `surblrejectmessage`, `surblscore`) VALUES
(1, 0, 'multi.surbl.org', 'Rejected by SURBL.', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_tcpipports`
--

CREATE TABLE `hm_tcpipports` (
  `portid` bigint NOT NULL,
  `portprotocol` tinyint NOT NULL,
  `portnumber` int NOT NULL,
  `portaddress1` bigint NOT NULL,
  `portaddress2` bigint DEFAULT NULL,
  `portconnectionsecurity` tinyint NOT NULL,
  `portsslcertificateid` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hm_tcpipports`
--

INSERT INTO `hm_tcpipports` (`portid`, `portprotocol`, `portnumber`, `portaddress1`, `portaddress2`, `portconnectionsecurity`, `portsslcertificateid`) VALUES
(1, 1, 25, 0, NULL, 0, 0),
(2, 1, 587, 0, NULL, 0, 0),
(3, 3, 110, 0, NULL, 0, 0),
(4, 5, 143, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hm_whitelist`
--

CREATE TABLE `hm_whitelist` (
  `whiteid` bigint NOT NULL,
  `whiteloweripaddress1` bigint NOT NULL,
  `whiteloweripaddress2` bigint DEFAULT NULL,
  `whiteupperipaddress1` bigint NOT NULL,
  `whiteupperipaddress2` bigint DEFAULT NULL,
  `whiteemailaddress` varchar(255) NOT NULL,
  `whitedescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `mail_folder`
--

CREATE TABLE `mail_folder` (
  `mailfolder_id` bigint NOT NULL,
  `accountid` int NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `sender_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mail_folder`
--

INSERT INTO `mail_folder` (`mailfolder_id`, `accountid`, `folder_name`, `sender_email`, `contact_name`) VALUES
(1, 0, 'inbox', 'other', NULL),
(2, 2, 'user1', 'user1@mypost.xy', 'User 1'),
(3, 1, 'user2', 'user2@mypost.xy', 'User 2'),
(4, 1, 'user3', 'user3@mypost.xy', 'User 3'),
(5, 2, 'user3', 'user3@mypost.xy', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `page_id` int NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'CSS class',
  `page_template` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_class`, `page_template`) VALUES
(1, 'Почта', 'button_email', 'mailbox_list.tpl'),
(2, 'Контакты', 'button_contacts', 'contacts_list.tpl'),
(3, 'Новое письмо', 'button_email_new', 'new_email.tpl');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD UNIQUE KEY `contact_id` (`contact_id`),
  ADD KEY `contact_email` (`contact_email`);

--
-- Индексы таблицы `hm_accounts`
--
ALTER TABLE `hm_accounts`
  ADD PRIMARY KEY (`accountid`),
  ADD UNIQUE KEY `accountid` (`accountid`),
  ADD UNIQUE KEY `accountaddress` (`accountaddress`),
  ADD KEY `idx_hm_accounts` (`accountaddress`);

--
-- Индексы таблицы `hm_acl`
--
ALTER TABLE `hm_acl`
  ADD PRIMARY KEY (`aclid`),
  ADD UNIQUE KEY `aclid` (`aclid`),
  ADD UNIQUE KEY `aclsharefolderid` (`aclsharefolderid`,`aclpermissiontype`,`aclpermissiongroupid`,`aclpermissionaccountid`);

--
-- Индексы таблицы `hm_aliases`
--
ALTER TABLE `hm_aliases`
  ADD PRIMARY KEY (`aliasid`),
  ADD UNIQUE KEY `aliasid` (`aliasid`),
  ADD UNIQUE KEY `aliasname` (`aliasname`),
  ADD KEY `idx_hm_aliases` (`aliasdomainid`,`aliasname`);

--
-- Индексы таблицы `hm_blocked_attachments`
--
ALTER TABLE `hm_blocked_attachments`
  ADD PRIMARY KEY (`baid`),
  ADD UNIQUE KEY `baid` (`baid`);

--
-- Индексы таблицы `hm_distributionlists`
--
ALTER TABLE `hm_distributionlists`
  ADD PRIMARY KEY (`distributionlistid`),
  ADD UNIQUE KEY `distributionlistid` (`distributionlistid`),
  ADD UNIQUE KEY `distributionlistaddress` (`distributionlistaddress`),
  ADD KEY `idx_hm_distributionlists` (`distributionlistdomainid`);

--
-- Индексы таблицы `hm_distributionlistsrecipients`
--
ALTER TABLE `hm_distributionlistsrecipients`
  ADD PRIMARY KEY (`distributionlistrecipientid`),
  ADD UNIQUE KEY `distributionlistrecipientid` (`distributionlistrecipientid`),
  ADD KEY `idx_hm_distributionlistsrecipients` (`distributionlistrecipientlistid`);

--
-- Индексы таблицы `hm_dnsbl`
--
ALTER TABLE `hm_dnsbl`
  ADD PRIMARY KEY (`sblid`),
  ADD UNIQUE KEY `sblid` (`sblid`);

--
-- Индексы таблицы `hm_domains`
--
ALTER TABLE `hm_domains`
  ADD PRIMARY KEY (`domainid`),
  ADD UNIQUE KEY `domainid` (`domainid`),
  ADD UNIQUE KEY `domainname` (`domainname`),
  ADD KEY `idx_hm_domains` (`domainname`);

--
-- Индексы таблицы `hm_domain_aliases`
--
ALTER TABLE `hm_domain_aliases`
  ADD PRIMARY KEY (`daid`),
  ADD UNIQUE KEY `daid` (`daid`);

--
-- Индексы таблицы `hm_fetchaccounts`
--
ALTER TABLE `hm_fetchaccounts`
  ADD PRIMARY KEY (`faid`),
  ADD UNIQUE KEY `faid` (`faid`);

--
-- Индексы таблицы `hm_fetchaccounts_uids`
--
ALTER TABLE `hm_fetchaccounts_uids`
  ADD PRIMARY KEY (`uidid`),
  ADD UNIQUE KEY `uidid` (`uidid`),
  ADD KEY `idx_hm_fetchaccounts_uids` (`uidfaid`);

--
-- Индексы таблицы `hm_greylisting_triplets`
--
ALTER TABLE `hm_greylisting_triplets`
  ADD PRIMARY KEY (`glid`),
  ADD UNIQUE KEY `glid` (`glid`),
  ADD KEY `idx_greylisting_triplets` (`glipaddress1`,`glipaddress2`,`glsenderaddress`(40),`glrecipientaddress`(40));

--
-- Индексы таблицы `hm_greylisting_whiteaddresses`
--
ALTER TABLE `hm_greylisting_whiteaddresses`
  ADD PRIMARY KEY (`whiteid`),
  ADD UNIQUE KEY `whiteid` (`whiteid`);

--
-- Индексы таблицы `hm_groups`
--
ALTER TABLE `hm_groups`
  ADD PRIMARY KEY (`groupid`),
  ADD UNIQUE KEY `groupid` (`groupid`);

--
-- Индексы таблицы `hm_group_members`
--
ALTER TABLE `hm_group_members`
  ADD PRIMARY KEY (`memberid`),
  ADD UNIQUE KEY `memberid` (`memberid`);

--
-- Индексы таблицы `hm_imapfolders`
--
ALTER TABLE `hm_imapfolders`
  ADD PRIMARY KEY (`folderid`),
  ADD UNIQUE KEY `folderid` (`folderid`),
  ADD UNIQUE KEY `idx_hm_imapfolders_unique` (`folderaccountid`,`folderparentid`,`foldername`),
  ADD KEY `idx_hm_imapfolders` (`folderaccountid`);

--
-- Индексы таблицы `hm_incoming_relays`
--
ALTER TABLE `hm_incoming_relays`
  ADD PRIMARY KEY (`relayid`),
  ADD UNIQUE KEY `relayid` (`relayid`);

--
-- Индексы таблицы `hm_logon_failures`
--
ALTER TABLE `hm_logon_failures`
  ADD KEY `idx_hm_logon_failures_ipaddress` (`ipaddress1`,`ipaddress2`),
  ADD KEY `idx_hm_logon_failures_failuretime` (`failuretime`);

--
-- Индексы таблицы `hm_messagerecipients`
--
ALTER TABLE `hm_messagerecipients`
  ADD PRIMARY KEY (`recipientid`),
  ADD UNIQUE KEY `recipientid` (`recipientid`),
  ADD KEY `idx_hm_messagerecipients` (`recipientmessageid`);

--
-- Индексы таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD UNIQUE KEY `messageid` (`messageid`),
  ADD KEY `idx_hm_messages` (`messageaccountid`,`messagefolderid`),
  ADD KEY `idx_hm_messages_type` (`messagetype`);

--
-- Индексы таблицы `hm_message_metadata`
--
ALTER TABLE `hm_message_metadata`
  ADD PRIMARY KEY (`metadata_id`),
  ADD UNIQUE KEY `idx_message_metadata_unique` (`metadata_accountid`,`metadata_folderid`,`metadata_messageid`),
  ADD KEY `idx_message_metadata_id` (`metadata_messageid`);

--
-- Индексы таблицы `hm_routeaddresses`
--
ALTER TABLE `hm_routeaddresses`
  ADD PRIMARY KEY (`routeaddressid`),
  ADD UNIQUE KEY `routeaddressid` (`routeaddressid`);

--
-- Индексы таблицы `hm_routes`
--
ALTER TABLE `hm_routes`
  ADD PRIMARY KEY (`routeid`),
  ADD UNIQUE KEY `routeid` (`routeid`);

--
-- Индексы таблицы `hm_rules`
--
ALTER TABLE `hm_rules`
  ADD PRIMARY KEY (`ruleid`),
  ADD UNIQUE KEY `ruleid` (`ruleid`),
  ADD KEY `idx_rules` (`ruleaccountid`);

--
-- Индексы таблицы `hm_rule_actions`
--
ALTER TABLE `hm_rule_actions`
  ADD PRIMARY KEY (`actionid`),
  ADD UNIQUE KEY `actionid` (`actionid`),
  ADD KEY `idx_rules_actions` (`actionruleid`);

--
-- Индексы таблицы `hm_rule_criterias`
--
ALTER TABLE `hm_rule_criterias`
  ADD PRIMARY KEY (`criteriaid`),
  ADD UNIQUE KEY `criteriaid` (`criteriaid`),
  ADD KEY `idx_rules_criterias` (`criteriaruleid`);

--
-- Индексы таблицы `hm_securityranges`
--
ALTER TABLE `hm_securityranges`
  ADD PRIMARY KEY (`rangeid`),
  ADD UNIQUE KEY `rangeid` (`rangeid`),
  ADD UNIQUE KEY `rangename` (`rangename`);

--
-- Индексы таблицы `hm_servermessages`
--
ALTER TABLE `hm_servermessages`
  ADD PRIMARY KEY (`smid`),
  ADD UNIQUE KEY `smid` (`smid`);

--
-- Индексы таблицы `hm_settings`
--
ALTER TABLE `hm_settings`
  ADD PRIMARY KEY (`settingid`),
  ADD UNIQUE KEY `settingid` (`settingid`),
  ADD UNIQUE KEY `settingname` (`settingname`);

--
-- Индексы таблицы `hm_sslcertificates`
--
ALTER TABLE `hm_sslcertificates`
  ADD PRIMARY KEY (`sslcertificateid`),
  ADD UNIQUE KEY `sslcertificateid` (`sslcertificateid`);

--
-- Индексы таблицы `hm_surblservers`
--
ALTER TABLE `hm_surblservers`
  ADD PRIMARY KEY (`surblid`),
  ADD UNIQUE KEY `surblid` (`surblid`);

--
-- Индексы таблицы `hm_tcpipports`
--
ALTER TABLE `hm_tcpipports`
  ADD PRIMARY KEY (`portid`),
  ADD UNIQUE KEY `portid` (`portid`);

--
-- Индексы таблицы `hm_whitelist`
--
ALTER TABLE `hm_whitelist`
  ADD PRIMARY KEY (`whiteid`),
  ADD UNIQUE KEY `whiteid` (`whiteid`);

--
-- Индексы таблицы `mail_folder`
--
ALTER TABLE `mail_folder`
  ADD PRIMARY KEY (`mailfolder_id`),
  ADD UNIQUE KEY `mailfolder_id` (`mailfolder_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_id` (`page_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `hm_accounts`
--
ALTER TABLE `hm_accounts`
  MODIFY `accountid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `hm_acl`
--
ALTER TABLE `hm_acl`
  MODIFY `aclid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_aliases`
--
ALTER TABLE `hm_aliases`
  MODIFY `aliasid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_blocked_attachments`
--
ALTER TABLE `hm_blocked_attachments`
  MODIFY `baid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `hm_distributionlists`
--
ALTER TABLE `hm_distributionlists`
  MODIFY `distributionlistid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_distributionlistsrecipients`
--
ALTER TABLE `hm_distributionlistsrecipients`
  MODIFY `distributionlistrecipientid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_dnsbl`
--
ALTER TABLE `hm_dnsbl`
  MODIFY `sblid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hm_domains`
--
ALTER TABLE `hm_domains`
  MODIFY `domainid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hm_domain_aliases`
--
ALTER TABLE `hm_domain_aliases`
  MODIFY `daid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_fetchaccounts`
--
ALTER TABLE `hm_fetchaccounts`
  MODIFY `faid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_fetchaccounts_uids`
--
ALTER TABLE `hm_fetchaccounts_uids`
  MODIFY `uidid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_greylisting_triplets`
--
ALTER TABLE `hm_greylisting_triplets`
  MODIFY `glid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_greylisting_whiteaddresses`
--
ALTER TABLE `hm_greylisting_whiteaddresses`
  MODIFY `whiteid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_groups`
--
ALTER TABLE `hm_groups`
  MODIFY `groupid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_group_members`
--
ALTER TABLE `hm_group_members`
  MODIFY `memberid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_imapfolders`
--
ALTER TABLE `hm_imapfolders`
  MODIFY `folderid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `hm_incoming_relays`
--
ALTER TABLE `hm_incoming_relays`
  MODIFY `relayid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_messagerecipients`
--
ALTER TABLE `hm_messagerecipients`
  MODIFY `recipientid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  MODIFY `messageid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT для таблицы `hm_message_metadata`
--
ALTER TABLE `hm_message_metadata`
  MODIFY `metadata_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_routeaddresses`
--
ALTER TABLE `hm_routeaddresses`
  MODIFY `routeaddressid` mediumint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_routes`
--
ALTER TABLE `hm_routes`
  MODIFY `routeid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_rules`
--
ALTER TABLE `hm_rules`
  MODIFY `ruleid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hm_rule_actions`
--
ALTER TABLE `hm_rule_actions`
  MODIFY `actionid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_rule_criterias`
--
ALTER TABLE `hm_rule_criterias`
  MODIFY `criteriaid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hm_securityranges`
--
ALTER TABLE `hm_securityranges`
  MODIFY `rangeid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hm_servermessages`
--
ALTER TABLE `hm_servermessages`
  MODIFY `smid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `hm_settings`
--
ALTER TABLE `hm_settings`
  MODIFY `settingid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT для таблицы `hm_sslcertificates`
--
ALTER TABLE `hm_sslcertificates`
  MODIFY `sslcertificateid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_surblservers`
--
ALTER TABLE `hm_surblservers`
  MODIFY `surblid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `hm_tcpipports`
--
ALTER TABLE `hm_tcpipports`
  MODIFY `portid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `hm_whitelist`
--
ALTER TABLE `hm_whitelist`
  MODIFY `whiteid` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mail_folder`
--
ALTER TABLE `mail_folder`
  MODIFY `mailfolder_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
