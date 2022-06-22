-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 20 2022 г., 08:58
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
-- Структура таблицы `mail_folder`
--

CREATE TABLE `mail_folder` (
  `mailfolder_id` bigint NOT NULL,
  `accountid` int NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mail_folder`
--

INSERT INTO `mail_folder` (`mailfolder_id`, `accountid`, `folder_name`, `sender_name`) VALUES
(1, 0, 'inbox', 'other'),
(2, 2, 'user1', 'user1@mypost.xy'),
(3, 1, 'user2', 'user2@mypost.xy');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mail_folder`
--
ALTER TABLE `mail_folder`
  ADD PRIMARY KEY (`mailfolder_id`),
  ADD UNIQUE KEY `mailfolder_id` (`mailfolder_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mail_folder`
--
ALTER TABLE `mail_folder`
  MODIFY `mailfolder_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
