-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.3.13
-- Время создания: Май 25 2023 г., 09:00
-- Версия сервера: 5.7.35-38
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `a0819989_amirutkirov99`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(26, 'Спорт'),
(27, 'Книги'),
(28, 'Гаджеты');

-- --------------------------------------------------------

--
-- Структура таблицы `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `command`
--

INSERT INTO `command` (`id`, `id_product`, `quantity`, `dat`, `statut`, `id_user`) VALUES
(153, 64, 2, '2023-05-20 03:31:02', 'paid', 1),
(155, 66, 1, '2023-05-22 02:44:33', 'paid', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `details_command`
--

CREATE TABLE `details_command` (
  `id` int(11) NOT NULL,
  `product` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_command` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `details_command`
--

INSERT INTO `details_command` (`id`, `product`, `quantity`, `price`, `id_command`, `id_user`, `user`, `address`, `country`, `city`, `statut`) VALUES
(43, 'Makeup Kit', 1, 800, 146, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', '', 'Urgench', 'done'),
(44, 'Makeup Kit', 2, 1600, 147, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', 'India', 'Urgench', 'done'),
(45, 'Triple Combo Purse Deal', 1, 2500, 148, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', '', 'Urgench', 'done'),
(46, 'Triple Combo Purse Deal', 1, 2500, 149, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', '', 'Urgench', 'done'),
(47, 'Triple Combo Purse Deal', 1, 2500, 150, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', 'Morocco', 'Urgench', 'done'),
(48, 'Triple Combo Purse Deal', 1, 2500, 151, 1, 'Амир Уткиров', 'amirutkirov99@gmail.com', 'Morocco', 'Urgench', 'done'),
(49, 'Книга', 2, 1000, 153, 1, 'Амир Уткиров', '17/1', 'India', 'Urgench', 'done'),
(50, 'Книга', 5, 2500, 154, 16, 'Dima Kim', 'G 51d 8 k', 'Morocco', 'Urgench', 'ready'),
(51, 'Мяч', 1, 15, 155, 1, 'Амир Уткиров', '17/1', 'Uzbekistan', 'Urgench', 'done'),
(52, 'Мяч', 99, 1485, 156, 19, 'Vebensnsnsm Dnsjsnsmm', 'Jsjsjsjwj', 'Uzbekistan', 'Jsnsndjs', 'ready');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `thumbnail` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `id_category`, `name`, `description`, `price`, `thumbnail`) VALUES
(66, 26, 'Мяч', 'Баскетбольный мяч', 15, 'image.jpeg'),
(67, 27, 'Метро 2033', '«Метро́ 2033» — постапокалиптический роман Дмитрия Глуховского, описывающий жизнь людей в московском метро после ядерной войны на Земле. Выпущен издательством «Эксмо» в 2005 году и переиздан издательством «Популярная литература» в 2007 году.', 25, 'metro2033-00.jpg'),
(68, 27, 'Метро 2034', 'Метро 2034 — постапокалиптический роман Дмитрия Глуховского, сиквел романа «Метро 2033», описывающего жизнь людей в Московском метрополитене после ядерной войны.', 25, 'boocover.jpg'),
(69, 27, 'Метро 2035', '«Метро 2035» — постапокалиптический роман Дмитрия Глуховского, продолжающий серию книг «Метро 2033» и «Метро 2034». Выход книги состоялся 12 июня 2015 года в книжном магазине «Москва». В отличие от предыдущих книг трилогии, роман практически не содержит элементов фантастики, но обладает яркими чертами антиутопии.', 30, '2035.jpg'),
(70, 28, 'Колонка для смартфона', 'Этот гаджет для тех, кто любит слушать музыку везде и всегда, подключился к смартфону и наслаждаешься столько, сколько батарея позволит.', 35, '103730_1488468080_4.jpg'),
(71, 28, 'Gametel', 'джойстик для игроманов. Не все же сидеть за компьютером или рубится в плейстейшн, а что делать в дороге или когда Вы в гостях? Конечно же не отрываться от любимого дела и играть столько, сколько захочется, ну или, на сколько хватит аккумулятора.', 10, '103730_1488468080_7.png'),
(72, 28, 'Wi-Fi репитер для дома', 'Часто можно столкнуться с проблемой, когда дома плохо работает Wi-Fi. Особенно, если он на частоте 2,4 ГГц и у соседей более мощные сети. Помехи настолько снижают скорость, что за несколько метров от роутера она падает в разы. Можно купить новый роутер с поддержкой 5 ГГц или поставить репитер.\r\nОн может работать на скорости до 300 Мб/сек, настраивается через приложение и выглядит довольно неплохо. И да, это Xiaomi — в качестве сомневаться не приходится.', 60, 'repiter.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `password`, `address`, `city`, `country`, `role`) VALUES
(1, 'amirutkirov99@gmail.com', 'Амир', 'Уткиров', 'e7d7d6711669e16c23feff27404e9d85', 'amirutkirov99@gmail.com', 'Urgench', 'India', 'admin'),
(20, 'dfg@gmail.com', 'иван', ' имсчсми', '6781f910ba2c58145cb5255d63083303', 'сельская 5', 'кострома', 'Russia', 'client');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `details_command`
--
ALTER TABLE `details_command`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT для таблицы `details_command`
--
ALTER TABLE `details_command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
