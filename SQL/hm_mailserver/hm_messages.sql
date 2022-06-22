-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 13 2022 г., 22:35
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
(39, 1, 1, '{07EE3661-37BA-475B-91FB-B18915D3C57F}.eml', 2, 'cfr@cc.vb', 197, 0, '1901-01-01 00:00:00', 65, '2022-05-12 10:09:11', 1, 6);

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

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD UNIQUE KEY `messageid` (`messageid`),
  ADD KEY `idx_hm_messages` (`messageaccountid`,`messagefolderid`),
  ADD KEY `idx_hm_messages_type` (`messagetype`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  MODIFY `messageid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
