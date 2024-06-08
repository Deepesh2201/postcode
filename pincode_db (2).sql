-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2024 at 04:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pincode_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_description` longtext DEFAULT NULL,
  `site_copyright` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `support_number` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `notification_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notification_settings`)),
  `auto_assign` tinyint(4) DEFAULT 0,
  `distance_unit` varchar(255) DEFAULT NULL COMMENT 'km, mile',
  `distance` double DEFAULT 0,
  `otp_verify_on_pickup_delivery` tinyint(4) DEFAULT 1,
  `currency` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_position` varchar(255) DEFAULT NULL,
  `is_vehicle_in_order` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `site_name`, `site_email`, `site_description`, `site_copyright`, `facebook_url`, `twitter_url`, `linkedin_url`, `instagram_url`, `support_number`, `support_email`, `notification_settings`, `auto_assign`, `distance_unit`, `distance`, `otp_verify_on_pickup_delivery`, `currency`, `currency_code`, `currency_position`, `is_vehicle_in_order`, `created_at`, `updated_at`) VALUES
(1, 'Go Go Riders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"active\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"cancelled\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"completed\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"courier_arrived\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"courier_assigned\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"courier_departed\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"courier_picked_up\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"courier_transfer\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"create\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"delayed\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"failed\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"},\"payment_status_message\":{\"IS_ONESIGNAL_NOTIFICATION\":\"1\",\"IS_FIREBASE_NOTIFICATION\":\"1\"}}', 0, NULL, 0, 1, '₦', 'NGN', 'left', 0, '2023-09-10 20:12:06', '2023-09-10 20:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` text DEFAULT NULL,
  `fixed_charges` double DEFAULT 0,
  `cancel_charges` double DEFAULT 0,
  `min_distance` double DEFAULT 0,
  `min_weight` double DEFAULT 0,
  `per_distance_charges` double DEFAULT 0,
  `per_weight_charges` double DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `commission_type` varchar(255) DEFAULT NULL COMMENT 'fixed, percentage',
  `admin_commission` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`, `address`, `fixed_charges`, `cancel_charges`, `min_distance`, `min_weight`, `per_distance_charges`, `per_weight_charges`, `status`, `created_at`, `updated_at`, `deleted_at`, `commission_type`, `admin_commission`) VALUES
(1, 'Lagos', 1, NULL, 30, 30, 1, 0.1, 30, 30, 1, '2023-09-10 09:57:34', '2024-01-14 10:52:17', NULL, 'percentage', 10),
(2, 'Deepesh', 2, NULL, 1, 2, 4, 2, 4, 6, 1, '2024-05-03 08:55:24', '2024-05-03 08:58:17', '2024-05-03 08:58:17', 'percentage', 10),
(3, 'Bengaluru', 7, NULL, 5, 10, 2, 1, 5, 5, 1, '2024-05-03 09:09:42', '2024-05-03 09:09:42', NULL, 'percentage', 10);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `distance_type` varchar(255) DEFAULT NULL,
  `weight_type` varchar(255) DEFAULT NULL,
  `links` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `distance_type`, `weight_type`, `links`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nigeria', 'NG', 'km', 'kg', NULL, 1, '2023-09-10 09:56:29', '2024-01-14 10:52:17', NULL),
(2, 'United Kingdom', 'GB', 'km', 'kg', NULL, 1, '2024-01-14 10:52:50', '2024-01-14 10:52:50', NULL),
(3, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-03 07:37:12', '2024-05-03 07:51:37', '2024-05-03 07:51:37'),
(4, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-03 07:37:22', '2024-05-03 07:51:39', '2024-05-03 07:51:39'),
(5, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-03 07:39:06', '2024-05-03 07:51:40', '2024-05-03 07:51:40'),
(6, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-03 07:39:38', '2024-05-03 07:51:41', '2024-05-03 07:51:41'),
(7, 'India', NULL, NULL, NULL, NULL, 1, '2024-05-03 07:41:29', '2024-05-03 07:41:29', NULL),
(8, 'KSA', NULL, NULL, NULL, NULL, 1, '2024-05-03 07:43:15', '2024-05-03 07:51:43', '2024-05-03 07:51:43'),
(9, 'Czech Republic', NULL, NULL, NULL, NULL, 1, '2024-05-03 07:52:11', '2024-05-03 07:52:13', '2024-05-03 07:52:13'),
(10, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-03 07:52:19', '2024-05-03 07:52:20', '2024-05-03 07:52:20'),
(11, 'KSA', NULL, NULL, NULL, NULL, 1, '2024-05-03 08:09:00', '2024-05-03 08:09:03', '2024-05-03 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_documents`
--

CREATE TABLE `delivery_man_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_verified` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `is_required` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `status`, `is_required`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SAMPLE', 1, 0, '2024-03-20 06:20:44', '2024-05-19 05:09:55', NULL),
(4, 'Deepesh', 1, 1, '2024-05-19 05:06:25', '2024-05-19 05:06:25', NULL),
(5, 'd', 1, 0, '2024-05-19 05:09:45', '2024-05-19 05:09:47', '2024-05-19 05:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `extra_charges`
--

CREATE TABLE `extra_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `charges_type` varchar(255) NOT NULL COMMENT 'fixed, percentage',
  `charges` double DEFAULT 0,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-inactive , 1 - active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_charges`
--

INSERT INTO `extra_charges` (`id`, `title`, `charges_type`, `charges`, `country_id`, `city_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'GST', 'percentage', 12, 1, 1, 1, '2023-09-10 10:03:40', '2023-09-10 10:03:40', NULL),
(2, 'Test', 'fixed', 101, 1, 1, 1, '2024-05-03 10:37:52', '2024-05-03 10:40:57', '2024-05-03 10:40:57'),
(3, 'awwq', 'percentage', 12, 7, 3, 1, '2024-05-03 10:38:08', '2024-05-03 10:40:55', '2024-05-03 10:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'c9db7c8b-d519-4756-b8cc-f171599c5e05', 'profile_image', '2533570b-d128-4835-b4dd-2a7b713f1590', '2533570b-d128-4835-b4dd-2a7b713f1590', 'image/png', 'public', 'public', 3995, '[]', '[]', '[]', '[]', 1, '2023-08-16 10:07:09', '2023-08-16 10:07:09'),
(3, 'App\\Models\\Vehicle', 1, 'd0ee5751-5263-4587-b766-58b382eb0e28', 'vehicle_image', '2b2f7300-9f00-4098-825e-f1f875f1239c', '2b2f7300-9f00-4098-825e-f1f875f1239c', 'image/png', 'public', 'public', 36804, '[]', '[]', '[]', '[]', 2, '2023-09-10 09:59:50', '2023-09-10 09:59:50'),
(5, 'App\\Models\\User', 2, 'c0809f46-6e8f-416c-bc6b-b7bff37b8344', 'profile_image', '1000010824', '1000010824.jpg', 'image/jpeg', 'public', 'public', 160856, '[]', '[]', '[]', '[]', 3, '2023-09-13 11:00:16', '2023-09-13 11:00:16'),
(16, 'App\\Models\\PaymentGateway', 2, '4f7583f9-fe9a-4f43-8923-e59a30335611', 'gateway_logo', 'download (15)', '583985.png', 'image/png', 'public', 'public', 2343, '[]', '[]', '[]', '[]', 4, '2024-01-20 08:31:27', '2024-01-20 08:31:27'),
(19, 'App\\Models\\PaymentGateway', 3, '1aca1f94-cfcc-42ea-94cc-05d65cd3e2e6', 'gateway_logo', '583985', '583985.png', 'image/png', 'public', 'public', 21523, '[]', '[]', '[]', '[]', 5, '2024-02-15 09:41:52', '2024-02-15 09:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_01_08_103820_create_sessions_table', 1),
(7, '2022_01_10_051714_create_countries_table', 1),
(8, '2022_01_10_070509_create_cities_table', 1),
(9, '2022_01_10_101903_create_extra_charges_table', 1),
(10, '2022_01_10_112023_create_app_settings_table', 1),
(11, '2022_01_11_090450_create_media_table', 1),
(12, '2022_01_13_074756_create_orders_table', 1),
(13, '2022_01_13_095310_create_static_data_table', 1),
(14, '2022_01_15_084527_create_order_histories_table', 1),
(15, '2022_01_18_100915_create_payment_gateways_table', 1),
(16, '2022_01_19_060358_create_payments_table', 1),
(17, '2022_01_24_104630_create_notifications_table', 1),
(18, '2022_04_14_084202_create_documents_table', 1),
(19, '2022_04_14_084351_create_delivery_man_documents_table', 1),
(20, '2022_05_11_080007_add_total_parcel_orders_table', 1),
(21, '2022_05_30_063501_add_fcm_token_to_users_table', 1),
(22, '2022_05_31_101332_add_auto_assign_to_orders', 1),
(23, '2022_06_02_065520_add_distance_to_app_settings', 1),
(24, '2022_06_27_131039_add_otp_verify_on_pickup_delivery', 1),
(25, '2022_12_05_111707_alter_cities_table', 1),
(26, '2022_12_05_140929_create_wallets_table', 1),
(27, '2022_12_05_140954_create_wallet_histories_table', 1),
(28, '2022_12_05_141107_create_user_bank_accounts_table', 1),
(29, '2022_12_06_061753_alter_payments_table', 1),
(30, '2022_12_10_054128_create_withdraw_requests_table', 1),
(31, '2023_01_30_121805_create_vehicles_table', 1),
(32, '2023_01_30_131633_add_is_vehicle_in_order_in_app_settings_table', 1),
(33, '2023_01_30_132224_add_vehicle_data_in_orders_table', 1),
(34, '2023_05_05_111042_create_settings_table', 1),
(35, '2023_05_19_100843_add_otp_verify_at_in_users_table', 1),
(36, '2023_10_07_105004_create_parcel_size_modals_table', 2),
(37, '2024_05_06_104854_create_zones_table', 3),
(38, '2024_05_06_105045_create_postalcodes_table', 3),
(39, '2024_05_30_131627_create_user_addresses_table', 4),
(40, '2024_05_30_155627_add_rows_to_user_addresses', 5),
(41, '2024_05_30_164541_create_user_designations_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3b5db052-f5fe-4c8e-8ab7-aa4349f0a3d1', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":43,\"type\":\"cancelled\",\"subject\":\"Order #43\",\"message\":\"Order has been cancelled.\"}', '2024-01-04 13:14:50', '2023-10-27 07:42:19', '2024-01-04 13:14:50'),
('3e19670d-5053-40be-ac3c-d63ca62d24a7', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 2, '{\"id\":10,\"type\":\"courier_arrived\",\"subject\":\"Order #10\",\"message\":\"Delivery person has been arrived at pickup location and waiting for a client.\"}', '2023-09-14 17:34:56', '2023-09-14 08:38:21', '2023-09-14 17:34:56'),
('3e392831-3988-4cc3-a970-af0afa197647', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 6, '{\"id\":10,\"type\":\"courier_assigned\",\"subject\":\"Order #10\",\"message\":\"New Order #10 has been assigned to you.\"}', '2023-09-14 06:26:02', '2023-09-14 06:25:10', '2023-09-14 06:26:02'),
('6764653d-6841-48ff-97a7-cfff95b806eb', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":35,\"type\":\"cancelled\",\"subject\":\"Order #35\",\"message\":\"Order has been cancelled.\"}', '2024-01-04 13:14:50', '2023-10-07 08:02:40', '2024-01-04 13:14:50'),
('770f4afa-f3d2-46d3-9287-6391899bf006', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":36,\"type\":\"cancelled\",\"subject\":\"Order #36\",\"message\":\"Order has been cancelled.\"}', '2024-01-04 13:14:50', '2023-10-07 08:18:29', '2024-01-04 13:14:50'),
('7f44aa32-9b18-424d-b3b4-6ab21ba20b8f', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":31,\"type\":\"cancelled\",\"subject\":\"Order #31\",\"message\":\"Order has been cancelled.\"}', '2024-01-04 13:14:50', '2023-10-07 07:55:33', '2024-01-04 13:14:50'),
('d13eb23c-d1e4-4f3e-a895-bc754240951d', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":10,\"type\":\"courier_arrived\",\"subject\":\"Order #10\",\"message\":\"Delivery person has been arrived at pickup location and waiting for a client.\"}', '2024-01-04 13:14:50', '2023-09-14 08:38:21', '2024-01-04 13:14:50'),
('f3407cb0-a5a5-4853-b751-a94d6d632ce0', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 2, '{\"id\":10,\"type\":\"courier_assigned\",\"subject\":\"Order #10\",\"message\":\"Your Order #10 has been assigned to Ad Gjgg.\"}', '2023-09-14 17:34:56', '2023-09-14 06:25:10', '2023-09-14 17:34:56'),
('fe942051-ab6a-4870-885b-be6d33b1f200', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 1, '{\"id\":38,\"type\":\"cancelled\",\"subject\":\"Order #38\",\"message\":\"Order has been cancelled.\"}', '2024-01-04 13:14:50', '2023-10-08 09:28:32', '2024-01-04 13:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pi_company_name` varchar(256) DEFAULT NULL,
  `pi_department_name` varchar(256) DEFAULT NULL,
  `pi_first_name` varchar(256) DEFAULT NULL,
  `pi_last_name` varchar(256) DEFAULT NULL,
  `pickup_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pickup_postal_code',
  `pickup_address` text DEFAULT NULL,
  `pickup_contact` varchar(256) DEFAULT NULL,
  `pickup_instructions` text DEFAULT NULL,
  `di_company_name` varchar(256) DEFAULT NULL,
  `di_department_name` varchar(256) NOT NULL,
  `di_first_name` varchar(256) DEFAULT NULL,
  `di_last_name` varchar(256) DEFAULT NULL,
  `delivery_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'delivery_postal_code',
  `delivery_address` text DEFAULT NULL,
  `delivery_contact` varchar(256) DEFAULT NULL,
  `delivery_instructions` text DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_type` varchar(255) DEFAULT NULL COMMENT 'document_type',
  `total_weight` double DEFAULT 0,
  `total_distance` double DEFAULT 0,
  `date` datetime DEFAULT NULL COMMENT 'order_date',
  `oder_type` int(11) DEFAULT 0 COMMENT '0=InstantDelivery,1=ScheduledDelivery',
  `pickup_datetime` datetime DEFAULT NULL,
  `delivery_datetime` datetime DEFAULT NULL,
  `parent_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `payment_collect_from` varchar(255) DEFAULT NULL COMMENT 'on_pickup, on_delivery',
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fixed_charges` double DEFAULT 0,
  `weight_charge` double DEFAULT 0,
  `distance_charge` double DEFAULT 0,
  `extra_charges` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra_charges`)),
  `total_amount` double DEFAULT 0,
  `pickup_confirm_by_client` tinyint(4) DEFAULT 0 COMMENT '0-not confirm , 1 - confirm',
  `pickup_confirm_by_delivery_man` tinyint(4) DEFAULT 0 COMMENT '0-not confirm , 1 - confirm',
  `total_parcel` double DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vehicle_data`)),
  `auto_assign` tinyint(4) DEFAULT NULL,
  `cancelled_delivery_man_ids` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `pi_company_name`, `pi_department_name`, `pi_first_name`, `pi_last_name`, `pickup_point`, `pickup_address`, `pickup_contact`, `pickup_instructions`, `di_company_name`, `di_department_name`, `di_first_name`, `di_last_name`, `delivery_point`, `delivery_address`, `delivery_contact`, `delivery_instructions`, `country_id`, `city_id`, `parcel_type`, `total_weight`, `total_distance`, `date`, `oder_type`, `pickup_datetime`, `delivery_datetime`, `parent_order_id`, `payment_id`, `reason`, `status`, `payment_collect_from`, `delivery_man_id`, `fixed_charges`, `weight_charge`, `distance_charge`, `extra_charges`, `total_amount`, `pickup_confirm_by_client`, `pickup_confirm_by_delivery_man`, `total_parcel`, `vehicle_id`, `vehicle_data`, `auto_assign`, `cancelled_delivery_man_ids`, `created_at`, `updated_at`, `deleted_at`) VALUES
(63, 63, NULL, NULL, NULL, NULL, '\"SA001\"', NULL, NULL, NULL, NULL, '', NULL, NULL, '\"SA001\"', NULL, NULL, NULL, NULL, NULL, '1', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2024-05-17 22:17:51', '2024-05-17 22:17:51', NULL),
(64, 63, NULL, NULL, NULL, NULL, '\"SA001\"', NULL, NULL, NULL, NULL, '', NULL, NULL, '\"SA001\"', NULL, NULL, NULL, NULL, NULL, '4', 10, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 5, NULL, NULL, NULL, NULL, '2024-05-17 22:25:42', '2024-05-17 22:25:42', NULL),
(65, 63, NULL, NULL, NULL, NULL, '\"SA001\"', 'Test Pickup Location', '7004920898', 'Test Pickup Description', NULL, '', NULL, NULL, '\"SA001\"', 'Test Delivery Location', '8995695869', 'Test Delivery Description', NULL, NULL, '4', 10, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 5, NULL, NULL, NULL, NULL, '2024-05-17 22:33:37', '2024-05-17 22:33:37', NULL),
(66, 63, NULL, NULL, NULL, NULL, '\"SA001\"', 'Test Pickup Location', '7004920898', 'Test Pickup Description', NULL, '', NULL, NULL, '\"SA001\"', 'Test Delivery Location', '8995695869', 'Test Delivery Description', NULL, NULL, '4', 10, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 5, NULL, NULL, NULL, NULL, '2024-05-18 22:36:21', '2024-05-17 22:36:21', NULL),
(67, 64, NULL, NULL, NULL, NULL, '\"SA001\"', 'Test Pickup Location', '7004920898', 'qweqwewq', NULL, '', NULL, NULL, '\"SA001\"', 'Test Delivery Location', '8995695869', 'zxczxcwfwr w w we w', NULL, NULL, '6', 20, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 15, NULL, NULL, NULL, NULL, '2024-05-17 22:37:00', '2024-05-19 06:51:19', NULL),
(78, 70, NULL, NULL, NULL, NULL, '\"SA\"', 'Patna, Bihar, India', '07004920897', 'adadadasd', NULL, '', NULL, NULL, '\"SX\"', 'Patna, Bihar, India', '07004920897', 'qweqweq', NULL, NULL, '10', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, 64, 0, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:57:49', '2024-05-19 06:53:12', NULL),
(79, NULL, NULL, NULL, NULL, NULL, '\"SA\"', 'Patna, Bihar, India', '07004920897', 'adw', NULL, '', NULL, NULL, '\"SX\"', 'Bengaluru', '07004920897', 'werwerwerwrwr', NULL, NULL, '10', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 2, NULL, NULL, NULL, NULL, '2024-05-19 07:22:10', '2024-05-19 07:22:10', NULL),
(80, 63, NULL, NULL, NULL, NULL, '\"SA\"', 'Bengaluru', '07004920897', 's', NULL, '', NULL, NULL, '\"SX\"', 'Bengaluru', '07004920897', 'AFSAFSF', NULL, NULL, '12', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2024-05-19 07:23:20', '2024-05-19 07:23:20', NULL),
(81, 68, NULL, NULL, NULL, NULL, '\"sa\"', 'Patna, Bihar, India', '07004920897', NULL, NULL, '', NULL, NULL, '\"sx\"', 'Patna, Bihar, India', '07004920897', NULL, NULL, NULL, '12', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2024-06-02 00:09:14', '2024-06-02 00:09:14', NULL),
(82, 68, 'Deepesh InfoTech', 'departmet', 'Deepesh', 'Raj', '\"SA\"', 'Patna, Bihar, India', '07004920897', 'pd', 'abcd company', 'utuytyu', 'Deepesh', 'Raj', '\"SX\"', 'Bengaluru', '07004920897', 'dd', NULL, NULL, '12', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, 10, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, '2024-06-02 04:58:19', '2024-06-02 04:58:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `history_type` varchar(255) DEFAULT NULL,
  `history_message` varchar(255) DEFAULT NULL,
  `history_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`history_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_size_modals`
--

CREATE TABLE `parcel_size_modals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_size_modals`
--

INSERT INTO `parcel_size_modals` (`id`, `name`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Extra Small', 10.00, 1, NULL, NULL),
(2, 'Small', 20.00, 1, NULL, NULL),
(3, 'Medium', 30.00, 1, NULL, NULL),
(4, 'Large', 40.00, 1, NULL, NULL),
(5, 'Extra Large', 50.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `total_amount` double DEFAULT 0,
  `payment_type` varchar(255) NOT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL COMMENT 'pending, paid, failed',
  `transaction_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`transaction_detail`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cancel_charges` double DEFAULT 0,
  `admin_commission` double DEFAULT 0,
  `delivery_man_commission` double DEFAULT 0,
  `received_by` varchar(255) DEFAULT NULL,
  `delivery_man_fee` double DEFAULT 0,
  `delivery_man_tip` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '0- InActive, 1- Active',
  `is_test` tinyint(4) DEFAULT 1 COMMENT '0-  No, 1- Yes',
  `test_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`test_value`)),
  `live_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`live_value`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `title`, `type`, `status`, `is_test`, `test_value`, `live_value`, `created_at`, `updated_at`) VALUES
(1, 'CARD/TRANSFER', 'stripe', 1, 1, '{\"secret_key\":\"sk_test_4b90901b0f5634561ea6b8e72c2145221c46f958\",\"publishable_key\":\"pk_test_ca1dbb184d371ae3431a53f300e7c099ea542a30\"}', NULL, '2024-01-02 18:33:17', '2024-01-19 10:46:50'),
(3, 'PayStack', 'paystack', 1, 1, '{\"public_key\":\"sk_test_4b90901b0f5634561ea6b8e72c2145221c46f958\"}', '{\"public_key\":\"sk_live_d74389d35e8ce30ea1d83f26d4e9bb94cd7a2516\"}', '2024-01-20 11:09:17', '2024-02-13 01:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '65d208e38f31c44cf8b3ce6b539239c243da4ead59f1ba6cb058aa8c9dc3bcbd', '[\"*\"]', '2023-08-16 07:06:45', '2023-08-16 02:33:24', '2023-08-16 07:06:45'),
(2, 'App\\Models\\User', 1, 'auth_token', '2f1b8df66307c039d4ba9e3bea1cba9384d5bde95184efcb60299fc15f89b81d', '[\"*\"]', '2023-10-02 04:54:44', '2023-08-16 07:13:14', '2023-10-02 04:54:44'),
(3, 'App\\Models\\User', 1, 'auth_token', '7092284e68d825cf36fe79d8628bce82e181c8a453fe498a86b126a125699c15', '[\"*\"]', '2023-09-15 06:33:39', '2023-09-10 09:55:31', '2023-09-15 06:33:39'),
(4, 'App\\Models\\User', 1, 'auth_token', '3b0ea635b8b7a36aa9cb28a74e756b8566503eba194974adaa97768699537773', '[\"*\"]', '2023-09-10 22:18:22', '2023-09-10 20:01:30', '2023-09-10 22:18:22'),
(5, 'App\\Models\\User', 1, 'auth_token', '8828d2766a5e3bca346b61a21de679f57fe3a4ddca38ca2228af0f618c8662f5', '[\"*\"]', '2024-01-15 22:47:14', '2023-09-10 22:19:11', '2024-01-15 22:47:14'),
(6, 'App\\Models\\User', 2, 'auth_token', '778618db7cc73e704e9f473fc9a6a521563284c065127b379af6a58f1bd3f25d', '[\"*\"]', NULL, '2023-09-13 09:44:01', '2023-09-13 09:44:01'),
(7, 'App\\Models\\User', 2, 'auth_token', '6c0b86f6f37b6cf55b3af0984dcdf6091b7e0fd0b2f89c1016c864815982e91e', '[\"*\"]', '2023-09-13 09:45:16', '2023-09-13 09:44:05', '2023-09-13 09:45:16'),
(8, 'App\\Models\\User', 2, 'auth_token', '0579d1c25425afd78af726366a764aebd50861d3a6efe4f62b68d3c92b7a6d08', '[\"*\"]', '2023-09-13 10:53:02', '2023-09-13 10:01:29', '2023-09-13 10:53:02'),
(9, 'App\\Models\\User', 2, 'auth_token', '0654d7da98311ea9e75c73c6a7b5ad38156143929f7725a3b4d0a8dd265c96ee', '[\"*\"]', '2023-09-13 10:57:43', '2023-09-13 10:53:13', '2023-09-13 10:57:43'),
(10, 'App\\Models\\User', 2, 'auth_token', '8376fe3d2c5a2bfcf0dc8f6281b85f5d1730dbad2f4e11d64412c96bb13adc93', '[\"*\"]', '2023-09-13 11:08:49', '2023-09-13 10:57:54', '2023-09-13 11:08:49'),
(11, 'App\\Models\\User', 2, 'auth_token', 'b61c5d984895067981d5cb1f2b7057f4e43333950234fa6ee343353d426d4101', '[\"*\"]', '2023-09-13 11:45:10', '2023-09-13 11:30:33', '2023-09-13 11:45:10'),
(12, 'App\\Models\\User', 3, 'auth_token', '66ef66616528c8aad104fc8f3fb02fdbab6deed7cd0f76670d56d27ce95a6d10', '[\"*\"]', NULL, '2023-09-13 11:46:04', '2023-09-13 11:46:04'),
(13, 'App\\Models\\User', 3, 'auth_token', '98da877eb39469fae9e70977ab62667bc0f8e0e9ff73bf757f218ede52b43765', '[\"*\"]', NULL, '2023-09-13 11:47:04', '2023-09-13 11:47:04'),
(14, 'App\\Models\\User', 3, 'auth_token', '4723537bb46165592d3377d7a60b104965d0fafefaf1715c5bdf8a144eba8bc0', '[\"*\"]', '2023-09-13 11:47:27', '2023-09-13 11:47:23', '2023-09-13 11:47:27'),
(15, 'App\\Models\\User', 4, 'auth_token', '85b07d66758b598c3cc7bb511416ea21dbfb27f31de285543fe8f7a5831de83f', '[\"*\"]', NULL, '2023-09-13 12:23:12', '2023-09-13 12:23:12'),
(16, 'App\\Models\\User', 4, 'auth_token', '252eb414913615dcdbcb9e3e743e194a172f0cef5bba6e08198c88f44f16e38b', '[\"*\"]', '2023-09-13 12:26:14', '2023-09-13 12:23:14', '2023-09-13 12:26:14'),
(17, 'App\\Models\\User', 2, 'auth_token', 'afb08d70193404168aa87f7f0ea0b389507de99c4b6fa37a4fca205e07cd2553', '[\"*\"]', '2023-09-13 18:33:01', '2023-09-13 12:32:45', '2023-09-13 18:33:01'),
(18, 'App\\Models\\User', 5, 'auth_token', 'a0f691d4318db7e507238eabdd8d19d17e23934b135c417e64f613e347943175', '[\"*\"]', NULL, '2023-09-13 13:01:05', '2023-09-13 13:01:05'),
(19, 'App\\Models\\User', 5, 'auth_token', '2489fabaf3d44dfb89e01f973e15fa9191690f7ee76c258828571141b8e6b48e', '[\"*\"]', '2023-09-13 13:21:51', '2023-09-13 13:01:09', '2023-09-13 13:21:51'),
(20, 'App\\Models\\User', 2, 'auth_token', 'a8ccfc5cadb46917cc22d06eac2d183c0e30bae3e065edbd07d49d232b3aa905', '[\"*\"]', '2023-09-13 13:30:55', '2023-09-13 13:23:17', '2023-09-13 13:30:55'),
(21, 'App\\Models\\User', 2, 'auth_token', 'e6a43619ba39a5dd7286f1deca7a24a0ceaae32f0c07ee135d99952314169c87', '[\"*\"]', '2024-04-23 07:16:19', '2023-09-13 18:09:11', '2024-04-23 07:16:19'),
(22, 'App\\Models\\User', 6, 'auth_token', 'a56120e24865cc29778107ebe870f192507f05eec86416c734479409338f7dca', '[\"*\"]', NULL, '2023-09-13 18:36:31', '2023-09-13 18:36:31'),
(23, 'App\\Models\\User', 2, 'auth_token', 'b5a248969b0ed0f63cc5400719f45659808dc301bb2a833aa30e83eab64f7c76', '[\"*\"]', '2023-09-14 06:08:37', '2023-09-13 18:36:47', '2023-09-14 06:08:37'),
(24, 'App\\Models\\User', 1, 'auth_token', '034aea5bb5b46e3258be55e948de12c22cade5672edf6590c96a404731ae6900', '[\"*\"]', NULL, '2023-09-14 06:07:16', '2023-09-14 06:07:16'),
(25, 'App\\Models\\User', 1, 'auth_token', 'eb376fba554ca024f703b383b730dd9feecc75eed013072f999d84f156914049', '[\"*\"]', '2023-09-14 07:02:27', '2023-09-14 06:07:16', '2023-09-14 07:02:27'),
(26, 'App\\Models\\User', 7, 'auth_token', 'b4e0e765516e6d95d3804fb205edff8c40ba0c7b0aa3403b0de8b0d8474ecbbe', '[\"*\"]', NULL, '2023-09-14 06:12:35', '2023-09-14 06:12:35'),
(27, 'App\\Models\\User', 7, 'auth_token', '8aa6c17dd0e1f3190a57ff77fb3ea1edcf8296087e68e82d1d53c9c01c936eac', '[\"*\"]', '2023-09-14 06:14:07', '2023-09-14 06:12:58', '2023-09-14 06:14:07'),
(28, 'App\\Models\\User', 7, 'auth_token', 'a06bfc719db2ef1d52dbc71e92139d97de98c9ee25ca470937817cfa16e7343a', '[\"*\"]', '2023-09-14 06:14:13', '2023-09-14 06:14:12', '2023-09-14 06:14:13'),
(29, 'App\\Models\\User', 6, 'auth_token', 'fa74c801c9b1061930aa634c32d29b13a35a97ed8b35f2bed0a729775854010f', '[\"*\"]', '2023-09-14 19:36:14', '2023-09-14 06:21:28', '2023-09-14 19:36:14'),
(30, 'App\\Models\\User', 8, 'auth_token', '98fb143a5801b8ed6dd724bb3d1e8a2d98eb0316ed8acc28919ac4719890a30c', '[\"*\"]', NULL, '2023-09-14 10:48:41', '2023-09-14 10:48:41'),
(31, 'App\\Models\\User', 8, 'auth_token', 'bd3725502f4b9554b687987b5d53d767dc0ddba7511b59d26cc1a67785c7faab', '[\"*\"]', '2023-09-14 22:07:35', '2023-09-14 10:48:43', '2023-09-14 22:07:35'),
(32, 'App\\Models\\User', 8, 'auth_token', '228fdfb039d78cbf9e33df062dade78d56008ae0bcfb2ca437b968421c5cb43b', '[\"*\"]', '2023-09-26 15:45:21', '2023-09-14 22:10:28', '2023-09-26 15:45:21'),
(33, 'App\\Models\\User', 6, 'auth_token', '60ea1eaaf75df6b47472c66c09e29135fbb5610709a06d84b63c55d9d05ad782', '[\"*\"]', '2023-09-15 14:00:35', '2023-09-15 13:19:55', '2023-09-15 14:00:35'),
(34, 'App\\Models\\User', 6, 'auth_token', '3b078efcce6b13dae7f7cece523e5ad5cb74d74e6b9ec33e8a21ae6764193137', '[\"*\"]', '2023-09-26 15:49:07', '2023-09-22 14:41:38', '2023-09-26 15:49:07'),
(35, 'App\\Models\\User', 8, 'auth_token', 'c52dac59afba412f2890326ecc5b8de46377b0f4e377c53ff424738bb2cdc772', '[\"*\"]', '2023-09-26 16:36:23', '2023-09-26 15:47:07', '2023-09-26 16:36:23'),
(36, 'App\\Models\\User', 9, 'auth_token', 'adc5f6a2274f1d24282ee0f0b424ba63226abca46bcf585400fcf86640407b1e', '[\"*\"]', NULL, '2023-09-29 05:35:48', '2023-09-29 05:35:48'),
(37, 'App\\Models\\User', 9, 'auth_token', 'e0e18912a8882fe0ee0fd8754ee39778b2a33d28440c77c964468c26788077cf', '[\"*\"]', '2023-09-29 05:36:58', '2023-09-29 05:35:53', '2023-09-29 05:36:58'),
(38, 'App\\Models\\User', 10, 'auth_token', 'f8abb7d4777920560227866fbb32c06ea07de146d6cee13800f7864cf21951b0', '[\"*\"]', NULL, '2023-09-29 05:38:04', '2023-09-29 05:38:04'),
(39, 'App\\Models\\User', 10, 'auth_token', '54354db5ef0f4eb838605ad0f89a83a2eb2ff2f28fdd0f5c442919d9220925de', '[\"*\"]', '2023-09-29 05:38:40', '2023-09-29 05:38:08', '2023-09-29 05:38:40'),
(40, 'App\\Models\\User', 11, 'auth_token', '1dc4ca2109c6b39dedfe73f9ef326726b4f540cf0a1cc9a9418181cf7881f870', '[\"*\"]', NULL, '2023-09-29 05:40:48', '2023-09-29 05:40:48'),
(41, 'App\\Models\\User', 11, 'auth_token', 'd88853d85f8dfe1bd1c0a56d1e795525aed645b490588ab305d8bc1b73d782cc', '[\"*\"]', NULL, '2023-09-29 05:41:28', '2023-09-29 05:41:28'),
(42, 'App\\Models\\User', 12, 'auth_token', '4f17535aa7a127fd798705c5268458480819a1c02ed0ddd20805c5da86df5255', '[\"*\"]', NULL, '2023-09-29 05:42:32', '2023-09-29 05:42:32'),
(43, 'App\\Models\\User', 12, 'auth_token', '6184417f7ed3b994803cd15137b9548a2d02eced674e59ba34fdff6f3df12340', '[\"*\"]', '2023-09-29 05:44:00', '2023-09-29 05:42:35', '2023-09-29 05:44:00'),
(44, 'App\\Models\\User', 12, 'auth_token', '62d7711aa866242dfdff630aad17a8b621b2fa9baf6ce3e1db8667fba8b5f11e', '[\"*\"]', '2023-09-29 06:19:20', '2023-09-29 05:55:57', '2023-09-29 06:19:20'),
(45, 'App\\Models\\User', 13, 'auth_token', '50d0c4d0c7214f75d731e137cfb47d4bdbad58685d00c67f109119d9feb54b0c', '[\"*\"]', NULL, '2023-09-29 06:20:01', '2023-09-29 06:20:01'),
(46, 'App\\Models\\User', 13, 'auth_token', '014ee511074d11950c509516829b735e65d4cea8ae43789f9180ff68da406522', '[\"*\"]', '2023-09-29 09:52:44', '2023-09-29 06:20:04', '2023-09-29 09:52:44'),
(47, 'App\\Models\\User', 13, 'auth_token', 'fab58ec5e63ad0440463f1c725ac6075aa2a676ae5b592db5b930306517b57d9', '[\"*\"]', '2023-09-29 10:00:20', '2023-09-29 09:52:50', '2023-09-29 10:00:20'),
(48, 'App\\Models\\User', 13, 'auth_token', 'd0b9f066b13ae2bdb9fe5ddcbba0584f8525352db03927459eb36a3397f1f6cb', '[\"*\"]', '2023-09-29 10:01:11', '2023-09-29 10:00:25', '2023-09-29 10:01:11'),
(49, 'App\\Models\\User', 13, 'auth_token', '23bfe46943cc9e8f742b029554de074620f03dbe6379cd894bd60c1cad08aa9c', '[\"*\"]', '2023-09-29 10:04:06', '2023-09-29 10:02:52', '2023-09-29 10:04:06'),
(50, 'App\\Models\\User', 13, 'auth_token', '7b5d888fc5aec784812164761caa901700ae480764c2df7de5f97d0832d21032', '[\"*\"]', '2023-09-29 10:04:47', '2023-09-29 10:04:10', '2023-09-29 10:04:47'),
(51, 'App\\Models\\User', 13, 'auth_token', '49c4f3d313c0c56a6a0599eaa207cd566929cf939fc686ac086f378b12425ac3', '[\"*\"]', '2023-09-29 10:11:11', '2023-09-29 10:04:57', '2023-09-29 10:11:11'),
(52, 'App\\Models\\User', 13, 'auth_token', '9d8a206d8e15e30e6b53525dc4075ed8a85af770d71d85c829574e408ef967f9', '[\"*\"]', '2023-09-29 10:12:39', '2023-09-29 10:11:15', '2023-09-29 10:12:39'),
(53, 'App\\Models\\User', 13, 'auth_token', '3004ba4d9acd4ebfdbcc81b71cde2711da3105980f4cd9249124534cbf080b43', '[\"*\"]', '2023-09-29 10:16:52', '2023-09-29 10:15:01', '2023-09-29 10:16:52'),
(54, 'App\\Models\\User', 13, 'auth_token', '2d4544c5c910340a9a2d43099f378f6446731c8cdb0dd85121b4be6a791907ac', '[\"*\"]', '2023-09-29 10:18:55', '2023-09-29 10:18:52', '2023-09-29 10:18:55'),
(55, 'App\\Models\\User', 13, 'auth_token', '736386ff257cbda04d1f38300d56f84cb1f615450ef8586b271b4f32cb0fe89c', '[\"*\"]', '2023-09-29 10:19:48', '2023-09-29 10:19:46', '2023-09-29 10:19:48'),
(56, 'App\\Models\\User', 13, 'auth_token', '8e98f6a4925a7d38d319127d7ea2e781cb11b175dfe01009eb752ac3c013098d', '[\"*\"]', '2023-09-29 10:30:50', '2023-09-29 10:30:47', '2023-09-29 10:30:50'),
(57, 'App\\Models\\User', 13, 'auth_token', '08726abfb03f94cb3a137ec5fa83a50d03fa63c9e2741ed15493f1872487445f', '[\"*\"]', '2023-10-02 04:36:08', '2023-09-29 11:10:24', '2023-10-02 04:36:08'),
(58, 'App\\Models\\User', 14, 'auth_token', '16dfc3832d09129a6119af31f0f18b8bccef73821dafbd349c8bfebde3ad900d', '[\"*\"]', NULL, '2023-09-29 20:13:58', '2023-09-29 20:13:58'),
(59, 'App\\Models\\User', 14, 'auth_token', '8e6ee2b30be60d61a0cadc313f56ac7ca183204898ce578e428c1fe6f08c2d3a', '[\"*\"]', '2023-09-29 20:14:59', '2023-09-29 20:14:32', '2023-09-29 20:14:59'),
(60, 'App\\Models\\User', 14, 'auth_token', '3d95ab678415057454899a28c0698240154e2aa5eb5eba3e5a8d9ad2692114af', '[\"*\"]', '2023-09-29 20:18:26', '2023-09-29 20:15:03', '2023-09-29 20:18:26'),
(61, 'App\\Models\\User', 14, 'auth_token', '8f75b101bb39f5285fa140d0d2d4ca5e06ee75a12d87d3ffcec84fa07f5f434f', '[\"*\"]', '2023-09-29 20:18:50', '2023-09-29 20:18:50', '2023-09-29 20:18:50'),
(62, 'App\\Models\\User', 14, 'auth_token', 'd59d0c4c44550b6fef1442430bc9dcd7bb47288f95689d656030cbce694a0910', '[\"*\"]', '2023-10-07 19:12:40', '2023-09-29 20:19:29', '2023-10-07 19:12:40'),
(63, 'App\\Models\\User', 13, 'auth_token', '5d709e07431970479af6953fa0325fa65b290ccc141f43099eacf098fc954af6', '[\"*\"]', '2023-10-02 04:38:01', '2023-10-02 04:37:18', '2023-10-02 04:38:01'),
(64, 'App\\Models\\User', 13, 'auth_token', '55d0268ccdb08a266af945983140dcebedadd44a266a51cb6b6eae63df6dbce0', '[\"*\"]', NULL, '2023-10-02 04:38:01', '2023-10-02 04:38:01'),
(65, 'App\\Models\\User', 13, 'auth_token', '2b085fa35e89282f34715db40c6401539576baf7010d7f838488c595584fd738', '[\"*\"]', '2023-10-02 04:50:32', '2023-10-02 04:38:02', '2023-10-02 04:50:32'),
(66, 'App\\Models\\User', 1, 'auth_token', 'ca1d9db7d7f0d6302b514b6d59b5fee1c1d34858e510c2fa1907ae7062d36f08', '[\"*\"]', '2023-10-02 04:57:30', '2023-10-02 04:55:07', '2023-10-02 04:57:30'),
(67, 'App\\Models\\User', 2, 'auth_token', '8c2c6dfe9c70d4433bb64dce0b4412a4b5354ba9acfbf11cb2c4a789bfe14bf6', '[\"*\"]', '2023-10-02 04:57:49', '2023-10-02 04:57:43', '2023-10-02 04:57:49'),
(68, 'App\\Models\\User', 3, 'auth_token', '1b414eb120c312cb8a3ebaf9489505b836dddbcaa247eec8f4b7ab155731aa3b', '[\"*\"]', '2023-10-02 04:58:48', '2023-10-02 04:58:43', '2023-10-02 04:58:48'),
(69, 'App\\Models\\User', 15, 'auth_token', 'baddb07c908f1ea6545141c09ce45b9efa509dce5ca79a7fb55ab7b7b5e43536', '[\"*\"]', NULL, '2023-10-07 06:10:26', '2023-10-07 06:10:26'),
(70, 'App\\Models\\User', 15, 'auth_token', '875bb81189a9d3771743b36caab1807b9a77a35ef7de85f86f3565f57b56980c', '[\"*\"]', NULL, '2023-10-07 06:10:34', '2023-10-07 06:10:34'),
(71, 'App\\Models\\User', 16, 'auth_token', '644b3b5df280bacc5c67f262826d90ed48caea36d44926773cff1e3bb12b42bb', '[\"*\"]', NULL, '2023-10-07 06:12:16', '2023-10-07 06:12:16'),
(72, 'App\\Models\\User', 16, 'auth_token', '48b824dc8d0df73e2f26ff94549250ab80f2d8c73856027409750c4fdba48830', '[\"*\"]', '2023-10-07 08:18:42', '2023-10-07 06:12:19', '2023-10-07 08:18:42'),
(73, 'App\\Models\\User', 16, 'auth_token', '056442903b9e80040cfce45c9edcb5c3df2fb61d2af90527c449e8b70504dd37', '[\"*\"]', '2023-11-09 10:40:25', '2023-10-07 09:39:16', '2023-11-09 10:40:25'),
(74, 'App\\Models\\User', 4, 'auth_token', 'b170b4efc5c47ff1177b73527ca889103d85ea1796d193402b0121860ac2938f', '[\"*\"]', '2023-10-24 10:11:20', '2023-10-24 10:11:18', '2023-10-24 10:11:20'),
(75, 'App\\Models\\User', 14, 'auth_token', 'a7eec62e1cf32625ff5fcb0e7a358a44facb2ad67a88a5a5dc585f7ddf85b89f', '[\"*\"]', '2024-02-10 19:05:57', '2023-10-26 12:26:41', '2024-02-10 19:05:57'),
(76, 'App\\Models\\User', 14, 'auth_token', '31140643e21e982285a979e1e2865bee6cdcc62ca7dae524c65d2b28d92c1899', '[\"*\"]', '2023-10-26 12:39:30', '2023-10-26 12:30:09', '2023-10-26 12:39:30'),
(77, 'App\\Models\\User', 14, 'auth_token', 'fe700fb13d574e6fb5c38e49e313acd23b1066549bbf3469041b8735776db25d', '[\"*\"]', '2023-10-27 18:36:18', '2023-10-26 12:41:24', '2023-10-27 18:36:18'),
(78, 'App\\Models\\User', 1, 'auth_token', 'f6972725bf11105387b46e5b47aa85702490b1302c20b4f25681094d2d96ceee', '[\"*\"]', '2024-01-05 07:48:45', '2023-10-26 12:53:17', '2024-01-05 07:48:45'),
(79, 'App\\Models\\User', 14, 'auth_token', 'f821c28f9a4d1da97f7e30c1a2c9807d09cc7898e6f6f99d39c0c57216e1fe33', '[\"*\"]', '2023-11-03 23:26:29', '2023-10-27 18:36:27', '2023-11-03 23:26:29'),
(80, 'App\\Models\\User', 17, 'auth_token', '399384683f9d3ba1ffd3b2552ba01ee641f27c4775490ca2fa5fa471c3775253', '[\"*\"]', NULL, '2023-11-09 09:56:21', '2023-11-09 09:56:21'),
(81, 'App\\Models\\User', 18, 'auth_token', '9ddc2b4d402615259140db3c50a7f876c83bb9f73f647a33b79258bbe910dd7b', '[\"*\"]', NULL, '2023-11-09 09:57:04', '2023-11-09 09:57:04'),
(82, 'App\\Models\\User', 19, 'auth_token', '6725f0dbd8068d14c5664aa70e81a1ded08a4e10fb2e4f6d72f4606c329fb42a', '[\"*\"]', NULL, '2023-11-09 09:57:17', '2023-11-09 09:57:17'),
(83, 'App\\Models\\User', 16, 'auth_token', '8e8b36ec36f560fb4690dc8279673596b2dd5021594061d008a15ce1dc06e51f', '[\"*\"]', '2023-11-09 10:40:58', '2023-11-09 10:40:45', '2023-11-09 10:40:58'),
(84, 'App\\Models\\User', 20, 'auth_token', '3ea6bac6315e918648b390c42c52c16bee4438a31da0d2d8f28db9b07daf247b', '[\"*\"]', NULL, '2023-11-09 10:41:25', '2023-11-09 10:41:25'),
(85, 'App\\Models\\User', 21, 'auth_token', '21f59640d16301e31b2dff43b28b69b0e72ee1bad4bf527b9474260eed093bd3', '[\"*\"]', NULL, '2023-11-09 10:42:08', '2023-11-09 10:42:08'),
(86, 'App\\Models\\User', 22, 'auth_token', '2345f81536d3746fdd4bd37bd293e0b34b5ef901ce94bd21a9a7fbf9a401284a', '[\"*\"]', NULL, '2023-11-09 10:44:27', '2023-11-09 10:44:27'),
(87, 'App\\Models\\User', 16, 'auth_token', '109e1a7a4f60c5d3000cb08c0cf4bb970ed4ab4016e7cb8bd3924ddbc0a31983', '[\"*\"]', '2023-12-28 10:34:17', '2023-11-09 14:43:57', '2023-12-28 10:34:17'),
(88, 'App\\Models\\User', 16, 'auth_token', '8cf2f57d3531a0da5ffe72eda03191110f3c336d8f1fb86754408eeaa8664cd5', '[\"*\"]', '2023-11-09 17:06:20', '2023-11-09 17:06:00', '2023-11-09 17:06:20'),
(89, 'App\\Models\\User', 16, 'auth_token', 'bd30c57da36fc482af0d1a5a160897f7866240654f059e21cab8636d6173e655', '[\"*\"]', '2023-11-13 08:56:16', '2023-11-10 06:54:25', '2023-11-13 08:56:16'),
(90, 'App\\Models\\User', 23, 'auth_token', '10c98cbfc36ca5161cbbce4c0fb1cc04b85bab215317612be648c9f93b7278be', '[\"*\"]', NULL, '2023-11-11 11:48:06', '2023-11-11 11:48:06'),
(91, 'App\\Models\\User', 23, 'auth_token', '5388f5a10bf7067c94cc3d9f73eaa0d6041492e0d17422bb11918075f382a1d5', '[\"*\"]', '2023-11-11 11:48:47', '2023-11-11 11:48:44', '2023-11-11 11:48:47'),
(92, 'App\\Models\\User', 24, 'auth_token', 'c6ed2312e860a3162d4773c37b6a8284f9aa814e7d4464143cc83e992f51c4d2', '[\"*\"]', NULL, '2023-11-11 11:56:01', '2023-11-11 11:56:01'),
(93, 'App\\Models\\User', 24, 'auth_token', '2490bfb83e676bff437907167d52fd74c777e199301c18f3b8f0c8fcc2fa1e1a', '[\"*\"]', '2024-04-30 09:32:26', '2023-11-11 11:56:51', '2024-04-30 09:32:26'),
(94, 'App\\Models\\User', 25, 'auth_token', 'f2b4090b9a657adae19da36d5bda14c5ac6b3469d4892d29d99b2440e207a4b9', '[\"*\"]', NULL, '2023-11-12 10:18:47', '2023-11-12 10:18:47'),
(95, 'App\\Models\\User', 26, 'auth_token', 'f35292aee2c39a2d53230aeae6f3017a87237c7fdeb9ee052fe721b06f079589', '[\"*\"]', NULL, '2023-11-13 08:55:06', '2023-11-13 08:55:06'),
(96, 'App\\Models\\User', 27, 'auth_token', '4820dd242f5fb7e5909a62e21c9d1001cac0069124ea001ca5574244c900b826', '[\"*\"]', NULL, '2023-11-13 08:56:47', '2023-11-13 08:56:47'),
(97, 'App\\Models\\User', 28, 'auth_token', 'a7271a965aefa54f64df67ef24f2071dbf2198e2145c53e80c83568338449270', '[\"*\"]', NULL, '2023-11-13 08:58:24', '2023-11-13 08:58:24'),
(98, 'App\\Models\\User', 29, 'auth_token', 'fd71da90695a6a93e5b78cad0d10d17f2577c0f207acf3410310b4ce7054f1a9', '[\"*\"]', NULL, '2023-11-13 09:27:19', '2023-11-13 09:27:19'),
(99, 'App\\Models\\User', 29, 'auth_token', '7e3ab7494333d12a0f8145cb7b2828959de2c4c806fe36db09cb978adbcb528e', '[\"*\"]', '2023-11-13 09:27:29', '2023-11-13 09:27:23', '2023-11-13 09:27:29'),
(100, 'App\\Models\\User', 30, 'auth_token', 'a592e825c80a6013c39347f3a7507c4df6ccc0056885eacc8fa40be05fafb66c', '[\"*\"]', NULL, '2023-11-13 09:28:05', '2023-11-13 09:28:05'),
(101, 'App\\Models\\User', 31, 'auth_token', 'ac1aba2507c15a71bf46ab54bf2c28e32c91b90a8dd07ba3bfe2e19942dcb5cc', '[\"*\"]', NULL, '2023-11-13 11:15:58', '2023-11-13 11:15:58'),
(102, 'App\\Models\\User', 31, 'auth_token', '3997798e93638b095f48443f85d63cb7021790aedd6057cd6ffe5a474b13d344', '[\"*\"]', '2023-11-13 11:16:39', '2023-11-13 11:16:01', '2023-11-13 11:16:39'),
(103, 'App\\Models\\User', 32, 'auth_token', '78b8756268390b904f42452853ba4f5ce37cd5f6cf2c0584dfca4ff5c866de9a', '[\"*\"]', NULL, '2023-11-13 11:17:35', '2023-11-13 11:17:35'),
(104, 'App\\Models\\User', 32, 'auth_token', '8034a8625f5d620aceaa579c7913ce2344523667f23ff40bc6ca3828fa7f9de2', '[\"*\"]', '2023-11-13 11:17:39', '2023-11-13 11:17:37', '2023-11-13 11:17:39'),
(105, 'App\\Models\\User', 16, 'auth_token', '9f6687a8642129af7bf68d20dddcf7c03a0dad80bb92a694685c39795c76a172', '[\"*\"]', '2023-11-13 11:31:38', '2023-11-13 11:31:29', '2023-11-13 11:31:38'),
(106, 'App\\Models\\User', 33, 'auth_token', 'a9b97dfe13a02c4d0981d9514c999ce5407fed611b866aaf9dd483d15b64cdd0', '[\"*\"]', NULL, '2023-11-13 11:32:02', '2023-11-13 11:32:02'),
(107, 'App\\Models\\User', 33, 'auth_token', 'd8c4225478965b7cd9e51d1ecd99ac62e18bb08d1f70d996ddc88e3089308171', '[\"*\"]', '2023-11-18 09:58:28', '2023-11-13 11:32:05', '2023-11-18 09:58:28'),
(108, 'App\\Models\\User', 34, 'auth_token', 'ddb5246433b28f10198d550b51aaadebb9cef3c1526c7d82c4c831ccb4427267', '[\"*\"]', NULL, '2023-11-13 20:03:41', '2023-11-13 20:03:41'),
(109, 'App\\Models\\User', 34, 'auth_token', 'b57df8ab4397576ff42c9d80927ac1b058bd48c98c104468f57756ffb77a516d', '[\"*\"]', '2023-11-13 20:03:46', '2023-11-13 20:03:44', '2023-11-13 20:03:46'),
(110, 'App\\Models\\User', 35, 'auth_token', '45af46cef46523f6aacefd87b71c31dbfa9b4d9424e70f02c9c92f0eff245f0e', '[\"*\"]', NULL, '2023-11-16 08:26:08', '2023-11-16 08:26:08'),
(111, 'App\\Models\\User', 35, 'auth_token', 'e848c7d95215c1d8d3a83f5fc705b4b58f9c9f68da57a4f615d852d5a496ca55', '[\"*\"]', '2023-11-18 09:57:15', '2023-11-16 08:26:11', '2023-11-18 09:57:15'),
(112, 'App\\Models\\User', 36, 'auth_token', '0d22f5f8e04d1eae2fdc20e886d21aadfc2b5343f4c0f9c2173ff98f0eb80f38', '[\"*\"]', NULL, '2023-11-18 09:57:54', '2023-11-18 09:57:54'),
(113, 'App\\Models\\User', 36, 'auth_token', '8496ebf380a57dccd6c416ce54d2740e23fdc9a8e10ee0ca1cbc25e4c03a26d0', '[\"*\"]', '2023-11-30 05:00:31', '2023-11-18 09:57:57', '2023-11-30 05:00:31'),
(114, 'App\\Models\\User', 36, 'auth_token', '0b87d104f0426cf84e4cd0ba50e1585413dd3edb6ac33c8d86551b06db6a78cc', '[\"*\"]', '2023-11-23 07:21:12', '2023-11-18 09:58:59', '2023-11-23 07:21:12'),
(115, 'App\\Models\\User', 37, 'auth_token', 'f129fcd5adf12178fb4ba8fb9f618f3f1d3af1435d060d92fc1f160461ddd1a5', '[\"*\"]', NULL, '2023-11-22 00:56:36', '2023-11-22 00:56:36'),
(116, 'App\\Models\\User', 14, 'auth_token', '58c38f745c7b89d27c7402e380875a94567e638aafd9f958f979db1efd37c950', '[\"*\"]', '2023-11-30 15:34:05', '2023-11-22 12:25:51', '2023-11-30 15:34:05'),
(117, 'App\\Models\\User', 38, 'auth_token', '4d14d7fb9ac282cccc700895a153a375ccf249f8df78cb56a66483e869871cf9', '[\"*\"]', NULL, '2023-11-22 12:42:07', '2023-11-22 12:42:07'),
(118, 'App\\Models\\User', 38, 'auth_token', '02223686e75ceb91c9cc1fd5bfe24fd4b29e942333629d5f2f8b68995cde890a', '[\"*\"]', '2023-11-22 12:43:58', '2023-11-22 12:42:10', '2023-11-22 12:43:58'),
(119, 'App\\Models\\User', 38, 'auth_token', 'fc32a7ce5a77b423d7f69bc63d617b3c9badcab5765306d51fdc5ec798776d0c', '[\"*\"]', '2023-11-22 12:45:23', '2023-11-22 12:45:20', '2023-11-22 12:45:23'),
(120, 'App\\Models\\User', 38, 'auth_token', '3def2a5ceae8784cba9ec81abb5e93b4dffb6dff5ecd7a20c6d7c1e14d264039', '[\"*\"]', '2023-11-22 13:21:53', '2023-11-22 13:21:48', '2023-11-22 13:21:53'),
(121, 'App\\Models\\User', 39, 'auth_token', 'eb1edd668277aadb7785c1a3a5d31d5e5eb10760f5997ff7410c8867c05c1345', '[\"*\"]', NULL, '2023-11-23 05:57:44', '2023-11-23 05:57:44'),
(122, 'App\\Models\\User', 39, 'auth_token', '092b4d70bdbd0845f3785d01dd030fb50af50bc97b21a03aee812b9c3e1e31e8', '[\"*\"]', '2023-12-06 12:59:04', '2023-11-23 05:57:48', '2023-12-06 12:59:04'),
(123, 'App\\Models\\User', 36, 'auth_token', '6266a969c459b611977cdf1c51a49fee0c16e48dd9ba14e46e8648684c2c51fc', '[\"*\"]', '2023-11-23 07:21:22', '2023-11-23 07:21:18', '2023-11-23 07:21:22'),
(124, 'App\\Models\\User', 40, 'auth_token', 'eeb9a72db522e2d3ba17368ca0a03e12f6f695cce3d2fdb84c939e424994636a', '[\"*\"]', NULL, '2023-11-23 09:47:04', '2023-11-23 09:47:04'),
(125, 'App\\Models\\User', 40, 'auth_token', 'a30c0bc5722ee8363b194fbeb4c0aa2f0ad25ee3506e6b0b2e4ec4e18a6cdee7', '[\"*\"]', '2023-11-23 09:48:16', '2023-11-23 09:47:06', '2023-11-23 09:48:16'),
(126, 'App\\Models\\User', 41, 'auth_token', 'e5e3f17131a9196058b4b8699957bb58eaea8e32f3b8e0075bb5865fb467b7f3', '[\"*\"]', NULL, '2023-11-23 14:24:13', '2023-11-23 14:24:13'),
(127, 'App\\Models\\User', 41, 'auth_token', '47b6525a669a75e7ccdb6d0cf4b7d5717cd3926efcd7fd1270a97218a6fe855d', '[\"*\"]', '2023-11-23 14:24:30', '2023-11-23 14:24:18', '2023-11-23 14:24:30'),
(128, 'App\\Models\\User', 41, 'auth_token', '52190975844948daa912a9b9b4561c33ca001c095f8d6764d89e212d8bed7727', '[\"*\"]', '2023-11-23 14:26:41', '2023-11-23 14:26:38', '2023-11-23 14:26:41'),
(129, 'App\\Models\\User', 41, 'auth_token', 'd381a5cc6d1d42968d9a26e5288419d21b92b87e5fc04db828fc6c627160121b', '[\"*\"]', '2023-11-23 14:27:15', '2023-11-23 14:27:13', '2023-11-23 14:27:15'),
(130, 'App\\Models\\User', 41, 'auth_token', 'd2a15b6441fb835c50cabd16a5c8df3de7b3cfa2f6ac81abede4c906744b5982', '[\"*\"]', '2023-11-23 14:28:09', '2023-11-23 14:28:06', '2023-11-23 14:28:09'),
(131, 'App\\Models\\User', 41, 'auth_token', '14a2dd8659df923db4350dd5539664dada41ebc29348d3b9fc66b407ef1d845f', '[\"*\"]', '2023-11-23 14:29:35', '2023-11-23 14:29:33', '2023-11-23 14:29:35'),
(132, 'App\\Models\\User', 42, 'auth_token', '76b351d7ebc893fa6b2ec9272760120b242cd941ad8a1fa644f2e873feaf4fcd', '[\"*\"]', NULL, '2023-11-26 20:39:39', '2023-11-26 20:39:39'),
(133, 'App\\Models\\User', 42, 'auth_token', '6a53d9c6c30ba84e09e520721f53ad77a130beebacc7fc5d46b88da2f561478e', '[\"*\"]', '2023-11-26 20:40:05', '2023-11-26 20:39:42', '2023-11-26 20:40:05'),
(134, 'App\\Models\\User', 16, 'auth_token', 'a21b25b177fe1b9564f71866ed5072d384119285809992db7f1c4bb4abc1fe4b', '[\"*\"]', '2023-11-27 16:15:57', '2023-11-27 16:15:51', '2023-11-27 16:15:57'),
(135, 'App\\Models\\User', 16, 'auth_token', '5c0b80bef6085f5e8fb945e8d49bca9ee8aa4aefffa76ae9be8fe24aed3801b4', '[\"*\"]', '2023-11-28 05:58:58', '2023-11-28 05:57:56', '2023-11-28 05:58:58'),
(136, 'App\\Models\\User', 16, 'auth_token', '5245fa349f89a970bedde7d3fbc577a77e802b1b8dab6eb36f4e8ea9d45f2028', '[\"*\"]', '2023-11-28 10:15:46', '2023-11-28 10:14:03', '2023-11-28 10:15:46'),
(137, 'App\\Models\\User', 16, 'auth_token', 'd8b2fb6f4597ef531e98b4fe38c3b97503852cf83be68e72b6530b1d366207f6', '[\"*\"]', '2023-11-28 11:09:24', '2023-11-28 11:08:55', '2023-11-28 11:09:24'),
(138, 'App\\Models\\User', 16, 'auth_token', '2e12ddfaa1f7011e26c787d2a0a426cfb075dd6bf0ee1217850e27fbb1bd7e51', '[\"*\"]', '2023-11-30 05:03:45', '2023-11-30 05:00:48', '2023-11-30 05:03:45'),
(139, 'App\\Models\\User', 16, 'auth_token', '48f04c4f17f33ae0c7006e196c7f21e2453f9efbdd9a541dd902d46b6f56cc89', '[\"*\"]', '2023-11-30 08:20:53', '2023-11-30 08:20:50', '2023-11-30 08:20:53'),
(140, 'App\\Models\\User', 16, 'auth_token', '150884e293d23aaf438f92b5f09e9b625dbe245c3a34a468a5fbffcf210aa067', '[\"*\"]', '2023-11-30 08:34:11', '2023-11-30 08:34:02', '2023-11-30 08:34:11'),
(141, 'App\\Models\\User', 43, 'auth_token', '3e26731324f18007a43d1405370ce143dafdcfdb89b8fa4412891565d1911b78', '[\"*\"]', NULL, '2023-11-30 08:34:37', '2023-11-30 08:34:37'),
(142, 'App\\Models\\User', 43, 'auth_token', '5104b953f251b9c7dff4f181458416e848d5b8bc3bfa80a43fe678fa61a0e03b', '[\"*\"]', '2023-11-30 08:40:19', '2023-11-30 08:34:39', '2023-11-30 08:40:19'),
(143, 'App\\Models\\User', 43, 'auth_token', 'bd7c2419f6c1c69f5f5b8f7bcfd7884439e32ddfd576e15a12e8d2191a40f557', '[\"*\"]', '2023-11-30 18:07:13', '2023-11-30 08:40:24', '2023-11-30 18:07:13'),
(144, 'App\\Models\\User', 44, 'auth_token', 'cbc1bbd9d11d9bc58bfe4b2a51ad3a77fb895db905969053681cc404b6308f29', '[\"*\"]', NULL, '2023-11-30 08:48:33', '2023-11-30 08:48:33'),
(145, 'App\\Models\\User', 45, 'auth_token', 'b4a83c16e00eb4c3c7dbb81a3c1d67f1418f3f904166a900374e4f8b8a2c2fac', '[\"*\"]', NULL, '2023-11-30 13:06:53', '2023-11-30 13:06:53'),
(146, 'App\\Models\\User', 45, 'auth_token', 'aa79075c01b6f127933cd8749f4e24822e71d14e80b38422c364fea4c66f000d', '[\"*\"]', '2023-11-30 13:09:29', '2023-11-30 13:06:55', '2023-11-30 13:09:29'),
(147, 'App\\Models\\User', 46, 'auth_token', 'a5d8f09f36a85937944a6c24dbc9882011789e01c39162e213fc03f6c0951732', '[\"*\"]', NULL, '2023-11-30 18:07:44', '2023-11-30 18:07:44'),
(148, 'App\\Models\\User', 46, 'auth_token', '016be741e111201983348d6e8be53064be3d9518df6b5959d73644bd8b2be573', '[\"*\"]', '2023-11-30 18:16:19', '2023-11-30 18:07:48', '2023-11-30 18:16:19'),
(149, 'App\\Models\\User', 46, 'auth_token', '6f768b2154d675920b078374f3af38ce2dbbb0e19626a4e82578d7ef70b5f2b5', '[\"*\"]', '2023-12-05 17:41:37', '2023-11-30 18:16:34', '2023-12-05 17:41:37'),
(150, 'App\\Models\\User', 47, 'auth_token', '194f7276b59d1311b149bf540254b1e1d962a3f6491c20eb912617a95b5ac305', '[\"*\"]', NULL, '2023-12-04 06:30:01', '2023-12-04 06:30:01'),
(151, 'App\\Models\\User', 48, 'auth_token', '75d0143d97750a8572a4471e9244cc9299dec7262eb6ca7b6546b3f8fbc64df3', '[\"*\"]', NULL, '2023-12-04 06:30:46', '2023-12-04 06:30:46'),
(152, 'App\\Models\\User', 49, 'auth_token', '86654448e9debdc06e64c2a7908d800004064467f154055f013a16b5d439b4bb', '[\"*\"]', NULL, '2023-12-04 06:31:07', '2023-12-04 06:31:07'),
(153, 'App\\Models\\User', 50, 'auth_token', 'b1560521a7bcfe8a2f4f1ea8dd78362b6b2af9698726370ce0fe31dd32c83cc5', '[\"*\"]', NULL, '2023-12-04 06:46:59', '2023-12-04 06:46:59'),
(154, 'App\\Models\\User', 50, 'auth_token', '73419be92948be93346d541bab6cd272ce03679c7ac1aad096223a50372116a0', '[\"*\"]', '2023-12-04 08:49:25', '2023-12-04 06:47:02', '2023-12-04 08:49:25'),
(155, 'App\\Models\\User', 51, 'auth_token', '8e1e2fb14e9efe128d103186cdcbbc5eef89ba9dc5d72327182ad7903d680946', '[\"*\"]', NULL, '2023-12-04 08:50:37', '2023-12-04 08:50:37'),
(156, 'App\\Models\\User', 51, 'auth_token', 'f7c45e005bbc1c8f0e02a21b4bc46cbdb08772e62d72f227f432d11fd50ef64c', '[\"*\"]', '2024-01-12 10:25:24', '2023-12-04 08:50:40', '2024-01-12 10:25:24'),
(157, 'App\\Models\\User', 52, 'auth_token', '22d106c8bfb1fb170051663509d3bd88a38a2e763ffcdd7535b192ab901e4bbb', '[\"*\"]', NULL, '2023-12-04 17:35:54', '2023-12-04 17:35:54'),
(158, 'App\\Models\\User', 52, 'auth_token', 'e8a58b45a4b5c6d7ea5b985e2893fbc385d39f84c50f541790c09971417d1299', '[\"*\"]', '2024-05-02 06:10:21', '2023-12-04 17:35:57', '2024-05-02 06:10:21'),
(159, 'App\\Models\\User', 53, 'auth_token', '529a04818b3bd77debc7abf2e4258f15f967b3544bc025ec2d283627ae58d63c', '[\"*\"]', NULL, '2023-12-05 15:34:22', '2023-12-05 15:34:22'),
(160, 'App\\Models\\User', 53, 'auth_token', '88bf9f7e30d8f18e7d75132f83a9e60c2fac98da0e375de71b45ac011269a654', '[\"*\"]', '2024-03-17 11:38:45', '2023-12-05 15:34:24', '2024-03-17 11:38:45'),
(161, 'App\\Models\\User', 14, 'auth_token', '6cc05d315321b538315c73d52623f1e2b6d8e0a04c8319dfc7c34832bd1d9186', '[\"*\"]', '2023-12-26 18:46:58', '2023-12-07 14:18:28', '2023-12-26 18:46:58'),
(162, 'App\\Models\\User', 38, 'auth_token', '04b43c54db2584950256eee83dd12830e9770ba539d4dc8c6558c050a4876542', '[\"*\"]', '2024-01-22 18:15:43', '2023-12-11 18:26:48', '2024-01-22 18:15:43'),
(163, 'App\\Models\\User', 1, 'auth_token', '2c00f05774622507bcdab515ede98af9384e361582c99cc1b4fdebd2ba669fd0', '[\"*\"]', '2024-03-26 09:57:29', '2023-12-30 11:38:31', '2024-03-26 09:57:29'),
(164, 'App\\Models\\User', 14, 'auth_token', '16f8c3bb96ca9e6c2a93b5a9a9df11c35b1b5be501484caf551918815a33311a', '[\"*\"]', '2024-01-04 13:00:12', '2024-01-02 19:51:51', '2024-01-04 13:00:12'),
(165, 'App\\Models\\User', 14, 'auth_token', '3e4595e7f75576eb5371e9d7cfff88a11b4f10f0f32276ef6c02864ef36caee1', '[\"*\"]', '2024-01-04 16:58:11', '2024-01-04 13:05:57', '2024-01-04 16:58:11'),
(166, 'App\\Models\\User', 14, 'auth_token', 'fc0ec70106e75e15232f0bdc265086a89903ae7b5476e9cb26b04221f886e8a3', '[\"*\"]', '2024-02-16 14:06:33', '2024-01-04 14:17:05', '2024-02-16 14:06:33'),
(167, 'App\\Models\\User', 54, 'auth_token', '64bd6e3897f898139fca0c7abd3694b062e05a51b5f1ce6635c3e0a7a1203c71', '[\"*\"]', NULL, '2024-01-04 18:19:40', '2024-01-04 18:19:40'),
(168, 'App\\Models\\User', 54, 'auth_token', '26e41e5e0b96c867a17949679b4c3821515d972c270544a95d8b0ee14f568a3b', '[\"*\"]', '2024-01-04 18:33:09', '2024-01-04 18:19:43', '2024-01-04 18:33:09'),
(169, 'App\\Models\\User', 54, 'auth_token', '9ec03a855a8b22d1ba729e655ab6d29cfb97cbbd47f9954f5f91a42405f060df', '[\"*\"]', '2024-01-04 18:33:52', '2024-01-04 18:33:50', '2024-01-04 18:33:52'),
(170, 'App\\Models\\User', 55, 'auth_token', 'd1a9374b04ca1644fa870688aa810af3a20d03ec0748db0ad522731905a06029', '[\"*\"]', NULL, '2024-01-07 01:22:13', '2024-01-07 01:22:13'),
(171, 'App\\Models\\User', 55, 'auth_token', '9e7656cc65e90e881f047b981b24d880d504f9d278cc8f6af7c9a868a800688b', '[\"*\"]', '2024-01-07 01:29:04', '2024-01-07 01:22:14', '2024-01-07 01:29:04'),
(172, 'App\\Models\\User', 14, 'auth_token', '00d268a8dcb6d9749bb2580b650d7891ceae7676e4d2ecb3d5c612d68ca6b5b6', '[\"*\"]', '2024-01-13 20:11:34', '2024-01-13 14:50:14', '2024-01-13 20:11:34'),
(173, 'App\\Models\\User', 14, 'auth_token', '71d387b3b88dafdb5fe370ac8fb84aa972351aac580948f6fb28e89cc96ee174', '[\"*\"]', '2024-01-17 12:49:42', '2024-01-13 20:11:54', '2024-01-17 12:49:42'),
(174, 'App\\Models\\User', 14, 'auth_token', '45e092b3cbe9fbd33fb2f1de042a9ffdf649f9e6ea2175ca770c9b547a8aab1e', '[\"*\"]', '2024-01-19 10:32:54', '2024-01-15 22:47:40', '2024-01-19 10:32:54'),
(175, 'App\\Models\\User', 56, 'auth_token', 'c2326f2f7e282492253b4b807b5b09861056e546f509bbe58a90880990a92366', '[\"*\"]', NULL, '2024-01-17 10:48:44', '2024-01-17 10:48:44'),
(176, 'App\\Models\\User', 56, 'auth_token', 'd767702606773907bd580771aa4626d786c1de4fc5a487074a45d1a513e38618', '[\"*\"]', '2024-01-17 10:49:43', '2024-01-17 10:48:48', '2024-01-17 10:49:43'),
(177, 'App\\Models\\User', 56, 'auth_token', '753b1169a9fe5e4d74ce2b83310904a11cff4d2b706bda07b7c2a32b15e8272a', '[\"*\"]', '2024-01-17 10:51:42', '2024-01-17 10:50:54', '2024-01-17 10:51:42'),
(178, 'App\\Models\\User', 56, 'auth_token', '35b5c356d1b223ca112d9a0ca441a04ee5735dc134e459ff4b55b99d56981622', '[\"*\"]', '2024-01-17 12:10:24', '2024-01-17 12:08:03', '2024-01-17 12:10:24'),
(179, 'App\\Models\\User', 57, 'auth_token', '5691e2377c6c5972d718b40ebdbf100b7ac306c3b489da1739913e7e32e14061', '[\"*\"]', NULL, '2024-01-17 12:26:55', '2024-01-17 12:26:55'),
(180, 'App\\Models\\User', 57, 'auth_token', 'ee0071b6e0214babb1451bd5c1a7d8ee3e5583c6409ee62bcdee926f5a3cfe5a', '[\"*\"]', '2024-01-17 13:05:04', '2024-01-17 12:27:00', '2024-01-17 13:05:04'),
(181, 'App\\Models\\User', 57, 'auth_token', 'd681161926abaabadfad630dcd95cfc19e158edffac7fb6b0394dd2f57fa8123', '[\"*\"]', '2024-01-17 13:05:21', '2024-01-17 13:05:17', '2024-01-17 13:05:21'),
(182, 'App\\Models\\User', 14, 'auth_token', '2de512bd6e7a8a94e0f4379e7ae2bd11e09bd35e659473d3bab3487e6e37f6f5', '[\"*\"]', '2024-02-07 13:54:34', '2024-01-17 16:30:11', '2024-02-07 13:54:34'),
(183, 'App\\Models\\User', 46, 'auth_token', '445eb5c20ef5df38ed5f91073cf16ebc921e5444a69a0b3f8810a7b37ef44ab7', '[\"*\"]', '2024-01-18 13:44:34', '2024-01-18 13:44:23', '2024-01-18 13:44:34'),
(184, 'App\\Models\\User', 16, 'auth_token', '0ef05a838bb56567f8a14cca155fbd6cd063f298530b88a89bb6c25e7a862139', '[\"*\"]', '2024-03-14 08:41:24', '2024-01-18 13:45:25', '2024-03-14 08:41:24'),
(185, 'App\\Models\\User', 1, 'auth_token', '5e0e77bb8060b136a56370255bfd1ad90d47138918624635b6b4cbffac687ead', '[\"*\"]', '2024-01-20 11:15:20', '2024-01-19 10:34:48', '2024-01-20 11:15:20'),
(186, 'App\\Models\\User', 1, 'auth_token', '2d3276f13313e9a740f5d583e10fb42f67e896948f93b2a59ba1379894f1b5a9', '[\"*\"]', '2024-02-12 23:43:25', '2024-01-19 10:35:41', '2024-02-12 23:43:25'),
(187, 'App\\Models\\User', 16, 'auth_token', '9f0674146a6baa8c82face3e676bfa1cb6b21acff3087c82e7b82a049302bea5', '[\"*\"]', '2024-01-20 11:16:41', '2024-01-20 11:13:22', '2024-01-20 11:16:41'),
(188, 'App\\Models\\User', 1, 'auth_token', '2ce1e8c6468d40d3a1cbedb56288a1d317b40db20f15ac2c63feeaaf37e341d9', '[\"*\"]', '2024-01-24 08:14:41', '2024-01-20 11:20:16', '2024-01-24 08:14:41'),
(189, 'App\\Models\\User', 1, 'auth_token', '8f18d4cf5fd361739e7098d0523b2bbe998dc96ceacc9bf6b7acc297f50c4510', '[\"*\"]', '2024-01-24 11:40:43', '2024-01-24 08:15:12', '2024-01-24 11:40:43'),
(190, 'App\\Models\\User', 14, 'auth_token', 'd3212836858d69d22067407ed569e315dd5991d925b8c002ad6426d00ea1db37', '[\"*\"]', '2024-02-07 23:24:46', '2024-02-07 13:59:54', '2024-02-07 23:24:46'),
(191, 'App\\Models\\User', 14, 'auth_token', '803bcdc09f4edbb241c897ecc631ed1435dc7181f54fa2052fdf660c9bbd4309', '[\"*\"]', '2024-02-10 18:04:30', '2024-02-07 23:31:20', '2024-02-10 18:04:30'),
(192, 'App\\Models\\User', 14, 'auth_token', '4697b8b393e97e1a4ad84c7cd53ce50e5147b43805f6663f515132be957f519e', '[\"*\"]', '2024-02-15 07:58:12', '2024-02-10 19:23:15', '2024-02-15 07:58:12'),
(193, 'App\\Models\\User', 16, 'auth_token', 'c4d0070494b8bb7a9ecce5d3b037b95d4ef62048945d97d565d301b0717a25ed', '[\"*\"]', '2024-02-13 15:26:21', '2024-02-12 19:32:08', '2024-02-13 15:26:21'),
(194, 'App\\Models\\User', 1, 'auth_token', '21d1a12c0432e5c01945edb3fc9f52399996765553326b2309f650e4f99bbe6b', '[\"*\"]', '2024-02-15 12:07:27', '2024-02-12 23:26:46', '2024-02-15 12:07:27'),
(195, 'App\\Models\\User', 58, 'auth_token', '8f104ca3ea71db3bbc5e86971fbce90eb0deea151140471ca5a403bd38ce5b46', '[\"*\"]', NULL, '2024-02-13 15:27:15', '2024-02-13 15:27:15'),
(196, 'App\\Models\\User', 58, 'auth_token', '0b792631ed58db302af59922b4eee92929414428a56b5b7c441349f16a3fc41f', '[\"*\"]', NULL, '2024-02-13 15:27:27', '2024-02-13 15:27:27'),
(197, 'App\\Models\\User', 58, 'auth_token', 'a4ce3c60dd683cb01a588ba65412f4c1e80b4bb175859c7410f37cf8f3c93435', '[\"*\"]', '2024-02-13 18:29:42', '2024-02-13 18:27:38', '2024-02-13 18:29:42'),
(198, 'App\\Models\\User', 16, 'auth_token', '68afcf1c2d31e6871de8fad4a00f63828a2046416eb4391c707b467ceb400097', '[\"*\"]', '2024-02-16 14:23:29', '2024-02-13 18:30:10', '2024-02-16 14:23:29'),
(199, 'App\\Models\\User', 14, 'auth_token', 'f0cc4ec15a20dceec8c66623cd30556a4ad4d5dda2ecaff9d363e7c1fb01d4cf', '[\"*\"]', '2024-02-15 08:03:26', '2024-02-15 08:03:11', '2024-02-15 08:03:26'),
(200, 'App\\Models\\User', 14, 'auth_token', '7ee851e0cf848b47f55772b79832a0478edeab8a0bc04a934d7600dabc06ec49', '[\"*\"]', '2024-02-15 11:52:02', '2024-02-15 11:51:54', '2024-02-15 11:52:02'),
(201, 'App\\Models\\User', 14, 'auth_token', '43ed3936fe931ea53308476a625114f66aa050eb48f02d054f0cf6ce801019f4', '[\"*\"]', '2024-02-16 19:53:34', '2024-02-16 07:24:32', '2024-02-16 19:53:34'),
(202, 'App\\Models\\User', 14, 'auth_token', 'ff627f70b571dfe52e4909c056c2696a9a1c6ff65bf0f3344b660ecc64f6ec8f', '[\"*\"]', '2024-04-01 04:17:49', '2024-02-16 14:08:00', '2024-04-01 04:17:49'),
(203, 'App\\Models\\User', 14, 'auth_token', 'a0c1ba1b4b41ee9f4a614d43daad0986dfd362bb1e37fd5ad8c678dcc6eeb25a', '[\"*\"]', '2024-02-16 14:25:10', '2024-02-16 14:23:53', '2024-02-16 14:25:10'),
(204, 'App\\Models\\User', 14, 'auth_token', '0e6b068c843998b944ea9a4a269bc860344c4a5a926729b361e58e7ebb9af5ea', '[\"*\"]', '2024-02-16 20:00:49', '2024-02-16 14:25:24', '2024-02-16 20:00:49'),
(205, 'App\\Models\\User', 14, 'auth_token', 'c17714a77a739d2571629030f6fa88442bb1198c4f33ffc887dcdfaa2574f5ab', '[\"*\"]', '2024-04-24 20:10:58', '2024-02-16 19:59:00', '2024-04-24 20:10:58'),
(206, 'App\\Models\\User', 14, 'auth_token', 'b12de80daf49b218ce92825d593703295aad302853b80b9cb7aa885f7bde9e95', '[\"*\"]', '2024-02-17 07:39:10', '2024-02-17 07:37:34', '2024-02-17 07:39:10'),
(207, 'App\\Models\\User', 14, 'auth_token', 'c9cabd3b42b5276149a6fc8a9cfda0ff72e954d584867e7589e6c6b2244334ae', '[\"*\"]', '2024-02-22 00:20:56', '2024-02-21 19:05:40', '2024-02-22 00:20:56'),
(208, 'App\\Models\\User', 59, 'auth_token', 'c5bf5f58f429ac697cf33cd20538eb0e19a6c906ee20ed7ff4dc94ee6df9cfc6', '[\"*\"]', NULL, '2024-02-28 13:44:57', '2024-02-28 13:44:57'),
(209, 'App\\Models\\User', 59, 'auth_token', '7e98ebb2c1d3f850cc19bdc39e11d72677539a49ca9dd4eedebe7239d3069f38', '[\"*\"]', NULL, '2024-02-28 13:45:36', '2024-02-28 13:45:36'),
(210, 'App\\Models\\User', 60, 'auth_token', '11822375ee33d72d7948ad784343058d1624ed1db96c9fa3b523872f89814fd4', '[\"*\"]', NULL, '2024-03-10 21:30:11', '2024-03-10 21:30:11'),
(211, 'App\\Models\\User', 60, 'auth_token', '0c0625dd89b290305f9f164d5836b8d51bc70ee1efc6e6bb49b7578c488ebb0c', '[\"*\"]', '2024-03-10 21:30:14', '2024-03-10 21:30:13', '2024-03-10 21:30:14'),
(212, 'App\\Models\\User', 61, 'auth_token', 'bbdedb156153261caf6e8377aace9fb08f900a38faff52dd7a8d65f6ae7a0cfd', '[\"*\"]', NULL, '2024-03-14 08:45:13', '2024-03-14 08:45:13'),
(213, 'App\\Models\\User', 61, 'auth_token', '70fe02fe0227a8052f01c79f1b871a03fb2594ab00411a9569a6794f12ffd2d0', '[\"*\"]', '2024-03-14 08:46:50', '2024-03-14 08:45:17', '2024-03-14 08:46:50'),
(214, 'App\\Models\\User', 1, 'auth_token', '83498343935065e313f0ff04b56e75de851c41171505fa7b5715846f63b391d0', '[\"*\"]', '2024-03-26 09:47:10', '2024-03-18 07:35:48', '2024-03-26 09:47:10'),
(215, 'App\\Models\\User', 14, 'auth_token', '1d83ea126840db1ea7c1ac7e532ac574a49881a6d2d02ca03845af8691f23b88', '[\"*\"]', '2024-04-28 12:17:39', '2024-03-20 12:02:29', '2024-04-28 12:17:39'),
(216, 'App\\Models\\User', 61, 'auth_token', '6229b8dbbca0c1e65e48feff0f095228712ead5d2aa24c2315d04cf7df99316e', '[\"*\"]', '2024-03-22 10:41:41', '2024-03-22 10:41:38', '2024-03-22 10:41:41'),
(217, 'App\\Models\\User', 62, 'auth_token', '087bc0480bf1d7f55c8203ef59dadb86ebd48f15d6f6001bd8d8e57f17a08081', '[\"*\"]', NULL, '2024-04-05 00:59:04', '2024-04-05 00:59:04'),
(218, 'App\\Models\\User', 62, 'auth_token', 'd1933d1cd099a546183400a189993b9e20464defa1a7414143b305bd76552a2b', '[\"*\"]', '2024-04-05 00:59:07', '2024-04-05 00:59:06', '2024-04-05 00:59:07'),
(219, 'App\\Models\\User', 1, 'auth_token', '42f964ae71e14066672c61ff8f536c5123334c4ac1e8c7cd159247837c6c18db', '[\"*\"]', NULL, '2024-05-03 15:28:31', '2024-05-03 15:28:31'),
(220, 'App\\Models\\User', 1, 'auth_token', '4de68bc7054860dbb76ddfe5f349f1de8e42a9ff35de75e9575d1a8ba7edd736', '[\"*\"]', NULL, '2024-05-03 15:29:19', '2024-05-03 15:29:19'),
(221, 'App\\Models\\User', 1, 'auth_token', 'b31ffc191ad3b026cf606160d51e192bdc112d6a5a7c770e5c5e500bf49f5232', '[\"*\"]', NULL, '2024-05-04 11:23:24', '2024-05-04 11:23:24'),
(222, 'App\\Models\\User', 1, 'auth_token', '85c2ffa7ed3007b3add19397bb2267777888778279559a33954bc14298abe7f4', '[\"*\"]', NULL, '2024-05-06 00:16:15', '2024-05-06 00:16:15'),
(223, 'App\\Models\\User', 1, 'auth_token', 'f53008990dcf3be7e37b6ce33b70d5976b00b78dced7366c556ee27feb2aa6ea', '[\"*\"]', NULL, '2024-05-06 00:23:58', '2024-05-06 00:23:58'),
(224, 'App\\Models\\User', 1, 'auth_token', '5d06b1943d71416707d9b24f70598f9a27867045e98921cf11ab7a0b4311b489', '[\"*\"]', NULL, '2024-05-06 03:41:01', '2024-05-06 03:41:01'),
(225, 'App\\Models\\User', 1, 'auth_token', '888973d82838b1f0b56b5ff577e9fa5a1cbd4a94738302df529a8e68e37bb0fb', '[\"*\"]', NULL, '2024-05-06 04:28:13', '2024-05-06 04:28:13'),
(226, 'App\\Models\\User', 1, 'auth_token', '7f37d7d748967cf33cd610fd9474c1eeb131e42a664a401f6960005cc0f4dfa6', '[\"*\"]', NULL, '2024-05-06 04:28:49', '2024-05-06 04:28:49'),
(227, 'App\\Models\\User', 1, 'auth_token', '4e6fe448f9a695d5e7724cb5751403bfcec146e426483068253cd4d3bdaff519', '[\"*\"]', NULL, '2024-05-06 04:29:13', '2024-05-06 04:29:13'),
(228, 'App\\Models\\User', 1, 'auth_token', 'f0c6afaaf784937c4a1b60bc16cddf9ec2296ba8d4e4fabada0cbb775617a3a9', '[\"*\"]', NULL, '2024-05-06 04:49:10', '2024-05-06 04:49:10'),
(229, 'App\\Models\\User', 1, 'auth_token', 'feb6824f4d18b53f1c83938b1348b79bbdd62701dbfd73212104e9cd309b0b81', '[\"*\"]', NULL, '2024-05-06 04:50:15', '2024-05-06 04:50:15'),
(230, 'App\\Models\\User', 1, 'auth_token', 'ee16c6ef9cfb5ae62d90e328d51bbc85a62236c506fe98575a4bbc138f9e1316', '[\"*\"]', NULL, '2024-05-06 05:02:48', '2024-05-06 05:02:48'),
(231, 'App\\Models\\User', 1, 'auth_token', '0186401f8594f1153a40867ebc7cbc1517af9314cb2d92b1c4e459cb9e56847b', '[\"*\"]', NULL, '2024-05-06 05:03:13', '2024-05-06 05:03:13'),
(232, 'App\\Models\\User', 1, 'auth_token', '4992c91d995885d31b715ecc98af665733879178b1eb26a8000ca4c6c0959af0', '[\"*\"]', NULL, '2024-05-06 11:09:41', '2024-05-06 11:09:41'),
(233, 'App\\Models\\User', 1, 'auth_token', '38acdfff911416b5efd70830b1044557e002d6d3d3f8de2c88541c17691dd29d', '[\"*\"]', NULL, '2024-05-16 02:57:44', '2024-05-16 02:57:44'),
(234, 'App\\Models\\User', 1, 'auth_token', 'fb257d8d11eda1e198a9fc8da96bbcba2745345ef97c8a0da169f7b4c1a2ff6a', '[\"*\"]', NULL, '2024-05-16 13:52:33', '2024-05-16 13:52:33'),
(235, 'App\\Models\\User', 1, 'auth_token', '274165d9335071e1abbf6ffb768054e1c59da29c6c9002129f4677f13aea896a', '[\"*\"]', NULL, '2024-05-17 00:47:17', '2024-05-17 00:47:17'),
(236, 'App\\Models\\User', 1, 'auth_token', '4b98e53823c0c3325d3f2a4aa8f82ccd5e49d21490e771afb449263755d91e63', '[\"*\"]', NULL, '2024-05-17 21:41:15', '2024-05-17 21:41:15'),
(237, 'App\\Models\\User', 1, 'auth_token', 'dc98b20e8507269602285f05740aed6ff53612ccf8dd7611cde79994b740afa2', '[\"*\"]', NULL, '2024-05-18 03:02:08', '2024-05-18 03:02:08'),
(238, 'App\\Models\\User', 1, 'auth_token', '6e5b5dd6e93607a9a2dc585908625ff53a47cb052c18d33b0ae7c3ccf631effe', '[\"*\"]', NULL, '2024-05-18 07:52:51', '2024-05-18 07:52:51'),
(239, 'App\\Models\\User', 1, 'auth_token', 'cf4c85cbf6c4814638ff7d192f3546b0ba4fa3bc1a676eb9a34bd4394ba0634a', '[\"*\"]', NULL, '2024-05-18 08:23:55', '2024-05-18 08:23:55'),
(240, 'App\\Models\\User', 63, 'auth_token', '1436f314f144f120ad8f139dbc31c6bb0b25843a190bec6e0e1b5ac0685bea69', '[\"*\"]', NULL, '2024-05-18 08:25:52', '2024-05-18 08:25:52'),
(241, 'App\\Models\\User', 1, 'auth_token', 'a0035af60cd7ce2de549e901cd64f724b2d12562b47996a7b0589afc398ac3dc', '[\"*\"]', NULL, '2024-05-18 10:35:06', '2024-05-18 10:35:06'),
(242, 'App\\Models\\User', 1, 'auth_token', '22b27f301f2c9311770cca5ba8a7f06e4ca17b63e6785c3f391807834134cdc8', '[\"*\"]', NULL, '2024-05-19 02:40:36', '2024-05-19 02:40:36'),
(243, 'App\\Models\\User', 65, 'auth_token', '72cf29ce7d14209859c6956a4d14e93a6ee116f15bd0d29d158bc18d99ebe6ba', '[\"*\"]', NULL, '2024-05-19 05:21:40', '2024-05-19 05:21:40'),
(244, 'App\\Models\\User', 65, 'auth_token', '848cfce3f245258c621133c118ab2c349e363759e5c037e2d88d33845e31fd44', '[\"*\"]', NULL, '2024-05-19 05:28:16', '2024-05-19 05:28:16'),
(245, 'App\\Models\\User', 65, 'auth_token', '3e55df3ee4b39b8c76dbc7f347e4f62f495d8c8559efbd4e4642b327fa183d67', '[\"*\"]', NULL, '2024-05-19 05:28:58', '2024-05-19 05:28:58'),
(246, 'App\\Models\\User', 67, 'auth_token', '481865f11e833b99f15016a580c6ed14a9ad1486b5f084bd6564146f2f8bddf5', '[\"*\"]', NULL, '2024-05-19 05:36:41', '2024-05-19 05:36:41'),
(247, 'App\\Models\\User', 67, 'auth_token', '765ce25707f17d83be0ed76a81c15115cfc697545fc47c8745d64fe225b9d50b', '[\"*\"]', NULL, '2024-05-19 05:36:55', '2024-05-19 05:36:55'),
(248, 'App\\Models\\User', 68, 'auth_token', '9cdae6bb0901efe02381d73d95608d126d49068ea5b41ecf4cafd322ac983ba9', '[\"*\"]', NULL, '2024-05-19 05:37:06', '2024-05-19 05:37:06'),
(249, 'App\\Models\\User', 70, 'auth_token', 'f7dd83e58adbfa90d950ac1ead5f9a7947507f5cd9a58362403f149b000ef8a0', '[\"*\"]', NULL, '2024-05-19 05:53:35', '2024-05-19 05:53:35'),
(250, 'App\\Models\\User', 72, 'auth_token', 'dd6298d2d36d38122d8371c1481f5a591548208311d165bfc72b41e64b38eeea', '[\"*\"]', NULL, '2024-05-19 05:54:08', '2024-05-19 05:54:08'),
(251, 'App\\Models\\User', 72, 'auth_token', 'cd2d0a89487c28af39b359e217e4099fb65fd5d12c374771a78d1c0d37b7a807', '[\"*\"]', NULL, '2024-05-19 05:54:18', '2024-05-19 05:54:18'),
(252, 'App\\Models\\User', 72, 'auth_token', '6be069134ef4fe946f2b9db44a9dc769065bb0d6c32755d143042474c2f2618c', '[\"*\"]', NULL, '2024-05-19 05:54:32', '2024-05-19 05:54:32'),
(253, 'App\\Models\\User', 63, 'auth_token', 'a9a632c1570b8173722edef8b929c78b0a3d5991769ba8a97be0dca4bc69cb14', '[\"*\"]', NULL, '2024-05-19 07:02:31', '2024-05-19 07:02:31'),
(254, 'App\\Models\\User', 1, 'auth_token', '2078843fc540264d8d0015280cb3384c08175459b5527220f190b8538b1df1bb', '[\"*\"]', NULL, '2024-05-19 07:06:22', '2024-05-19 07:06:22'),
(255, 'App\\Models\\User', 63, 'auth_token', 'a13a68a6722fc9d247bdddfaf87d4ea68534f634f13d89fab818ee75555918b9', '[\"*\"]', NULL, '2024-05-19 07:06:40', '2024-05-19 07:06:40'),
(256, 'App\\Models\\User', 1, 'auth_token', 'e379d9d213dede4cc42f891981879cb04414282785d499e957f611846ecdd05c', '[\"*\"]', NULL, '2024-05-19 07:09:32', '2024-05-19 07:09:32'),
(257, 'App\\Models\\User', 63, 'auth_token', '2bc813a6aca679251e9a5f30f7490ab1c7a87402e2cc04e41f58183746c26273', '[\"*\"]', NULL, '2024-05-19 07:18:06', '2024-05-19 07:18:06'),
(258, 'App\\Models\\User', 1, 'auth_token', '81434ecd0174456e6bed1a9115ce450211e283ae6237e2b91d889e7c070d92e5', '[\"*\"]', NULL, '2024-05-30 04:00:24', '2024-05-30 04:00:24'),
(259, 'App\\Models\\User', 1, 'auth_token', '2e8270a467e9cdccfa236dcf8d6e1f2612d73adda412f78594fbdb18321accbb', '[\"*\"]', NULL, '2024-05-30 04:09:50', '2024-05-30 04:09:50'),
(260, 'App\\Models\\User', 1, 'auth_token', '70e8092c705c0c158640ed110106da9ef3dc34c9c5c9e80ec2dd9be4ff33a0d3', '[\"*\"]', NULL, '2024-05-30 06:55:56', '2024-05-30 06:55:56'),
(261, 'App\\Models\\User', 1, 'auth_token', '10df25bad4e1e885d66e22d4ddd3f2e0071fbec0de793c3ccc06cd090fe719da', '[\"*\"]', NULL, '2024-05-30 10:17:13', '2024-05-30 10:17:13'),
(262, 'App\\Models\\User', 1, 'auth_token', 'dca5f2b4a872dd5635ff3f921520662456dafc4147d32a165757782fd12b008f', '[\"*\"]', NULL, '2024-05-31 10:38:08', '2024-05-31 10:38:08'),
(263, 'App\\Models\\User', 1, 'auth_token', '18b229fb97d61992e4f000dd034d3790a7210822ddcc7ba9d7d218c8390bd183', '[\"*\"]', NULL, '2024-06-01 08:54:06', '2024-06-01 08:54:06'),
(264, 'App\\Models\\User', 1, 'auth_token', 'bde983fbab9284824eed64e0cf515f288c178a6ff8215700f7cc1b4f1e162b8d', '[\"*\"]', NULL, '2024-06-02 00:06:23', '2024-06-02 00:06:23'),
(265, 'App\\Models\\User', 1, 'auth_token', 'ba6fa3743a35e909bfeb5db418181d6a5608da5bd7b3ad091feff224285b4d29', '[\"*\"]', NULL, '2024-06-02 04:56:16', '2024-06-02 04:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `postalcodes`
--

CREATE TABLE `postalcodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code1` varchar(255) NOT NULL,
  `code2` varchar(255) NOT NULL,
  `charge` double(8,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postalcodes`
--

INSERT INTO `postalcodes` (`id`, `code1`, `code2`, `charge`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SA32X91', 'SP11P90', 100.00, 'Test Data', 1, '2024-05-06 05:57:51', '2024-05-06 05:57:51'),
(2, 'SA', 'SX', 10.00, 'Test Data Differ Zone', 1, '2024-05-06 06:12:54', '2024-05-19 04:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('zz6VuKeV3qZK3o3i4N6wczrlJ49riSu5HV2DxxVm', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicUdyQjM0SjF2ajI4cWp4am5LM3hsTHdzRVpQREVhRHpRN3M3TmxHMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlci84MiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJ1c2VyIjtPOjE1OiJBcHBcTW9kZWxzXFVzZXIiOjM3OntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjU6InVzZXJzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MzA6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6NToiQWRtaW4iO3M6NToiZW1haWwiO3M6MTU6ImFkbWluQGFkbWluLmNvbSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEwJEVVQmYvc0R2L09VZmtOME1QR210VE9RN0JXWk9NRjZXZktVVS8yNms3dXRFVkVlLjVRWmdlIjtzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7TjtzOjI1OiJ0d29fZmFjdG9yX3JlY292ZXJ5X2NvZGVzIjtOO3M6NzoiYWRkcmVzcyI7TjtzOjE0OiJjb250YWN0X251bWJlciI7czoxMDoiOTg3NjU0MzIxMCI7czo5OiJ1c2VyX3R5cGUiO3M6NToiYWRtaW4iO3M6MTA6ImNvdW50cnlfaWQiO047czo3OiJjaXR5X2lkIjtOO3M6OToicGxheWVyX2lkIjtOO3M6ODoibGF0aXR1ZGUiO047czo5OiJsb25naXR1ZGUiO047czoxNDoicmVtZW1iZXJfdG9rZW4iO047czoyMjoibGFzdF9ub3RpZmljYXRpb25fc2VlbiI7TjtzOjY6InN0YXR1cyI7aToxO3M6MzoidWlkIjtOO3M6OToiZmNtX3Rva2VuIjtOO3M6MTU6ImN1cnJlbnRfdGVhbV9pZCI7TjtzOjE4OiJwcm9maWxlX3Bob3RvX3BhdGgiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNC0wNS0wMiAwODowMToyNCI7czoxMDoidXBkYXRlZF9hdCI7TjtzOjEwOiJkZWxldGVkX2F0IjtOO3M6MTM6Im90cF92ZXJpZnlfYXQiO047czo5OiJhcGlfdG9rZW4iO3M6NDQ6IjI2NXx0bFJMeTRVYkRJSHA4WGVZQ2lpQmRjeHNacnlFdHI2MFlGMDNoaXpqIjtzOjEzOiJwcm9maWxlX2ltYWdlIjtzOjQyOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaW1hZ2VzL3VzZXIvdXNlci5wbmciO3M6MjQ6ImlzX3ZlcmlmaWVkX2RlbGl2ZXJ5X21hbiI7aTowO31zOjExOiIAKgBvcmlnaW5hbCI7YToyNzp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJBZG1pbiI7czo1OiJlbWFpbCI7czoxNToiYWRtaW5AYWRtaW4uY29tIjtzOjg6InVzZXJuYW1lIjtzOjU6ImFkbWluIjtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTAkRVVCZi9zRHYvT1Vma04wTVBHbXRUT1E3QldaT01GNldmS1VVLzI2azd1dEVWRWUuNVFaZ2UiO3M6MTc6InR3b19mYWN0b3Jfc2VjcmV0IjtOO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO047czo3OiJhZGRyZXNzIjtOO3M6MTQ6ImNvbnRhY3RfbnVtYmVyIjtzOjEwOiI5ODc2NTQzMjEwIjtzOjk6InVzZXJfdHlwZSI7czo1OiJhZG1pbiI7czoxMDoiY291bnRyeV9pZCI7TjtzOjc6ImNpdHlfaWQiO047czo5OiJwbGF5ZXJfaWQiO047czo4OiJsYXRpdHVkZSI7TjtzOjk6ImxvbmdpdHVkZSI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7TjtzOjIyOiJsYXN0X25vdGlmaWNhdGlvbl9zZWVuIjtOO3M6Njoic3RhdHVzIjtpOjE7czozOiJ1aWQiO047czo5OiJmY21fdG9rZW4iO047czoxNToiY3VycmVudF90ZWFtX2lkIjtOO3M6MTg6InByb2ZpbGVfcGhvdG9fcGF0aCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI0LTA1LTAyIDA4OjAxOjI0IjtzOjEwOiJ1cGRhdGVkX2F0IjtOO3M6MTA6ImRlbGV0ZWRfYXQiO047czoxMzoib3RwX3ZlcmlmeV9hdCI7Tjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTo2OntzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7czo4OiJkYXRldGltZSI7czoxMDoiY291bnRyeV9pZCI7czo3OiJpbnRlZ2VyIjtzOjc6ImNpdHlfaWQiO3M6NzoiaW50ZWdlciI7czo2OiJzdGF0dXMiO3M6NzoiaW50ZWdlciI7czoxMzoib3RwX3ZlcmlmeV9hdCI7czo4OiJkYXRldGltZSI7czoxMDoiZGVsZXRlZF9hdCI7czo4OiJkYXRldGltZSI7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6ODoiACoAZGF0ZXMiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YToxOntpOjA7czoxNzoicHJvZmlsZV9waG90b191cmwiO31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czo5OiIAKgBoaWRkZW4iO2E6NDp7aTowO3M6ODoicGFzc3dvcmQiO2k6MTtzOjE0OiJyZW1lbWJlcl90b2tlbiI7aToyO3M6MjU6InR3b19mYWN0b3JfcmVjb3ZlcnlfY29kZXMiO2k6MztzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjE5OntpOjA7czo0OiJuYW1lIjtpOjE7czo1OiJlbWFpbCI7aToyO3M6ODoicGFzc3dvcmQiO2k6MztzOjg6InVzZXJuYW1lIjtpOjQ7czo5OiJ1c2VyX3R5cGUiO2k6NTtzOjEwOiJjb3VudHJ5X2lkIjtpOjY7czo3OiJjaXR5X2lkIjtpOjc7czo3OiJhZGRyZXNzIjtpOjg7czoxNDoiY29udGFjdF9udW1iZXIiO2k6OTtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7aToxMDtzOjk6InBsYXllcl9pZCI7aToxMTtzOjg6ImxhdGl0dWRlIjtpOjEyO3M6OToibG9uZ2l0dWRlIjtpOjEzO3M6Njoic3RhdHVzIjtpOjE0O3M6MjI6Imxhc3Rfbm90aWZpY2F0aW9uX3NlZW4iO2k6MTU7czoxMDoibG9naW5fdHlwZSI7aToxNjtzOjM6InVpZCI7aToxNztzOjk6ImZjbV90b2tlbiI7aToxODtzOjEzOiJvdHBfdmVyaWZ5X2F0Ijt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9czoyMDoiACoAcmVtZW1iZXJUb2tlbk5hbWUiO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjE0OiIAKgBhY2Nlc3NUb2tlbiI7TjtzOjE2OiIAKgBmb3JjZURlbGV0aW5nIjtiOjA7czoxNjoibWVkaWFDb252ZXJzaW9ucyI7YTowOnt9czoxNjoibWVkaWFDb2xsZWN0aW9ucyI7YTowOnt9czoyNDoiACoAZGVsZXRlUHJlc2VydmluZ01lZGlhIjtiOjA7czozMDoiACoAdW5BdHRhY2hlZE1lZGlhTGlicmFyeUl0ZW1zIjthOjA6e319czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRFVUJmL3NEdi9PVWZrTjBNUEdtdFRPUTdCV1pPTUY2V2ZLVVUvMjZrN3V0RVZFZS41UVpnZSI7fQ==', 1717332920);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `key`, `value`) VALUES
(1, 'order_invoice', 'company_name', 'GOGO Riders'),
(2, 'order_invoice', 'company_contact_number', '+234 809 066 8144'),
(3, 'order_invoice', 'company_address', 'Block 235 flat 2 jakande housing Estate oke-afa isolo lagos');

-- --------------------------------------------------------

--
-- Table structure for table `static_data`
--

CREATE TABLE `static_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_data`
--

INSERT INTO `static_data` (`id`, `type`, `label`, `value`, `created_at`, `updated_at`) VALUES
(10, 'parcel_type', 'Big Shipments', 'big_shipments', '2024-05-19 04:59:14', '2024-05-19 04:59:21'),
(11, 'parcel_type', 'Small Shipments', 'small_shipments', '2024-05-19 04:59:39', '2024-05-19 04:59:50'),
(12, 'parcel_type', 'Medium Shipments', 'medium_shipments', '2024-05-19 04:59:44', '2024-05-19 04:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `player_id` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `uid` varchar(255) DEFAULT NULL,
  `fcm_token` text DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `otp_verify_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `address`, `contact_number`, `user_type`, `country_id`, `city_id`, `player_id`, `latitude`, `longitude`, `remember_token`, `last_notification_seen`, `status`, `uid`, `fcm_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `deleted_at`, `otp_verify_at`) VALUES
(1, 'Admin', 'admin@admin.com', 'admin', NULL, '$2y$10$EUBf/sDv/OUfkN0MPGmtTOQ7BWZOMF6WfKUU/26k7utEVEe.5QZge', NULL, NULL, NULL, '9876543210', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-02 02:31:24', NULL, NULL, NULL),
(63, 'Deepesh', 'deepesh@gmail.com', 'deepesh', NULL, '$2y$10$EUBf/sDv/OUfkN0MPGmtTOQ7BWZOMF6WfKUU/26k7utEVEe.5QZge', NULL, NULL, NULL, '7004920897', 'client', 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-06 07:51:10', NULL, NULL, NULL),
(64, 'Test Driver', 'driver@gmail.com', 'testdriver', NULL, '1234567890', NULL, NULL, NULL, '7004920897', 'delivery_man', 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-06 08:01:47', NULL, NULL, NULL),
(65, 'Deepesh Raj Chauhan', 'aaa@gmail.com', 'deepeshraj', NULL, '12345678', NULL, NULL, NULL, '1234567890', 'client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:21:40', '2024-05-19 05:28:58', NULL, NULL),
(67, 'Deasdepesh Raj', 'adaas@gmail.com', '07004asdasda920897', NULL, 'undefinedasd', NULL, NULL, NULL, '07asd004920897', 'client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:36:41', '2024-05-19 05:36:55', NULL, NULL),
(68, 'Development Team', 'deepeshidnfo22@gmail.com', '07004920897', NULL, '$2y$10$gUc0qpA29BSW3XRFyGSIWufXaZofRL9KDXBXg3SjhWZOZi0gPLgp2', NULL, NULL, NULL, '07004920897', 'client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:37:06', '2024-05-19 05:37:06', NULL, NULL),
(70, 'Deepesh Raj', 'dedddepeshinfo22@gmail.com', '0700492s0897', NULL, '$2y$10$XHlSW4mjekEngpfu/EW5D.uD0Wexjx7SuRx3JADbBa8yoeaSFe9RS', NULL, NULL, NULL, '0700492s0897', 'delivery_man', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:53:35', '2024-05-19 05:53:35', NULL, NULL),
(72, 'Deepesh Raj', '1212@abc.com', '1207004920897', NULL, 'undefined', NULL, NULL, NULL, '1207004920897', 'delivery_man', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-19 05:54:08', '2024-05-19 05:54:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `name` varchar(255) NOT NULL,
  `postal_code` varchar(256) NOT NULL,
  `contact_number` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `primary_address` int(11) DEFAULT 0,
  `remarks` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `first_name`, `last_name`, `name`, `postal_code`, `contact_number`, `user_id`, `is_active`, `primary_address`, `remarks`, `created_at`, `updated_at`) VALUES
(4, 'Deepesh', 'Raj', 'Patna, Bihar, India', '800001', '07004920897', 68, 1, 0, NULL, '2024-05-30 10:51:50', '2024-05-30 10:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_bank_accounts`
--

CREATE TABLE `user_bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_designations`
--

CREATE TABLE `user_designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_designations`
--

INSERT INTO `user_designations` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 1, NULL, NULL),
(2, 'CEO', 1, NULL, NULL),
(3, 'Asst. manager', 1, NULL, NULL),
(4, 'Sales Person', 1, NULL, NULL),
(5, 'Accountant', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'all,city_wise',
  `size` varchar(255) DEFAULT NULL,
  `city_ids` text DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `title`, `type`, `size`, `city_ids`, `capacity`, `status`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bike', 'all', '2', '[ \"1\"]', '2', 1, 'Bike', '2023-09-10 09:59:50', '2023-09-10 09:59:50', NULL),
(2, 'Tst', 'city_wise', '2', '[\"1\",\"3\"]', '2', 1, 'Bike', '2024-05-03 10:05:19', '2024-05-03 10:07:56', '2024-05-03 10:07:56'),
(3, 'Scooty', 'all', '2', '[\"1\"]', '2', 1, 'Only For City Rides', '2024-05-03 10:08:44', '2024-05-03 10:08:44', NULL),
(4, NULL, NULL, NULL, 'null', NULL, 1, NULL, '2024-05-19 04:50:49', '2024-05-19 04:50:58', '2024-05-19 04:50:58'),
(5, 'sddd', NULL, 'd', 'null', 'd', 1, 'd', '2024-05-19 04:50:56', '2024-05-19 04:52:21', '2024-05-19 04:52:21'),
(6, 'asdadasdasdasdas', NULL, 'asdasdasdasda', NULL, 'asdasdasdasdas', 1, 'asdadasdasdasda', '2024-05-19 04:52:10', '2024-05-19 04:52:19', '2024-05-19 04:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` double DEFAULT 0,
  `online_received` double DEFAULT 0,
  `collected_cash` double DEFAULT 0,
  `manual_received` double DEFAULT 0,
  `total_withdrawn` double DEFAULT 0,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'credit,debit',
  `transaction_type` varchar(255) DEFAULT NULL COMMENT 'topup,withdraw,order_fee,admin_commision,correction',
  `currency` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `balance` double DEFAULT 0,
  `datetime` datetime DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'requested' COMMENT 'requested,approved,decline',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_documents`
--
ALTER TABLE `delivery_man_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_man_documents_document_id_foreign` (`document_id`),
  ADD KEY `delivery_man_documents_delivery_man_id_foreign` (`delivery_man_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_client_id_foreign` (`client_id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_histories_order_id_foreign` (`order_id`);

--
-- Indexes for table `parcel_size_modals`
--
ALTER TABLE `parcel_size_modals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_client_id_foreign` (`client_id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `postalcodes`
--
ALTER TABLE `postalcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `static_data`
--
ALTER TABLE `static_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bank_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_designations`
--
ALTER TABLE `user_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_histories_user_id_foreign` (`user_id`),
  ADD KEY `wallet_histories_order_id_foreign` (`order_id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `delivery_man_documents`
--
ALTER TABLE `delivery_man_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `extra_charges`
--
ALTER TABLE `extra_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `parcel_size_modals`
--
ALTER TABLE `parcel_size_modals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `postalcodes`
--
ALTER TABLE `postalcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `static_data`
--
ALTER TABLE `static_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_designations`
--
ALTER TABLE `user_designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery_man_documents`
--
ALTER TABLE `delivery_man_documents`
  ADD CONSTRAINT `delivery_man_documents_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_man_documents_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD CONSTRAINT `order_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  ADD CONSTRAINT `user_bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD CONSTRAINT `wallet_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wallet_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD CONSTRAINT `withdraw_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
