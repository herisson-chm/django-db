-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 10 2019 г., 18:43
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `crud3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adm_levels`
--

CREATE TABLE `adm_levels` (
  `id_level` int(11) NOT NULL,
  `level_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `adm_levels`
--

INSERT INTO `adm_levels` (`id_level`, `level_name`) VALUES
(1, 'bachelor');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id_country` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id_country`, `country_name`) VALUES
(1, 'UK'),
(2, 'France'),
(3, 'USA'),
(4, 'Ukraine'),
(5, 'Germany'),
(6, 'Belgium'),
(7, 'Czech Republic'),
(8, 'Poland'),
(9, 'Netherlands'),
(10, 'Switzerland'),
(11, 'Australia'),
(12, 'Austria'),
(13, 'Brazil'),
(14, 'Canada'),
(15, 'China'),
(16, 'Finland'),
(17, 'Greece'),
(18, 'Ireland'),
(19, 'Italy'),
(20, 'Japan'),
(21, 'New Zealand'),
(22, 'Norway'),
(23, 'Russia'),
(24, 'Singapore'),
(25, 'Sweden'),
(26, 'Spain');

-- --------------------------------------------------------

--
-- Структура таблицы `fields`
--

CREATE TABLE `fields` (
  `id_field` int(11) NOT NULL,
  `field_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fields`
--

INSERT INTO `fields` (`id_field`, `field_name`) VALUES
(1, 'Chemistry'),
(2, 'Physics'),
(3, 'Biology'),
(6, 'Material science'),
(7, 'Maths');

-- --------------------------------------------------------

--
-- Структура таблицы `offers`
--

CREATE TABLE `offers` (
  `id_offer` int(11) NOT NULL,
  `offer_name` varchar(200) NOT NULL,
  `info` text NOT NULL,
  `link` text NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `offers`
--

INSERT INTO `offers` (`id_offer`, `offer_name`, `info`, `link`, `deadline`) VALUES
(1, 'name', 'info', 'link', '2019-08-22'),
(2, 'other name', 'other info', 'other link', '2019-08-28'),
(3, 'tyge', 'yevgv', 'nfbhdvdgft', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `off_country`
--

CREATE TABLE `off_country` (
  `id_offer` int(11) NOT NULL,
  `id_country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `off_country`
--

INSERT INTO `off_country` (`id_offer`, `id_country`) VALUES
(1, 1),
(1, 20),
(1, 1),
(1, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `off_field`
--

CREATE TABLE `off_field` (
  `id_offer` int(11) NOT NULL,
  `id_field` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `off_field`
--

INSERT INTO `off_field` (`id_offer`, `id_field`) VALUES
(1, 1),
(1, 2),
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `off_levl`
--

CREATE TABLE `off_levl` (
  `id_offer` int(11) NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `off_levl`
--

INSERT INTO `off_levl` (`id_offer`, `id_level`) VALUES
(1, 1),
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `off_type`
--

CREATE TABLE `off_type` (
  `id_offer` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `off_type`
--

INSERT INTO `off_type` (`id_offer`, `id_type`) VALUES
(1, 2),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id_type` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id_type`, `type_name`) VALUES
(1, 'PhD'),
(2, 'Internship'),
(3, 'Master Degree'),
(4, 'Conference'),
(5, 'Workshop'),
(6, 'Job'),
(7, 'Competition');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adm_levels`
--
ALTER TABLE `adm_levels`
  ADD PRIMARY KEY (`id_level`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_country`);

--
-- Индексы таблицы `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id_field`);

--
-- Индексы таблицы `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id_offer`);

--
-- Индексы таблицы `off_country`
--
ALTER TABLE `off_country`
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_country` (`id_country`);

--
-- Индексы таблицы `off_field`
--
ALTER TABLE `off_field`
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_field` (`id_field`);

--
-- Индексы таблицы `off_levl`
--
ALTER TABLE `off_levl`
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_level` (`id_level`);

--
-- Индексы таблицы `off_type`
--
ALTER TABLE `off_type`
  ADD KEY `id_offer` (`id_offer`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adm_levels`
--
ALTER TABLE `adm_levels`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `fields`
--
ALTER TABLE `fields`
  MODIFY `id_field` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id_offer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `off_country`
--
ALTER TABLE `off_country`
  ADD CONSTRAINT `OFF_COUNTRY_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id_offer`),
  ADD CONSTRAINT `OFF_COUNTRY_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`);

--
-- Ограничения внешнего ключа таблицы `off_field`
--
ALTER TABLE `off_field`
  ADD CONSTRAINT `OFF_FIELD_ibfk_1` FOREIGN KEY (`id_field`) REFERENCES `fields` (`id_field`),
  ADD CONSTRAINT `OFF_FIELD_ibfk_2` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id_offer`);

--
-- Ограничения внешнего ключа таблицы `off_levl`
--
ALTER TABLE `off_levl`
  ADD CONSTRAINT `OFF_LEVL_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id_offer`),
  ADD CONSTRAINT `OFF_LEVL_ibfk_2` FOREIGN KEY (`id_level`) REFERENCES `adm_levels` (`id_level`);

--
-- Ограничения внешнего ключа таблицы `off_type`
--
ALTER TABLE `off_type`
  ADD CONSTRAINT `OFF_TYPE_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id_offer`),
  ADD CONSTRAINT `OFF_TYPE_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
