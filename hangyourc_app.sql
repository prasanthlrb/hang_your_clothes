-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 31, 2020 at 09:55 AM
-- Server version: 5.7.28
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hangyourc_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `email`, `mobile`, `fcm_token`, `password`, `created_at`, `updated_at`) VALUES
(3, 'Habib Ali', 'habib.ali@hangyourcloths.com', '0503015048', 'd8jYoHQpuE8:APA91bGvf_6oXlWW3IVtzloAKKOF0RqXPDF6tUfmL5zEGJYK12KV3q5u78RAWSesSqlxJDqvB9CpY-z_URIRhfX0dhBOW_l6ATSVC88jEieqrmAzt2dyr52X7WvVEcpTeo_-sGVOzylS', '$2y$10$LYmLAEB1ULx/BdMetKcxgewiRFs5XvuJKdAW4Egi8IOhXwl4jE9ZK', '2020-07-21 11:41:37', '2020-10-11 01:06:18'),
(4, 'Aashar saleem', 'aasharsaleem97@gmail.com', '0503098124', 'cIPkzBvqrBo:APA91bGlFlgAQ5SClv5pxEDi4ScbfyNPLJiUaFIx_VSXFnzO59auXPx_of9D2qsDU644kWTPIqf9zF9gWilLcp0KaYC9wr_UtPB7fkL8mQs3rl6VIbUna5rS3WFGJ_450kwgk33PZ65o', '$2y$10$QJPWSf5tWYg4070iEj/9qOWjvT96KabRdCA/drLn6MB46E2yxf36u', '2020-08-05 10:58:41', '2020-08-06 05:37:16'),
(5, 'ali alqubaisi', 'alialqubaisi91@gmail.com', '0502088902', 'dMHtCE3kCnE:APA91bGeLJl42ZWUpUD7qSmVjiJz5dritqVv1rGRrIDcNTzwQqvT44jjyg9XvIf1gE0-g8aKh1Xrb2R4rJV0Cymm-WX69tzlG7tvERgkADjrD-EfiJaDprQtTaaP1_LPMQ9tLAVPGG7X', '$2y$10$QrfZpg.gsnysxeNQnC7C7.jp1b49GTgS0KX.IEcZZxJjRMVr0qQ8G', '2020-08-06 05:12:10', '2020-08-11 23:58:43'),
(6, 'admin', 'admin@admin.com', '0568169568', NULL, '$2y$10$NTF/0qA0sAJzewcgzeNrneKuzjsf/AzZ2mkerYvz5s1qAcYaXzgWC', '2020-09-03 07:49:21', '2020-09-03 07:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area_name`, `city_name`, `created_at`, `updated_at`) VALUES
(9, 'Abu Dhabi', 'Abu Dhabi', '2020-09-13 13:53:17', '2020-09-13 13:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title_1`, `title_2`, `time`, `image`, `banner`, `content`, `created_at`, `updated_at`) VALUES
(1, 'DRY CLEAN', 'SUPER FAST DRY CLEAN', '24 Hours', '1250013048.png', '1667862415.png', 'We offer wide range of service Send your cloths today and get them back cleaned. We make sure ready to wear  Outfits once you schedule this order.Explore Super Fast Dry Clean:Are you worried about party wear that need\'s to be cleaned immediately.', '2020-04-13 13:15:11', '2020-09-14 02:10:42'),
(2, 'WASH & IRON', 'RAPID WASH & IRON', '24 Hours', '1860025559.png', '180244751.jpg', 'We wash with care Premium Wet Cleaning service In UAE enjoy your cloths with fresh smell and steam ironed. Ready to Wear Outfits.Explore our Rapid Wash & Iron Service Now which is automated and advanced Electrolux  Cleaning service.', '2020-04-24 06:32:18', '2020-09-14 02:10:27'),
(3, 'IRONING', 'EXPRESS IRONING', '24 Hours', '503898512.png', '1667673429.jpg', 'Do you have a stack of clothes that don’t need washing but needs ironing? Send them to us and get back freshly steam ironed ready-to-wear outfits. Explore our Rapid Iron Service Schedule your pick up now.', '2020-04-24 08:58:05', '2020-09-14 02:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 'Abu Dhabi', NULL, NULL),
(2, 'Dubai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_per_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_per_coupon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_order_val` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `description`, `start_date`, `end_date`, `discount_type`, `service_id`, `amount`, `max_value`, `limit_per_user`, `limit_per_coupon`, `user_type`, `user_id`, `min_order_val`, `created_at`, `updated_at`) VALUES
(15, 'HYC', 'خصمم الافتتاح', '2020-08-01', '2020-12-31', '4', NULL, '15', NULL, '4', NULL, '0', '', NULL, '2020-08-05 10:04:45', '2020-10-05 12:01:13'),
(17, 'local', 'خصم علي الحمادي', '2020-08-06', '2020-12-31', '4', NULL, '15', NULL, '1000', NULL, '0', '', NULL, '2020-08-06 10:53:14', '2020-08-17 07:07:13'),
(18, 'NS20', 'خصم متطوعين خط الدفاع الاول', '2020-08-08', '2020-09-30', '4', NULL, '50', NULL, '10', NULL, '0', '', NULL, '2020-08-08 01:29:18', '2020-09-08 15:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `token_id`, `unique_id`, `created_at`, `updated_at`) VALUES
(1, 'Aravind', 'admin@gmail.com', '8883191961', '', NULL, NULL, NULL, '2020-08-17 09:51:47'),
(2, 'aravind', 'admin1723@gmail.com', '9876548210', '$2y$10$HRa2Go7VS1fsKYHnkaG9d.L07DMsXyO5vZtiIqGauaEs1oJWMMac2', NULL, '148691', '2020-04-18 07:53:58', '2020-04-19 08:12:10'),
(3, 'aravind', 'admin123@gmail.com', '9876543210', '$2y$10$F7bDW.iNhE6M4xtrG0zdtOrc7lc3YEuanI/nt44VD0l7WoPFqC/62', NULL, NULL, '2020-04-18 08:44:42', '2020-04-18 08:44:42'),
(4, 'aravind', 'admin123@gmail.com', '9876543210', '$2y$10$oNTVoc8xEbnYrI5LqKbjh.4XklCwwP/yjXG4eKXSrOJ4KyrDTgRRK', NULL, NULL, '2020-04-18 08:45:42', '2020-04-18 08:45:42'),
(5, 'john', 'nijojio.com', '0567987826', '$2y$10$WVhA0ZjSAHPszrrahFV/iuyTP3N1QDwzvGoV69KN8rYhC.fHbQyG2', '818652', NULL, '2020-04-26 18:51:54', '2020-04-26 19:04:06'),
(6, 'mohamed', 'thowsif', '0568169568', '$2y$10$XWvRllvCkErvMpQAexkA2.a9VDHE6WFku/dFkjNzMErQdvQufHE52', '365662', NULL, '2020-04-26 19:24:34', '2020-04-26 19:24:34'),
(7, 'mohamed thowsif', 'thowsifm81@gmail.com', '0568169569', '$2y$10$p7Lw0rODbOPSvlcD8BwCl.NWpbE.cAxBOLWnrkxaRVHARJCCwAfGC', '426038', NULL, '2020-04-26 19:40:53', '2020-04-26 19:40:53'),
(8, 'trety477', '5678@223.com', '0568169569', '$2y$10$Wrckw0iZeSy9ULwY.QgEkOAmylgwLoO5de.CwP7WFkKdYYPSdBBMi', '102314', NULL, '2020-04-26 22:05:13', '2020-04-26 22:05:13'),
(9, 'Aravindkumar R', 'aravind.0216@gmail.com', '7904497927', '$2y$10$KUX2VjQzdZyt9GuVpVFR1ujdhLg2hUmyPET4GLvYCGJMUWsiZgvfy', '261952', '352112', '2020-04-28 10:45:50', '2020-08-05 21:13:15'),
(10, 'Prasanth', 'prasanthats@gmail.com', '7010384622', '$2y$10$FxFPx27XRBw5KiVgXMh0tOx6SxwMMZ0M.8/6a3D4jQJzrB/Vok/xG', '678081', '729670', '2020-04-28 11:58:35', '2020-08-22 08:16:38'),
(11, 'ali', 'alialqubaisi91@gmail.com', '0589996914', '$2y$10$KlxvXTfDAc6vbffUlnsgyewoy9JLyHeUP5DrN.M7JW8sF1afpwx3i', '681728', NULL, '2020-04-28 12:21:00', '2020-04-28 12:21:00'),
(12, 'Prasad', 'prasanthats1@gmail.com', NULL, '$2y$10$enRDp7cxnw6wjMJH1SJgOu.L.W9T2JuWjTV5TlPrdvBSQI.Qqk2G6', '890663', NULL, '2020-07-04 23:41:44', '2020-07-04 23:41:44'),
(13, 'john nijo', 'johnnijomail@gmail.com', '0564180384', '$2y$10$5bT66gfxYh3Vm3qysphD5.laUorUmX7d571IZhn7ghQQlXbQfRqU2', '369181', '510995', '2020-07-12 09:28:06', '2020-08-05 03:23:28'),
(14, 'Mohamed Thowsif', 'thowsif@lrbinfotech.com', '0568169568', '$2y$10$.Hkf7nCeXxLdNrCq2.4mTOstwQ5Ob4yslQX5BWdbfgBD1IP9c25Ke', '533105', NULL, '2020-07-12 10:12:50', '2020-07-12 10:12:50'),
(15, 'heba', 'heba.alhamed@gmail.com', '0509092847', '$2y$10$C5aifiiF9IY9Afqrk56fJeFf8QHfJf7rbRHB1NMEZ7qRVTxLeROh.', '584943', NULL, '2020-07-12 13:44:55', '2020-07-12 13:44:55'),
(16, 'abdulla', 'trigger770@outlook.com', '0501401201', '$2y$10$Z2nIF6Q6Koq58tB5vvuaSOOdMeT2k.BcLIFdwXjQBAL57LjfzH6eu', '296778', NULL, '2020-07-13 03:22:15', '2020-07-13 03:22:15'),
(17, 'abdulla', 'trigger770@outlook.com', '0501401201', '$2y$10$AlsZYmHb0nOMrSy7lk8DAOmsYrtHjSlaJryasjyHL72hIBcWsmwKi', '177679', NULL, '2020-07-13 03:22:15', '2020-07-13 03:22:15'),
(18, 'alpha', 'show', NULL, '$2y$10$.CPO4J/HsP4coPA/yehYTezAdVB922kOPwemAHM77te6xZ9.1hl3y', '490834', NULL, '2020-07-13 04:21:04', '2020-07-13 04:21:04'),
(19, 'salemalmansoori', 's109s@hotmail.com', '0507688891', '$2y$10$SOTjPV0P1VRAh7CxgUuBoer07wVQBf4TDV70kgykTLcaMOsGob1K6', '210514', NULL, '2020-07-13 18:46:47', '2020-07-13 18:46:47'),
(20, 'ashika', 'ashikamrf71@gmail.com', NULL, '$2y$10$Udg7BCIPw3RVmcOhWNScWuIHk9tCct8yLo6xJWa2n.yYrMhD8Xuoy', '172098', NULL, '2020-07-14 00:50:47', '2020-07-14 00:50:47'),
(21, 'saeed alkaabi', 'saeedalkaabi130@gmail.com', '0509702062', '$2y$10$MHv2O1fV6IlhnzZ20U5UteHQfzh77/bPxsfC.BdT6YOs658szgrjy', '575166', NULL, '2020-08-05 11:40:10', '2020-08-05 11:40:10'),
(22, 'yousuf alnahdi', 'ad.prince.69@hotmail.com', '0501144668', '$2y$10$CMAT6pHk7AFt/Xj6fI2EX.rMieiwBzHGEG3V5JLWvFd0hXcZhUsF.', '881185', NULL, '2020-08-05 11:40:59', '2020-08-05 11:40:59'),
(23, 'Amran Bin Sheikhan', 'a.binsheikhan@gmail.com', '0503666464', '$2y$10$kLGsU0PL.qA9.AoSnptGXOcnKx0hIMMFuC0wcUO5HF2x0SYLDeuX.', '367283', NULL, '2020-08-05 11:42:47', '2020-08-05 11:42:47'),
(24, 'Maitha', 'Maitha.alhajeri2@gmail.com', '508198883', '$2y$10$hQ/svfOTYlsHg.i6sBSkJOBdjYYKHvuEEk.FLQSRe9DPSWvPCEtiq', '140128', NULL, '2020-08-05 11:53:19', '2020-08-05 11:53:19'),
(25, 'Mahra', 'bafeefi@gmail.com', '0508125884', '$2y$10$34s5zexH7mv8mzJhj7LETuucHqyAwLWz5QDlnm5E6nJyYz9tcYHPy', '728100', NULL, '2020-08-05 11:56:04', '2020-08-05 11:56:04'),
(26, 'Khalfan', 'dmaany.ad@gmail.com', '0554709074', '$2y$10$OiUBfoqlfCa7eyEbRsxJBOleBFf.k2uZIIVkit6yCEP2MDrNNwAQe', '132444', NULL, '2020-08-05 12:41:09', '2020-08-05 12:41:09'),
(27, 'reem', 'remoka21@icloud.com', '0504804492', '$2y$10$Y8EEL6sGGu6aEM/fZ8gHMOQFd65DQKxEptrB4aS0DPkn61i9Zw5Xy', '149489', NULL, '2020-08-05 12:59:24', '2020-08-05 12:59:24'),
(28, 'Maryam', 'mryamiihamed@gmail.com', '0526633133', '$2y$10$pFwCbQ3sZMXo35dz25C3dui.NCJA7xi1E12CzjD08Aw5e0wyiK0P.', '856671', NULL, '2020-08-05 18:30:56', '2020-08-05 18:30:56'),
(29, 'Maha', 'Maha.almehairbi@gmail.com', '0555933551', '$2y$10$t6kBu0wpDBB6MEKzpDrsBuazHWwgs1MTUrQfofgjlBWGlpxolXUB.', '139100', NULL, '2020-08-05 19:48:59', '2020-08-05 19:48:59'),
(30, 'salwa', 'salwa2009@live.com', '0504482026', '$2y$10$5NVosmK.JXawCF2hBt.2zOmOnirI9MhxT3/wHzvV9yr/dSpAI6V6a', '708434', NULL, '2020-08-06 02:24:09', '2020-08-06 02:24:09'),
(31, 'Bader', 'b.khoori@gmail.com', '0507633388', '$2y$10$vdjB7g8Di.aDw8ok7WL2OOs/Un65cHm8j3yQnQq2folXHc8wqR/3S', '508795', NULL, '2020-08-06 03:37:37', '2020-08-06 03:37:37'),
(32, 'mohamed', 'mohd-565@hotmail.com', '0504456676', '$2y$10$V40dh9Bx5Ng1fvUl7Vb/HuFF5A.12bRGh3IjD/w14joz9rOj6m1L2', '636410', NULL, '2020-08-06 06:54:34', '2020-08-06 06:54:34'),
(33, 'Mohamed Ahmed', 'itmak92@gmail.com', '0506662566', '$2y$10$aLFjXmPDr5zT8iOCjZmsju9NCjW2Z7lGDtQUUrJ2a7qj88huTIAoa', '644929', NULL, '2020-08-06 07:09:23', '2020-08-06 07:09:23'),
(34, 'nahyan', 'n-ad-n@hotmail.com', '0567942664', '$2y$10$9ziYcIIKfIZeloH72aBnL.qjL/uM2FVKn8CqvkiF9refLzswGP5EO', '755184', NULL, '2020-08-06 07:25:10', '2020-08-06 07:25:10'),
(35, 'Ali al hamadi', 'ashfaqashari43@gmail.com', '0508010179', '$2y$10$rJwPfqDrjPiL.Rk7snT/Pu6GnT5/miJFmOlgPLgkBBGuHAsU3fZyu', '737748', NULL, '2020-08-06 09:59:15', '2020-08-06 09:59:15'),
(36, 'ahmed almansoori', 'almansoori2015@gmail.com', '0502212227', '$2y$10$fh6R5YE3FvytzG4mbEifCe/9mffpvOOlpVCdh8AouvrZEQ.qTwrOy', '489325', NULL, '2020-08-07 02:22:06', '2020-08-07 02:22:06'),
(37, 'alyazya al malood', 'alyazya.almalood@gmail.com', '0553558608', '$2y$10$spw3iHEy12G68UEZgee7duSBx1H5WD7lvFpoj/l1IZVWoJGfor.p.', '635171', NULL, '2020-08-07 23:07:38', '2020-08-07 23:07:38'),
(38, 'Khaled', 'khaledaldahmani@hotmail.com', '0501919993', '$2y$10$CIjbpZ7XsKCY8sp3jiThjux02eh2.Zhh5do3YbGlth146rF6TbDn.', '312045', NULL, '2020-08-08 02:39:53', '2020-08-08 02:39:53'),
(39, 'Aziza Alhamadi', 'azizaalain27@hotmail.com', '0561090690', '$2y$10$5nUrEdxMZq76RJEYzTX8ge7CswkjVh9Q4Q7feuql1QnRLU6.gOc1C', '936251', NULL, '2020-08-08 06:46:29', '2020-08-08 06:46:29'),
(40, 'Ghanem ALQubaisi', 'al-qubisi@hotmail.com', '0507222799', '$2y$10$5.X6BSrTDiljrumwLmDM0.As5JWwgWLgDVlRl3YXDIHZ5lRTRy4Ea', '402558', NULL, '2020-08-08 09:19:04', '2020-08-08 09:19:04'),
(41, 'amaar yaser alharbi', 'ammar10290@hotmail.com', '0557824211', '$2y$10$7MFpycKz42ct4G6C8jZ38ewRKr00kEAwF/qgYadDbEObkVkorgEAa', '942318', NULL, '2020-08-09 01:16:14', '2020-08-09 01:16:14'),
(42, 'asma', 'a_sm5800@hotmail.com', '0561974224', '$2y$10$jU5tq2JY8/MQWBr/wxHO3.hQwe3SAY5TlgGD4EvHtV2/PTj/H/c1u', '192503', NULL, '2020-08-09 06:18:15', '2020-08-09 06:18:15'),
(43, 'suhail', 'suhail.alq808@gmail.com', '0508177762', '$2y$10$FvQhSIS3TOefA.wqu2xL2.0uFvvCrR2sHYWaWprs2iXx0BFafsCuS', '931867', NULL, '2020-08-10 04:20:10', '2020-08-10 04:20:10'),
(44, 'suhail', 'suhail.alq808@gmail.com', '0508177762', '$2y$10$LwtfpRUF7H8JfF1HfB5Ni.ZZ69zLA..qmPHwUPSvb3n/4RLiXWU0i', '690002', NULL, '2020-08-10 04:20:10', '2020-08-10 04:20:10'),
(45, 'suhail', 'suhail.alq808@gmail.com', '0508177762', '$2y$10$iGFn8X4Md5FqNgMbVC8EauITrDXTlJjCpLsa048odZY6gEIfouHxu', '420921', NULL, '2020-08-10 04:20:10', '2020-08-10 04:20:10'),
(46, 'Abdullah', 'Abdullah_albadi@outlook.com', '0553699123', '$2y$10$j4iUhbMLTj3z1u5jnZYzfe5yy.aKJcHgpEZ.m2TXMHGq0cwDlWB/G', '689651', NULL, '2020-08-11 16:38:33', '2020-08-11 16:38:33'),
(47, 'Abdullah', 'Abdullah_albadi@outlook.com', '0553699123', '$2y$10$1L/eafG6Czg7TGTSwlYyCuAosHasKD06APfm8k8rQOh0uZklhLrk6', '765067', NULL, '2020-08-11 16:38:33', '2020-08-11 16:38:33'),
(48, 'Rashed', 'add.meeee@hotmail.com', '0508344200', '$2y$10$vI1rKKtVCNMPrKxzFxF86ecMYtDM21Ig1sHOJnEb53H5k8NY.Zyay', '137248', NULL, '2020-08-12 03:53:51', '2020-08-12 03:53:51'),
(49, 'houran', 'israahouran@hotmail.con', '0567520782', '$2y$10$KrRZjxD9Jz7GW.TZIdEFBu/nbrsD5jOUmQ8nJfqqllPNDguVUm6Gq', '626660', NULL, '2020-08-12 03:55:19', '2020-08-12 03:55:19'),
(50, 'Khalid Almazrouei', 'k-6600@hotmail.com', NULL, '$2y$10$B35rxjkzaEO.smIqFudPrutb.pyO4BJZwfIpeBKuIUrZML.mx4Cbm', '569348', NULL, '2020-08-12 06:08:32', '2020-08-12 06:08:32'),
(51, 'ali alshehhi', 'ali.alshehhii@outlook.com', '0526864971', '$2y$10$MmSose0wom12ZFlkGhBo2eBCC/.whWA4ozI1U1M3XL8kQ8FMSes.O', '543330', NULL, '2020-08-13 05:39:50', '2020-08-13 05:39:50'),
(52, 'basema', 'basema_a83@yahoo.com', '0555592755', '$2y$10$oqL3Pq23rb8oaibmh0oUQeDHmHrRGAmN/YUlRc8Hp3Nd7MY456fg2', '697598', NULL, '2020-08-13 08:59:39', '2020-08-13 08:59:39'),
(53, 'Abdulla Al Boushelaibi', 'aalboush@gmail.com', '0582299992', '$2y$10$XusmeS4TK5eQaIznT09UxuQLRjhCJQCsPJCIGVkvuWmO5D4v/EyPe', '699044', NULL, '2020-08-14 02:19:43', '2020-08-14 02:19:43'),
(54, 'Mahra', 'am_n2@hotmail.com', '0562005019', '$2y$10$MG2PG/P.73AQFwMK5X07FewHSmcVrjNXnAaJuQBkDN4XG3mN0FF1a', '786652', NULL, '2020-08-14 05:20:47', '2020-08-14 05:20:47'),
(55, 'Mahra', 'am_n2@hotmail.com', '0562005019', '$2y$10$55wqlxzrttwVHwwwkr6vX.x2DDrqTis2mJCygFTYJXYjiEueDrQci', '492075', NULL, '2020-08-14 05:20:47', '2020-08-14 05:20:47'),
(56, 'hessa', 'yameenali_2011@hotmail.com', '0562826664', '$2y$10$wwPKXX0Akk/VoaazMXcBbezRGn/kawG7SafOdi8cCbpmOcdQDVwSW', '746208', NULL, '2020-08-15 06:08:18', '2020-08-15 06:08:18'),
(57, 'KHASSIB', 'KHASSIb2000@gmail.com', 'Alain', '$2y$10$MzoSEbzw79QlRIN98r7iZOLSYaS/cVJbkJXSy5ahRtSf0FqCKq9qC', '107120', NULL, '2020-08-16 05:58:39', '2020-08-16 05:58:39'),
(58, 'hamda', 'hamdasayedd@icloud.com', '0543100544', '$2y$10$p4jiyZvxeyyUanYyfj22GeI49NpIqLBot2Yv4R/biV1L3Hd2V1COC', '383119', NULL, '2020-08-16 06:44:40', '2020-08-16 06:44:40'),
(59, 'hamdan', 'binahmedalmarzouqi@gmail.com', '0502005264', '$2y$10$ZJx1x1xaAZK/UGlysMGXqeYp.QhvoHAkBCxXqaBFfTMo0OsibL7R2', '998806', NULL, '2020-08-16 07:44:01', '2020-08-16 07:44:01'),
(60, 'mairah', 'Mairah.hamid1@icloud.com', '71589005', '$2y$10$S603ldFVnu3AfZSuWeXhO.7j9XlBhu26m3l7c2NQdNpS33qJpQiwi', '164787', NULL, '2020-08-16 11:45:21', '2020-08-16 11:45:21'),
(61, 'mairah', 'Mairah.hamid1@icloud.com', '71589005', '$2y$10$wCZMjFrKCNRTgvO6DCIiiOdXu4zg2qxMNwW8bu4o6bslWbZkBDWAy', '248121', NULL, '2020-08-16 11:45:21', '2020-08-16 11:45:21'),
(62, 'areej', 'areej.fadel@dentistry.cu.esu.eg', '00971566131468', '$2y$10$Bymm0sp9PgkKgHXfLUCTWOtxDCtpOIxIl/663zhao1maa6WdomBRK', '916774', NULL, '2020-08-16 18:50:48', '2020-08-16 18:50:48'),
(63, 'Saeed alkaabi', 's.s.a78@hotmail.com', '0508668835', '$2y$10$wE.ttRnmiz0IzYgnPFc1pOf8.jK7uF3LC2ZzpIs6FxP2L03/l43q.', '777712', NULL, '2020-08-17 07:43:43', '2020-08-17 07:43:43'),
(64, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$XiMhiftThpigfSseeJ4ydeghg3WeTLzgDeR.KKrf2eJLjDH.9PPXG', '231809', NULL, '2020-08-17 09:06:40', '2020-08-17 09:06:40'),
(65, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$5K5wxOiO/YwBtlf5eq5QWeGfl0J40nKbmqO/XFru7qpGR2MjQJWG6', '505091', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(66, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$C29ai0EpEEGKia3uNKhnUezdZAba88H7.JGcuTI8EqjK4C7PwvTsS', '730298', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(67, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$YRQYL4.RfV9A8v74xqeEPu2bMWBIQPIyue5zIM7ST7lv3bz7CpCau', '910391', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(68, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$lJEFVsNbsv5p31rE6sOfteRbfzk7fHYs9JccT5NgM5DFEb8/cPV/O', '435315', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(69, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$3l0VWR6zCknhTbCWbKW2/uEYY3iW04i0deD9DgjiF3e7eckygjzaO', '219631', NULL, '2020-08-17 09:06:40', '2020-08-17 09:06:40'),
(70, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$bKGHj2CgIncNKWYQMOQDdenQSILsZpxwfbPKGGMBC4i917J1MLPaC', '455811', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(71, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$tJMR8ZNWkv1/68eWbiKHHe9KFDTdFPiDhSFemeL4BjnRstHuuQmj.', '240423', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(72, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$pORq8qzynWRB/2X4yj/tl.WznFAQJOgl6WEAjf1aHhuNGK1NHlHvy', '606841', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(73, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$rnKWpH2TptnETkhP38uPYejGVrDwhIhkl7E3OGxAVj5mQjXNSdxpi', '563215', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(74, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$k/lsbJ9i9MzctvQgFx1B0uUI3YBdJZY4vhxZVA6Sflsfem/1v8irq', '921422', NULL, '2020-08-17 09:06:40', '2020-08-17 09:06:40'),
(75, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$UJ9mz1/pqAOLe62QgRiE1.6Korsv5QImtgkk/HWA8yjGVNl72.ubi', '727535', NULL, '2020-08-17 09:06:40', '2020-08-17 09:06:40'),
(76, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$KClWMe13xz5PJsDDLzpKfeh3dCA4nZPXw6d7Dj0m.pORxvfGqU.eC', '732470', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(77, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$CWSJNOQW1XrVOO6HbwAk/eXnfyk1r9lyGlHvxtiTqb6a3kRMOzVlS', '642597', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(78, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$FJO7g3Vyvn8jTcSkkmXzuONl8bU3jL76K0G91T74WYZJwmrnbqwBe', '222420', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(79, 'khawla', 'vawwla@gmail.com', '0507009422', '$2y$10$9Ae22ak9MKEQ/vI/375Dte9KCWZy/pe6lavwR8qGTvWOsqeW1skgO', '980241', NULL, '2020-08-17 09:06:39', '2020-08-17 09:06:39'),
(80, 'Fatima alameri', 'girls-2019@hotmail.com', '0556527026', '$2y$10$J7.Ow4J0uMvfPQ29MqCnA.Yb03BX5EvJFQIbGoqVYFY2LbcyW/MaS', '195521', NULL, '2020-08-17 09:35:55', '2020-08-17 09:35:55'),
(81, 'hamad', 'h.h.alrmhi@hotmail.com', '0501000398', '$2y$10$xFAC9D/KIpbj6v23vdsLD.KXJZilXthkmiIDHt/.vJgEHJLfuZdDO', '544476', NULL, '2020-08-19 05:55:11', '2020-08-19 05:55:11'),
(82, 'mariam', 'mze.almansoori@icloud.com', '0507373577', '$2y$10$bn0mVxfZj7Kh.a.5zbdkkOG/Qnv5BdEOk9W9JKY71Gm1HAzeYXrLO', '758603', NULL, '2020-08-20 13:15:43', '2020-08-20 13:15:43'),
(83, 'nader alyafai', 'opera.advt@gmail.com', '0561616196', '$2y$10$FAbiBtBQKJnq4JTGhlFNb.fLZdf80XZ3oD7yRhosADSp2KNBRkgfi', '435527', NULL, '2020-08-24 02:19:55', '2020-08-24 02:19:55'),
(84, 'Salama', 'e.b_s@hotmail.com', '0501114556', '$2y$10$fxxHVQTFJL6tJFcGkOVBBesvWfOYk/uw3x8BE.PX9k/K8fuJ7cpr6', '514046', NULL, '2020-08-28 07:19:57', '2020-08-28 07:19:57'),
(85, 'ام  ‏راشد', 'falshamsi2000@icloud.com', '0551146666', '$2y$10$3mCjDQAODdzIKV06pilcDOOcy7BJQScf782DYq5xBcUIOKCogpAqu', '206091', NULL, '2020-08-29 07:48:52', '2020-08-29 07:48:52'),
(86, 'Shamsa', 'missalhameli@hotmail.com', '0509065396', '$2y$10$XLnJ2c2bRtz0X8yCvB2V/.cj6VgZ1lDLKnnxdaee4gmJ378dlQA.e', '405085', NULL, '2020-09-02 12:39:04', '2020-09-02 12:39:04'),
(87, 'khadija', 'khadija.karam84@hotmail.com', '0547774414', '$2y$10$nVGw1kxXK9HfgzZ8VCTiFOt9/wXB6.Y7GOCppAQOq3O5c1s8gRbq.', '119978', NULL, '2020-09-03 08:51:56', '2020-09-03 08:51:56'),
(88, 'ainour', 'ainourkhaled14@gmail.com', '0561211333', '$2y$10$8a8lct8cakuFE6v/3Xp8BuyPxpuyi.sblsporCn7EUHxbbzgg4HWi', '709716', NULL, '2020-09-03 16:24:39', '2020-09-03 16:24:39'),
(89, 'Rima AlZaabi', 'rima_a_alzaabi@hotmail.com', '0508805887', '$2y$10$6bNENrxOwmiTZbVS3EjIIuWKSh3bag/6xDNnsV4SUK/qTwexSvPEe', '601460', NULL, '2020-09-04 03:18:08', '2020-09-04 03:18:08'),
(90, 'alhameli', 'Mariam1985m@hotmail.com', '0563232400', '$2y$10$SYM44rIeY.pkchaPWoD0VOf3/9YwKFOyr7sbVeqkASCSErvER.33S', '500533', NULL, '2020-09-04 08:50:41', '2020-09-04 08:50:41'),
(91, 'Ameera Alshehhi', 'a.alshehhi92@outlook.com', '0503338980', '$2y$10$eTzLUnQTvGGu0FKhAtK0DuueYC7EQni4LAsBR/3YfY9ujzmpNLvci', '947556', NULL, '2020-09-05 15:41:16', '2020-09-05 15:41:16'),
(92, 'shaikha', 'shaikha_alromithy@hotmail.com', '0505141442', '$2y$10$XcoIsctc8tIjpTrtM/gepOpbOIUMxNd0fegXRZC8vfYiAzfsS.F9O', '159852', NULL, '2020-09-10 05:43:04', '2020-09-10 05:43:04'),
(93, 'Idris Sheikh', 'idrissheikh21@gmail.com', NULL, '$2y$10$a0OHbdPJvYyzxT3Jhy3WtORX.Rt7swyCi60jW/Ib.k4Z6yVGErRyi', '828759', NULL, '2020-09-10 10:17:28', '2020-09-10 10:17:28'),
(94, 'mouza', 'mouza17777@gmail.com', '0505062350', '$2y$10$C3rq//RIcBGbCv2.8IwgAenbVuZYfzH1PVCkWemAbCqFZ2JYpCBD6', '434883', NULL, '2020-09-11 05:47:54', '2020-09-11 05:47:54'),
(95, 'pi sensor', 'pisensor@gmail.com', NULL, '$2y$10$bx4KJKrqy.ra.BuDXKb//uo0Xsuql3ZUp9lgAiI45uzdX54xMQdKK', '215261', NULL, '2020-09-11 12:59:41', '2020-09-11 12:59:41'),
(96, 'Khalifa', 'fefoalt1@gmail.com', '0504641146', '$2y$10$.ceC3Rd2n/NHR34XEtdd9Ocrb3Pdley.5HXMfre6QBR0DychWkaaa', '268492', NULL, '2020-09-12 13:31:23', '2020-09-12 13:31:23'),
(97, 'adel', 'adel.bbc@hotmail.com', '0505221371', '$2y$10$eUIBmW.zv0ksgYD5lxjK8eT6yFqVlnQ7w8HPNcJpu1b5RIlA1HruC', '298179', NULL, '2020-09-12 14:44:21', '2020-09-12 14:44:21'),
(98, 'Hashem Al Shateri', 'halshateri@gmail.com', '0509774111', '$2y$10$DUEaVSrnQt3delEBV8.JAuZVPBu1HdqvtfL3nXk2nY6YTg6i5BhJS', '218741', NULL, '2020-09-13 02:21:26', '2020-09-13 02:21:26'),
(99, 'noura Alzaabi', 'ns.alz3abi@gmail.com', '0507468673', '$2y$10$RbUcKrRsvM/dJ4gAUy3sCe58EKO.YQChSGhTioVElSqIw0R8WSRxO', '778687', NULL, '2020-09-13 06:04:19', '2020-09-13 06:04:19'),
(100, 'maitha', 'maithaalmatrooshi@outlook.com', '0521788874', '$2y$10$WY6kzBjxX1iRok10awqhPu6nYT3SDHhTPEDQF4cGqZWRzSv0PfggO', '986251', NULL, '2020-09-13 13:39:12', '2020-09-13 13:39:12'),
(101, 'ali test', 'alq@gmail.co.', '0508878714', '$2y$10$2dOquL8garkk5plM6Ey0dODqk/HiyWaroqx6QGnC/qV6RoqqS57Sm', '790074', NULL, '2020-09-14 00:44:41', '2020-09-16 02:35:14'),
(102, 'asma', 'H00349579@hct.ac.ae', '0506262781', '$2y$10$65KJ16mQrzucveocMuAizOvrzwJGL7vJbX9DzkFn7sDYmleeUTvm.', '410705', NULL, '2020-09-14 01:51:18', '2020-09-14 01:51:18'),
(103, 'fatima', 'f.wahbi@hotmail.fr', '0521906363', '$2y$10$lgxhnUySbn53Xjb5TWgzL.T6d9M.ErzuA.LsASug1d18/ZNwlqici', '306333', NULL, '2020-09-17 00:36:04', '2020-09-17 00:36:04'),
(104, 'mariam', 'xfhx@hotmail.com', '0507373577', '$2y$10$obPKQEfjcx6pmF8gEVnk/ejfMObQi8uQHyiUjW8KzWVWfmyaBJsvq', '336394', '902227', '2020-09-19 02:52:31', '2020-09-23 11:22:13'),
(105, 'sara', 'swarysultan1@gmail.com', '0523330077', '$2y$10$nBlmsTHZAj9d3QZVwbwXfehnLRF1SUwvhRsjIx3nxvOJTqonhbKsi', '850249', NULL, '2020-09-19 06:54:09', '2020-09-19 06:54:09'),
(106, 'suhail', 'ssh94@live.com', '0559949949', '$2y$10$F6yyEL1sedJSkrSp7ihNyenrWa4ibCKllctIWdjk4pq0TcCf0kOBC', '829296', NULL, '2020-09-22 08:41:55', '2020-09-22 08:41:55'),
(107, 'saleh AlHammadi', 'saleh@uae.net', '0501111971', '$2y$10$RDM7KEofO1VQ2smFzecMcuRE3J4zRbujjSP6508CaqLhgLm/LiuMy', '639305', NULL, '2020-09-22 23:11:28', '2020-09-22 23:11:28'),
(108, 'Eman', 'eman.albadi@live.com', '0505966505', '$2y$10$BysymepmcVrYgiB4l7zdieG9cSXU1LnqHWh43Ah7cvsM.KLiOX4o2', '136018', NULL, '2020-09-23 03:47:18', '2020-09-23 03:47:18'),
(109, 'shosho', 'shalmansoory956', '0506614149', '$2y$10$Bqpn9cNsVgk6FkHoTtHFX.cPXrgLEFh8XFuev76wl.qMhwAIc8zTe', '362086', NULL, '2020-09-23 15:57:14', '2020-09-23 15:57:14'),
(110, 'Nasser', 'maabyswaak@hotmail.com', '0506644336', '$2y$10$GjZU7/W1tjAQOJCiOuLX1OOc07r2lUNoMPxQ0GbPqncvKLnQZt28O', '905692', NULL, '2020-09-23 17:50:01', '2020-09-23 17:50:01'),
(111, 'ahmed', 'medoo__8@hotmail.com', '0558868667', '$2y$10$Sb55mduA90NrPZjZIxgtk.WbUGhM5DxLDIReyPcW.yVgpgFgOeK3m', '729796', NULL, '2020-09-24 00:56:34', '2020-09-24 00:56:34'),
(112, 'Salem', 'salem_mm87@hotmail.com', '0505332442', '$2y$10$knduPQChDSmhddRtEUyn1uj3OZeAy9wTbWJ6soPK4XWKh28auYFgO', '268737', NULL, '2020-09-24 13:06:19', '2020-09-24 13:06:19'),
(113, 'noof', 'Al5a6ry@hotmail.com', '0558332558', '$2y$10$WV1/AX49iVg2cHAj7AS0DuWQsgWFN5VElITGOTDyour8EyUKbeeTG', '909819', NULL, '2020-09-24 23:42:03', '2020-09-24 23:42:03'),
(114, 'Hasan', 'uae.events87@gmail.com', '0565754453', '$2y$10$UlFq2eoAV50oXtVcDwVgNOVbUmfF/nTtFv/0q8a0FgYh2hcKeh/Bm', '669631', NULL, '2020-09-26 04:34:17', '2020-09-26 04:34:17'),
(115, 'Fatima', 'f6amijz@gmail.com', '0551080034', '$2y$10$o1oSgzizsukNhoo22un7Iu.Fx4xc/8TzUyVFgtkr59GJwEBGzAY.C', '151227', NULL, '2020-09-26 05:00:26', '2020-09-26 05:00:26'),
(116, 'Ibrahim', 'i.k.a@hotmail.com', '0566666213', '$2y$10$XK0kp9obuIANofMfEWU6ruEHs4AsCSRbuzxuwQYJbccoe8jUuU/e6', '171573', NULL, '2020-09-26 05:53:31', '2020-09-26 05:53:31'),
(117, 'Sara', 's.salem@live.co.uk', '0509191939', '$2y$10$WtdrxHnyjF5c5hrdCTSr/exW3SYcIwfx805gW7dVRaFSngwHtIHPq', '354605', NULL, '2020-09-26 06:59:41', '2020-09-26 06:59:41'),
(118, 'saif rashed Alhefeiti', 'saifrashed12s3@gmail.com', '0555222352', '$2y$10$DgCvDN5ee75VmoNctYnKHOtKWuZ5Rk0n7oO4v7iRnzWT2dTmmGLIW', '630187', NULL, '2020-09-30 04:39:28', '2020-09-30 04:39:28'),
(119, 'saniya', 'khansaniyak0@gmail.com', NULL, '$2y$10$XL9LrvLCzCVwTzucOKDsS.bBTPDLwOmJRjFSFrQhnmoThDdQdg3Wu', '525652', NULL, '2020-09-30 07:44:18', '2020-09-30 07:44:18'),
(120, 'essa', 'essa.alya3robi@icloud.com', '0506900309', '$2y$10$7y62cDbYxX548ucRRqHL5u/fmSA5Brn.GqRXESwG64naW5YhwJVEe', '555571', NULL, '2020-09-30 09:43:10', '2020-09-30 09:43:10'),
(121, 'hamdan', 'hamdanaamer@icloud.com', '0501200334', '$2y$10$0qrfw59WMJlDy9civsXxQe2FN6OdY0MzuHHzSsO4drtf0v2Q6wmn2', '312262', NULL, '2020-10-04 06:54:06', '2020-10-04 06:54:06'),
(122, 'Mohamed Almarar', 'mohamed.k.almarar@gmail.com', '0504434103', '$2y$10$/xkOLjtOi4T0QBA/aGG5fOVOK./jK45IaiQ7aREvCA6c3md5nwXiy', '741789', NULL, '2020-10-05 13:37:21', '2020-10-05 13:37:21'),
(123, 'salamah', 'salamah2711@gmail.com', '0558852018', '$2y$10$s4fbcL7ZiPCNMVvVDksEb.H49nwI6hpZOUHhIqN.rI2p3Xzi.1/G6', '320631', NULL, '2020-10-06 04:03:02', '2020-10-06 04:03:02'),
(124, 'mohmmed', 'nana96_2000@hotmail.com', '0526661145', '$2y$10$Fv1VBXF44ycUxxDQ5laufOqOazL.CJ1yI1oZTmxFTETEdcsx5BGDW', '736454', NULL, '2020-10-08 01:30:48', '2020-10-08 01:30:48'),
(125, 'Hussain', 'hussainahon61@gmail.com', '0508023857', '$2y$10$G7/zoeDnXhjEJCOIYnCMjehltEmyL.PvW4ytgFjLxAjjnSVD.QkX6', '413644', NULL, '2020-10-12 01:33:46', '2020-10-12 01:33:46'),
(126, 'rashed', 'uae66020@gmail.com', '0521999960', '$2y$10$C5Ot11y4d.eU2aAkm.mYrOtM55VvhJiG7l61RXjO2cHIPLNQ2LDpm', '883862', NULL, '2020-10-12 02:22:27', '2020-10-12 02:22:27'),
(127, 'Ahmed alhosani', 'ah.alhosani27@gmail.com', '0547777871', '$2y$10$9bu7mc7rXsO6cPG3AwcameLxRRriy8EtH9FeGYrgnbNplNmFZjHmy', '946557', NULL, '2020-10-14 23:51:25', '2020-10-14 23:51:25'),
(128, 'hazza3', 'a@a.a', '0508630086', '$2y$10$a2vTwaFcSk.WlboyfPmD1esH3uLIBIk.wDjcSHGYcmx9webUpsedi', '446018', NULL, '2020-10-14 23:53:15', '2020-10-14 23:53:15'),
(129, 'Musabah AlMuhairi', 'bin_muhair@hotmail.com', '0506992197', '$2y$10$OHD2UQoKPgzqSFrmcGDaYu0ClmVFYNB/D4Ll5fVhYAnEzDlC8dSgi', '973727', NULL, '2020-10-14 23:54:13', '2020-10-14 23:54:13'),
(130, 'muzna', 'm.alqubaisii94@gmail.com', NULL, '$2y$10$lICXqrzOF3fYNyE.SdXpFeIpqsZU7hqWnz4yT4ZyUv53M.6wts/P.', '837846', NULL, '2020-10-18 09:31:47', '2020-10-18 09:31:47'),
(131, 'zakarya', 'z1@uae.net', '0553936664', '$2y$10$LylI3JN6ctEmeNDyDtDkL.DaKeKlB23IFV.3PMm4AG99g.n79Fc76', '148737', NULL, '2020-10-19 06:37:46', '2020-10-19 06:37:46'),
(132, 'Lee', 'leesevilla05@gmail.com', '0569495959', '$2y$10$qkH0p1X927qqpOemoyMbxOyZWe5xTr8dN/W6ClVoDee4Ua0cycWLm', '820418', NULL, '2020-10-19 06:57:18', '2020-10-19 06:57:18'),
(133, 'Asma', 'um.dabya@gmail.com', '0505002333', '$2y$10$b.qrbfc873B8rsWuhyCstuNhGitYInVfS.I8OkdaYfXBWxaAK0Lf.', '619215', NULL, '2020-10-23 06:37:19', '2020-10-23 06:37:19'),
(134, 'Abdulla', 'abdulla-salem@hotmail.com', '0557744776', '$2y$10$R9yY.CAVi/CICwqr/ake4uxkKEiXa/91sn2EOMKiH/nVhOcspMR4u', '296007', NULL, '2020-10-27 04:12:02', '2020-10-27 04:12:02'),
(135, 'Shireen', 'shireensand.665773@gmail.com', '09064532888', '$2y$10$bPmi.VdPtXwYr/BjbDK9NO.rfrQpLfeppebBaBie/fHzanBqxz8j.', '147198', NULL, '2020-10-28 21:27:14', '2020-10-28 21:27:14'),
(136, 'melisandre snow', 'melisandresnow.938862@gmail.com', NULL, '$2y$10$Lj0NAdI2gfKsn7KwrkSflezJH3/MCM37Gy2DMsVPy0pUMtQ.vH8z2', '487728', NULL, '2020-10-28 21:35:43', '2020-10-28 21:35:43'),
(137, 'licy', 'margaeryclegane.643523@gmail.com', '09770195470', '$2y$10$RslveRBzAXRmCj6h/Koyt.dW07Tpvh8OxGprD.fTXc915m4CkOUde', '972593', NULL, '2020-10-28 21:41:57', '2020-10-28 21:41:57'),
(138, 'lysa tyrell', 'lysatyrell.673927@gmail.com', NULL, '$2y$10$2juk2HP1cQnLObMsfPG.VuCBxH/QTV5tU.nQXXeA/zvrkwZ7BVPgO', '407624', NULL, '2020-10-28 21:48:21', '2020-10-28 21:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `position`, `image`, `title`, `text`, `created_at`, `updated_at`) VALUES
(4, '1', '2107777827.jpeg', 'لاندري بوكس', 'Order', '2020-04-10 08:56:49', '2020-09-23 03:18:50'),
(5, '2', '356001422.jpeg', 'عرض لاندري بوكس', 'احصل على اربع بوكسات فقط على 220 درهم', '2020-09-23 03:17:34', '2020-09-23 03:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_arabic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `name_arabic`, `image`, `created_at`, `updated_at`) VALUES
(70, 'Laundry Box', 'لاندري بوكس', '12795743.png', '2020-08-29 02:41:29', '2020-09-13 14:40:27'),
(71, 'Blanket/Single', 'بطانية\\سنقل', '628727124.png', '2020-09-14 01:56:54', '2020-09-14 01:56:54'),
(72, 'Blanket/Double', 'بطانية/دبل', '669464455.png', '2020-09-14 01:57:46', '2020-09-14 01:57:46'),
(73, 'Bed Sheet/ Single', 'شرشف\\سنقل', '80581264.jpg', '2020-09-14 01:59:30', '2020-09-14 01:59:30'),
(74, 'Bed Sheet/Double', 'شرشف\\دبل', '375135661.jpg', '2020-09-14 02:00:13', '2020-09-14 02:00:13'),
(75, 'Carpet/Meter', 'سجاد\\بلمتر', '860722060.jpg', '2020-09-14 02:02:37', '2020-09-14 02:02:37'),
(76, 'Curtains', 'ستارة', '2086671991.jpg', '2020-09-14 02:04:17', '2020-09-14 02:04:17'),
(77, 'Pillowcase', 'غطاء وسادة', '311500713.png', '2020-09-14 02:05:54', '2020-09-14 02:05:54'),
(78, 'Table Cloth', 'شرشف الطاولة', '740270770.jpg', '2020-09-14 02:06:49', '2020-09-14 02:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `manage_addresses`
--

CREATE TABLE `manage_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `map_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addr_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_addresses`
--

INSERT INTO `manage_addresses` (`id`, `map_title`, `lat`, `lng`, `addr_type`, `addr_title`, `address1`, `address2`, `address3`, `customer_id`, `phone`, `city`, `area`, `status`, `created_at`, `updated_at`) VALUES
(68, '306 Khalifa Bin Zayed The First St - Zone 1E6 - Abu Dhabi - United Arab Emirates', '24.4899018', '54.3588434', 'apt', 'dalma plaza', '1210', NULL, NULL, '10', '0567100733', 'Abu Dhabi', 'Khalidiya', '1', '2020-08-04 02:54:34', '2020-08-08 05:58:15'),
(69, '103 Mohd Saif Saqral Muhairabi Building, Above Al Niyadi Travels - Hamdan Bin Mohammed St - Zone 1E3-01 - Abu Dhabi - United Arab Emirates', '24.4866015', '54.3597595', 'office', '101', '0105', 'convex business center', NULL, '13', '0564180384', 'Abu Dhabi', 'Al Zahiyah and Al Markaziyah', '0', '2020-08-04 05:12:51', '2020-08-04 05:12:51'),
(70, '33 شارع السِّنَّارَة - Al ZahiyahE16-01 - Abu Dhabi - United Arab Emirates', '24.4934566', '54.3811659', 'villa', 'test', 'rest', 'test', NULL, '14', 'tets', 'Abu Dhabi', 'Al Wahda', '0', '2020-08-05 00:53:50', '2020-08-05 00:53:50'),
(71, '33 شارع السِّنَّارَة - Al ZahiyahE16-01 - Abu Dhabi - United Arab Emirates', '24.4934566', '54.3811659', 'villa', 'test', 'rest', 'test', NULL, '14', 'tets', 'Abu Dhabi', 'Al Wahda', '0', '2020-08-05 00:53:51', '2020-08-05 00:53:51'),
(72, '14 شارع الهَيْل - Al NahyanE20-02 - Abu Dhabi - United Arab Emirates', '24.4628905', '54.3830879', 'apt', '12', '303', NULL, NULL, '15', '0509092847', 'Abu Dhabi', 'Al Muroor', '0', '2020-08-05 09:42:14', '2020-08-05 09:42:14'),
(73, '12 Al Athmar St، - MusaffahM-37 - Abu Dhabi - United Arab Emirates', '24.3477126', '54.4998595', 'villa', '٢', '٣', '٤', NULL, '11', '٤', 'Abu Dhabi', 'Al Wahda', '0', '2020-08-05 10:20:39', '2020-08-05 10:20:39'),
(74, '610 Hazza Bin Zayed the First St - Al Manhal - Abu Dhabi - United Arab Emirates', '24.4665357', '54.3666377', 'apt', 'building', '1', NULL, NULL, '9', NULL, 'Abu Dhabi', 'Al Zahiyah and Al Markaziyah', '0', '2020-08-05 11:51:23', '2020-08-05 11:51:23'),
(76, '4 شارع أهْل الإِكْرَام - Najmat Abu Dhabi - Abu Dhabi - United Arab Emirates', '24.4837746', '54.4058049', 'apt', 'Baheen tower, nagmat Abu Dhabi', '608', NULL, NULL, '25', '0508125884', 'Abu Dhabi', 'Select Area', '1', '2020-08-05 11:59:14', '2020-09-21 00:34:49'),
(77, 'C 53 - Shams - شمس أبوظبي - أبو ظبي - United Arab Emirates', '24.4976843', '54.4110093', 'apt', 'park side view B', '105', NULL, NULL, '28', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-05 18:36:59', '2020-08-05 18:36:59'),
(78, '27 شارع الأَسِيل - Khalifa CitySector 33 - أبوظبي - United Arab Emirates', '24.4013506', '54.5579979', 'villa', 'villa', '23', '31', NULL, '31', '0507633388', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-06 03:40:04', '2020-08-06 03:40:04'),
(79, '48 شارع البَزْم - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4408879', '54.3687372', 'villa', 'albteen', 'albazm', '44', NULL, '29', '0555933551', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-06 05:45:20', '2020-08-16 13:49:43'),
(80, '48 شارع البَزْم - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4408879', '54.3687372', 'villa', 'albteen', 'albazm', '44', NULL, '29', '0555933551', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-06 05:45:20', '2020-08-16 13:49:46'),
(81, 'Bani YasEast 10 - Abu Dhabi - United Arab Emirates', '24.2928541', '54.64926', 'villa', '119', '10', '119', NULL, '32', '0504456676', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-06 06:58:47', '2020-08-06 06:58:47'),
(82, '6th St - MusaffahMusaffah Industrial - Abu Dhabi - United Arab Emirates', '24.3815731', '54.495821', 'office', '1', '1', '1', NULL, '35', '025557009', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-06 10:02:17', '2020-08-22 02:10:36'),
(83, '36 شارع المناسك - Al WathbaNew Wathba South - Abu Dhabi - United Arab Emirates', '24.2644224', '54.66767369999999', 'villa', 'villa', 'المناسك', '36', NULL, '36', '0502212227', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-07 02:23:55', '2020-08-07 02:23:55'),
(84, '105 Dhafeer St - Al Sa\'Adah - Abu Dhabi - United Arab Emirates', '24.428763', '54.4374137', 'hotel', 'holiday inn', '604', NULL, NULL, '37', '0553558608', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-07 23:09:31', '2020-08-07 23:09:31'),
(85, 'Saeed Bin Mukhashin Building - 5 Hamdan Bin Mohammed St - Zone 1E3-01 - Abu Dhabi - United Arab Emirates', '24.4862539', '54.35915130000001', 'apt', '1', '1210', NULL, NULL, '13', '0564180384', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-08 01:32:25', '2020-08-08 01:32:25'),
(86, '31 شارع الفجري - Khalifa CitySE-5 - أبوظبي - United Arab Emirates', '24.409355', '54.57752900000001', 'villa', 'khalifa city', '19', '31', NULL, '40', '0507222799', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-08 13:02:40', '2020-08-08 13:02:40'),
(87, '16 شارع المُعْتَكِف - Al Falah - أبوظبي - United Arab Emirates', '24.4558563', '54.7205593', 'villa', '1b-616', 'المعتكف', '16', NULL, '46', '0553699123', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-11 16:40:56', '2020-08-11 16:40:56'),
(88, '4 شارع الشُّولَة - Al BateenW10 - Abu Dhabi - United Arab Emirates', '24.4710954', '54.3393673', 'apt', 'saqer building, cbi bank same building', '903', NULL, NULL, '49', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-12 03:58:02', '2020-08-12 03:58:02'),
(89, '4 شارع الشُّولَة - Al BateenW10 - Abu Dhabi - United Arab Emirates', '24.4710954', '54.3393673', 'apt', 'saqer building, cbi bank same building', '903', NULL, NULL, '49', NULL, 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-12 03:58:03', '2020-08-12 03:58:18'),
(90, '139 شارع الذِّيد - RabdanAl Maqta\' - Abu Dhabi - United Arab Emirates', '24.4065264', '54.5121583', 'villa', '139', 'Aldheed rd', '139', NULL, '50', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-12 06:09:59', '2020-08-12 06:09:59'),
(91, 'Marina - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4519787', '54.3367484', 'hotel', 'The edition hotel , marsa', '535', NULL, NULL, '41', '0557824211', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-12 12:18:47', '2020-08-12 12:18:47'),
(92, '42 شارع لَمْحَة - RabdanAl Maqta\' - Abu Dhabi - United Arab Emirates', '24.4098748', '54.496227', 'villa', 'almaqta', 'lamha street', '42', NULL, '52', '0555592755', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-13 09:01:44', '2020-08-13 09:01:44'),
(93, 'Al Bateen St - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4602546', '54.3477814', 'apt', 'A1A', '4', '401', NULL, '56', '0562826664', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-15 06:10:42', '2020-08-15 06:10:42'),
(94, '3 شارع الزُمرُّد - Al Ma\'aridCapital Centre - Abu Dhabi - United Arab Emirates', '24.4178774', '54.4399289', 'hotel', 'rotana', '1707', '‎ ‎urgent', NULL, '57', '0559861313', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-16 06:03:56', '2020-08-16 06:03:56'),
(95, '51 شارع السَّمَاك - Zone 1 - Abu Dhabi - United Arab Emirates', '24.4412436', '54.3992073', 'villa', 'villa 55', 'almroor', '55', NULL, '58', '0543100544', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-16 06:47:05', '2020-08-16 06:47:05'),
(96, '48 شارع البَزْم - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4408879', '54.3687372', 'villa', 'البطين', 'البزم', '٤٤', NULL, '29', '٠٥٥٥٩٣٣٥٥١', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-16 13:51:36', '2020-08-16 13:51:36'),
(97, 'Marina - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4519787', '54.3367484', 'hotel', 'the abudhabi edition', '104', NULL, NULL, '62', '0566131468', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-16 18:52:27', '2020-08-16 18:52:27'),
(98, '2 شارع وَانِس - Zone 1E5 - Abu Dhabi - United Arab Emirates', '24.4904438', '54.3582876', 'apt', 'Mubarak tower', '404', 'Sanam restaurant', NULL, '10', '0567100733', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-17 06:13:57', '2020-08-17 06:13:57'),
(99, '10 شارع السِّهام - Al Falah - Abu Dhabi - United Arab Emirates', '24.4506454', '54.71086769999999', 'villa', 'Alfalah', 'شارع ‏السهام', '1A993', NULL, '80', '0556527026', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-17 09:38:03', '2020-08-17 09:38:03'),
(100, '190 King Abdullah Bin Abdulaziz Al Saud St - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4596433', '54.3220189', 'apt', 'Etihad Tower 5', '2604', 'tower 5', NULL, '59', '0502005264', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-17 12:28:49', '2020-08-17 12:28:49'),
(101, '13 Warnah St - Al Falah - Abu Dhabi - United Arab Emirates', '24.4326878', '54.7406081', 'villa', 'villa', '1e', '13', NULL, '23', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-19 04:13:05', '2020-08-19 04:13:05'),
(102, '12 شارع الطويرة - Al ShamkhahSH-17 - Abu Dhabi - United Arab Emirates', '24.3735258', '54.7009317', 'apt', 'alshamkah17', '1', '12', NULL, '81', '0501000398', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-19 07:44:58', '2020-08-20 13:38:05'),
(103, '54 شارع القَوالِب - Mohamed Bin Zayed CityZ4 - أبوظبي - United Arab Emirates', '24.3571263', '54.5622372', 'villa', 'villa', 'القوالب', NULL, NULL, '38', '0501919993', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-19 13:35:09', '2020-08-19 13:35:09'),
(104, '6th St - MusaffahM-14 - Abu Dhabi - United Arab Emirates', '24.3810186', '54.4938727', 'office', 'near car dip', '025557009', NULL, NULL, '35', '0508010179', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-22 02:03:36', '2020-08-22 02:10:47'),
(105, '6th St - MusaffahM-14 - Abu Dhabi - United Arab Emirates', '24.3810186', '54.4938727', 'office', 'local car care', '025557009', NULL, NULL, '35', '0508010179', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-08-22 02:08:07', '2020-09-26 12:08:05'),
(106, '304 Khalifa Bin Zayed The First St - Zone 1E6 - Abu Dhabi - United Arab Emirates', '24.4897387', '54.3587463', 'apt', 'Mubarak tower', '403', 'developer testing', NULL, '10', '567100733', NULL, NULL, '0', '2020-08-22 08:18:01', '2020-08-22 08:18:30'),
(107, 'Al \'Ishoush St - Khalifa City - Abu Dhabi - United Arab Emirates', '24.426379', '54.5517228', 'villa', 'gate 24', 'gate 24', '435', NULL, '84', '0501114556', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-28 07:21:17', '2020-08-28 07:21:17'),
(108, '64 شارع الروامس - Al ShawamekhSector 10 - Abu Dhabi - United Arab Emirates', '24.3383674', '54.6493788', 'villa', 'الشوامخ', '١٠', '١٠', NULL, '85', '٠٥٥١١٤٦٦٦٦', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-08-29 07:50:53', '2020-08-29 07:50:53'),
(109, 'Etihad Towers, West Corniche, Al Ras Al Akhdar - Al Bateen - Abu Dhabi - United Arab Emirates', '24.4586575', '54.3214528', 'apt', 'Etihad Towers', '2008', NULL, NULL, '91', '0503338980', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-05 15:43:54', '2020-09-05 15:43:54'),
(110, '25 Shireenah St - Zone 1 - Abu Dhabi - United Arab Emirates', '24.4854113', '54.36831420000001', 'villa', 'back said of Etihad building', 'shireenah st', '25', NULL, '92', '0505141442', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-10 05:45:37', '2020-09-10 05:45:37'),
(111, '441 شارع سعيد بن شخبوط الأول - Falaj Hazzaa - Abu Dhabi - United Arab Emirates', '24.1813229', '55.7264048', 'villa', 'house', 'street 1', 'house 441', NULL, '94', '0505062350', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-11 05:50:22', '2020-09-11 05:50:22'),
(112, '441 شارع سعيد بن شخبوط الأول - Falaj Hazzaa - Abu Dhabi - United Arab Emirates', '24.1813229', '55.7264048', 'villa', 'house', 'street 1', 'house 441', NULL, '94', '0505062350', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-11 05:50:23', '2020-09-11 05:50:23'),
(113, '19 شارع الكديد - Khalifa CitySE-12 - أبوظبي - United Arab Emirates', '24.4253937', '54.5751505', 'villa', 'villa', '38', '19', NULL, '97', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-12 14:45:12', '2020-09-12 14:45:12'),
(114, '11 Mshaybi\' St - Al NahyanE25 - Abu Dhabi - United Arab Emirates', '24.4662407', '54.38535009999999', 'apt', 'Same building of al sultan bakery', '9/first floor/104', NULL, NULL, '98', '0509774111', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-13 02:27:12', '2020-09-13 02:27:12'),
(115, '40 شارع القائد - Mohamed Bin Zayed CityZ17 - أبوظبي - United Arab Emirates', '24.3414377', '54.5493164', 'villa', 'villa', '40', '21', NULL, '99', '0507468673', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-13 06:07:26', '2020-09-13 06:07:26'),
(116, '16 شارع الوثب - Khalifa CitySE-6 - أبوظبي - United Arab Emirates', '24.4027604', '54.5794587', 'villa', 'villa 12', '16', '12', NULL, '100', '+971 56 773 6942', 'Abu Dhabi', 'Select Area', '0', '2020-09-13 13:42:12', '2020-09-29 14:37:26'),
(117, '12 شارع الوثب - Khalifa CitySE-6 - Abu Dhabi - United Arab Emirates', '24.4031436', '54.5793031', 'villa', 'villa 12', '16', '12', NULL, '100', '0521788874', 'Abu Dhabi', 'Abu Dhabi', '1', '2020-09-13 13:42:13', '2020-09-13 13:42:22'),
(118, '4 شارع جَنَاح - Zone 1E6 - Abu Dhabi - United Arab Emirates', '24.4891625', '54.3588688', 'apt', '1', '403', NULL, NULL, '13', '0564180384', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-15 03:05:41', '2020-09-15 03:05:41'),
(119, 'NYU Abu Dhabi A3 West Admin Bldg - E 12 - Al Sa\'DiyatSaadiyat Marina District - Abu Dhabi - United Arab Emirates', '24.5237037', '54.4334016', 'apt', '12', '23', '35', NULL, '101', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-16 02:42:22', '2020-09-16 02:42:22'),
(120, '45 شارع الحِمْرَار - Al Sa\'Adah - Abu Dhabi - United Arab Emirates', '24.4316669', '54.4354963', 'apt', 'guardian tower', '1209', 'near mosaic restaurant', NULL, '103', '0521906363', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-17 00:42:18', '2020-09-17 00:42:18'),
(121, '3 شارع المقسوم - Jarn YafourBaniyas West - Abu Dhabi - United Arab Emirates', '24.2995808', '54.6186348', 'villa', 'villa', 'maqsoom3', 'villa 3', NULL, '104', '0502000774', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-19 02:54:44', '2020-09-19 02:54:44'),
(122, '43 Al Muthil St - Zone 1Rowdhat Abu Dhabi - Abu Dhabi - United Arab Emirates', '24.4199592', '54.4627853', 'apt', 'c70', '910', NULL, NULL, '87', '917547774414', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-19 02:56:47', '2020-09-19 02:56:47'),
(123, '86 شارع عبدالله عمران تريم - Najmat Abu Dhabi - Abu Dhabi - United Arab Emirates', '24.4878371', '54.40604', 'apt', 'Al Muhaimat', '3207', NULL, NULL, '25', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-21 00:34:37', '2020-09-21 00:34:37'),
(124, '27 Al Wajihah St - Khalifa CitySE-15 - Abu Dhabi - United Arab Emirates', '24.4080829', '54.5809063', 'villa', 'villa 29', 'khalifa city A - street 34', 'villa 29', NULL, '106', '0559949949', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-22 08:48:34', '2020-09-22 08:48:34'),
(125, '43 شارع بَرْقَا السَّلاَهِب - Shakhbout CityMFW-22 - Abu Dhabi - United Arab Emirates', '24.3818357', '54.64630390000001', 'villa', '43', 'barqa alsalahib', NULL, NULL, '107', '0501111971', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-22 23:28:09', '2020-09-22 23:28:09'),
(126, '8 Niqa Al Houz St - Al NahyanE25 - Abu Dhabi - United Arab Emirates', '24.4660792', '54.3851407', 'apt', 'vision 2', '1006', NULL, NULL, '109', '0506614149', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-23 15:59:38', '2020-09-23 15:59:38'),
(127, '7 شارع العارف - Khalifa CitySE 26 - Abu Dhabi - United Arab Emirates', '24.4058845', '54.5918845', 'villa', 'compound 7', '48', '5', NULL, '111', '0558868667', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-24 00:58:22', '2020-09-24 00:58:22'),
(128, '7 شارع العارف - Khalifa CitySE 26 - Abu Dhabi - United Arab Emirates', '24.4058845', '54.5918845', 'villa', 'compound 7', '48', '5', NULL, '111', '0558868667', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-24 00:58:22', '2020-09-24 00:58:22'),
(129, '157 شارع زاخِر - Khalifa CitySW-4 - Abu Dhabi - United Arab Emirates', '24.4099137', '54.5591216', 'villa', 'Khalifa City', '28', '157', NULL, '112', '0505332442', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-24 13:11:38', '2020-09-24 13:11:38'),
(130, '5 شارع رَمْلَة السَّاحِب - Shakhbout CityMFW-3 - Abu Dhabi - United Arab Emirates', '24.3443309', '54.6185179', 'villa', '5', '27', '5', NULL, '113', '0558332558', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-25 00:04:05', '2020-09-25 00:04:05'),
(131, 'Abu Dhabi National Exhibition Centre - Al Ma\'aridCapital Centre - Abu Dhabi - United Arab Emirates', '24.4208122', '54.4390744', 'hotel', 'Aloft Hotel', '640', NULL, NULL, '114', '0565754453', 'Abu Dhabi', 'Select Area', '0', '2020-09-26 04:36:45', '2020-10-20 06:58:16'),
(132, 'Al Khalidiyah - Abu Dhabi - United Arab Emirates', '24.4652812', '54.352293', 'apt', 'desert tower', '404', NULL, NULL, '115', '0551080034', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-26 05:04:23', '2020-09-26 05:04:23'),
(133, 'Al Khalidiyah - Abu Dhabi - United Arab Emirates', '24.4652812', '54.352293', 'apt', 'desert tower', '404', NULL, NULL, '115', '0551080034', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-26 05:04:24', '2020-09-26 05:04:24'),
(134, '8 شارع الحجلية - Al Falah - أبوظبي - United Arab Emirates', '24.4237526', '54.7180773', 'villa', '8', '8', '8', NULL, '116', '0566666213', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-26 05:56:02', '2020-09-26 05:56:02'),
(135, '8 شارع الحجلية - Al Falah - أبوظبي - United Arab Emirates', '24.4237526', '54.7180773', 'villa', '8', '8', '8', NULL, '116', '0566666213', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-26 05:56:03', '2020-09-26 05:56:03'),
(136, '6th St - MusaffahM-14 - Abu Dhabi - United Arab Emirates', '24.3810186', '54.4938727', 'office', 'local car care', '025557009', NULL, NULL, '35', '0508010179', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-09-26 12:11:11', '2020-09-26 12:11:11'),
(137, 'Arabian Ranches - Dubai - United Arab Emirates', '25.0523684', '55.26736019999999', 'villa', 'samra', 'samara', '315', NULL, '119', NULL, 'Abu Dhabi', 'Abu Dhabi', '1', '2020-09-30 07:46:34', '2020-09-30 07:47:10'),
(138, 'Arabian Ranches - Dubai - United Arab Emirates', '25.0523684', '55.26736019999999', 'villa', 'samra', 'samara', '315', NULL, '119', NULL, 'Abu Dhabi', 'Abu Dhabi', '1', '2020-09-30 07:46:35', '2020-09-30 07:47:11'),
(139, 'Arabian Ranches - Dubai - United Arab Emirates', '25.0523684', '55.26736019999999', 'villa', 'samra', 'samara', '315', NULL, '119', NULL, 'Abu Dhabi', 'Abu Dhabi', '1', '2020-09-30 07:46:39', '2020-09-30 07:47:12'),
(140, '105 شارع زاخِر - Khalifa CitySector 32 - أبوظبي - United Arab Emirates', '24.4154816', '54.5571739', 'villa', 'house', 'dont know', '103', NULL, '123', '0558852018', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-06 04:07:10', '2020-10-06 04:07:10'),
(141, '247 شارع التشريف - Khalifa CitySE-25 - أبوظبي - United Arab Emirates', '24.4102513', '54.59467369999999', 'villa', 'privet', '58', '10', NULL, '125', '0508023857', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-12 01:35:57', '2020-10-12 01:35:57'),
(142, '150 Jabir Bin Hayyan St - Al Mushrif - Abu Dhabi - United Arab Emirates', '24.4437071', '54.39248629999999', 'villa', '152', 'شارع ‏جابر ‏بن ‏حيان', '152', NULL, '131', '0553936664', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-19 06:40:15', '2020-10-19 06:40:15'),
(143, '150 Jabir Bin Hayyan St - Al Mushrif - Abu Dhabi - United Arab Emirates', '24.4437071', '54.39248629999999', 'villa', '152', 'شارع ‏جابر ‏بن ‏حيان', '152', NULL, '131', '0553936664', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-19 06:40:15', '2020-10-19 06:40:15'),
(144, 'Khalifa Street - شارع الكورنيش الشرقي - Zone 1E9-01 - أبو ظبي - United Arab Emirates', '24.49858459999999', '54.3678581', 'apt', 'Capital Plaza Tower', '403', NULL, NULL, '134', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-27 04:14:32', '2020-10-27 04:14:32'),
(145, 'Khalifa Street - شارع الكورنيش الشرقي - Zone 1E9-01 - أبو ظبي - United Arab Emirates', '24.49858459999999', '54.3678581', 'apt', 'Capital Plaza Tower', '403', NULL, NULL, '134', NULL, 'Abu Dhabi', 'Abu Dhabi', '1', '2020-10-27 04:14:32', '2020-10-27 04:14:46'),
(146, 'Unnamed Road - Al \'Azeeziyyah - Abu Dhabi - United Arab Emirates', '23.4674389', '53.967808', 'apt', 'villa gloria resort, kayigbak', '245', NULL, NULL, '135', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:34:34', '2020-10-28 21:34:34'),
(147, 'Unnamed Road - Al \'Azeeziyyah - Abu Dhabi - United Arab Emirates', '23.4674389', '53.967808', 'apt', 'villa gloria resort, kayigbak', '245', NULL, NULL, '135', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:34:35', '2020-10-28 21:34:35'),
(148, '110 شارع الرُّوَيْسِي - Al NahyanE20-02 - Abu Dhabi - United Arab Emirates', '24.4599702', '54.3811702', 'apt', '42627hbe7hs h7shs', '1346', NULL, NULL, '135', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:42:40', '2020-10-28 21:42:40'),
(149, 'Unnamed Road, San Jose del Monte City, Bulacan, Philippines', '14.8233937', '121.067129', 'villa', 'california', 'jsjs', 'bzbzhz', NULL, '137', '09770195470', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:45:48', '2020-10-28 21:45:48'),
(150, 'Unnamed Road, San Jose del Monte City, Bulacan, Philippines', '14.8233937', '121.067129', 'villa', 'california', 'jsjs', 'bzbzhz', NULL, '137', '09770195470', 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:45:49', '2020-10-28 21:45:49'),
(151, 'Dubai - Nadd Al Hamar - Dubai - United Arab Emirates', '25.1852317', '55.3732075', 'villa', 'arave jt uja', 'ncjcjc', 'cnfjd', NULL, '138', NULL, 'Abu Dhabi', 'Abu Dhabi', '0', '2020-10-28 21:50:34', '2020-10-28 21:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2020_03_08_230016_create_categories_table', 1),
(9, '2020_03_08_230035_create_services_table', 1),
(10, '2020_03_08_235514_create_customers_table', 1),
(11, '2020_03_08_235924_create_orders_table', 1),
(12, '2020_03_09_001236_create_order_items_table', 1),
(13, '2020_03_12_002220_create_roles_table', 1),
(14, '2020_04_08_131927_create_coupons_table', 2),
(15, '2020_04_09_131829_create_home_sliders_table', 3),
(16, '2020_04_10_150846_create_agents_table', 4),
(17, '2020_04_17_170031_create_weeks_table', 5),
(18, '2020_04_17_170048_create_schedules_table', 5),
(19, '2020_04_24_110335_create_manage_addresses_table', 6),
(20, '2020_05_03_135559_create_items_table', 7),
(21, '2020_07_09_105623_create_cities_table', 8),
(22, '2020_07_09_105640_create_areas_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_driver_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_driver_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `pickup_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_complete` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `date`, `agent_id`, `pickup_driver_id`, `delivery_driver_id`, `total`, `payment_type`, `pickup_date`, `pickup_time`, `delivery_date`, `delivery_time`, `address_id`, `status`, `created_at`, `updated_at`, `delivery_option`, `coupon_id`, `coupon_value`, `coupon_code`, `remark`, `order_complete`, `payment_status`) VALUES
(111, '28', '2020-08-06', NULL, NULL, NULL, '118', '0', 'Aug 07', '08:00 AM - 11:00 AM', NULL, NULL, '77', '5', '2020-08-05 18:42:27', '2020-09-06 11:42:02', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(112, '31', '2020-08-06', NULL, NULL, NULL, '145', '0', 'Aug 06', '02:00 PM - 04:00 PM', NULL, NULL, '78', '4', '2020-08-06 03:43:02', '2020-08-23 06:52:27', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(114, '29', '2020-08-06', NULL, NULL, NULL, '67', '0', 'Aug 07', '04:00 PM - 08:00 PM', NULL, NULL, '79', '5', '2020-08-06 05:50:52', '2020-08-08 10:58:40', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(116, '32', '2020-08-06', NULL, NULL, NULL, '93', '0', 'Aug 06', NULL, NULL, NULL, '81', '5', '2020-08-06 07:01:36', '2020-09-06 10:03:57', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(118, '36', '2020-08-07', NULL, NULL, NULL, '168', '0', 'Aug 07', '02:00 PM - 04:00 PM', NULL, NULL, '83', '4', '2020-08-07 02:25:28', '2020-08-12 07:44:19', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(119, '37', '2020-08-08', NULL, NULL, NULL, '62', '0', 'Aug 08', '02:00 PM - 04:00 PM', NULL, NULL, '84', '5', '2020-08-07 23:14:59', '2020-08-23 06:53:10', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(120, '13', '2020-08-08', NULL, NULL, NULL, '18.0', '0', 'Aug 08', '02:00 PM - 04:00 PM', NULL, NULL, '85', '5', '2020-08-08 01:33:26', '2020-08-12 07:35:17', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(124, '31', '2020-08-08', NULL, NULL, NULL, '0.0', '0', 'Aug 09', '03:00 PM - 05:00 PM', NULL, NULL, '78', '5', '2020-08-08 12:29:04', '2020-08-13 09:32:55', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(130, '32', '2020-08-11', NULL, NULL, NULL, '10', '0', 'Aug 12', '08:00 AM - 10:00 AM', NULL, NULL, '81', '5', '2020-08-11 10:34:28', '2020-09-06 10:05:02', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(134, '46', '2020-08-12', NULL, NULL, NULL, '211', '0', 'Aug 12', '10:00 AM - 12:00 PM', NULL, NULL, '87', '5', '2020-08-11 22:56:06', '2020-08-13 08:49:06', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(137, '49', '2020-08-12', NULL, NULL, NULL, '105.0', '0', 'Aug 12', '03:00 PM - 05:00 PM', NULL, NULL, '88', '5', '2020-08-12 04:10:00', '2020-08-15 02:08:57', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(142, '52', '2020-08-13', NULL, NULL, NULL, '80.0', '0', 'Aug 13', '07:00PM - 09:00PM', NULL, NULL, '92', '5', '2020-08-13 09:07:04', '2020-08-30 04:57:45', 'standard', 'null', '0.0', 'HYC', NULL, '0', 1),
(145, '56', '2020-08-15', NULL, NULL, NULL, '32', '0', 'Aug 15', '05:00 PM - 07:00 PM', NULL, NULL, '93', '5', '2020-08-15 06:13:57', '2020-08-23 06:54:23', 'standard', 'null', '0.0', NULL, NULL, '0', 1),
(146, '57', '2020-08-16', NULL, NULL, NULL, '0.0', '0', 'Aug 17', NULL, NULL, NULL, '94', '0', '2020-08-16 06:15:06', '2020-08-16 06:15:06', 'express', 'null', '0.0', NULL, NULL, '0', 0),
(148, '57', '2020-08-16', NULL, NULL, NULL, '36', '0', 'Aug 17', NULL, NULL, NULL, '94', '5', '2020-08-16 06:15:09', '2020-08-16 12:23:13', 'express', 'null', '0.0', NULL, NULL, '1', 1),
(152, '62', '2020-08-17', NULL, NULL, NULL, '22', '0', 'Aug 18', '03:00 PM - 05:00 PM', NULL, NULL, '97', '5', '2020-08-16 18:54:45', '2020-09-08 10:56:08', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(153, '59', '2020-08-17', NULL, NULL, NULL, '64', '0', 'Aug 18', '08:00 AM - 10:00 AM', NULL, NULL, '100', '5', '2020-08-17 12:30:22', '2020-08-18 07:32:49', 'express', 'null', '0.0', NULL, NULL, '1', 1),
(154, '23', '2020-08-19', NULL, NULL, NULL, '38', '0', 'Aug 19', '03:00 PM - 05:00 PM', NULL, NULL, '101', '5', '2020-08-19 04:14:23', '2020-08-24 01:37:16', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(157, '38', '2020-08-19', NULL, NULL, NULL, '65.5', '0', 'Aug 22', '10:00 AM - 12:00 PM', NULL, NULL, '103', '0', '2020-08-19 13:39:21', '2020-08-19 13:39:21', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(159, '35', '2020-08-22', NULL, NULL, NULL, '17', '0', 'Aug 22', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-08-22 02:09:36', '2020-09-01 03:28:19', 'standard', 'null', '0.0', NULL, 'need tody Delvery', '1', 0),
(162, '15', '2020-08-28', NULL, NULL, NULL, '90', '0', 'Aug 28', '05:00 PM - 07:00 PM', NULL, NULL, '72', '5', '2020-08-28 07:11:45', '2020-08-31 00:57:47', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(164, '35', '2020-08-29', NULL, NULL, NULL, '77', '0', 'Aug 29', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-08-29 02:54:15', '2020-09-01 03:23:43', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(165, '85', '2020-08-29', NULL, NULL, NULL, '138.5', '0', 'Aug 30', NULL, NULL, NULL, '108', '5', '2020-08-29 10:29:49', '2020-08-30 04:57:59', 'standard', '15', '42.0', 'hyc', NULL, '1', 1),
(166, '85', '2020-08-29', NULL, NULL, NULL, '138.5', '0', 'Aug 30', NULL, NULL, NULL, '108', '5', '2020-08-29 10:29:51', '2020-08-30 04:56:34', 'standard', '15', '42.0', 'hyc', NULL, '1', 1),
(167, '28', '2020-08-31', NULL, NULL, NULL, '41', '0', 'Aug 31', '03:00 PM - 05:00 PM', NULL, NULL, '77', '5', '2020-08-31 05:01:46', '2020-09-06 11:42:14', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(169, '35', '2020-09-03', NULL, NULL, NULL, '0.0', '0', 'Sep 03', '03:00 PM - 05:00 PM', NULL, NULL, '105', '0', '2020-09-03 01:48:16', '2020-09-03 01:48:16', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(170, '35', '2020-09-03', NULL, NULL, NULL, '27.5', '0', 'Sep 03', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-09-03 01:48:17', '2020-09-05 03:23:26', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(171, '29', '2020-09-03', NULL, NULL, NULL, '0.0', '0', 'Sep 03', '05:00 PM - 07:00 PM', NULL, NULL, '96', '0', '2020-09-03 05:59:05', '2020-09-16 03:26:17', 'standard', 'null', '0.0', NULL, NULL, '0', 1),
(172, '13', '2020-09-03', NULL, NULL, NULL, '36.0', '0', 'Sep 03', NULL, NULL, NULL, '69', '4', '2020-09-03 07:52:04', '2020-09-03 08:27:53', 'standard', 'null', '0.0', NULL, 'testing testing', '0', 0),
(173, '35', '2020-09-05', NULL, NULL, NULL, '65', '0', 'Sep 05', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-09-05 03:27:15', '2020-09-07 03:20:27', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(174, '91', '2020-09-05', NULL, NULL, NULL, '65', '0', 'Sep 06', '07:00 PM - 09:00 PM', NULL, NULL, '109', '5', '2020-09-05 15:50:16', '2020-09-08 11:01:55', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(175, '92', '2020-09-10', NULL, NULL, NULL, '65.0', '0', 'Sep 10', '05:00 PM - 07:00 PM', NULL, NULL, '110', '0', '2020-09-10 05:48:54', '2020-09-10 05:48:54', 'standard', 'null', '0.0', NULL, 'I don’t know how many laundry box i need', '0', 0),
(176, '35', '2020-09-10', NULL, NULL, NULL, '65', '0', 'Sep 10', '05:00 PM - 07:00 PM', NULL, NULL, '105', '5', '2020-09-10 07:07:58', '2020-09-14 02:48:07', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(177, '38', '2020-09-10', NULL, NULL, NULL, '130', '0', 'Sep 10', '07:00 PM - 09:00 PM', NULL, NULL, '103', '5', '2020-09-10 08:00:41', '2020-09-13 14:21:28', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(184, '99', '2020-09-14', NULL, NULL, NULL, '65.0', '0', 'Sep 14', '03:00 PM - 05:00 PM', NULL, NULL, '115', '5', '2020-09-14 02:43:59', '2020-09-16 03:04:36', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(185, '29', '2020-09-14', NULL, NULL, NULL, '65', '0', 'Sep 14', '07:00 PM - 09:00 PM', NULL, NULL, '96', '5', '2020-09-14 06:49:23', '2020-09-15 10:18:46', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(186, '35', '2020-09-15', NULL, NULL, NULL, '65', '0', 'Sep 15', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-09-15 02:32:04', '2020-09-17 12:33:26', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(187, '13', '2020-09-15', NULL, NULL, NULL, '31.0', '0', NULL, NULL, NULL, NULL, '69', '0', '2020-09-15 13:09:49', '2020-09-15 13:09:49', 'standard', 'null', '0.0', NULL, 'testing', '0', 0),
(188, '13', '2020-09-15', NULL, NULL, NULL, '31.0', '0', NULL, NULL, NULL, NULL, '69', '0', '2020-09-15 13:09:51', '2020-09-15 13:09:51', 'standard', 'null', '0.0', NULL, 'testing', '0', 0),
(191, '103', '2020-09-17', NULL, NULL, NULL, '65', '0', 'Sep 17', '03:00 PM - 05:00 PM', NULL, NULL, '120', '5', '2020-09-17 00:44:45', '2020-09-21 00:10:44', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(192, '87', '2020-09-19', NULL, NULL, NULL, '35.0', '0', 'Sep 19', '03:00 PM - 05:00 PM', NULL, NULL, '122', '5', '2020-09-19 03:04:54', '2020-09-23 06:59:50', 'standard', 'null', '0.0', NULL, 'only abaya shila kandora qitra I want hanging ,', '1', 0),
(193, '87', '2020-09-19', NULL, NULL, NULL, '35.0', '0', 'Sep 19', '03:00 PM - 05:00 PM', NULL, NULL, '122', '5', '2020-09-19 03:04:55', '2020-09-21 00:11:29', 'standard', 'null', '0.0', NULL, 'only abaya shila kandora qitra I want hanging ,', '1', 1),
(194, '99', '2020-09-19', NULL, NULL, NULL, '130.0', '0', 'Sep 20', '10:00 AM - 12:00PM', NULL, NULL, '115', '5', '2020-09-19 09:45:39', '2020-09-22 03:10:53', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(195, '99', '2020-09-19', NULL, NULL, NULL, '130.0', '0', 'Sep 20', '10:00 AM - 12:00PM', NULL, NULL, '115', '5', '2020-09-19 09:45:40', '2020-09-22 03:03:52', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(196, '104', '2020-09-20', NULL, NULL, NULL, '70', '0', 'Sep 20', '10:00 AM - 12:00PM', NULL, NULL, '121', '5', '2020-09-19 23:14:05', '2020-09-23 16:07:19', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(197, '35', '2020-09-20', NULL, NULL, NULL, '65', '0', 'Sep 20', '03:00 PM - 05:00 PM', NULL, NULL, '105', '5', '2020-09-20 02:58:49', '2020-09-21 10:18:02', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(198, '87', '2020-09-22', NULL, NULL, NULL, '48.0', '0', 'Sep 22', '03:00 PM - 05:00 PM', NULL, NULL, '122', '0', '2020-09-22 02:12:53', '2020-09-22 02:12:53', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(199, '87', '2020-09-22', NULL, NULL, NULL, '48.0', '0', 'Sep 22', '03:00 PM - 05:00 PM', NULL, NULL, '122', '0', '2020-09-22 02:12:54', '2020-09-22 02:12:54', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(200, '87', '2020-09-22', NULL, NULL, NULL, '48', '0', 'Sep 22', '03:00 PM - 05:00 PM', NULL, NULL, '122', '0', '2020-09-22 02:12:55', '2020-09-22 09:26:20', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(201, '87', '2020-09-22', NULL, NULL, NULL, '48', '0', 'Sep 22', '03:00 PM - 05:00 PM', NULL, NULL, '122', '3', '2020-09-22 02:12:56', '2020-09-22 08:50:20', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(202, '106', '2020-09-22', NULL, NULL, NULL, '0.0', '0', 'Sep 26', '10:00 AM - 12:00 PM', NULL, NULL, '124', '0', '2020-09-22 08:50:32', '2020-09-22 08:50:32', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(203, '106', '2020-09-22', NULL, NULL, NULL, '65', '0', 'Sep 26', '10:00 AM - 12:00 PM', NULL, NULL, '124', '5', '2020-09-22 08:50:33', '2020-09-27 09:48:24', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(207, '107', '2020-09-23', NULL, NULL, NULL, '65', '0', 'Sep 23', '10:00 AM - 12:00 PM', NULL, NULL, '125', '5', '2020-09-22 23:31:04', '2020-09-24 09:15:45', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(211, '104', '2020-09-23', NULL, NULL, NULL, '70', '0', 'Sep 24', '08:00 AM - 10:00 AM', NULL, NULL, '121', '5', '2020-09-23 11:35:23', '2020-09-24 09:16:24', 'standard', '15', '5.0', 'HYC', 'Fahed Al Qubaisi', '1', 0),
(212, '31', '2020-09-23', NULL, NULL, NULL, '32', '0', 'Sep 24', '10:00 AM - 12:00 PM', NULL, NULL, '78', '5', '2020-09-23 13:29:38', '2020-09-27 11:01:57', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(216, '109', '2020-09-23', NULL, NULL, NULL, '105', '0', 'Sep 24', '03:00 PM - 05:00 PM', NULL, NULL, '126', '5', '2020-09-23 16:04:26', '2020-09-27 07:01:07', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(217, '87', '2020-09-24', NULL, NULL, NULL, '48.0', '0', 'Sep 24', '10:00 AM - 12:00 PM', NULL, NULL, '122', '0', '2020-09-23 23:02:07', '2020-09-23 23:02:07', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(218, '87', '2020-09-24', NULL, NULL, NULL, '48.0', '0', 'Sep 24', '10:00 AM - 12:00 PM', NULL, NULL, '122', '5', '2020-09-23 23:02:08', '2020-09-27 06:24:05', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(223, '111', '2020-09-24', NULL, NULL, NULL, '96.0', '0', 'Sep 24', '03:00 PM - 05:00 PM', NULL, NULL, '127', '5', '2020-09-24 01:11:22', '2020-09-27 10:42:21', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(225, '113', '2020-09-25', NULL, NULL, NULL, '130', '0', NULL, NULL, NULL, NULL, '130', '5', '2020-09-25 00:06:32', '2020-10-01 01:05:24', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(226, '114', '2020-09-26', NULL, NULL, NULL, '65', '0', 'Sep 26', '03:00 PM - 05:00 PM', NULL, NULL, '131', '5', '2020-09-26 04:39:37', '2020-09-27 01:47:01', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(228, '115', '2020-09-26', NULL, NULL, NULL, '91', '0', 'Sep 26', '03:00 PM - 05:00 PM', NULL, NULL, '132', '5', '2020-09-26 05:05:05', '2020-09-28 08:51:00', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(231, '35', '2020-09-26', NULL, NULL, NULL, '20', '0', 'Sep 27', '08:00 AM - 10:00 AM', NULL, NULL, '136', '5', '2020-09-26 12:11:40', '2020-09-27 10:47:50', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(232, '114', '2020-09-27', NULL, NULL, NULL, '65.0', '0', 'Sep 27', '03:00 PM - 05:00 PM', NULL, NULL, '131', '0', '2020-09-27 01:50:13', '2020-09-27 01:50:13', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(233, '114', '2020-09-27', NULL, NULL, NULL, '65.0', '0', 'Sep 27', '03:00 PM - 05:00 PM', NULL, NULL, '131', '0', '2020-09-27 01:50:14', '2020-09-27 01:50:14', 'standard', 'null', '0.0', NULL, NULL, '0', 0),
(235, '99', '2020-09-27', NULL, NULL, NULL, '65.0', '0', 'Sep 28', '03:00 PM - 05:00 PM', NULL, NULL, '115', '5', '2020-09-27 12:14:49', '2020-09-29 09:01:33', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(237, '87', '2020-09-29', NULL, NULL, NULL, '35.0', '0', 'Sep 30', '08:00 AM - 10:00 AM', NULL, NULL, '122', '5', '2020-09-29 12:57:31', '2020-10-03 03:30:13', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(241, '100', '2020-09-29', NULL, NULL, NULL, '42.0', '0', 'Sep 30', '10:00 AM - 12:00 PM', NULL, NULL, '116', '5', '2020-09-29 14:29:08', '2020-10-05 08:51:32', 'standard', '15', '6.0', 'HYC', NULL, '1', 0),
(243, '15', '2020-09-30', NULL, NULL, NULL, '39', '0', 'Sep 30', '03:00 PM - 05:00 PM', NULL, NULL, '72', '5', '2020-09-30 02:27:52', '2020-10-04 09:06:13', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(244, '104', '2020-09-30', NULL, NULL, NULL, '70.0', '0', 'Oct 01', '10:00 AM - 12:00 PM', NULL, NULL, '121', '5', '2020-09-30 14:10:06', '2020-10-25 11:24:01', 'express', '15', '11.0', 'hyc', NULL, '1', 1),
(245, '107', '2020-10-01', NULL, NULL, NULL, '130.0', '0', 'Oct 01', '10:00 AM - 12:00 PM', NULL, NULL, '125', '5', '2020-09-30 23:52:09', '2020-10-15 03:41:35', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(247, '87', '2020-10-03', NULL, NULL, NULL, '35.0', '0', 'Oct 03', '03:00 PM - 05:00 PM', NULL, NULL, '122', '5', '2020-10-03 03:02:53', '2020-10-04 08:40:26', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(251, '114', '2020-10-03', NULL, NULL, NULL, '65.0', '0', 'Oct 04', '08:00 AM - 10:00 AM', NULL, NULL, '131', '5', '2020-10-03 11:18:07', '2020-10-06 03:09:39', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(252, '35', '2020-10-04', NULL, NULL, NULL, '65', '0', 'Oct 04', '03:00 PM - 05:00 PM', NULL, NULL, '136', '5', '2020-10-04 01:29:43', '2020-10-06 00:39:45', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(255, '100', '2020-10-05', NULL, NULL, NULL, '55.0', '0', 'Oct 05', '10:00 AM - 12:00 PM', NULL, NULL, '116', '5', '2020-10-05 00:17:19', '2020-10-07 03:53:22', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(256, '114', '2020-10-06', NULL, NULL, NULL, '65.0', '0', 'Oct 06', '03:00 PM - 05:00 PM', NULL, NULL, '131', '5', '2020-10-06 01:44:44', '2020-10-07 09:47:19', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(262, '104', '2020-10-10', NULL, NULL, NULL, '35.0', '0', 'Oct 10', '07:00 PM - 09:00 PM', NULL, NULL, '121', '0', '2020-10-10 09:13:44', '2020-10-25 11:25:29', 'standard', '15', '5.0', 'hyc', NULL, '0', 1),
(263, '35', '2020-10-10', NULL, NULL, NULL, '65', '0', 'Oct 11', '08:00 AM - 10:00 AM', NULL, NULL, '136', '5', '2020-10-10 11:15:45', '2020-10-13 08:53:25', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(264, '104', '2020-10-10', NULL, NULL, NULL, '70', '0', 'Oct 11', '08:00 AM - 10:00 AM', NULL, NULL, '121', '5', '2020-10-10 14:22:39', '2020-10-25 11:25:17', 'standard', '15', '5.0', 'hyc', NULL, '1', 1),
(267, '87', '2020-10-12', NULL, NULL, NULL, '70', '0', 'Oct 12', '03:00 PM - 05:00 PM', NULL, NULL, '122', '5', '2020-10-12 01:31:17', '2020-10-14 10:21:01', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(269, '107', '2020-10-12', NULL, NULL, NULL, '65', '0', 'Oct 12', '05:00 PM - 07:00 PM', NULL, NULL, '125', '5', '2020-10-12 06:34:56', '2020-10-14 07:49:13', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(270, '35', '2020-10-13', NULL, NULL, NULL, '65', '0', NULL, NULL, NULL, NULL, '136', '5', '2020-10-13 09:55:00', '2020-10-15 03:43:22', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(271, '11', '2020-10-16', NULL, NULL, NULL, '65.0', '0', NULL, NULL, NULL, NULL, '73', '4', '2020-10-16 06:42:58', '2020-10-19 07:50:26', 'standard', '15', '10.0', 'hyc', 'tomorrow morning', '0', 0),
(273, '35', '2020-10-19', NULL, NULL, NULL, '65', '0', 'Oct 19', '05:00 PM - 07:00 PM', NULL, NULL, '136', '5', '2020-10-19 05:45:06', '2020-10-20 11:55:41', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(275, '15', '2020-10-19', NULL, NULL, NULL, '21', '0', 'Oct 19', '05:00 PM - 07:00 PM', NULL, NULL, '72', '5', '2020-10-19 07:18:32', '2020-10-25 11:22:56', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(276, '114', '2020-10-20', NULL, NULL, NULL, '65.0', '0', 'Oct 20', '05:00 PM - 07:00 PM', NULL, NULL, '131', '5', '2020-10-20 06:57:06', '2020-10-24 12:57:53', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(277, '104', '2020-10-20', NULL, NULL, NULL, '35.0', '0', 'Oct 21', '08:00 AM - 10:00 AM', NULL, NULL, '121', '5', '2020-10-20 14:12:42', '2020-10-22 01:30:06', 'standard', 'null', '0.0', 'HY', NULL, '1', 0),
(279, '107', '2020-10-24', NULL, NULL, NULL, '130.0', '0', 'Oct 24', '07:00 PM - 09:00 PM', NULL, NULL, '125', '5', '2020-10-24 09:29:29', '2020-10-26 08:19:39', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(283, '131', '2020-10-25', NULL, NULL, NULL, '35', '0', 'Oct 26', '08:00 AM - 10:00 AM', NULL, NULL, '142', '5', '2020-10-25 11:18:23', '2020-10-28 07:59:12', 'standard', 'null', '0.0', NULL, NULL, '1', 1),
(284, '87', '2020-10-25', NULL, NULL, NULL, '130.0', '0', 'Oct 26', '08:00 AM - 10:00 AM', NULL, NULL, '122', '5', '2020-10-25 12:13:22', '2020-10-28 11:30:39', 'standard', '15', '20.0', 'HYC', NULL, '1', 1),
(285, '104', '2020-10-26', NULL, NULL, NULL, '35.0', '0', 'Oct 26', '03:00 PM - 05:00 PM', NULL, NULL, '121', '5', '2020-10-26 00:48:47', '2020-10-27 03:50:52', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(286, '35', '2020-10-26', NULL, NULL, NULL, '65', '0', 'Oct 27', NULL, NULL, NULL, '136', '5', '2020-10-26 10:21:07', '2020-10-27 11:39:27', 'standard', 'null', '0.0', NULL, NULL, '1', 0),
(287, '25', '2020-10-27', NULL, NULL, NULL, '130', '0', 'Oct 27', '03:00 PM - 05:00 PM', NULL, NULL, '123', '5', '2020-10-27 04:01:06', '2020-10-28 07:51:37', 'standard', 'null', '0.0', NULL, '10 Abaya and 5 shila', '0', 0),
(288, '134', '2020-10-27', NULL, NULL, NULL, '65.0', '0', 'Oct 27', '05:00 PM - 07:00 PM', NULL, NULL, '144', '3', '2020-10-27 04:18:38', '2020-10-27 08:56:33', 'standard', 'null', '0.0', NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `laundry_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dry_clean_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iron_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `laundry_qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dry_clean_qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iron_qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `date`, `order_id`, `service_id`, `qty`, `price`, `created_at`, `updated_at`, `item_id`, `laundry_price`, `dry_clean_price`, `iron_price`, `laundry_qty`, `dry_clean_qty`, `iron_qty`, `unique_value`, `total`, `status`) VALUES
(80, '2020-08-05', '93', NULL, NULL, NULL, '2020-08-04 03:08:46', '2020-08-04 03:08:46', '2', '5', '8', '3', '1', '0', '0', NULL, '5.0', NULL),
(81, NULL, '93', NULL, NULL, NULL, '2020-08-04 03:08:46', '2020-08-04 03:08:46', '1', '10', '15', '6', '1', '0', '0', NULL, '10.0', NULL),
(82, NULL, '93', NULL, NULL, NULL, '2020-08-04 03:08:46', '2020-08-04 03:08:46', '4', '-', '8', '-', '0', '1', '0', NULL, '8.0', NULL),
(83, NULL, '94', NULL, NULL, NULL, '2020-08-04 05:17:19', '2020-08-04 05:17:19', '1', '10', '15', '6', '4', '0', '0', NULL, '40.0', NULL),
(84, '2020-08-05', '95', NULL, NULL, NULL, '2020-08-04 05:20:08', '2020-08-04 05:20:08', '1', '10', '15', '6', '0', '4', '0', NULL, '60.0', NULL),
(85, NULL, '96', NULL, NULL, NULL, '2020-08-04 05:20:11', '2020-08-04 05:20:11', '1', '10', '15', '6', '0', '4', '0', NULL, '60.0', NULL),
(86, NULL, '98', NULL, NULL, NULL, '2020-08-04 05:20:11', '2020-08-04 05:20:11', '1', '10', '15', '6', '0', '4', '0', NULL, '60.0', NULL),
(87, '2020-08-05', '99', NULL, NULL, NULL, '2020-08-04 05:20:12', '2020-08-04 05:20:12', '1', '10', '15', '6', '0', '4', '0', NULL, '60.0', NULL),
(88, NULL, '97', NULL, NULL, NULL, '2020-08-04 05:20:12', '2020-08-04 05:20:57', '1', '10', '15', '6', '0', '4', '0', '83', '60.0', NULL),
(89, NULL, '102', NULL, NULL, NULL, '2020-08-04 08:08:42', '2020-08-04 08:08:47', '1', '10', '15', '6', '2', '0', '0', '28', '20.0', NULL),
(90, '2020-08-05', '103', NULL, NULL, NULL, '2020-08-05 00:35:38', '2020-08-05 00:35:38', '1', '10', '15', '6', '0', '2', '0', NULL, '30.0', NULL),
(91, NULL, '104', NULL, NULL, NULL, '2020-08-05 00:54:36', '2020-08-05 00:54:36', '9', '-', '8', '-', '0', '4', '0', NULL, '32.0', NULL),
(92, NULL, '105', NULL, NULL, NULL, '2020-08-05 00:54:37', '2020-08-05 00:54:37', '9', '-', '8', '-', '0', '4', '0', NULL, '32.0', NULL),
(101, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-05 18:42:29', '2020-08-06 07:19:56', '13', '5', '7', '3', '5', '0', '0', '75', '25.0', NULL),
(102, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-05 18:42:29', '2020-08-06 07:19:56', '40', '10', '15', '5', '1', '0', '0', '75', '10.0', NULL),
(103, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-05 18:42:29', '2020-08-06 07:19:56', '1', '10', '15', '6', '5', '0', '0', '75', '50.0', NULL),
(104, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-05 18:42:29', '2020-08-06 07:19:56', '58', '15', '20', '8', '1', '0', '0', '75', '15.0', NULL),
(105, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-05 18:42:29', '2020-08-06 07:19:56', '14', '5', '6', '3', '1', '0', '0', '75', '5.0', NULL),
(108, '2020-08-06', '114', NULL, NULL, NULL, '2020-08-06 05:50:54', '2020-08-06 07:59:03', '1', '10', '15', '6', '2', '0', '0', '16', '20.0', NULL),
(109, '2020-08-06', '114', NULL, NULL, NULL, '2020-08-06 05:50:54', '2020-08-06 07:59:03', '16', '5', '6', '3', '1', '2', '0', '16', '17.0', NULL),
(111, '2020-08-06', '112', NULL, NULL, NULL, '2020-08-06 06:38:42', '2020-08-06 06:46:58', '53', '5', '10', '3', '8', '0', '0', '9', '40.0', NULL),
(113, '2020-08-06', '112', NULL, NULL, NULL, '2020-08-06 06:45:38', '2020-08-06 06:46:58', '42', '6', '15', '4', '0', '7', '0', '9', '105.0', NULL),
(114, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-06 07:19:56', '2020-08-06 07:19:56', '39', '10', '20', '-', '1', '0', '0', '75', '10.0', NULL),
(115, '2020-08-06', '111', NULL, NULL, NULL, '2020-08-06 07:19:56', '2020-08-06 07:19:56', '60', '1.5', '2', '-', '2', '0', '0', '75', '3.0', NULL),
(116, '2020-08-06', '114', NULL, NULL, NULL, '2020-08-06 07:59:03', '2020-08-06 07:59:03', '32', '20', '30', '6', '0', '1', '0', '16', '30.0', NULL),
(117, '2020-08-06', '116', NULL, NULL, NULL, '2020-08-06 11:37:19', '2020-08-06 11:37:19', '53', '5', '10', '3', '2', '0', '0', '87', '10.0', NULL),
(118, '2020-08-06', '116', NULL, NULL, NULL, '2020-08-06 11:37:19', '2020-08-06 11:37:19', '44', '6', '15', '4', '9', '0', '0', '87', '54.0', NULL),
(119, '2020-08-06', '116', NULL, NULL, NULL, '2020-08-06 11:37:20', '2020-08-06 11:37:20', '4', '-', '8', '-', '0', '3', '0', '87', '24.0', NULL),
(120, '2020-08-06', '116', NULL, NULL, NULL, '2020-08-06 11:37:20', '2020-08-06 11:37:20', '54', '5', '10', '3', '1', '0', '0', '87', '5.0', NULL),
(121, '2020-08-07', '118', NULL, NULL, NULL, '2020-08-07 07:21:58', '2020-08-07 07:22:24', '44', '6', '15', '4', '28', '0', '0', '45', '168.0', NULL),
(122, '2020-08-08', '120', NULL, NULL, NULL, '2020-08-08 01:33:29', '2020-08-08 01:33:29', '2', '5', '8', '3', '2', '0', '0', NULL, '10.0', NULL),
(123, '2020-08-08', '120', NULL, NULL, NULL, '2020-08-08 01:33:29', '2020-08-08 01:33:29', '22', '4', '5', '2', '2', '0', '0', NULL, '8.0', NULL),
(132, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '27', '2', '3', '1', '3', '0', '0', '26', '6.0', NULL),
(133, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '4', '-', '8', '-', '0', '1', '0', '26', '8.0', NULL),
(134, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '14', '5', '6', '3', '4', '0', '0', '26', '20.0', NULL),
(135, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '9', '-', '8', '-', '0', '2', '0', '26', '16.0', NULL),
(136, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '42', '6', '15', '4', '2', '0', '0', '26', '12.0', NULL),
(137, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '30', '1.5', '3', '1', '2', '0', '0', '26', '3.0', NULL),
(138, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '29', '1.5', '3', '1', '4', '0', '0', '26', '6.0', NULL),
(139, '2020-08-08', '119', NULL, NULL, NULL, '2020-08-08 06:28:22', '2020-08-08 06:28:22', '22', '4', '5', '2', '3', '0', '0', '26', '12.0', NULL),
(146, '2020-08-12', '130', NULL, NULL, NULL, '2020-08-12 01:14:13', '2020-08-12 01:14:13', '54', '5', '10', '3', '2', '0', '0', '15', '10.0', NULL),
(147, '2020-08-12', '130', NULL, NULL, NULL, '2020-08-12 01:14:13', '2020-08-12 01:14:13', '53', '5', '10', '3', '4', '0', '0', '15', '20.0', NULL),
(148, '2020-08-12', '130', NULL, NULL, NULL, '2020-08-12 01:14:13', '2020-08-12 01:14:13', '4', '-', '8', '-', '0', '2', '0', '15', '16.0', NULL),
(149, '2020-08-12', '130', NULL, NULL, NULL, '2020-08-12 01:14:13', '2020-08-12 01:14:13', '44', '6', '15', '4', '13', '0', '0', '15', '78.0', NULL),
(152, '2020-08-12', '137', NULL, NULL, NULL, '2020-08-12 04:10:22', '2020-08-12 04:10:22', '1', '10', '15', '6', '0', '1', '0', NULL, '15.0', NULL),
(153, '2020-08-12', '137', NULL, NULL, NULL, '2020-08-12 04:10:23', '2020-08-12 04:10:23', '33', '20', '30', '-', '0', '3', '0', NULL, '90.0', NULL),
(155, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '9', '-', '8', '-', '0', '1', '0', '76', '8.0', NULL),
(156, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '13', '5', '7', '3', '8', '0', '0', '76', '40.0', NULL),
(157, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '44', '6', '15', '4', '3', '0', '0', '76', '18.0', NULL),
(158, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '21', '4', '5', '3', '1', '0', '0', '76', '4.0', NULL),
(159, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '42', '6', '15', '4', '8', '0', '0', '76', '48.0', NULL),
(160, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '1', '10', '15', '6', '8', '0', '0', '76', '80.0', NULL),
(161, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '53', '5', '10', '3', '1', '0', '0', '76', '5.0', NULL),
(162, '2020-08-12', '134', NULL, NULL, NULL, '2020-08-12 05:06:59', '2020-08-12 05:06:59', '6', '-', '8', '-', '0', '1', '0', '76', '8.0', NULL),
(169, '2020-08-13', '142', NULL, NULL, NULL, '2020-08-13 09:07:06', '2020-08-13 09:07:06', '33', '20', '30', '-', '2', '0', '0', NULL, '40.0', NULL),
(170, '2020-08-13', '142', NULL, NULL, NULL, '2020-08-13 09:07:06', '2020-08-13 09:07:06', '1', '10', '13', '6', '4', '0', '0', NULL, '40.0', NULL),
(173, '2020-08-15', '145', NULL, NULL, NULL, '2020-08-15 06:13:58', '2020-08-15 06:13:58', '49', '6', '12', '3', '2', '0', '0', NULL, '12.0', NULL),
(177, '2020-08-16', '148', NULL, NULL, NULL, '2020-08-16 09:43:46', '2020-08-16 09:43:46', '3', '28', '28', '-', '1', '0', '0', '48', '28.0', NULL),
(178, '2020-08-16', '148', NULL, NULL, NULL, '2020-08-16 09:43:46', '2020-08-16 09:43:46', '24', '-', '8', '-', '0', '1', '0', '48', '8.0', NULL),
(179, '2020-08-16', '148', NULL, NULL, NULL, '2020-08-16 09:43:46', '2020-08-16 09:43:46', '7', '-', '12', '-', '0', '1', '0', '48', '12.0', NULL),
(184, '2020-08-17', '145', NULL, NULL, NULL, '2020-08-17 08:16:17', '2020-08-17 08:18:02', '39', '10', '20', '-', '2', '0', '0', '94', '20.0', NULL),
(185, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:26:22', '2020-08-18 06:30:28', '44', '8', '12', '-', '3', '0', '0', '3', '24.0', NULL),
(186, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '22', '4', '8', '-', '1', '0', '0', '3', '4.0', NULL),
(187, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '9', '-', '12', '-', '0', '2', '0', '3', '24.0', NULL),
(188, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '28', '12', '3', '2', '0', '0', '6', '3', '12.0', NULL),
(189, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '24', '-', '6', '-', '0', '3', '0', '3', '18.0', NULL),
(190, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '13', '6', '10', '-', '1', '0', '0', '3', '6.0', NULL),
(191, '2020-08-18', '153', NULL, NULL, NULL, '2020-08-18 06:30:28', '2020-08-18 06:30:28', '21', '6', '8', '-', '1', '0', '0', '3', '6.0', NULL),
(194, '2020-08-19', '152', NULL, NULL, NULL, '2020-08-19 03:13:15', '2020-08-19 03:14:19', '27', '2', '3', '1', '3', '0', '0', '61', '6.0', NULL),
(196, '2020-08-19', '152', NULL, NULL, NULL, '2020-08-19 03:13:51', '2020-08-19 03:14:19', '3', '14', '14', '6', '1', '0', '0', '61', '14.0', NULL),
(198, '2020-08-19', '152', NULL, NULL, NULL, '2020-08-19 03:13:51', '2020-08-19 03:14:19', '14', '2', '3', '-', '1', '0', '0', '61', '2.0', NULL),
(200, '2020-08-19', '157', NULL, NULL, NULL, '2020-08-19 13:39:23', '2020-08-19 13:39:23', '44', '4', '5', '-', '10', '0', '0', NULL, '40.0', NULL),
(201, '2020-08-19', '157', NULL, NULL, NULL, '2020-08-19 13:39:23', '2020-08-19 13:39:23', '34', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(202, '2020-08-19', '157', NULL, NULL, NULL, '2020-08-19 13:39:23', '2020-08-19 13:39:23', '53', '2.5', '3.5', '-', '5', '0', '0', NULL, '12.5', NULL),
(203, '2020-08-22', '154', NULL, NULL, NULL, '2020-08-22 07:33:55', '2020-08-22 07:33:55', '49', '2', '5', '-', '0', '1', '0', '55', '5.0', NULL),
(204, '2020-08-22', '154', NULL, NULL, NULL, '2020-08-22 07:33:55', '2020-08-22 07:33:55', '37', '8', '17', '-', '0', '1', '0', '55', '17.0', NULL),
(205, '2020-08-22', '154', NULL, NULL, NULL, '2020-08-22 07:33:55', '2020-08-22 07:33:55', '60', '1.5', '2', '-', '0', '8', '0', '55', '16.0', NULL),
(206, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:41', '2020-08-24 01:36:41', '22', '2', '3', '-', '2', '0', '0', '86', '4.0', NULL),
(207, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:41', '2020-08-24 01:36:41', '44', '4', '5', '-', '2', '0', '0', '86', '8.0', NULL),
(208, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:41', '2020-08-24 01:36:41', '28', '1', '1', '1', '5', '0', '0', '86', '5.0', NULL),
(209, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:42', '2020-08-24 01:36:42', '29', '1', '2', '-', '2', '0', '0', '86', '2.0', NULL),
(210, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:42', '2020-08-24 01:36:42', '24', '2', '3', '2', '2', '0', '0', '86', '4.0', NULL),
(211, '2020-08-24', '159', NULL, NULL, NULL, '2020-08-24 01:36:42', '2020-08-24 01:36:42', '27', '2', '3', '1', '1', '0', '0', '86', '2.0', NULL),
(214, '2020-08-29', '162', NULL, NULL, NULL, '2020-08-29 04:10:10', '2020-08-29 07:38:24', '33', '17', '30', '-', '0', '3', '0', '39', '90.0', NULL),
(215, '2020-08-29', '164', NULL, NULL, NULL, '2020-08-29 07:37:05', '2020-08-29 07:37:05', '37', '8', '17', '-', '1', '0', '0', '55', '8.0', NULL),
(216, '2020-08-29', '164', NULL, NULL, NULL, '2020-08-29 07:37:05', '2020-08-29 07:37:05', '40', '4', '10', '-', '1', '0', '0', '55', '4.0', NULL),
(217, '2020-08-29', '164', NULL, NULL, NULL, '2020-08-29 07:37:05', '2020-08-29 07:37:05', '70', '35', '65', '-', '0', '1', '0', '55', '65.0', NULL),
(218, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:51', '2020-08-29 10:29:51', '5', '6', '6', '3', '0', '0', '3', NULL, '9.0', NULL),
(219, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:51', '2020-08-29 10:29:51', '44', '4', '5', '-', '4', '0', '0', NULL, '16.0', NULL),
(220, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:51', '2020-08-29 10:29:51', '23', '-', '2', '-', '0', '4', '0', NULL, '8.0', NULL),
(221, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:51', '2020-08-29 10:29:51', '22', '2', '3', '-', '5', '0', '0', NULL, '10.0', NULL),
(222, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '24', '2', '3', '2', '7', '0', '0', NULL, '14.0', NULL),
(223, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '42', '3', '5', '-', '15', '0', '0', NULL, '45.0', NULL),
(224, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '21', '2', '3', '-', '6', '0', '0', NULL, '12.0', NULL),
(225, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '53', '2.5', '3.5', '-', '0', '3', '0', NULL, '10.5', NULL),
(226, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '29', '1', '2', '-', '2', '0', '0', NULL, '2.0', NULL),
(227, '2020-08-29', '165', NULL, NULL, NULL, '2020-08-29 10:29:52', '2020-08-29 10:29:52', '28', '1', '1', '1', '12', '0', '0', NULL, '12.0', NULL),
(228, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '53', '2.5', '3.5', '-', '0', '3', '0', NULL, '10.5', NULL),
(229, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '23', '-', '2', '-', '0', '4', '0', NULL, '8.0', NULL),
(230, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '44', '4', '5', '-', '4', '0', '0', NULL, '16.0', NULL),
(231, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '21', '2', '3', '-', '6', '0', '0', NULL, '12.0', NULL),
(232, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '22', '2', '3', '-', '5', '0', '0', NULL, '10.0', NULL),
(233, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '5', '6', '6', '3', '0', '0', '3', NULL, '9.0', NULL),
(234, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '29', '1', '2', '-', '2', '0', '0', NULL, '2.0', NULL),
(235, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '28', '1', '1', '1', '12', '0', '0', NULL, '12.0', NULL),
(236, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '24', '2', '3', '2', '7', '0', '0', NULL, '14.0', NULL),
(237, '2020-08-29', '166', NULL, NULL, NULL, '2020-08-29 10:29:54', '2020-08-29 10:29:54', '42', '3', '5', '-', '15', '0', '0', NULL, '45.0', NULL),
(238, '2020-09-02', '167', NULL, NULL, NULL, '2020-08-31 05:01:49', '2020-09-02 07:48:18', '1', '13', '13', '5', '3', '0', '0', '70', '39.0', NULL),
(239, '2020-09-02', '167', NULL, NULL, NULL, '2020-08-31 05:01:50', '2020-09-02 07:48:18', '32', '5', '13', '4', '4', '0', '0', '70', '20.0', NULL),
(240, '2020-09-02', '167', NULL, NULL, NULL, '2020-08-31 05:01:50', '2020-09-02 07:48:17', '13', '3', '4', '-', '2', '0', '0', '70', '6.0', NULL),
(241, '2020-09-03', '172', NULL, NULL, NULL, '2020-09-03 07:52:06', '2020-09-03 07:52:06', '2', '6', '6', '2', '6', '0', '0', NULL, '36.0', NULL),
(242, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '28', '1', '1', '1', '10', '0', '0', '42', '10.0', NULL),
(243, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '29', '1', '2', '-', '3', '0', '0', '42', '3.0', NULL),
(244, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '44', '4', '5', '-', '3', '0', '0', '42', '12.0', NULL),
(245, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '53', '2.5', '3.5', '-', '1', '0', '0', '42', '2.5', NULL),
(246, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '21', '2', '3', '-', '2', '0', '0', '42', '4.0', NULL),
(247, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '24', '2', '3', '2', '6', '0', '0', '42', '12.0', NULL),
(248, '2020-09-05', '170', NULL, NULL, NULL, '2020-09-05 03:10:45', '2020-09-05 03:10:45', '9', '-', '6', '-', '0', '4', '0', '42', '24.0', NULL),
(249, '2020-09-05', '173', NULL, NULL, NULL, '2020-09-05 03:27:47', '2020-09-05 03:27:47', '70', '35', '65', '-', '0', '1', '0', '71', '65.0', NULL),
(255, '2020-09-06', '174', NULL, NULL, NULL, '2020-09-06 11:28:06', '2020-09-06 11:33:36', '70', '35', '65', '-', '0', '1', '0', '68', '65.0', NULL),
(256, '2020-09-10', '175', NULL, NULL, NULL, '2020-09-10 05:48:56', '2020-09-10 05:48:56', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(257, '2020-09-10', '176', NULL, NULL, NULL, '2020-09-10 10:23:10', '2020-09-10 10:23:10', '70', '65', '130', '35', '1', '0', '0', '85', '65.0', NULL),
(264, '2020-09-13', '177', NULL, NULL, NULL, '2020-09-13 14:20:44', '2020-09-13 14:20:59', '70', '65', '130', '35', '2', '0', '0', '13', '130.0', NULL),
(265, '2020-09-14', '184', NULL, NULL, NULL, '2020-09-14 02:44:02', '2020-09-14 02:44:02', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(266, '2020-09-14', '185', NULL, NULL, NULL, '2020-09-14 10:38:54', '2020-09-14 10:38:54', '70', '65', '130', '35', '1', '0', '0', '10', '65.0', NULL),
(267, '2020-09-15', '187', NULL, NULL, NULL, '2020-09-15 13:09:52', '2020-09-15 13:09:52', '71', '8', '15', '-', '2', '1', '0', NULL, '31.0', NULL),
(268, '2020-09-15', '188', NULL, NULL, NULL, '2020-09-15 13:09:54', '2020-09-15 13:09:54', '71', '8', '15', '-', '2', '1', '0', NULL, '31.0', NULL),
(271, '2020-09-16', '186', NULL, NULL, NULL, '2020-09-16 08:10:24', '2020-09-16 08:10:24', '70', '65', '130', '35', '1', '0', '0', '11', '65.0', NULL),
(272, '2020-09-17', '191', NULL, NULL, NULL, '2020-09-17 09:34:01', '2020-09-17 09:34:05', '70', '65', '130', '35', '1', '0', '0', '9', '65.0', NULL),
(273, '2020-09-19', '192', NULL, NULL, NULL, '2020-09-19 03:04:56', '2020-09-19 03:04:56', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(274, '2020-09-19', '193', NULL, NULL, NULL, '2020-09-19 03:04:57', '2020-09-19 03:04:57', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(275, '2020-09-19', '194', NULL, NULL, NULL, '2020-09-19 09:45:42', '2020-09-19 09:45:42', '70', '65', '130', '35', '2', '0', '0', NULL, '130.0', NULL),
(276, '2020-09-19', '195', NULL, NULL, NULL, '2020-09-19 09:45:42', '2020-09-19 09:45:42', '70', '65', '130', '35', '2', '0', '0', NULL, '130.0', NULL),
(277, '2020-09-20', '196', NULL, NULL, NULL, '2020-09-20 01:28:57', '2020-09-20 01:28:57', '70', '65', '130', '35', '0', '0', '2', '67', '70.0', NULL),
(278, '2020-09-20', '197', NULL, NULL, NULL, '2020-09-20 07:54:13', '2020-09-20 07:54:24', '70', '65', '130', '35', '1', '0', '0', '5', '65.0', NULL),
(279, '2020-09-22', '198', NULL, NULL, NULL, '2020-09-22 02:12:56', '2020-09-22 02:12:56', '72', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(280, '2020-09-22', '198', NULL, NULL, NULL, '2020-09-22 02:12:56', '2020-09-22 02:12:56', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(281, '2020-09-22', '199', NULL, NULL, NULL, '2020-09-22 02:12:56', '2020-09-22 02:12:56', '72', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(282, '2020-09-22', '199', NULL, NULL, NULL, '2020-09-22 02:12:56', '2020-09-22 02:12:56', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(283, '2020-09-22', '200', NULL, NULL, NULL, '2020-09-22 02:12:57', '2020-09-22 02:12:57', '72', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(284, '2020-09-23', '200', NULL, NULL, NULL, '2020-09-22 02:12:57', '2020-09-23 03:09:04', '70', '65', '130', '35', '0', '0', '1', '99', '35.0', NULL),
(285, '2020-09-22', '201', NULL, NULL, NULL, '2020-09-22 02:12:57', '2020-09-22 08:49:27', '72', '-', '13', '-', '0', '1', '0', '91', '13.0', NULL),
(286, '2020-09-22', '201', NULL, NULL, NULL, '2020-09-22 02:12:57', '2020-09-22 08:49:27', '70', '65', '130', '35', '0', '0', '2', '91', '70.0', NULL),
(288, '2020-09-23', '207', NULL, NULL, NULL, '2020-09-22 23:31:07', '2020-09-23 03:06:40', '70', '65', '130', '35', '1', '0', '0', '70', '65.0', NULL),
(294, '2020-09-24', '211', NULL, NULL, NULL, '2020-09-23 11:35:25', '2020-09-24 00:31:12', '70', '65', '130', '35', '0', '0', '2', '38', '70.0', NULL),
(298, '2020-09-26', '216', NULL, NULL, NULL, '2020-09-23 16:04:27', '2020-09-26 01:28:39', '70', '65', '130', '35', '0', '0', '3', '37', '105.0', NULL),
(299, '2020-09-24', '217', NULL, NULL, NULL, '2020-09-23 23:02:09', '2020-09-23 23:02:09', '72', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(300, '2020-09-24', '217', NULL, NULL, NULL, '2020-09-23 23:02:09', '2020-09-23 23:02:09', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(301, '2020-09-24', '218', NULL, NULL, NULL, '2020-09-23 23:02:11', '2020-09-23 23:02:11', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(302, '2020-09-24', '218', NULL, NULL, NULL, '2020-09-23 23:02:11', '2020-09-23 23:02:11', '72', '-', '13', '-', '0', '1', '0', NULL, '13.0', NULL),
(306, '2020-09-24', '223', NULL, NULL, NULL, '2020-09-24 01:11:24', '2020-09-24 01:11:24', '75', '-', '8', '-', '0', '12', '0', NULL, '96.0', NULL),
(309, '2020-09-28', '225', NULL, NULL, NULL, '2020-09-25 00:06:34', '2020-09-28 11:52:59', '70', '65', '130', '35', '2', '0', '0', '39', '130.0', NULL),
(310, '2020-09-26', '228', NULL, NULL, NULL, '2020-09-26 08:23:54', '2020-09-26 08:23:54', '70', '65', '130', '35', '1', '0', '0', '35', '65.0', NULL),
(311, '2020-09-26', '228', NULL, NULL, NULL, '2020-09-26 08:23:54', '2020-09-26 08:23:54', '72', '-', '13', '-', '0', '2', '0', '35', '26.0', NULL),
(312, '2020-09-26', '226', NULL, NULL, NULL, '2020-09-26 08:24:28', '2020-09-26 08:24:28', '70', '65', '130', '35', '1', '0', '0', '21', '65.0', NULL),
(313, '2020-09-26', '203', NULL, NULL, NULL, '2020-09-26 09:05:09', '2020-09-26 09:05:09', '70', '65', '130', '35', '1', '0', '0', '22', '65.0', NULL),
(314, '2020-09-27', '231', NULL, NULL, NULL, '2020-09-27 01:24:34', '2020-09-27 01:24:34', '73', '-', '5', '-', '0', '4', '0', '32', '20.0', NULL),
(315, '2020-09-27', '231', NULL, NULL, NULL, '2020-09-27 01:24:34', '2020-09-27 01:24:34', '70', '65', '130', '35', '2', '0', '0', '32', '130.0', NULL),
(316, '2020-09-27', '232', NULL, NULL, NULL, '2020-09-27 01:50:15', '2020-09-27 01:50:15', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(317, '2020-09-27', '233', NULL, NULL, NULL, '2020-09-27 01:50:16', '2020-09-27 01:50:16', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(318, '2020-09-27', '212', NULL, NULL, NULL, '2020-09-27 03:56:11', '2020-09-27 03:56:11', '75', '-', '8', '-', '0', '4', '0', '63', '32.0', NULL),
(320, '2020-09-27', '235', NULL, NULL, NULL, '2020-09-27 12:14:52', '2020-09-27 12:14:52', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(322, '2020-09-29', '237', NULL, NULL, NULL, '2020-09-29 12:57:33', '2020-09-29 12:57:33', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(328, '2020-09-29', '241', NULL, NULL, NULL, '2020-09-29 14:29:11', '2020-09-29 14:29:11', '71', '8', '15', '-', '2', '0', '0', NULL, '16.0', NULL),
(329, '2020-09-29', '241', NULL, NULL, NULL, '2020-09-29 14:29:11', '2020-09-29 14:29:11', '72', '-', '13', '-', '0', '2', '0', NULL, '26.0', NULL),
(330, '2020-09-30', '243', NULL, NULL, NULL, '2020-09-30 09:19:28', '2020-09-30 09:19:28', '72', '-', '13', '-', '0', '3', '0', '82', '39.0', NULL),
(331, '2020-09-30', '243', NULL, NULL, NULL, '2020-09-30 09:19:28', '2020-09-30 09:19:28', '71', '8', '15', '-', '0', '1', '0', '82', '15.0', NULL),
(332, '2020-09-30', '244', NULL, NULL, NULL, '2020-09-30 14:10:09', '2020-09-30 14:10:09', '70', '130', '260', '70', '0', '0', '1', NULL, '70.0', NULL),
(333, '2020-10-01', '245', NULL, NULL, NULL, '2020-09-30 23:52:10', '2020-09-30 23:52:10', '70', '65', '130', '35', '2', '0', '0', NULL, '130.0', NULL),
(335, '2020-10-03', '247', NULL, NULL, NULL, '2020-10-03 03:02:55', '2020-10-03 03:02:55', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(339, '2020-10-03', '251', NULL, NULL, NULL, '2020-10-03 11:18:09', '2020-10-03 11:18:09', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(340, '2020-10-04', '252', NULL, NULL, NULL, '2020-10-04 06:34:01', '2020-10-04 06:34:01', '70', '65', '130', '35', '1', '0', '0', '51', '65.0', NULL),
(345, '2020-10-05', '255', NULL, NULL, NULL, '2020-10-05 00:17:21', '2020-10-05 00:17:21', '72', '-', '13', '-', '0', '3', '0', NULL, '39.0', NULL),
(346, '2020-10-05', '255', NULL, NULL, NULL, '2020-10-05 00:17:22', '2020-10-05 00:17:22', '75', '-', '8', '-', '0', '2', '0', NULL, '16.0', NULL),
(347, '2020-10-06', '256', NULL, NULL, NULL, '2020-10-06 01:44:46', '2020-10-06 01:44:46', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(353, '2020-10-10', '262', NULL, NULL, NULL, '2020-10-10 09:13:46', '2020-10-10 09:13:46', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(354, '2020-10-11', '264', NULL, NULL, NULL, '2020-10-10 14:22:42', '2020-10-11 01:47:21', '70', '65', '130', '35', '0', '0', '2', '58', '70.0', NULL),
(355, '2020-10-12', '263', NULL, NULL, NULL, '2020-10-11 21:00:27', '2020-10-11 21:00:27', '70', '65', '130', '35', '1', '0', '0', '48', '65.0', NULL),
(359, '2020-10-12', '269', NULL, NULL, NULL, '2020-10-12 06:34:58', '2020-10-12 09:23:13', '70', '65', '130', '35', '1', '0', '0', '62', '65.0', NULL),
(360, '2020-10-12', '267', NULL, NULL, NULL, '2020-10-12 10:55:00', '2020-10-12 10:55:00', '70', '65', '130', '35', '0', '0', '2', '14', '70.0', NULL),
(361, '2020-10-14', '270', NULL, NULL, NULL, '2020-10-14 03:14:34', '2020-10-14 03:14:34', '70', '65', '130', '35', '1', '0', '0', '53', '65.0', NULL),
(362, '2020-10-16', '271', NULL, NULL, NULL, '2020-10-16 06:43:00', '2020-10-16 06:43:00', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(364, '2020-10-19', '275', NULL, NULL, NULL, '2020-10-19 08:13:04', '2020-10-19 08:13:04', '71', '8', '15', '-', '1', '0', '0', '5', '8.0', NULL),
(365, '2020-10-19', '275', NULL, NULL, NULL, '2020-10-19 08:13:04', '2020-10-19 08:13:04', '72', '13', '30', '-', '1', '0', '0', '5', '13.0', NULL),
(366, '2020-10-19', '273', NULL, NULL, NULL, '2020-10-19 08:59:41', '2020-10-19 08:59:41', '70', '65', '130', '35', '1', '0', '0', '41', '65.0', NULL),
(367, '2020-10-20', '276', NULL, NULL, NULL, '2020-10-20 06:57:08', '2020-10-20 06:57:08', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(368, '2020-10-20', '277', NULL, NULL, NULL, '2020-10-20 14:12:45', '2020-10-20 14:12:45', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(370, '2020-10-24', '279', NULL, NULL, NULL, '2020-10-24 09:29:31', '2020-10-24 09:29:31', '70', '65', '130', '35', '2', '0', '0', NULL, '130.0', NULL),
(371, '2020-10-25', '284', NULL, NULL, NULL, '2020-10-25 12:13:24', '2020-10-25 12:13:24', '72', '13', '30', '-', '0', '2', '0', NULL, '60.0', NULL),
(372, '2020-10-25', '284', NULL, NULL, NULL, '2020-10-25 12:13:25', '2020-10-25 12:13:25', '70', '65', '130', '35', '0', '0', '2', NULL, '70.0', NULL),
(373, '2020-10-26', '285', NULL, NULL, NULL, '2020-10-26 00:48:49', '2020-10-26 00:48:49', '70', '65', '130', '35', '0', '0', '1', NULL, '35.0', NULL),
(374, '2020-10-26', '283', NULL, NULL, NULL, '2020-10-26 11:14:31', '2020-10-26 11:14:31', '70', '65', '130', '35', '0', '0', '1', '84', '35.0', NULL),
(375, '2020-10-27', '286', NULL, NULL, NULL, '2020-10-27 03:51:18', '2020-10-27 03:51:18', '70', '65', '130', '35', '1', '0', '0', '80', '65.0', NULL),
(376, '2020-10-27', '288', NULL, NULL, NULL, '2020-10-27 04:18:41', '2020-10-27 04:18:41', '70', '65', '130', '35', '1', '0', '0', NULL, '65.0', NULL),
(377, '2020-10-27', '287', NULL, NULL, NULL, '2020-10-27 08:22:36', '2020-10-27 08:22:36', '70', '65', '130', '35', '0', '1', '0', '68', '130.0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_read` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_edit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_del` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_read` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_edit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_del` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_read` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_edit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_del` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_read` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_edit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_del` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_report` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `category_read`, `category_edit`, `category_del`, `services_read`, `services_edit`, `services_del`, `customer_read`, `customer_edit`, `customer_del`, `user_read`, `user_edit`, `user_del`, `role_read`, `role_edit`, `role_del`, `order_read`, `order_edit`, `order_del`, `coupon_read`, `coupon_edit`, `coupon_del`, `agent_read`, `agent_edit`, `agent_del`, `slider_read`, `slider_edit`, `slider_del`, `order_report`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', NULL, 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', '0', '2020-04-13 02:43:30', '2020-04-16 09:37:01'),
(2, 'Manager', 'on', 'on', NULL, 'on', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'on', 'on', NULL, 'on', 'on', NULL, 'on', '0', '2020-08-05 01:28:29', '2020-08-12 10:10:24'),
(3, 'Driver', 'on', 'on', 'on', 'on', 'on', 'on', NULL, NULL, NULL, 'on', 'on', NULL, 'on', 'on', NULL, 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', NULL, 'on', '0', '2020-08-05 01:31:29', '2020-08-12 10:09:03'),
(4, 'Driver1', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', NULL, 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', '0', '2020-08-05 01:32:06', '2020-09-26 16:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `week_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_strtotime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `week_id`, `title`, `description`, `from_strtotime`, `from_time`, `to_time`, `status`, `created_at`, `updated_at`) VALUES
(2, '2', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-04-18 05:49:36', '2020-08-08 02:05:31'),
(3, '1', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-04-28 13:40:02', '2020-08-08 02:02:24'),
(4, '1', NULL, NULL, '1596880800', '10:00 AM', '12:00PM', '0', '2020-06-13 09:35:39', '2020-08-08 02:02:49'),
(6, '1', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-06-13 09:36:10', '2020-08-08 02:03:17'),
(8, '1', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:26:40', '2020-08-08 02:03:45'),
(9, '2', NULL, NULL, '1596880800', '10:00 AM', '12:00 PM', '0', '2020-07-21 11:28:42', '2020-08-08 02:05:45'),
(10, '2', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-07-21 11:29:05', '2020-08-08 02:06:00'),
(11, '2', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:29:18', '2020-08-08 02:06:13'),
(12, '3', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-07-21 11:32:16', '2020-08-08 02:06:51'),
(13, '3', NULL, NULL, '1596880800', '10:00 AM', '12:00 PM', '0', '2020-07-21 11:32:25', '2020-08-08 02:07:02'),
(14, '3', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-07-21 11:32:53', '2020-08-08 02:07:20'),
(15, '3', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:33:05', '2020-08-08 02:07:39'),
(16, '4', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-07-21 11:33:21', '2020-08-08 02:08:26'),
(17, '4', NULL, NULL, '1596880800', '10:00 AM', '12:00 PM', '0', '2020-07-21 11:33:33', '2020-08-08 02:08:38'),
(18, '4', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-07-21 11:33:47', '2020-08-08 02:08:49'),
(19, '4', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:34:00', '2020-08-08 02:09:05'),
(20, '5', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-07-21 11:34:26', '2020-08-08 02:10:15'),
(21, '5', NULL, NULL, '1596880800', '10:00 AM', '12:00 PM', '0', '2020-07-21 11:34:31', '2020-08-08 02:10:25'),
(22, '5', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-07-21 11:34:45', '2020-08-08 02:10:37'),
(23, '5', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:34:56', '2020-08-08 02:10:51'),
(28, '7', NULL, NULL, '1596873600', '08:00 AM', '10:00 AM', '0', '2020-07-21 11:36:15', '2020-08-08 02:13:06'),
(29, '7', NULL, NULL, '1596880800', '10:00 AM', '12:00 PM', '0', '2020-07-21 11:36:19', '2020-08-08 02:13:15'),
(30, '7', NULL, NULL, '1596898800', '03:00 PM', '05:00 PM', '0', '2020-07-21 11:36:34', '2020-08-08 02:13:37'),
(31, '7', NULL, NULL, '1596906000', '05:00 PM', '07:00 PM', '0', '2020-07-21 11:36:57', '2020-08-08 02:13:57'),
(33, '4', NULL, NULL, '1596913200', '07:00 PM', '09:00 PM', '0', '2020-08-05 10:39:02', '2020-08-08 02:09:43'),
(34, '1', NULL, NULL, '1598209200', '07:00 PM', '09:00 PM', '0', '2020-08-08 02:04:29', '2020-08-22 20:58:40'),
(35, '2', NULL, NULL, '1598209200', '07:00 PM', '09:00 PM', '0', '2020-08-08 02:06:32', '2020-08-22 20:58:57'),
(36, '3', NULL, NULL, '1598209200', '07:00 PM', '09:00 PM', '0', '2020-08-08 02:08:01', '2020-08-22 20:59:15'),
(37, '5', NULL, NULL, '1598209200', '07:00 PM', '09:00 PM', '0', '2020-08-08 02:11:08', '2020-08-22 20:59:52'),
(39, '7', NULL, NULL, '1598209200', '07:00 PM', '09:00 PM', '0', '2020-08-08 02:14:17', '2020-08-22 21:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `cat_id`, `item_id`, `price_1`, `duration_1`, `price_2`, `duration_2`, `created_at`, `updated_at`) VALUES
(165, '2', '70', '65', NULL, '130', NULL, '2020-08-29 02:42:28', '2020-09-10 09:33:03'),
(168, '3', '70', '35', NULL, '70', NULL, '2020-09-08 15:33:38', '2020-09-10 09:34:41'),
(169, '1', '70', '130', NULL, '260', NULL, '2020-09-08 15:35:51', '2020-09-10 09:31:58'),
(170, '2', '71', '8', NULL, '16', NULL, '2020-09-14 02:09:16', '2020-09-14 02:09:16'),
(171, '2', '72', '13', NULL, '26', NULL, '2020-09-14 02:12:12', '2020-09-14 02:12:12'),
(172, '2', '73', '3.50', NULL, '7', NULL, '2020-09-14 02:12:49', '2020-10-08 00:21:51'),
(173, '1', '71', '15', '15', '15', '15', '2020-09-14 02:15:32', '2020-09-14 02:15:32'),
(174, '2', '75', '10', NULL, NULL, NULL, '2020-09-14 11:45:48', '2020-10-08 00:18:26'),
(175, '3', '75', NULL, NULL, NULL, NULL, '2020-09-14 11:47:06', '2020-09-14 11:47:06'),
(176, '1', '72', '30', NULL, '60', NULL, '2020-10-08 00:19:25', '2020-10-08 00:19:25'),
(177, '1', '74', '8', NULL, '16', NULL, '2020-10-08 00:20:18', '2020-10-08 00:20:18'),
(178, '2', '74', '5', NULL, '10', NULL, '2020-10-08 00:22:25', '2020-10-08 00:22:25'),
(179, '1', '73', '5', NULL, '10', NULL, '2020-10-08 00:23:14', '2020-10-08 00:23:14'),
(180, '1', '76', '30', NULL, '60', NULL, '2020-10-08 00:24:03', '2020-10-08 00:24:03'),
(181, '1', '78', '13', NULL, '26', NULL, '2020-10-08 00:24:56', '2020-10-08 00:28:59'),
(182, '2', '76', '15', NULL, '30', NULL, '2020-10-08 00:26:00', '2020-10-08 00:26:00'),
(183, '2', '78', '7', NULL, '14', NULL, '2020-10-08 00:26:22', '2020-10-08 00:26:22'),
(184, '3', '73', '2.50', NULL, '5', NULL, '2020-10-08 00:27:31', '2020-10-08 00:27:31'),
(185, '3', '74', '4', NULL, '8', NULL, '2020-10-08 00:27:51', '2020-10-08 00:27:51'),
(186, '3', '76', '10', NULL, '20', NULL, '2020-10-08 00:28:15', '2020-10-08 00:28:15'),
(187, '3', '78', '5', NULL, '10', NULL, '2020-10-08 00:28:31', '2020-10-08 00:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(5000) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `shop_license_code` varchar(255) DEFAULT NULL,
  `shop_address` varchar(5000) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `email`, `phone`, `address`, `city`, `area`, `pincode`, `vat_number`, `shop_license_code`, `shop_address`, `logo`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '571973826.png', NULL, '2020-08-06 09:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@hangyourcloths.com', NULL, '1', '$2y$10$/wyr8rLDdA90Xxu0kiecV.YLsOB55HerMfbqSSojge0.XFB5/Twim', NULL, NULL, '2020-04-23 18:16:56'),
(2, 'Thowsif', 'thowsif@lrbinfotech.com', NULL, '3', '$2y$10$gjzbFsX58E9rlW/ykUBN/etBI6GRO1rtsJPKNzQ4h3dapKhHyWBaS', NULL, '2020-08-05 01:34:31', '2020-08-05 01:34:31'),
(3, 'John Nijo', 'johnnijomail@gmail.com', NULL, '2', '$2y$10$3c0StZUFpzRVucE8tjBm8uLiApHSzzN67YzlggwHkbqHCwrL1BrTC', NULL, '2020-08-05 01:35:53', '2020-08-05 01:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE `weeks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weeks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weeks`
--

INSERT INTO `weeks` (`id`, `name`, `weeks`, `created_at`, `updated_at`) VALUES
(1, 'Sunday', 'Sunday', NULL, NULL),
(2, 'Monday', 'Monday', NULL, NULL),
(3, 'Tuesday', 'Tuesday', NULL, NULL),
(4, 'Wednesday', 'Wednesday', NULL, NULL),
(5, 'Thursday', 'Thursday', NULL, NULL),
(6, 'Friday', 'Friday', NULL, NULL),
(7, 'Saturday', 'Saturday', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_addresses`
--
ALTER TABLE `manage_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `manage_addresses`
--
ALTER TABLE `manage_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
