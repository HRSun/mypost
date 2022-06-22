-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 16 2022 г., 22:32
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
(105, 1, 1, '{99E2BF29-08A0-4548-9277-B07A0BA4D5E2}.eml', 2, 'felix@mypost.xy', 422, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:32:59', 1, 27),
(106, 15, 12, '{4627B5F1-ED0D-4C3A-A5E3-BA17FC69EC98}.eml', 2, 'user1@mypost.xy', 421, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:33:46', 1, 2),
(107, 15, 12, '{BDD520DF-1D74-482A-A8E2-B3E9B9192DD7}.eml', 2, 'user1@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-02 01:49:16', 1, 3),
(108, 1, 1, '{4D7D73F4-031E-4B2E-9D3C-933432034E16}.eml', 2, 'sever@nn.ru', 414, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:00:06', 1, 28),
(112, 1, 1, '{F8F85E13-09FE-476A-B536-4B6252187E0C}.eml', 2, 'sever@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:05:13', 1, 29),
(114, 25, 22, '{CB3425BA-85A4-40A1-ADF7-D1F580D55E1E}.eml', 2, 'qwer@mypost.xy', 426, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:10:56', 1, 1),
(116, 1, 1, '{261119E0-FC44-4E85-AE64-4863771D5D49}.eml', 2, 'qwer2@mypost.xy', 420, 0, '1901-01-01 00:00:00', 96, '2022-06-02 13:14:19', 1, 30),
(118, 1, 1, '{E590F255-F0B4-4A88-B339-ECC9397CC541}.eml', 2, '', 612, 0, '1901-01-01 00:00:00', 32, '2022-06-03 19:07:14', 1, 31),
(119, 2, 2, '{4DC0980E-09F7-4402-8B3F-0F476A6C474B}.eml', 2, 'user1@mypost.xy', 437, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:12:58', 1, 48),
(120, 1, 1, '{65189B74-BA9A-4E2F-BB57-4634BC462CCD}.eml', 2, 'user2@mypost.xy', 428, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:17:29', 1, 32),
(121, 1, 1, '{55A8C7E9-9849-4FB3-99FD-A76270DABA52}.eml', 2, 'user2@mypost.xy', 422, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:23:44', 1, 33),
(122, 1, 1, '{302EC682-4A4B-45BD-B894-FA38758B1613}.eml', 2, 'user2@mypost.xy', 391, 0, '1901-01-01 00:00:00', 96, '2022-06-04 03:25:04', 1, 34),
(123, 1, 1, '{C0E67BA2-F9D8-49D1-A279-243C204E0E25}.eml', 2, 'user2@mypost.xy', 397, 0, '1901-01-01 00:00:00', 96, '2022-06-04 17:47:44', 1, 35),
(124, 2, 2, '{07978A33-4F2E-40C2-BB82-C6AB9B5B64D1}.eml', 2, 'user1@mypost.xy', 403, 0, '1901-01-01 00:00:00', 96, '2022-06-04 19:54:59', 1, 49),
(125, 1, 1, '{1A868123-FF19-423F-89A8-6CF4CAAACA97}.eml', 2, 'user2@mypost.xy', 406, 0, '1901-01-01 00:00:00', 96, '2022-06-05 05:21:45', 1, 36),
(126, 28, 25, '{BE89E2D9-D53E-447F-A2E9-970CCA4B6992}.eml', 2, 'user1@mypost.xy', 527, 0, '1901-01-01 00:00:00', 96, '2022-06-07 17:12:08', 1, 1),
(127, 2, 2, '{056DE617-4D0B-494A-988F-14FC9A17881B}.eml', 2, 'user1@mypost.xy', 399, 0, '1901-01-01 00:00:00', 96, '2022-06-07 18:42:22', 1, 50);

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
  MODIFY `messageid` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
