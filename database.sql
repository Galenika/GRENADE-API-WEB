-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 14 2018 г., 22:48
-- Версия сервера: 5.5.47-MariaDB-log
-- Версия PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `grenade`
--

-- --------------------------------------------------------

--
-- Структура таблицы `approved`
--

CREATE TABLE IF NOT EXISTS `approved` (
  `id` int(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `map` varchar(32) NOT NULL,
  `grenade` varchar(64) NOT NULL,
  `viewangles` varchar(64) NOT NULL,
  `position` varchar(64) NOT NULL,
  `screenshot1` varchar(256) NOT NULL,
  `screenshot2` varchar(256) NOT NULL,
  `added_by` int(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `approved`
--

INSERT INTO `approved` (`id`, `title`, `description`, `map`, `grenade`, `viewangles`, `position`, `screenshot1`, `screenshot2`, `added_by`) VALUES
(48, '-', '-', 'de_overpass', '["smokegrenade"]', '{"x":"0","y":"0"}', '{"x":"0","y":"0","z":"0"}', '-', '-', 2),
(49, 'Momental flash on Long', 'LMB + RMB', 'de_overpass', '["flashbang"]', '{"x":"-44.02","y":"175.63"}', '{"x":"-2904.23","y":"-1904.55","z":"536.50"}', '-', '-', 4),
(50, 'Smoke on help', 'Stand and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-28.72","y":"38.98"}', '{"x":"-3355.56","y":"-229.59","z":"585.92"}', '-', '-', 4),
(51, 'Smoke on A stairs', 'Stand and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-61.62","y":"100.34"}', '{"x":"-2287.27","y":"-931.43","z":"450.84"}', '-', '-', 4),
(52, 'Smoke on CT long', 'Jump and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-11.73","y":"90.11"}', '{"x":"-3151.81","y":"-1478.44","z":"585.09"}', '-', '-', 4),
(53, 'Smoke on bank', 'Stand and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-18.60","y":"61.25"}', '{"x":"-3283.90","y":"-358.97","z":"600.09"}', '-', '-', 4),
(54, 'Smoke on bridge', 'Stand and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-43.97","y":"22.32"}', '{"x":"-1558.81","y":"-365.30","z":"95.89"}', '-', '-', 4),
(55, 'Momental flash on short', 'Run and throw', 'de_overpass', '["flashbang"]', '{"x":"31.57","y":"43.92"}', '{"x":"-1332.43","y":"-738.92","z":"76.28"}', '-', '-', 4),
(56, 'Smoke on car', 'Stand and throw', 'de_overpass', '["smokegrenade"]', '{"x":"-37.58","y":"79.09"}', '{"x":"-2351.84","y":"-790.03","z":"452.79"}', '-', '-', 4),
(57, 'Molotov on toxic ', 'Stand and throw', 'de_overpass', '["incgrenade"]', '{"x":"-9.18","y":"49.64"}', '{"x":"-1751.97","y":"-671.97","z":"192.34"}', '-', '-', 4),
(60, 'Flash on appartments', 'run no jump', 'de_mirage', '["flashbang"]', '{"x":"-6.72","y":"153.69"}', '{"x":"-1851.44","y":"488.00","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(61, 'Flash on appartments short', 'no jump', 'de_mirage', '["flashbang"]', '{"x":"-20.09","y":"54.66"}', '{"x":"-2411.97","y":"-247.97","z":"-100.68"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(62, 'Flash on site A wood pit tetris', 'no jump', 'de_mirage', '["flashbang"]', '{"x":"-43.58","y":"175.11"}', '{"x":"-704.21","y":"-2125.78","z":"-115.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(63, 'Flash on pit ', 'run no jump', 'de_mirage', '["flashbang"]', '{"x":"-2.91","y":"-159.58"}', '{"x":"151.30","y":"-1912.03","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(64, 'Flash on jungle connector tetris', 'jump', 'de_mirage', '["flashbang"]', '{"x":"-42.46","y":"-19.02"}', '{"x":"-261.36","y":"-1545.94","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(65, '2 OneWay smoke on appartments B ', 'Use RMB to throw.', 'de_mirage', '["smokegrenade"]', '{"x":"68.39","y":"68.14"}', '{"x":"-1183.97","y":"599.97","z":"28.09"}', '-', '-', 4),
(66, 'Smoke on pit', 'no jump ', 'de_mirage', '["smokegrenade"]', '{"x":"-67.25","y":"-9.17"}', '{"x":"-790.77","y":"-1306.03","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(67, 'Smoke on connector', 'no jump ', 'de_mirage', '["smokegrenade"]', '{"x":"-47.01","y":"-136.49"}', '{"x":"398.97","y":"176.13","z":"-185.29"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(68, 'Smoke on short', 'Run and throw', 'de_mirage', '["smokegrenade"]', '{"x":"-39.49","y":"159.79"}', '{"x":"1399.97","y":"-1160.71","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(69, 'Smoke on jungle-tetris', 'Throw', 'de_mirage', '["smokegrenade"]', '{"x":"-28.07","y":"-173.31"}', '{"x":"815.97","y":"-1415.01","z":"-44.91"}', '-', '-', 4),
(70, 'Smoke on A site', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-44.13","y":"-145.38"}', '{"x":"1084.25","y":"-1019.80","z":"-194.54"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(71, '_', '_', 'de_mirage', '["smokegrenade"]', '{"x":"-49.05","y":"-175.49"}', '{"x":"1423.99","y":"-367.97","z":"-103.91"}', '-', '-', 4),
(72, 'Smoke on connector', 'jump', 'de_mirage', '["smokegrenade"]', '{"x":"-28.16","y":"-140.95"}', '{"x":"1135.97","y":"648.00","z":"-197.32"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(73, 'Smoke on A site (help short)', 'jump', 'de_mirage', '["smokegrenade"]', '{"x":"-24.17","y":"-86.52"}', '{"x":"-738.87","y":"623.97","z":"-11.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(74, 'Smoke on kitchen(window)  B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-63.81","y":"-148.08"}', '{"x":"-834.98","y":"615.07","z":"-15.05"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(75, 'Smoke on site B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-44.97","y":"-171.92"}', '{"x":"-607.08","y":"615.97","z":"-14.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(76, 'Smoke on forest B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-41.63","y":"179.84"}', '{"x":"-539.40","y":"520.02","z":"-17.25"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(77, 'Smoke on short B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-60.90","y":"96.81"}', '{"x":"-1467.76","y":"-1174.97","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(78, 'OneWay smoke on appartments B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-0.74","y":"154.62"}', '{"x":"-1257.90","y":"664.03","z":"-15.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(79, 'OneWay smoke on A site', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-12.85","y":"132.79"}', '{"x":"457.97","y":"-1712.00","z":"-176.89"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(80, 'OneWay smoke in window', 'Throw', 'de_mirage', '["smokegrenade"]', '{"x":"63.65","y":"32.49"}', '{"x":"-1194.92","y":"-759.97","z":"-103.91"}', '-', '-', 4),
(82, 'Smoke on kitchen B ', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-58.99","y":"124.92"}', '{"x":"-1434.03","y":"-1174.97","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(83, 'Smoke on site B ', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-59.54","y":"116.75"}', '{"x":"-1434.03","y":"-1174.97","z":"-103.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(84, 'Smoke on appartments B', 'no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-24.73","y":"43.93"}', '{"x":"-2415.99","y":"-115.75","z":"-93.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(85, 'Smoke on jungle', 'jump', 'de_mirage', '["smokegrenade"]', '{"x":"-17.58","y":"-174.21"}', '{"x":"779.69","y":"-1203.27","z":"-44.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(86, 'Smoke on tetris', 'Throw', 'de_mirage', '["smokegrenade"]', '{"x":"-40.82","y":"-164.83"}', '{"x":"1147.60","y":"-1183.97","z":"-141.51"}', '-', '-', 4),
(87, 'Smoke on ct spawn', 'jump', 'de_mirage', '["smokegrenade"]', '{"x":"-13.99","y":"-142.11"}', '{"x":"872.20","y":"-1036.03","z":"-187.91"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 4),
(88, 'Smoke on catwalk and short', 'Stand and throw/Jump and throw', 'de_mirage', '["smokegrenade"]', '{"x":"-30","y":"175.93"}', '{"x":"1423.99","y":"-367.99","z":"-103.91"}', '-', '-', 4),
(89, 'Smoke on connector', 'jump', 'de_mirage', '["smokegrenade"]', '{"x":"-30.21","y":"-138.48"}', '{"x":"1054.39","y":"668.37","z":"-190.57"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 2),
(90, 'Smoke on short', ' no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-46.55","y":"-174.35"}', '{"x":"399.97","y":"-17.52","z":"-135.63"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 2),
(91, 'Smoke on short', 'run no jump', 'de_mirage', '["smokegrenade"]', '{"x":"-44.47","y":"-78.35"}', '{"x":"-1039.98","y":"-347.28","z":"-298.26"}', 'Ñ…ÑƒÐ¹', 'Ñ…ÑƒÐ¹', 2),
(161, 'Smoke to A side', 'Throw', 'de_overpass', '["smokegrenade"]', '{"x":"-38.00","y":"41.08"}', '{"x":"-3681.25","y":"-526.54","z":"558.73"}', 'http://SSMaker.ru/65d33915/', 'http://SSMaker.ru/38402a3a/', 5),
(162, 'Smoke to short', 'Throw', 'de_overpass', '["smokegrenade"]', '{"x":"-58.84","y":"94.00"}', '{"x":"-2029.89","y":"-2391.63","z":"512.09"}', 'http://SSMaker.ru/f6dfb684/', 'http://SSMaker.ru/e183c33c/', 5),
(163, '-', '-', 'de_cbble', '["smokegrenade"]', '{"x":"0","y":"0"}', '{"x":"0","y":"0","z":"0"}', '-', '-', 5),
(164, 'Smoke to B Short', 'Throw', 'de_overpass', '["smokegrenade"]', '{"x":"-16.98","y":"41.69"}', '{"x":"-1823.97","y":"-1218.58","z":"160.09"}', 'http://SSMaker.ru/9effc91d/', 'http://SSMaker.ru/ac80349b/', 5),
(165, '-', '-', 'de_inferno', '["smokegrenade"]', '{"x":"-42.47","y":"1.09"}', '{"x":"-656.03","y":"457.27","z":"32.75"}', '-', '-', 5),
(166, 'Smoke Spools B Plant', 'Stand & Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-44.68","y":"76.83"}', '{"x":"110.84","y":"1569.61","z":"196.08"}', 'https://image.prntscr.com/image/6fay3_NNT9CsUTHcvxmQEw.png', 'https://image.prntscr.com/image/E6G1FVZJRiO6lVukWEZ1zQ.png', 5),
(167, 'Smoke CT on B Plant', 'Stand & Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-48.07","y":"65.35"}', '{"x":"416.48","y":"1768.70","z":"192.65"}', 'https://image.prntscr.com/image/RrSSSubJTg_-ozambu_kHg.png', 'https://image.prntscr.com/image/p4m_dvMGQT6EQQd38jv_Fw.png', 5),
(168, 'Fnatic Smoke B Plant', 'Stand & Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-36.52","y":"66.62"}', '{"x":"-79.45","y":"1330.01","z":"170.77"}', 'https://image.prntscr.com/image/ZdULxxa9SY6osJDcVwsh2g.png', 'https://image.prntscr.com/image/JZbNNn8SQdGgEQv2LEaopQ.png', 5),
(170, 'Smoke Long', 'Stand & Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-29.87","y":"10.53"}', '{"x":"209.97","y":"436.03","z":"134.29"}', 'https://image.prntscr.com/image/eiNhOFezQyukOYdbJW3XdA.png', 'https://image.prntscr.com/image/e0NGhD4pSNG34g4hSDZmSg.png', 5),
(172, 'Smoke Back Pit', 'Stand & Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-54.28","y":"-12.73"}', '{"x":"726.01","y":"276.27","z":"160.09"}', 'https://image.prntscr.com/image/0o1RaPdaQW_JpvCcLQ96WA.png', 'https://image.prntscr.com/image/EGCRc2pCRQ2Gi_MEUWzYlg.png', 5),
(188, 'Start Long', 'LMB', 'de_dust2', '["incgrenade"]', '{"x":"-46.023","y":"47.605"}', '{"x":"222.664","y":"-87.978","z":"9.031"}', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 1),
(189, 'Midl', 'LMB', 'de_dust2', '["smokegrenade"]', '{"x":"-41.563","y":"120.59"}', '{"x":"450.452","y":"114.679","z":"-3.691"}', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 1),
(190, 'Short', 'LMB', 'de_dust2', '["smokegrenade"]', '{"x":"-47.210","y":"109.669"}', '{"x":"338.316","y":"174.81","z":"-2.130"}', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 'Ð Ð°Ð·Ñ€ÐµÑˆÐ¸Ð»Ð¸ Ð±ÐµÐ· ÑÐºÑ€Ð¸Ð½Ð¾Ð²', 1),
(191, 'Smoke on mid', 'Stand and throw', 'de_cache', '["smokegrenade"]', '{"x":"-12.12","y":"174.40"}', '{"x":"1761.01","y":"202.47","z":"-94.91"}', 'http://moveax.eu/52525252', 'http://moveax.eu/2525252525', 1),
(192, 'Smoke on mid', 'Stand and throw', 'de_cache', '["smokegrenade"]', '{"x":"-12.51","y":"173.48"}', '{"x":"1760.32","y":"322.29","z":"-94.91"}', 'http:/unknownsite.com/vfvfvvf', 'http://moveax.eu/252555252', 1),
(193, 'Smoke on quad', 'Jump and throw', 'de_cache', '["smokegrenade"]', '{"x":"-29.31","y":"140.24"}', '{"x":"1760.09","y":"509.62","z":"-94.91"}', 'http://moveax.eu/5252522', 'http://moveax.eu/252552524525', 1),
(194, 'Smoke on balcony', 'Stand and throw', 'de_cache', '["smokegrenade"]', '{"x":"-58.03","y":"178.81"}', '{"x":"1319.97","y":"1337.20","z":"-6.91"}', 'http://moveax.eu/5252855252', 'http://moveax.eu/252525442525', 1),
(195, 'Smoke on A site', 'Stand and throw', 'de_cache', '["smokegrenade"]', '{"x":"-50.15","y":"176.06"}', '{"x":"1319.97","y":"1612.99","z":"71.31"}', 'http://moveax.eu/5252855gb252', 'http://moveax.eu/2525b25442525', 1),
(196, 'Smoke on connector', 'CROUCH SMOKE', 'de_mirage', '["smokegrenade"]', '{"x":"-44.845","y":"-114.943"}', '{"x":"-463.994","y":"644.202","z":"-34.907"}', 'https://i.imgur.com/lXpkng6.jpg', 'https://i.imgur.com/lXpkng6.jpg', 1),
(197, 'Cave One Way', 'OneWay', 'de_mirage', '["smokegrenade"]', '{"x":"-11.48","y":"33.07"}', '{"x":"-879.98","y":"-2264.00","z":"-107.03"}', 'https://prnt.sc/j5jtc9', 'http://prntscr.com/j5jtv5', 1),
(198, 'Big list of smokes', 'https://github.com/svv1fity/grenades\r\nhttps://github.com/sapphyrus/CSGO-Grenades\r\nThey all are actual and dope.', 'de_dust2', '["decoy"]', '{"x":"90","y":"180"}', '{"x":"123","y":"123","z":"123"}', 'https://github.com/svv1fity/grenades', 'https://github.com/sapphyrus/CSGO-Grenades', 1),
(199, 'Big list of smokes', 'https://github.com/svv1fity/grenades\r\nhttps://github.com/sapphyrus/CSGO-Grenades\r\nThey all are actual and dope.', 'de_dust2', '["decoy"]', '{"x":"90","y":"180"}', '{"x":"123","y":"123","z":"123"}', 'https://github.com/svv1fity/grenades', 'https://github.com/sapphyrus/CSGO-Grenades', 1),
(200, 'Big list of smokes', 'https://github.com/svv1fity/grenades\r\nhttps://github.com/sapphyrus/CSGO-Grenades\r\nThey all are actual and dope.', 'de_dust2', '["decoy"]', '{"x":"90","y":"180"}', '{"x":"123","y":"123","z":"123"}', 'https://github.com/svv1fity/grenades', 'https://github.com/sapphyrus/CSGO-Grenades', 1),
(201, 'Smoke Long Corner', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-47.82","y":"48.92"}', '{"x":"222.66","y":"-87.98","z":"73.09"}', 'https://i.imgur.com/WMyCDhn.jpg', 'https://i.imgur.com/7EXTv3K.jpg', 1),
(202, 'Smoke Tunnel', 'Step forward & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-35.99","y":"-151.23"}', '{"x":"-618.03","y":"2549.99","z":"-17.54"}', 'https://i.imgur.com/nwC9Ko5.jpg', 'https://i.imgur.com/drhN615.jpg', 1),
(203, 'Smoke Car', 'Jump & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-48.93","y":"37.41"}', '{"x":"916.03","y":"1123.97","z":"65.48"}', 'https://i.imgur.com/ZOMgMmi.jpg', 'https://i.imgur.com/qPHhMeF.jpg', 1),
(204, 'Smoke CT', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-62.93","y":"34.01"}', '{"x":"273.00","y":"1536.50","z":"66.77"}', 'https://i.imgur.com/ZLqWmh8.jpg', 'https://i.imgur.com/bOltho4.jpg', 1),
(205, 'Smoke Site', 'Step forward & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-18.04","y":"67.18"}', '{"x":"350.12","y":"1678.63","z":"107.56"}', 'https://i.imgur.com/sQMweLr.jpg', 'https://i.imgur.com/wXBaab7.jpg', 1),
(206, 'Smoke Short 1 way', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-36.07","y":"131.69"}', '{"x":"427.03","y":"1650.78","z":"67.29"}', 'https://i.imgur.com/DGWHcIn.jpg', 'https://i.imgur.com/GclDayt.jpg', 1),
(207, 'Smoke Site', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-7.91","y":"118.35"}', '{"x":"-1747.41","y":"1064.03","z":"98.03"}', 'https://i.imgur.com/8ggw3oZ.jpg', 'https://i.imgur.com/h98Q5Be.jpg', 1),
(208, 'Smoke Site', 'Run until your crosshair reaches the sky & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-58.09","y":"99.30"}', '{"x":"1571.97","y":"201.09","z":"-114.87"}', 'https://i.imgur.com/YjqJzuN.jpg', 'https://i.imgur.com/mtK4kji.jpg', 1),
(209, 'Smoke CT', 'Run until you reach the roof with your crosshair & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-21.99","y":"43.82"}', '{"x":"850.03","y":"790.00","z":"68.37"}', 'https://i.imgur.com/ZfnjzIc.jpg', 'https://i.imgur.com/SR7FBm3.jpg', 1),
(210, 'Smoke CT', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-52.76","y":"89.07"}', '{"x":"516.02","y":"984.77","z":"65.56"}', 'https://i.imgur.com/J8zPoRe.jpg', 'https://i.imgur.com/F29XlnH.jpg', 1),
(211, 'Smoke Short', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-64.64","y":"93.55"}', '{"x":"516.03","y":"808.05","z":"67.31"}', 'https://i.imgur.com/ULOrQlq.jpg', 'https://i.imgur.com/7uc9L2S.jpg', 1),
(212, 'Smoke Tunnel', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-26.75","y":"-143.89"}', '{"x":"-986.14","y":"2553.23","z":"65.60"}', 'https://i.imgur.com/vReR4uM.jpg', 'https://i.imgur.com/adzrTT8.jpg', 1),
(213, 'Smoke CT', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-35.99","y":"131.48"}', '{"x":"-275.03","y":"1345.44","z":"-58.12"}', 'https://i.imgur.com/3pC0zPc.jpg', 'https://i.imgur.com/nZc754M.jpg', 1),
(214, 'Smoke Long Corner', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-34.36","y":"69.17"}', '{"x":"683.97","y":"-407.97","z":"73.14"}', 'https://i.imgur.com/OETtBDz.jpg', 'https://i.imgur.com/N0fXKnJ.jpg', 1),
(215, 'Smoke Pit', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-56.01","y":"43.38"}', '{"x":"116.03","y":"-276.01","z":"70.43"}', 'https://i.imgur.com/pd8hm2O.jpg', 'https://i.imgur.com/DHmatoB.jpg', 1),
(216, 'Smoke CT', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-77.10","y":"51.71"}', '{"x":"427.25","y":"1749.97","z":"68.97"}', 'https://i.imgur.com/ctzKkWa.jpg', 'https://i.imgur.com/x6tt4DF.jpg', 1),
(217, 'Smoke Long', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-37.21","y":"-128.19"}', '{"x":"1644.92","y":"1977.37","z":"65.09"}', 'https://i.imgur.com/IOes4Il.jpg', 'https://i.imgur.com/WhZFNUG.jpg', 1),
(218, 'Smoke Car', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-51.33","y":"36.56"}', '{"x":"516.03","y":"1019.97","z":"66.25"}', 'https://i.imgur.com/xX7RYBJ.jpg', 'https://i.imgur.com/V0VE2kb.jpg', 1),
(219, 'Smoke T-Spawn', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-51.25","y":"-113.72"}', '{"x":"916.03","y":"1123.97","z":"65.48"}', 'https://i.imgur.com/K5xbHMz.jpg', 'https://i.imgur.com/SpTyVWp.jpg', 1),
(220, 'Smoke Mid', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-36.97","y":"53.61"}', '{"x":"-539.35","y":"1382.03","z":"-47.97"}', 'https://i.imgur.com/nettZ7j.jpg', 'https://i.imgur.com/yhJBUa2.jpg', 1),
(221, 'Smoke Site', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-20.08","y":"164.72"}', '{"x":"-760.02","y":"2066.03","z":"-45.20"}', 'https://i.imgur.com/pG3ErBg.jpg', 'https://i.imgur.com/byonWYL.jpg', 1),
(222, 'Smoke Short', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-49.11","y":"-179.78"}', '{"x":"1594.00","y":"1428.03","z":"66.84"}', 'https://i.imgur.com/7ojkjDR.jpg', 'https://i.imgur.com/SozxbPL.jpg', 1),
(223, 'Smoke Short', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-56.68","y":"-126.83"}', '{"x":"617.03","y":"2379.97","z":"41.09"}', 'https://i.imgur.com/5SiAP33.jpg', 'https://i.imgur.com/IixcdBA.jpg', 1),
(224, 'Smoke Xbox', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-5.00","y":"3.33"}', '{"x":"-874.03","y":"1393.65","z":"-47.91"}', 'https://i.imgur.com/DnxOZLB.jpg', 'https://i.imgur.com/ERoLzRg.jpg', 1),
(225, 'Smoke Middle', 'Stand & Throw', 'de_dust2', '["smokegrenade"]', '{"x":"-32.92","y":"-123.33"}', '{"x":"-242.03","y":"2278.89","z":"-55.93"}', 'https://i.imgur.com/ogUFChh.jpg', 'https://i.imgur.com/us81Z0i.jpg', 1),
(226, 'Smoke Window', 'Stepforward & Throw', 'de_mirage', '["smokegrenade"]', '{"x":"-16.58","y":"179.92"}', '{"x":"502.97","y":"-622.20","z":"-113.96"}', 'https://i.imgur.com/O8ixrUe.jpg', 'https://i.imgur.com/FnEHxxb.jpg', 1),
(227, 'Smoke on Site', 'Stand & Jumpthrow', 'de_mirage', '["smokegrenade"]', '{"x":"-30.78","y":"-138.33"}', '{"x":"683.72","y":"-1130.03","z":"-63.91"}', 'https://i.imgur.com/q7G2QMi.jpg', 'https://i.imgur.com/z3Jqasg.jpg', 1),
(228, 'Pipes to Truck', 'unused', 'de_cache', '["smokegrenade"]', '{"x":"-42.396","y":"-169.734"}', '{"x":"1319.97","y":"1613","z":"1843.31"}', 'unknown', 'unknown', 1),
(229, 'Mid to B from Lower tunnels', 'Stand', 'de_dust2', '["smokegrenade"]', '{"x":"-32.38","y":"57.31"}', '{"x":"-525.26","y":"1382.03","z":"-46.91"}', 'http://prntscr.com/irrcif', 'http://prntscr.com/irrcpx', 1),
(230, 'dfd', 'dfdf', 'de_dust2', '["smokegrenade"]', '{"x":"-0.001","y":"-0.001"}', '{"x":"-0.036","y":"-0.019","z":"-0.028"}', 'efdf', 'dsfdf', 1),
(231, 'Random Smoke', 'Testing if it works o:', 'de_dust2', '["smokegrenade"]', '{"x":"-5.78","y":"-99.15"}', '{"x":"-112.97","y":"1581.97","z":"66.27"}', 'https://prnt.sc/iitogf', 'https://prnt.sc/iitogf', 1),
(232, 'Sandbags Escape', 'Throw', 'de_inferno', '["smokegrenade"]', '{"x":"-22.54","y":"109.77"}', '{"x":"703.03","y":"1871.77","z":"177.99"}', 'https://i.imgur.com/WsveyUC.jpg', 'https://i.imgur.com/aQ62pRA.jpg', 1),
(233, 'qda', '424124', 'de_dust2', '["hegrenade"]', '{"x":"41","y":"41"}', '{"x":"41","y":"414","z":"4141"}', '441', '4141', 1),
(234, 'Quad Smoke', 'Stand Smoke', 'de_cache', '["smokegrenade"]', '{"x":"-48.93","y":"146.71"}', '{"x":"1319.03","y":"1294.86","z":"1765.09"}', 'https://ss.blick1337.pro/9on7j.png', 'https://ss.blick1337.pro/9on7j.png', 1),
(235, 'Quad Smoke', 'Stand Smoke', 'de_cache', '["smokegrenade"]', '{"x":"89","y":"-4.19"}', '{"x":"1319.36","y":"1294.96","z":"1765.09"}', 'https://ss.blick1337.pro/9on7j.png', 'https://ss.blick1337.pro/9on7j.png', 1),
(236, 'asd', 'aasd', 'de_dust2', '["flashbang"]', '{"x":"2","y":"4"}', '{"x":"23","y":"5435","z":"3434"}', 'imgur.com/1324234234', 'imgur.com/1324234234', 1),
(237, 'Smoke pit', 'ÐšÐ¸Ð½ÑƒÑ‚ÑŒ Ð² Ð¿Ñ€Ñ‹Ð¶ÐºÐµ', 'de_inferno', '["incgrenade"]', '{"x":"-19.03","y":"0.58"}', '{"x":"-26.00","y":"-36.03","z":"99.96"}', 'http://prntscr.com/icjn60', 'http://prntscr.com/icjo44', 1),
(238, 'Fake molotov new box', 'ÐšÐ¸Ð½ÑƒÑ‚ÑŒ Ð² Ð¿Ñ€Ñ‹Ð¶ÐºÐµ', 'de_inferno', '["incgrenade"]', '{"x":"-32.05","y":"120.75"}', '{"x":"473.94","y":"2034.52","z":"267.09"}', 'http://prntscr.com/icjczq', 'http://prntscr.com/icjdhe', 1),
(239, 'Smoke CT', 'ÐšÐ¸Ð½ÑƒÑ‚ÑŒ Ð² Ð¿Ñ€Ñ‹Ð¶ÐºÐµ', 'de_inferno', '["smokegrenade"]', '{"x":"-23.77","y":"67.51"}', '{"x":"460.46","y":"1828.48","z":"200.18"}', 'http://prntscr.com/icirdr', 'http://prntscr.com/icirym', 1),
(240, 'Smoke banana', 'ÐšÐ¸Ð½ÑƒÑ‚ÑŒ Ð² Ð¿Ñ€Ñ‹Ð¶ÐºÐµ', 'de_inferno', '["smokegrenade"]', '{"x":"-28.95","y":"51.88"}', '{"x":"-862.97","y":"372.21","z":"48.38"}', 'http://prntscr.com/icimos', 'http://prntscr.com/icinki', 1),
(241, 'MID', 'ÐšÐ¸Ð½ÑƒÑ‚ÑŒ Ð² Ð¿Ñ€Ñ‹Ð¶ÐºÐµ', 'de_inferno', '["smokegrenade"]', '{"x":"-8.72","y":"-1.52"}', '{"x":"-858.00","y":"585.64","z":"36.36"}', 'http://prntscr.com/icif5o', 'http://prntscr.com/iciffo', 1),
(242, 'Molotov to forest', 'Run and throw', 'de_mirage', '["incgrenade"]', '{"x":"-9.0","y":"-161.21"}', '{"x":"-1265.33","y":"782.83","z":"-15.91"}', 'http://prntscr.com/ichux8', 'http://prntscr.com/ichv66', 1),
(243, 'ÐÐ¸Ð½Ð·Ñ  Ð¿Ð»ÐµÐ½Ñ‚-ÑÐ¼Ð¾Ðº ', 'Ð—Ð°Ð¶Ð°Ñ‚ÑŒ W Ð¸ ÑÑ€Ð°Ð·Ñƒ Ð¶Ðµ Ð¾Ñ‚ÑÐºÐ¸Ð½ÑƒÑ‚ÑŒ Ð´Ñ‹Ð¼', 'de_mirage', '["smokegrenade"]', '{"x":"-40.17","y":"-150.37"}', '{"x":"1238.00","y":"-1025.96","z":"-194.87"}', 'http://prntscr.com/ich8zy', 'http://prntscr.com/ich9fw', 1),
(244, 'ÐœÐ¾Ð»Ð¾Ñ‚Ð¾Ð² Ð½Ð° ÐºÐ¾Ð½ÐµÐºÑ‚', 'ÐÐ°Ð²ÐµÑÑ‚Ð¸ Ð¿Ñ€Ð¸Ñ†ÐµÐ» Ð½Ð° ÐºÑ€Ð°Ð¹Ð½ÑŽÑŽ Ð±Ð°Ð»ÐºÑƒ Ð¸ Ð¾Ñ‚Ð¿ÑƒÑÑ‚Ð¸Ñ‚ÑŒ', 'de_mirage', '["incgrenade"]', '{"x":"-22.75","y":"179.86"}', '{"x":"461.86","y":"-1520.00","z":"-178.83"}', 'http://prntscr.com/ich59m', 'http://prntscr.com/ich5ls', 1),
(245, 'Just throw', 'Quad Smoke A Site', 'de_cache', '["smokegrenade"]', '{"x":"-47.92","y":"146.88"}', '{"x":"1317.43","y":"1293.8","z":"1765.09"}', 'https://imgur.com/a/5Dc64', 'https://imgur.com/a/34jKZ', 1),
(246, 'One way smoke window', 'Throw', 'de_mirage', '["smokegrenade"]', '{"x":"53.20","y":"-81.31"}', '{"x":"-1120.03","y":"-456.03","z":"-103.91"}', 'https://i.snag.gy/BKAZRC.jpg', 'https://i.snag.gy/yhiA3W.jpg', 1),
(247, 'Boiler/Truck side', 'LMB Only', 'de_dust2', '["smokegrenade"]', '{"x":"-30.58","y":"53.51"}', '{"x":"736.03","y":"125.20","z":"164.25"}', 'http://prntscr.com/iaplrm', 'http://prntscr.com/iapm78', 1),
(248, 'Site Smoke', 'No Jump', 'de_inferno', '["smokegrenade"]', '{"x":"-56.67","y":"139.05"}', '{"x":"2463.97","y":"-117.61","z":"157.63"}', 'https://prnt.sc/ia1joe', 'https://prnt.sc/ia1jsk', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `moderating`
--

CREATE TABLE IF NOT EXISTS `moderating` (
  `id` int(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `map` varchar(32) NOT NULL,
  `grenade` varchar(64) NOT NULL,
  `viewangles` varchar(64) NOT NULL,
  `position` varchar(64) NOT NULL,
  `screenshot1` varchar(256) NOT NULL,
  `screenshot2` varchar(256) NOT NULL,
  `ip` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(32) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '954caabc04df43b9ef97481c2c992698');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `approved`
--
ALTER TABLE `approved`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `moderating`
--
ALTER TABLE `moderating`
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
-- AUTO_INCREMENT для таблицы `approved`
--
ALTER TABLE `approved`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=249;
--
-- AUTO_INCREMENT для таблицы `moderating`
--
ALTER TABLE `moderating`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
