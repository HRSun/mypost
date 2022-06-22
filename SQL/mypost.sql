-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 14 2022 г., 10:12
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
-- База данных: `mypost`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `catalog_get_mailbox_list` ()   BEGIN
SELECT mailfolder_id, folder_name FROM mail_folder ORDER BY mailfolder_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pages` ()   BEGIN
SELECT page_id, page_name, page_class, page_template FROM pages ORDER BY page_id;
END$$

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
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(3, 1, 1, '{D02FA7E0-DA61-4073-B4A6-86625E400DF4}.eml', 2, 'user2@mypost.xy', 616, 0, '1901-01-01 00:00:00', 96, '2022-05-09 15:48:15', 1, 1),
(4, 2, 2, '{82F24BBB-A5E7-43B3-8CBB-1C50A6D7668F}.eml', 2, 'user1@mypost.xy', 431, 0, '1901-01-01 00:00:00', 96, '2022-05-09 18:12:50', 1, 3),
(5, 1, 1, '{4A8DE2F3-5019-4188-AD30-6BBC12B380C7}.eml', 2, 'user2@mypost.xy', 622, 0, '1901-01-01 00:00:00', 96, '2022-05-09 18:14:23', 1, 2),
(6, 2, 2, '{73C7D0A1-04E6-4441-9B94-168C0EFBEF10}.eml', 2, 'user1@mypost.xy', 438, 0, '1901-01-01 00:00:00', 96, '2022-05-11 01:29:32', 1, 4),
(7, 2, 2, '{733ADA91-35B0-4938-8C49-BD51FA8FF314}.eml', 2, 'user1@mypost.xy', 440, 0, '1901-01-01 00:00:00', 96, '2022-05-11 01:38:13', 1, 5),
(9, 0, 0, '{DF7CA2C6-0B4B-4F18-9DCE-ECC89437C1E9}.eml', 1, 'user1@mypost.xy', 739, 0, '1901-01-01 00:00:00', 96, '2022-05-11 03:07:14', 1, 0),
(10, 0, 0, '{9D1C9538-26D1-4342-B0D9-33B43A822CAE}.eml', 1, 'user2@mypost.xy', 620, 0, '1901-01-01 00:00:00', 96, '2022-05-11 03:08:13', 1, 0),
(11, 0, 0, '{03282458-D769-4489-8E30-6739376D2081}.eml', 1, 'user1@mypost.xy', 741, 0, '1901-01-01 00:00:00', 96, '2022-05-11 03:24:28', 1, 0),
(12, 0, 0, '{221627DB-45F1-4737-A55A-97F052A35292}.eml', 1, 'user1@mypost.xy', 336, 0, '1901-01-01 00:00:00', 96, '2022-05-11 15:21:24', 1, 0),
(13, 0, 0, '{07EE3661-37BA-475B-91FB-B18915D3C57F}.eml', 1, 'cfr@cc.vb', 197, 0, '1901-01-01 00:00:00', 96, '2022-05-12 10:09:11', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `inbox`
--

CREATE TABLE `inbox` (
  `id` bigint NOT NULL,
  `filename` varchar(255) NOT NULL,
  `messagefrom` varchar(255) NOT NULL,
  `messagesize` bigint NOT NULL,
  `messagedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mail_folder`
--

CREATE TABLE `mail_folder` (
  `mailfolder_id` bigint NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mail_folder`
--

INSERT INTO `mail_folder` (`mailfolder_id`, `folder_name`, `sender_name`) VALUES
(1, 'inbox', 'other'),
(2, 'user1', 'user1@mypost.xy'),
(3, 'user2', 'user2@mypost.xy');

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

-- --------------------------------------------------------

--
-- Структура таблицы `user1`
--

CREATE TABLE `user1` (
  `id` bigint NOT NULL,
  `filename` varchar(255) NOT NULL,
  `messagefrom` varchar(255) NOT NULL,
  `messagesize` bigint NOT NULL,
  `messagedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Индексы таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD UNIQUE KEY `messageid` (`messageid`),
  ADD KEY `idx_hm_messages` (`messageaccountid`,`messagefolderid`),
  ADD KEY `idx_hm_messages_type` (`messagetype`);

--
-- Индексы таблицы `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `user1`
--
ALTER TABLE `user1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hm_messages`
--
ALTER TABLE `hm_messages`
  MODIFY `messageid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mail_folder`
--
ALTER TABLE `mail_folder`
  MODIFY `mailfolder_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user1`
--
ALTER TABLE `user1`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
