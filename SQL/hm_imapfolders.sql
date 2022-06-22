-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 02 2022 г., 01:19
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
(1, 1, -1, 'INBOX', 1, '2022-05-09 15:40:12', 26),
(2, 2, -1, 'INBOX', 1, '2022-05-09 15:40:24', 47),
(7, 5, -1, 'INBOX', 1, '2022-05-14 21:50:03', 0),
(8, 6, -1, 'INBOX', 1, '2022-05-15 02:46:33', 1),
(10, 8, -1, 'INBOX', 1, '2022-05-15 07:17:15', 0),
(11, 14, -1, 'INBOX', 1, '2022-06-02 01:03:28', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hm_imapfolders`
--
ALTER TABLE `hm_imapfolders`
  ADD PRIMARY KEY (`folderid`),
  ADD UNIQUE KEY `folderid` (`folderid`),
  ADD UNIQUE KEY `idx_hm_imapfolders_unique` (`folderaccountid`,`folderparentid`,`foldername`),
  ADD KEY `idx_hm_imapfolders` (`folderaccountid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hm_imapfolders`
--
ALTER TABLE `hm_imapfolders`
  MODIFY `folderid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
