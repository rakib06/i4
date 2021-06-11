-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2021 at 04:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\Domains\\Announcement\\Models\\Announcement', NULL, NULL, '{\"attributes\": {\"area\": null, \"type\": \"info\", \"enabled\": true, \"ends_at\": null, \"message\": \"This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>\", \"starts_at\": null}}', '2021-04-12 02:46:26', '2021-04-12 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `area`, `type`, `message`, `enabled`, `starts_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'info', 'This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>', 1, NULL, NULL, '2021-04-12 02:46:26', '2021-04-12 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'i4Survey Global', NULL, NULL),
(2, 'Branch 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AJ TRADINGS', NULL, NULL),
(2, 'ALPHA DPIS CO', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `place_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('loading','discharging','analysis','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'loading',
  `customer_reference` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expected_eta` timestamp NULL DEFAULT NULL,
  `demo` varchar(10) DEFAULT NULL,
  `vessel_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `customer_id`, `branch_id`, `place_id`, `type`, `customer_reference`, `enabled`, `expected_eta`, `demo`, `vessel_id`, `created_at`, `updated_at`) VALUES
(12, 1, 1, 2, 'loading', 'Rakib', 1, '2021-06-07 18:24:00', 'Yes', 2, '2021-06-07 12:24:37', '2021-06-07 12:24:37'),
(11, 1, 1, 2, 'discharging', 'Sakib', 1, '2021-06-07 18:22:00', NULL, 2, '2021-06-07 12:23:59', '2021-06-07 12:23:59'),
(9, 1, 2, 1, 'loading', 'Sakib', 1, '2021-06-07 18:21:00', NULL, 1, '2021-06-07 12:21:47', '2021-06-07 12:21:47'),
(10, 1, 1, 2, 'discharging', 'Sakib', 1, '2021-06-07 18:22:00', 'Yes', 2, '2021-06-07 12:23:15', '2021-06-07 12:23:15'),
(8, 1, 1, 1, 'analysis', 'Rakibul', 1, '2021-06-07 18:17:00', NULL, 2, '2021-06-07 12:19:27', '2021-06-07 12:19:27'),
(13, 2, 1, 1, 'discharging', 'Fa', 1, '2021-06-07 18:25:00', NULL, 1, '2021-06-07 12:25:13', '2021-06-07 12:25:13'),
(14, 2, 1, 2, 'analysis', 'Rakib', 1, '2021-06-07 18:30:00', 'Yes', 2, '2021-06-07 12:30:46', '2021-06-07 12:30:46'),
(15, 2, 1, 2, 'analysis', 'Rakib', 1, '2021-06-07 18:30:00', NULL, 2, '2021-06-07 12:31:09', '2021-06-07 12:31:09'),
(16, 2, 1, 1, 'loading', 'Sqak', 1, '2021-06-07 18:31:00', NULL, 2, '2021-06-07 12:32:03', '2021-06-07 12:32:03'),
(17, 1, 2, 2, 'discharging', 'Test No', 1, '2021-06-07 18:33:00', 'Yes', 2, '2021-06-07 12:34:00', '2021-06-07 12:34:00'),
(18, 1, 2, 2, 'discharging', 'Test No', 1, '2021-06-07 18:33:00', 'Yes', 2, '2021-06-07 12:34:11', '2021-06-07 12:34:11'),
(19, 1, 2, 2, 'analysis', 'Test No', 1, '2021-06-07 18:33:00', 'Yes', 2, '2021-06-07 12:34:27', '2021-06-07 12:34:27'),
(20, 1, 2, 2, 'analysis', 'Test No', 1, '2021-06-07 18:33:00', 'Yes', 2, '2021-06-07 12:34:40', '2021-06-07 12:34:40'),
(21, 1, 2, 2, 'analysis', 'Test No', 1, '2021-06-07 18:33:00', NULL, 2, '2021-06-07 12:34:51', '2021-06-07 12:34:51'),
(22, 1, 2, 2, 'analysis', 'Test No', 1, '2021-06-07 18:33:00', NULL, 2, '2021-06-07 12:35:11', '2021-06-07 12:35:11'),
(23, 1, 2, 2, 'analysis', 'Test No', 1, '2021-06-07 18:33:00', 'No', 2, '2021-06-07 12:35:55', '2021-06-07 12:35:55'),
(24, 1, 1, 2, 'discharging', 'Fa', 1, '2021-06-07 18:37:00', 'Yes', 2, '2021-06-07 12:37:15', '2021-06-07 12:37:15'),
(25, 1, 1, 2, 'discharging', 'Fa', 1, '2021-06-07 18:37:00', NULL, 2, '2021-06-07 12:37:28', '2021-06-07 12:37:28'),
(26, 1, 1, 2, 'discharging', 'Fa', 1, '2021-06-07 18:37:00', NULL, 2, '2021-06-07 12:37:49', '2021-06-07 12:37:49'),
(27, 1, 1, 2, 'loading', 'Sm', 1, '2021-06-07 18:40:00', NULL, 2, '2021-06-07 12:40:40', '2021-06-07 12:40:40'),
(28, 1, 1, 1, 'loading', 'Test No', 1, '2021-06-07 18:43:00', NULL, 2, '2021-06-07 12:43:38', '2021-06-07 12:43:38'),
(29, 1, 1, 2, 'analysis', 'Md', 1, '2021-06-08 08:41:00', '1', 1, '2021-06-08 02:41:18', '2021-06-08 02:41:18'),
(30, 1, 2, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:42:00', NULL, 2, '2021-06-08 02:42:20', '2021-06-08 02:42:20'),
(31, 1, 2, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:42:00', NULL, 2, '2021-06-08 02:44:26', '2021-06-08 02:44:26'),
(32, 1, 2, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:42:00', NULL, 2, '2021-06-08 02:44:58', '2021-06-08 02:44:58'),
(33, 1, 1, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:45:00', NULL, 3, '2021-06-08 02:45:53', '2021-06-08 02:45:53'),
(34, 1, 1, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:45:00', '0', 3, '2021-06-08 02:46:18', '2021-06-08 02:46:18'),
(35, 1, 1, 1, 'analysis', 'Sakib', 1, '2021-06-08 08:45:00', NULL, 3, '2021-06-08 02:46:52', '2021-06-08 02:46:52'),
(36, 1, 1, 1, 'loading', 'Sakib', 1, '2021-06-08 08:47:00', '1', 2, '2021-06-08 02:47:41', '2021-06-08 02:47:41'),
(37, 2, 1, 2, 'analysis', 'Test No', 1, '2021-06-08 08:48:00', NULL, 3, '2021-06-08 02:48:27', '2021-06-08 02:48:27'),
(38, 1, 1, 1, 'loading', 'Test No', 1, '2021-06-08 08:49:00', NULL, 2, '2021-06-08 02:49:12', '2021-06-08 02:49:12'),
(39, 1, 1, 2, 'loading', 'USA', 1, '2021-06-08 08:51:00', NULL, 2, '2021-06-08 02:51:14', '2021-06-08 02:51:14'),
(40, 1, 1, 2, 'loading', 'USA', 1, '2021-06-08 08:51:00', '0', 2, '2021-06-08 02:51:46', '2021-06-08 02:51:46'),
(41, 1, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 08:52:00', NULL, 2, '2021-06-08 02:53:08', '2021-06-08 02:53:08'),
(42, 2, 1, 1, 'discharging', 'Rakib', 1, '2021-06-08 09:27:00', '1', 2, '2021-06-08 03:27:35', '2021-06-08 03:27:35'),
(43, 2, 1, 1, 'discharging', 'Rakib', 1, '2021-06-08 09:27:00', '1', 2, '2021-06-08 03:40:58', '2021-06-08 03:40:58'),
(44, 2, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 09:41:00', '1', 2, '2021-06-08 03:41:20', '2021-06-08 03:41:20'),
(45, 1, 1, 1, 'analysis', 'Sakib', 1, '2021-06-08 17:40:00', '1', 2, '2021-06-08 11:40:10', '2021-06-08 11:40:10'),
(46, 1, 1, 1, 'analysis', 'Sakib', 1, '2021-06-08 17:40:00', '1', 2, '2021-06-08 11:40:44', '2021-06-08 11:40:44'),
(47, 1, 1, 1, 'discharging', 'Rakibul', 1, '2021-06-15 17:42:00', '1', 2, '2021-06-08 11:42:10', '2021-06-08 11:42:10'),
(48, 2, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 17:44:00', '1', 2, '2021-06-08 11:44:12', '2021-06-08 11:44:12'),
(49, 2, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 17:44:00', '1', 2, '2021-06-08 11:46:16', '2021-06-08 11:46:16'),
(50, 1, 1, 1, 'loading', 'Test No', 1, '2021-06-08 17:46:00', '1', 1, '2021-06-08 11:46:56', '2021-06-08 11:46:56'),
(51, 1, 1, 1, 'discharging', 'Test No', 1, '2021-06-08 17:47:00', '1', 2, '2021-06-08 11:48:01', '2021-06-08 11:48:01'),
(52, 1, 1, 1, 'loading', 'Sakib', 1, '2021-06-08 17:54:00', NULL, 2, '2021-06-08 11:55:06', '2021-06-08 11:55:06'),
(53, 1, 1, 1, 'loading', 'Sakib', 1, '2021-06-08 17:54:00', NULL, 2, '2021-06-08 11:56:00', '2021-06-08 11:56:00'),
(54, 1, 1, 2, 'loading', 'Rakib', 1, '2021-06-08 17:00:00', NULL, 2, '2021-06-08 11:56:25', '2021-06-08 11:56:25'),
(55, 1, 1, 1, 'discharging', 'Sakib', 1, '2021-06-08 17:57:00', '1', 2, '2021-06-08 11:57:54', '2021-06-08 11:57:54'),
(56, 2, 1, 1, 'discharging', 'Sakib', 1, '2021-06-08 18:01:00', '1', 2, '2021-06-08 12:01:48', '2021-06-08 12:01:48'),
(57, 2, 1, 1, 'discharging', 'Sakib', 1, '2021-06-08 18:01:00', '1', 2, '2021-06-08 12:04:43', '2021-06-08 12:04:43'),
(58, 1, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 18:07:00', '1', 2, '2021-06-08 12:07:09', '2021-06-08 12:07:09'),
(59, 1, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 18:07:00', '1', 2, '2021-06-08 12:07:34', '2021-06-08 12:07:34'),
(60, 1, 1, 1, 'loading', 'Rakib', 1, '2021-06-08 18:07:00', '1', 2, '2021-06-08 12:09:37', '2021-06-08 12:09:37'),
(61, 1, 1, 1, 'discharging', 'Mr. Abdc', 1, '2021-06-08 18:10:00', '1', 2, '2021-06-08 12:10:33', '2021-06-08 12:10:33'),
(62, 1, 1, 1, 'loading', 'Mr. Abcd', 1, '2021-06-08 18:17:00', '1', 2, '2021-06-08 12:14:57', '2021-06-08 12:14:57'),
(63, 2, 2, 1, 'discharging', 'Rakib', 1, '2021-06-09 21:21:00', NULL, 2, '2021-06-08 12:17:24', '2021-06-08 12:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_25_034148_create_permission_tables', 1),
(5, '2020_05_25_021239_create_announcements_table', 1),
(6, '2020_05_29_020244_create_password_histories_table', 1),
(7, '2020_07_06_215139_create_activity_log_table', 1),
(8, '2021_04_05_153840_create_two_factor_authentications_table', 1),
(9, '2021_05_06_081856_create_posts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_histories`
--

CREATE TABLE `password_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_histories`
--

INSERT INTO `password_histories` (`id`, `model_type`, `model_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1, '$2y$10$pCCfuwSdNDaJgA6Y83tOROeJjzExRTHkhrCmWecqRS8jWOvIiGFva', '2021-04-12 02:46:25', '2021-04-12 02:46:25'),
(2, 'App\\Domains\\Auth\\Models\\User', 2, '$2y$10$9YciyvqmhdZKs8WZrpYE0.B7EMgLVZtPcbR6ctj8PD4CtexqZvFWu', '2021-04-12 02:46:26', '2021-04-12 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `type`, `guard_name`, `name`, `description`, `parent_id`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'admin.access.user', 'All User Permissions', NULL, 1, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(2, 'admin', 'web', 'admin.access.user.list', 'View Users', 1, 1, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(3, 'admin', 'web', 'admin.access.user.deactivate', 'Deactivate Users', 1, 2, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(4, 'admin', 'web', 'admin.access.user.reactivate', 'Reactivate Users', 1, 3, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(5, 'admin', 'web', 'admin.access.user.clear-session', 'Clear User Sessions', 1, 4, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(6, 'admin', 'web', 'admin.access.user.impersonate', 'Impersonate Users', 1, 5, '2021-04-12 02:46:26', '2021-04-12 02:46:26'),
(7, 'admin', 'web', 'admin.access.user.change-password', 'Change User Passwords', 1, 6, '2021-04-12 02:46:26', '2021-04-12 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `place_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `place_name`, `created_at`, `updated_at`) VALUES
(1, 'Spain', NULL, NULL),
(2, 'USA-Test-', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'web', '2021-04-12 02:46:26', '2021-04-12 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_authentications`
--

CREATE TABLE `two_factor_authentications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `authenticatable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `shared_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint(3) UNSIGNED NOT NULL DEFAULT 6,
  `seconds` tinyint(3) UNSIGNED NOT NULL DEFAULT 30,
  `window` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`recovery_codes`)),
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`safe_devices`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `two_factor_authentications`
--

INSERT INTO `two_factor_authentications` (`id`, `authenticatable_type`, `authenticatable_id`, `shared_secret`, `enabled_at`, `label`, `digits`, `seconds`, `window`, `algorithm`, `recovery_codes`, `recovery_codes_generated_at`, `safe_devices`, `created_at`, `updated_at`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1, 'L5VCLC424FDFJC3KUDLTQS26FLUTODR7', '2021-04-12 02:58:21', 'admin@admin.com', 6, 30, 1, 'sha1', '[{\"code\":\"J5XFFBJH\",\"used_at\":\"2021-04-13T05:02:17.678433Z\"},{\"code\":\"ZYKYRVKD\",\"used_at\":\"2021-05-02T06:06:48.942267Z\"},{\"code\":\"XJIQE3YM\",\"used_at\":\"2021-05-03T05:10:03.892578Z\"},{\"code\":\"HAD1BECP\",\"used_at\":\"2021-05-03T05:42:36.999769Z\"},{\"code\":\"ERJC0I91\",\"used_at\":\"2021-05-06T06:13:05.452535Z\"},{\"code\":\"JDZXHSDK\",\"used_at\":null},{\"code\":\"IK7RX2HS\",\"used_at\":null},{\"code\":\"YP0YBWJF\",\"used_at\":null},{\"code\":\"TKBQEBJE\",\"used_at\":null},{\"code\":\"FR5CZMOU\",\"used_at\":\"2021-05-30T11:14:44.427377Z\"}]', '2021-04-12 02:58:21', NULL, '2021-04-12 02:50:36', '2021-05-30 05:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT 0,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `email`, `email_verified_at`, `password`, `password_changed_at`, `active`, `timezone`, `last_login_at`, `last_login_ip`, `to_be_logged_out`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Super Admin', 'admin@admin.com', '2021-04-12 02:46:25', '$2y$10$pCCfuwSdNDaJgA6Y83tOROeJjzExRTHkhrCmWecqRS8jWOvIiGFva', NULL, 1, 'America/New_York', '2021-05-30 05:14:44', '127.0.0.1', 0, NULL, NULL, 'c3KhR8PO0v7I8QauzjHdBN3pM61ZjL5Xd37nITLu6oFfNdO2XWO0PbHo23oZ', '2021-04-12 02:46:25', '2021-05-30 05:14:44', NULL),
(2, 'user', 'Test User', 'user@user.com', '2021-04-12 02:46:25', '$2y$10$9YciyvqmhdZKs8WZrpYE0.B7EMgLVZtPcbR6ctj8PD4CtexqZvFWu', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-04-12 02:46:26', '2021-04-12 02:46:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

CREATE TABLE `vessels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vessels`
--

INSERT INTO `vessels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Test Vessel 1', NULL, NULL),
(2, 'Test Vessel 2', NULL, NULL),
(3, 'test 2', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vessels`
--
ALTER TABLE `vessels`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vessels`
--
ALTER TABLE `vessels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
