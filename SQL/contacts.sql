-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 24 2022 г., 13:35
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
(1, 1, 'user5@mypost.xy', 'user5', 'John'),
(2, 1, 'dan@mypost.xy', 'Dan', 'Dan Kyle'),
(3, 1, 'tom_bourne@mypost.xy', 'Bourne', 'Tom Bourne'),
(4, 2, 'fill_hugh@mypost.xy', 'Hugh', 'Fill Hugh'),
(5, 2, 's_veron@mypost.xy', 'Veron S.', 'Sally Veron Douglas II'),
(6, 2, 'b_sheppard@mypost.xy', 'Sheppard', 'Bill Sheppard'),
(7, 1, 'user2@mypost.xy', 'user2', 'User 2'),
(9, 1, 'user4@mypost.xy', 'user4', 'User 4'),
(11, 2, 'dan@mypost.xy', 'Dan', 'Dan Kyle'),
(19, 2, 'user1@mypost.xy', 'papka', 'papka'),
(20, 2, 'tom_bourne@mypost.xy', 'f', 'f'),
(21, 1, 'dfsf@dsf.vv', 'spam', 'spam');

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
