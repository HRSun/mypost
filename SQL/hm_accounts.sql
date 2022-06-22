-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 01 2022 г., 19:56
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
(1, 1, 0, 'user1@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-31 00:06:00', 0, '2022-05-15 00:00:00', '', ''),
(2, 1, 0, 'user2@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-30 19:22:51', 0, '2022-05-15 00:00:00', '', ''),
(5, 1, 0, 'user3@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-14 21:50:03', 0, '2022-05-15 00:00:00', '', ''),
(6, 1, 0, 'user4@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-15 02:46:33', 0, '2022-05-15 00:00:00', '', ''),
(8, 1, 0, 'user5@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-15 07:17:15', 0, '2022-05-15 00:00:00', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hm_accounts`
--
ALTER TABLE `hm_accounts`
  ADD PRIMARY KEY (`accountid`),
  ADD UNIQUE KEY `accountid` (`accountid`),
  ADD UNIQUE KEY `accountaddress` (`accountaddress`),
  ADD KEY `idx_hm_accounts` (`accountaddress`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hm_accounts`
--
ALTER TABLE `hm_accounts`
  MODIFY `accountid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO `hm_accounts` (`accountdomainid`, `accountadminlevel`, `accountaddress`, `accountpassword`, `accountactive`, `accountisad`, `accountaddomain`, `accountadusername`, `accountmaxsize`, `accountvacationmessageon`, `accountvacationmessage`, `accountvacationsubject`, `accountpwencryption`, `accountforwardenabled`, `accountforwardaddress`, `accountforwardkeeporiginal`, `accountenablesignature`, `accountsignatureplaintext`, `accountsignaturehtml`, `accountlastlogontime`, `accountvacationexpires`, `accountvacationexpiredate`, `accountpersonfirstname`, `accountpersonlastname`) 
VALUES
(1, 0, 'user11@mypost.xy', '202cb962ac59075b964b07152d234b70', 1, 0, '', '', 0, 0, '', '', 2, 0, '', 0, 0, '', '', '2022-05-31 00:06:00', 0, '2022-05-15 00:00:00', '', '');