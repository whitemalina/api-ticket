-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 13 2022 г., 23:58
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fun', NULL, NULL),
(2, 'sports', NULL, NULL),
(3, 'movie', NULL, NULL),
(4, 'theater', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `costs`
--

CREATE TABLE `costs` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `t_type` tinyint(1) NOT NULL,
  `normal` int(11) NOT NULL,
  `silver` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `platinum` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `costs`
--

INSERT INTO `costs` (`id`, `event_id`, `t_type`, `normal`, `silver`, `gold`, `platinum`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 10, 19, 49, '2021-05-29 09:56:24', '2021-05-29 09:56:24'),
(8, 15, 0, 5, 0, 0, 0, '2021-05-30 12:05:05', '2021-05-30 12:05:05'),
(9, 16, 1, 0, 10, 20, 50, '2021-05-30 12:06:21', '2021-05-30 12:06:21'),
(10, 17, 0, 100, 0, 0, 0, '2021-05-30 12:07:53', '2021-05-30 12:07:53'),
(11, 18, 0, 99, 0, 0, 0, '2021-05-30 12:09:00', '2021-05-30 12:09:00'),
(12, 19, 0, 150, 0, 0, 0, '2021-05-30 12:10:34', '2021-05-30 12:10:34'),
(13, 20, 0, 98, 0, 0, 0, '2021-05-30 12:12:23', '2021-05-30 12:12:23'),
(14, 21, 0, 98, 0, 0, 0, '2021-05-30 12:13:54', '2021-05-30 12:13:54'),
(15, 22, 0, 100, 0, 0, 0, '2021-05-30 12:15:13', '2021-05-30 12:15:13'),
(16, 23, 0, 30, 0, 0, 0, '2021-05-30 12:16:23', '2021-05-30 12:16:23'),
(17, 24, 0, 0, 0, 0, 0, '2021-05-30 12:17:27', '2021-05-30 12:17:27'),
(22, 29, 0, 120, 0, 0, 0, '2021-06-02 17:03:21', '2021-06-02 17:03:21'),
(23, 30, 0, 1000, 0, 0, 0, '2022-10-13 16:39:10', '2022-10-13 16:39:10'),
(25, 32, 0, 1000, 0, 0, 0, '2022-10-13 16:41:31', '2022-10-13 16:41:31'),
(26, 33, 0, 1000, 0, 0, 0, '2022-10-13 16:51:45', '2022-10-13 16:51:45');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'Hassan Saeed', 'hassan@mail.com', 12345678, '2021-05-29 10:20:59', '2021-05-29 10:20:59'),
(3, 'John mic', 'john@gmail.com', 12345678, '2021-05-29 10:24:07', '2021-05-29 10:24:07'),
(4, 'Mandy Joo', 'mandy@gmail.com', 22345675, '2021-05-29 10:26:06', '2021-05-29 10:26:06'),
(5, 'Manu1', 'manu1@man.in', 5398345, '2021-05-30 09:08:53', '2021-05-30 09:08:53'),
(6, 'Hassan Saeed2', 'hassan2@gmail.com', 343525245, '2021-05-30 12:19:44', '2021-05-30 12:19:44'),
(7, 'Hassan Saeed3', 'hassan3@gmail.com', 42552, '2021-05-30 12:20:02', '2021-05-30 12:20:02'),
(8, 'Tom22', 'tom22@xyz.com', 23424545, '2021-05-30 12:48:56', '2021-05-30 12:48:56'),
(9, 'Dany23', 'daniel23@xyz.com', 23423495, '2021-05-30 13:05:18', '2021-05-30 13:05:18'),
(10, 'Frontier43', 'frontier44@gmail.com', 32422545, '2021-06-01 02:40:05', '2021-06-01 02:40:05'),
(11, 'Dani55', 'dan55@gmail.com', 349204, '2021-06-01 02:51:43', '2021-06-01 02:51:43'),
(12, 'Samuel24', 'sam44@sam.co', 42432347, '2021-06-01 13:23:06', '2021-06-01 13:23:06'),
(13, 'Tomy Hall', 'hello53@tom.com', 24897340, '2021-06-01 13:24:50', '2021-06-01 13:24:50'),
(14, 'Ron Lee4', 'ron3@ron3.co', 2348943, '2021-06-01 20:45:03', '2021-06-01 20:45:03'),
(15, 'Donald44', 'donald44@gmail.com', 42394234, '2021-06-02 14:36:31', '2021-06-02 14:36:31'),
(16, 'paul', 'paul@gmail.com', 342525425, '2021-06-02 14:40:05', '2021-06-02 14:40:05'),
(17, 'James78', 'james78@jbd.com', 32252524, '2021-06-02 14:54:26', '2021-06-02 14:54:26'),
(18, 'Ferrari23', 'test@ferrari23.com', 2328542, '2021-06-02 14:55:27', '2021-06-02 14:55:27'),
(19, 'Rony67', 'ron67@mail.com', 423864239, '2021-06-02 14:57:51', '2021-06-02 14:57:51'),
(20, 'Hassan4', 'hassan4@gmail.com', 23482634, '2021-06-02 15:01:22', '2021-06-02 15:01:22'),
(21, 'Someone45', 'someone45@asd.com', 3423432, '2021-06-02 15:04:26', '2021-06-02 15:04:26'),
(22, 'Hassan5', 'hello@Hassan5.co', 34282433, '2021-06-02 15:05:11', '2021-06-02 15:05:11'),
(23, 'Hassan6', 'Hassan6@gmail.com', 2348328, '2021-06-02 15:06:54', '2021-06-02 15:06:54'),
(24, 'Tomy doll', 'tomdoll@tomdoll.com', 23423333, '2021-06-02 15:07:53', '2021-06-02 15:07:53'),
(26, 'Sarah Jhon', 'sarah@gmail.com', 3234234, '2021-06-02 15:40:29', '2021-06-02 15:40:29'),
(27, 'Daniel89', 'dan89@gmail.com', 5345334, '2021-06-02 19:29:11', '2021-06-02 19:29:11'),
(28, 'Don56', 'don56@mail.com', 34535445, '2021-06-02 20:47:33', '2021-06-02 20:47:33');

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `organizer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `image_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `name`, `category_id`, `organizer`, `location`, `date`, `description`, `duration`, `image_title`, `created_at`, `updated_at`) VALUES
(1, 'The Tomorrowland', 1, 'TL Inc.', 'Mountain View, CA', '2021-05-15', 'Lorem Ipsum We are delighted and grateful to hear that the Belgian Government has given a realistic perspective for large festivals in Belgium towards the end of the summer. We want to study the guidelines and parameters from the National Government in the next days, so that we can properly communicate the different scenarios and implications. \\nWith a combination of vaccination and rapid testing at the door, we believe we can make Tomorrowland a safe place, which so many people have been looking forward to for so long. We will take every measure and guideline very seriously and apply all the right protocols.', 5, 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-29 09:56:24', '2021-05-29 09:56:24'),
(15, 'The Beach hack', 1, 'hillhacks', 'Miami', '2021-06-04', 'Lorem Ipsum HackbytheBeach is the hackathon organised in Quark, the annual technical festival of BITS Goa. Schedule. For the event schedule, visit https://bits-quark.org/ ...', 2, 'https://images.unsplash.com/photo-1560359614-870d1a7ea91d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-30 12:05:05', '2021-05-30 12:05:05'),
(16, 'SnowBoard Blazing', 2, 'The snow foundation', 'Himalayas', '2021-05-27', 'Lorem Ipsum Snowboarding is a recreational and competitive activity that involves descending a snow-covered slope while standing on a snowboard that is almost always ...', 1, 'https://images.unsplash.com/photo-1612180466811-921a028fe665?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80', '2021-05-30 12:06:21', '2021-05-30 12:06:21'),
(17, 'Dirt Rally', 2, 'DIRT org', 'Amazon', '2021-05-10', 'Lorem Ipsum DiRT Rally is the most authentic and thrilling rally game ever made, road-tested over 80 million miles by the DiRT community. It perfectly captures that white ...', 1, 'https://images.unsplash.com/photo-1548536624-57fc3720f8a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-30 12:07:53', '2021-05-30 12:07:53'),
(18, 'Expo 2021', 1, 'DUBAI', 'Dubai', '2021-08-04', 'Lorem Ipsum Expo 2020 Dubai will host the world for 182 days, each one brimming with new experiences. It\'ll be a time to create, collaborate and innovate. And it\'s going to ...', 182, 'https://images.unsplash.com/flagged/photo-1559717865-a99cac1c95d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80', '2021-05-30 12:09:00', '2021-05-30 12:09:00'),
(19, 'Golf Week', 2, 'The Golf Club', 'Abu Dhabi', '2021-05-20', 'Lorem Ipsum 2020 Dubai will host the world for 182 days, each one brimming with new experiences. It\'ll be a time to create, collaborate and innovate. And it\'s going to ...', 5, 'https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-30 12:10:34', '2021-06-02 20:00:52'),
(20, 'Fifa World Cup', 2, 'World Cup Foundation', 'Qatar', '2022-06-23', 'Lorem Ipsum Keep up with the FIFA World Cup Qatar in Arabic! From the latest news to in-depth team profiles, exclusive interviews, ticketing information and more ...', 90, 'https://images.unsplash.com/photo-1617144519956-bba853571334?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1045&q=80', '2021-05-30 12:12:23', '2021-05-30 12:12:23'),
(21, 'Scuba fest 2020', 2, 'Marine world inc', 'Dubai', '2021-05-12', 'Lorem Ipsum Scuba diving is a mode of underwater diving where the diver uses an apparatus which is completely independent of surface supply to breathe underwater.', 7, 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-30 12:13:54', '2021-05-30 12:13:54'),
(22, 'Hockey Battle 2022', 2, 'WC foundation', 'Atlanta', '2021-05-31', 'Lorem Ipsum Hockey is a sport in which two teams play against each other by trying to manoeuvre a ball or a puck into the opponent\'s goal using a hockey stick.', 3, 'https://images.unsplash.com/photo-1545471977-94cac22e71ed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', '2021-05-30 12:15:13', '2021-05-30 12:15:13'),
(23, 'Olympics 2022', 2, 'Japan', 'Tokyo', '2021-10-19', 'Lorem Ipsum The 2022 Summer Olympics, officially the Games of the XXXII Olympiad, and also known as Tokyo 2020, is an upcoming international multi-sport event scheduled to be held from 23 July to 8 August 2021 in Tokyo, Japan.', 0, 'https://images.unsplash.com/photo-1569517282132-25d22f4573e6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1433&q=80', '2021-05-30 12:16:23', '2021-05-30 12:16:23'),
(24, 'WWDC \'21', 1, 'Apple', 'Online', '2021-06-07', 'Lorem Ipsum Apple Worldwide Developers Conference is an information technology conference held annually by Apple Inc. The conference is normally held in the San Jose Convention Center in California.', 1, 'https://images.unsplash.com/photo-1491933382434-500287f9b54b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80', '2021-05-30 12:17:27', '2021-05-30 12:17:27'),
(29, 'Jet Ski Festival 2020', 2, 'JET', 'Abu Dhabi', '2021-06-18', 'Lorem Ipsum Amazing that 2020 will mark our 20th raffle jet ski and the 13th JetFest. Incredible, as the goal back in the beginning was to create a true pwc destination ...', 5, 'https://images.unsplash.com/photo-1564633351631-e85bd59a91af?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8amV0JTIwc2tpfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', '2021-06-02 17:03:21', '2021-06-02 17:03:21'),
(30, 'Test', 1, '1', '1', '2022-05-10', '1', 1, '1', '2022-10-13 16:39:10', '2022-10-13 16:39:10'),
(32, 'Test', 1, '1', '1', '2022-05-10', '1', 1, '1', '2022-10-13 16:41:31', '2022-10-13 16:41:31'),
(33, 'Test', 1, '1', '1', '2022-05-10', '1', 1, '1', '2022-10-13 16:51:45', '2022-10-13 16:51:45');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_05_29_065121_events', 1),
(6, '2021_05_29_072839_create_categories_table', 1),
(7, '2021_05_29_072840_create_events_table', 1),
(8, '2021_05_29_092155_create_costs_table', 1),
(9, '2021_05_29_093429_create_sales_table', 1),
(10, '2021_05_29_093745_create_customers_table', 1),
(11, '2021_05_29_112325_create_tickets_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'auth_token', '1ec5e99dd4f599027f320243bd22a3e19e3ebd5f6631f4042c4cc65f5c7d971b', '[\"*\"]', NULL, '2022-10-13 16:26:12', '2022-10-13 16:26:12'),
(2, 'App\\Models\\User', 4, 'auth_token', '4ea7b498d14bf4d8506e5f5a77cccca463c5405baf45fb0393f729bbfaba670a', '[\"*\"]', '2022-10-13 16:53:58', '2022-10-13 16:31:00', '2022-10-13 16:53:58'),
(3, 'App\\Models\\User', 5, 'auth_token', '47c2ba0a928362cdc5a99e6daa21a808e836e99651b4ecd73a92740a6add7ac7', '[\"*\"]', '2022-10-13 16:53:16', '2022-10-13 16:38:05', '2022-10-13 16:53:16'),
(4, 'App\\Models\\User', 6, 'auth_token', 'daebca6791dedd49fc0876df749a5c6f0eb7bbec7ef5fbbbf9bc554fcfc8def7', '[\"*\"]', NULL, '2022-10-13 16:57:09', '2022-10-13 16:57:09');

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `n_sold` int(11) NOT NULL,
  `s_sold` int(11) NOT NULL,
  `g_sold` int(11) NOT NULL,
  `p_sold` int(11) NOT NULL,
  `total_sold` int(11) NOT NULL,
  `total_revenue` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `event_id`, `n_sold`, `s_sold`, `g_sold`, `p_sold`, `total_sold`, `total_revenue`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 38, 9, 22, 71, 1578, '2021-05-29 09:56:24', '2022-10-13 16:32:33'),
(15, 15, 20, 0, 0, 0, 20, 100, '2021-05-30 12:05:05', '2021-06-02 15:06:54'),
(16, 16, 0, 0, 8, 0, 8, 160, '2021-05-30 12:06:21', '2021-06-01 13:24:50'),
(17, 17, 6, 0, 0, 0, 6, 600, '2021-05-30 12:07:53', '2021-06-01 20:45:03'),
(18, 18, 7, 0, 0, 0, 7, 693, '2021-05-30 12:09:00', '2021-06-02 14:36:31'),
(19, 19, 11, 0, 0, 0, 11, 1650, '2021-05-30 12:10:34', '2021-06-02 19:29:11'),
(20, 20, 19, 0, 0, 0, 19, 1862, '2021-05-30 12:12:23', '2021-06-02 14:40:05'),
(21, 21, 3, 0, 0, 0, 3, 294, '2021-05-30 12:13:54', '2021-06-02 15:01:22'),
(22, 22, 4, 0, 0, 0, 4, 400, '2021-05-30 12:15:13', '2021-06-02 20:47:33'),
(23, 23, 3, 0, 0, 0, 3, 90, '2021-05-30 12:16:23', '2021-06-02 15:05:11'),
(24, 24, 6, 0, 0, 0, 6, 0, '2021-05-30 12:17:27', '2021-06-02 15:40:29'),
(29, 29, 0, 0, 0, 0, 0, 0, '2021-06-02 17:03:21', '2021-06-02 17:03:21'),
(30, 30, 0, 0, 0, 0, 0, 0, '2022-10-13 16:39:10', '2022-10-13 16:39:10'),
(32, 32, 0, 0, 0, 0, 0, 0, '2022-10-13 16:41:31', '2022-10-13 16:41:31'),
(33, 33, 0, 0, 0, 0, 0, 0, '2022-10-13 16:51:45', '2022-10-13 16:51:45');

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `t_type` int(11) NOT NULL,
  `no_of_tickets` int(11) NOT NULL,
  `costs` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tickets`
--

INSERT INTO `tickets` (`id`, `event_id`, `user_id`, `booking_code`, `t_type`, `no_of_tickets`, `costs`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '11c652e1727503ae', 0, 1, 0, '2022-10-13 16:32:07', '2022-10-13 16:32:07'),
(2, 1, 4, 'a6793d143b6ebb7c', 0, 1, 0, '2022-10-13 16:32:33', '2022-10-13 16:32:33');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `is_admin`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hassan Saeed', 0, 'hassan@mail.com', NULL, '$2y$10$LwF6PqQ4L7ofeeCX.ulo4OBoDvD4L3w.CFQpXaJLb1F3zrOUrHB86', NULL, '2021-05-29 15:36:00', '2021-05-29 15:36:00'),
(2, 'Mr John', 0, 'john@gmail.com', NULL, '$2y$10$LwF6PqQ4L7ofeeCX.ulo4OBoDvD4L3w.CFQpXaJLb1F3zrOUrHB86', NULL, '2021-05-29 15:36:21', '2021-05-29 15:36:21'),
(3, 'smith', 0, 'smith@gmail.com', NULL, '$2y$10$LwF6PqQ4L7ofeeCX.ulo4OBoDvD4L3w.CFQpXaJLb1F3zrOUrHB86', NULL, '2021-05-29 15:36:37', '2021-05-29 15:36:37'),
(4, 'John Doe', 0, 'example@email.ru', NULL, '$2y$10$iyTJ5im8kPwEDFLAH941Lu7.wYLge.AyW33m6DcYN9cCyasYG8m4O', NULL, '2022-10-13 16:26:12', '2022-10-13 16:26:12'),
(5, 'John Doe', 0, 'example1@email.ru', NULL, '$2y$10$oK7CagtsabO.zIVTjqqCLOhavIS.najWt66qxJBSQzYG0/qomWccm', NULL, '2022-10-13 16:38:05', '2022-10-13 16:38:05'),
(6, 'admin', 1, 'admin@email.ru', NULL, '$2y$10$IPSWbFmI8nRBi9Bu.h9vfOqqbNc9IHnw0VbQYX.hfQanrovf5Xz1e', NULL, '2022-10-13 16:57:09', '2022-10-13 16:57:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `costs_event_id_foreign` (`event_id`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_event_id_foreign` (`event_id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_event_id_foreign` (`event_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `costs`
--
ALTER TABLE `costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `costs`
--
ALTER TABLE `costs`
  ADD CONSTRAINT `costs_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ограничения внешнего ключа таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
