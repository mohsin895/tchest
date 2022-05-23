-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2022 at 08:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reset_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `email_verified` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `email_token` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('admin','superadmin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `manager` tinyint(1) NOT NULL DEFAULT 0,
  `number_of_logins` int(11) NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `accepted_gdpr` tinyint(1) DEFAULT NULL,
  `isAnonymized` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `company_id`, `name`, `email`, `password`, `reset_code`, `last_login`, `email_verified`, `email_token`, `remember_token`, `created_at`, `updated_at`, `type`, `manager`, `number_of_logins`, `last_activity`, `accepted_gdpr`, `isAnonymized`) VALUES
(1, NULL, 'SuperAdmin', 'admin@gmail.com', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', NULL, '2021-10-07 04:49:14', 'yes', NULL, NULL, '2021-07-13 06:19:25', '2021-10-06 22:49:14', 'superadmin', 0, 47, NULL, NULL, 0),
(2, 1, 'Divan Serfontein', 'divan@opticsoftwaresolutions.co.za', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', NULL, '2021-10-05 06:39:13', 'yes', NULL, NULL, '2021-07-13 16:17:50', '2021-10-05 00:39:13', 'admin', 0, 23, NULL, NULL, 0),
(4, 3, 'Divan Serfontein', 'divan@pharmadiv.co.za', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', NULL, '2021-10-04 06:56:29', 'yes', NULL, NULL, '2021-07-15 11:05:05', '2021-10-04 00:56:29', 'admin', 0, 24, NULL, NULL, 0),
(9, NULL, 'mohsin', 'mohsinsikder@gmail.com', '$2y$10$xg/93xNDSPox/V1BwczWLe9U4ciYHeYde0RNxy2P6hO/aCeMSOIem', NULL, '2021-10-04 08:44:20', 'yes', NULL, NULL, '2021-10-04 01:28:17', '2021-10-04 02:44:20', 'superadmin', 0, 2, NULL, NULL, 0),
(10, NULL, 'gbfhbfgh', 'a1@gmail.com', '$2y$10$lkBHP7m/qwVM410EEsQoteP/A6OwRTScuZmZ6TEagmgTvrUrtAmOG', NULL, '2021-10-05 06:29:46', 'no', NULL, NULL, '2021-10-04 03:26:36', '2021-10-05 00:29:46', 'admin', 0, 1, NULL, NULL, 0),
(12, NULL, 'rahat', 'mohsin1@gmail.com', '$2y$10$Ss5VYRygQ06YU.OY1sKjj.fcAyrLqTXje7.qDqt7DDKK/zfbvUSOu', NULL, NULL, 'no', NULL, NULL, '2021-10-04 03:27:16', '2021-10-04 03:27:16', 'admin', 0, 0, NULL, NULL, 0),
(13, NULL, NULL, '', '', NULL, NULL, 'no', NULL, NULL, '2021-10-04 04:18:58', '2021-10-04 04:18:58', 'admin', 0, 0, NULL, NULL, 0),
(14, NULL, 'gjgyujki', 'as@gmail.com', '123456789', NULL, NULL, 'no', NULL, NULL, '2021-10-04 04:29:21', '2021-10-04 04:29:21', 'admin', 0, 0, NULL, NULL, 0),
(16, 19, 'gjgyujki', 'as1@gmail.com', '$2y$10$SnP/ozOy4ybS/tmVHzEPie3X92XnpheFksWPWLm5TQhB7rTTpcgUa', NULL, NULL, 'yes', NULL, NULL, '2021-10-04 04:30:37', '2021-10-04 04:30:37', 'admin', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('absent','present') COLLATE utf8_unicode_ci NOT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `halfDayType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `application_status` enum('approved','rejected','pending') COLLATE utf8_unicode_ci DEFAULT NULL,
  `applied_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clock_in` time DEFAULT NULL,
  `clock_out` time DEFAULT NULL,
  `clock_in_ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clock_out_ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_from` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Office',
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_late` tinyint(1) NOT NULL DEFAULT 0,
  `office_start_time` time DEFAULT NULL,
  `office_end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`, `leaveType`, `halfDayType`, `last_updated_by`, `reason`, `application_status`, `applied_on`, `created_at`, `updated_at`, `clock_in`, `clock_out`, `clock_in_ip_address`, `clock_out_ip_address`, `working_from`, `notes`, `is_late`, `office_start_time`, `office_end_time`) VALUES
(15, 2, '2021-09-15', 'present', NULL, NULL, NULL, '', NULL, NULL, '2021-09-15 05:23:50', '2021-09-16 04:44:53', '10:20:00', '10:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(16, 2, '2021-09-16', 'present', NULL, NULL, NULL, '', NULL, NULL, '2021-09-16 04:55:27', '2021-09-16 04:55:27', '10:20:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(18, 1, '2021-09-16', 'present', NULL, NULL, NULL, '', NULL, NULL, '2021-09-16 04:59:00', '2021-09-16 04:59:00', '10:20:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `award_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `gift` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `cash_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `company_id`, `employee_id`, `award_name`, `gift`, `cash_price`, `month`, `year`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Employee of the month', 'Cash Prize', '100', 'august', '2021', '2021-09-16 07:38:18', '2021-09-16 07:38:18'),
(2, 3, 2, 'yhuut', 'frt6yh', '123', 'september', '2021', '2021-09-19 01:05:13', '2021-09-19 01:05:13'),
(4, 3, 2, '', '', NULL, '', '', '2021-09-19 05:23:19', '2021-09-19 05:23:19'),
(5, 3, 2, 'ryrtytfy7ut67u', 'Prize', '1213', 'august', '2020', '2021-09-19 05:26:14', '2021-09-19 05:26:14'),
(6, 3, 2, 'ryrtytfy7ut67u', 'Prize', '1213', 'august', '2020', '2021-09-19 05:26:52', '2021-09-19 05:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `bank` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tax_payer_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bin` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `employee_id`, `account_name`, `account_number`, `bank`, `tax_payer_id`, `branch`, `bin`, `created_at`, `updated_at`) VALUES
(1, 2, 'divan@pharmadiv.co.za', '4083002962', 'Absa', '100000001', 'Universal', '632005', '2021-07-15 11:10:00', '2021-07-21 10:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `browse_history`
--

CREATE TABLE `browse_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `browse_history`
--

INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '105.225.58.131', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-13 16:19:12', '2021-07-13 16:19:12'),
(2, 1, 2, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-13 16:19:13', '2021-07-13 16:19:13'),
(3, 1, 2, '105.225.58.131', 'admin.departments.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-13 16:19:31', '2021-07-13 16:19:31'),
(4, 1, 2, '105.225.58.131', 'admin.logout', 'http://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-13 16:19:50', '2021-07-13 16:19:50'),
(5, 1, 2, '105.225.58.131', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-13 16:36:29', '2021-07-13 16:36:29'),
(6, 1, 2, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-13 16:36:30', '2021-07-13 16:36:30'),
(7, 1, 2, '105.225.58.131', 'admin.departments.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-13 16:47:08', '2021-07-13 16:47:08'),
(8, 1, 2, '105.225.58.131', 'admin.departments.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments/create', '2021-07-13 16:47:12', '2021-07-13 16:47:12'),
(9, 1, 2, '105.225.58.131', 'admin.departments.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments/create', '2021-07-13 16:47:30', '2021-07-13 16:47:30'),
(10, 1, 2, '105.225.58.131', 'admin.departments.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-13 16:47:34', '2021-07-13 16:47:34'),
(11, 1, 2, '105.225.58.131', 'admin.departments.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-13 16:47:41', '2021-07-13 16:47:41'),
(12, 1, 2, '105.225.58.131', 'admin.departments.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-13 16:47:41', '2021-07-13 16:47:41'),
(13, 1, 2, '105.225.58.131', 'admin.employees.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees/create', '2021-07-13 16:47:47', '2021-07-13 16:47:47'),
(14, 1, 2, '105.225.58.131', 'admin.departments.ajax_designation', 'http://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-07-13 16:47:48', '2021-07-13 16:47:48'),
(15, 1, 2, '105.225.58.131', 'admin.employees.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-13 16:51:36', '2021-07-13 16:51:36'),
(16, 1, 2, '105.225.58.131', 'admin.employees.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-13 16:51:43', '2021-07-13 16:51:43'),
(17, 1, 2, '105.225.58.131', 'admin.employees.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-13 16:51:47', '2021-07-13 16:51:47'),
(18, 1, 2, '105.225.58.131', 'admin.ajax_employees', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-13 16:51:48', '2021-07-13 16:51:48'),
(19, 1, 2, '105.225.58.131', 'admin.holidays.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-13 16:51:56', '2021-07-13 16:51:56'),
(20, 1, 2, '105.225.58.131', 'admin.screenlock.modal', 'http://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-07-13 16:52:21', '2021-07-13 16:52:21'),
(21, 1, 2, '105.225.58.131', 'admin.screen.lock', 'http://tchest.opticsoftwaresolutions.co.za/screenlock', '2021-07-13 16:53:57', '2021-07-13 16:53:57'),
(22, 1, 2, '105.225.58.131', 'admin.screen.lock', 'http://tchest.opticsoftwaresolutions.co.za/screenlock', '2021-07-13 16:54:37', '2021-07-13 16:54:37'),
(23, 1, 2, '105.225.58.131', 'admin.screen.lock', 'http://tchest.opticsoftwaresolutions.co.za/screenlock', '2021-07-13 16:54:40', '2021-07-13 16:54:40'),
(24, 1, 2, '105.225.58.131', 'admin.screen.lock', 'http://tchest.opticsoftwaresolutions.co.za/screenlock', '2021-07-13 16:54:43', '2021-07-13 16:54:43'),
(25, 1, 2, '105.225.58.131', 'admin.login', 'http://tchest.opticsoftwaresolutions.co.za/admin/login', '2021-07-13 16:54:51', '2021-07-13 16:54:51'),
(26, 1, 2, '105.225.58.131', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-13 16:54:52', '2021-07-13 16:54:52'),
(27, 1, 2, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-13 16:54:53', '2021-07-13 16:54:53'),
(28, 1, 2, '105.225.58.131', 'admin.holidays.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-13 16:54:57', '2021-07-13 16:54:57'),
(29, 1, 2, '105.225.58.131', 'admin.holidays.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-13 16:55:00', '2021-07-13 16:55:00'),
(30, 1, 2, '105.225.58.131', 'admin.holidays.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-13 16:55:40', '2021-07-13 16:55:40'),
(31, 1, 2, '105.225.58.131', 'admin.holidays.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-13 16:55:41', '2021-07-13 16:55:41'),
(32, 1, 2, '105.225.58.131', 'admin.leavetypes.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-13 16:55:43', '2021-07-13 16:55:43'),
(33, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:55:44', '2021-07-13 16:55:44'),
(34, 1, 2, '105.225.58.131', 'admin.leavetypes.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/create', '2021-07-13 16:57:24', '2021-07-13 16:57:24'),
(35, 1, 2, '105.225.58.131', 'admin.leavetypes.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-13 16:57:33', '2021-07-13 16:57:33'),
(36, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:57:34', '2021-07-13 16:57:34'),
(37, 1, 2, '105.225.58.131', 'admin.leavetypes.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/create', '2021-07-13 16:57:35', '2021-07-13 16:57:35'),
(38, 1, 2, '105.225.58.131', 'admin.leavetypes.store', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-13 16:57:45', '2021-07-13 16:57:45'),
(39, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:57:45', '2021-07-13 16:57:45'),
(40, 1, 2, '105.225.58.131', 'admin.leavetypes.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-13 16:58:03', '2021-07-13 16:58:03'),
(41, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:58:04', '2021-07-13 16:58:04'),
(42, 1, 2, '105.225.58.131', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-13 16:58:07', '2021-07-13 16:58:07'),
(43, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:58:10', '2021-07-13 16:58:10'),
(44, 1, 2, '105.225.58.131', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-13 16:59:48', '2021-07-13 16:59:48'),
(45, 1, 2, '105.225.58.131', 'admin.leavetypes.ajax_list', 'http://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-13 16:59:50', '2021-07-13 16:59:50'),
(46, 1, 2, '105.225.58.131', 'admin.logout', 'http://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-13 16:59:52', '2021-07-13 16:59:52'),
(47, 1, 2, '105.225.58.131', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-13 16:59:58', '2021-07-13 16:59:58'),
(48, 1, 2, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-13 16:59:59', '2021-07-13 16:59:59'),
(49, 1, 2, '105.225.58.131', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-13 17:09:01', '2021-07-13 17:09:01'),
(50, 1, 2, '105.225.58.131', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-13 17:09:02', '2021-07-13 17:09:02'),
(60, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-15 11:05:42', '2021-07-15 11:05:42'),
(61, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-15 11:05:43', '2021-07-15 11:05:43'),
(62, 3, 4, '105.225.58.131', 'admin.departments.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-15 11:06:04', '2021-07-15 11:06:04'),
(63, 3, 4, '105.225.58.131', 'admin.departments.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/create', '2021-07-15 11:06:06', '2021-07-15 11:06:06'),
(64, 3, 4, '105.225.58.131', 'admin.departments.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-15 11:06:45', '2021-07-15 11:06:45'),
(65, 3, 4, '105.225.58.131', 'admin.departments.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-15 11:06:46', '2021-07-15 11:06:46'),
(66, 3, 4, '105.225.58.131', 'admin.employees.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/create', '2021-07-15 11:06:55', '2021-07-15 11:06:55'),
(67, 3, 4, '105.225.58.131', 'admin.departments.ajax_designation', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-07-15 11:06:56', '2021-07-15 11:06:56'),
(68, 3, 4, '105.225.58.131', 'admin.employees.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-15 11:09:38', '2021-07-15 11:09:38'),
(69, 3, 4, '105.225.58.131', 'admin.employees.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-15 11:10:00', '2021-07-15 11:10:00'),
(70, 3, 4, '105.225.58.131', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-15 11:10:00', '2021-07-15 11:10:00'),
(71, 3, 4, '105.225.58.131', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-15 11:10:01', '2021-07-15 11:10:01'),
(72, 3, 4, '105.225.58.131', 'admin.holidays.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-15 11:10:05', '2021-07-15 11:10:05'),
(73, 3, 4, '105.225.58.131', 'admin.holidays.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-15 11:10:42', '2021-07-15 11:10:42'),
(74, 3, 4, '105.225.58.131', 'admin.holidays.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-15 11:10:43', '2021-07-15 11:10:43'),
(75, 3, 4, '105.225.58.131', 'admin.leavetypes.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-15 11:10:47', '2021-07-15 11:10:47'),
(76, 3, 4, '105.225.58.131', 'admin.leavetypes.ajax_list', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-15 11:10:47', '2021-07-15 11:10:47'),
(77, 3, 4, '105.225.58.131', 'admin.leavetypes.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/create', '2021-07-15 11:10:49', '2021-07-15 11:10:49'),
(78, 3, 4, '105.225.58.131', 'admin.leavetypes.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-15 11:10:55', '2021-07-15 11:10:55'),
(79, 3, 4, '105.225.58.131', 'admin.leavetypes.ajax_list', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-15 11:10:56', '2021-07-15 11:10:56'),
(80, 3, 4, '105.225.58.131', 'admin.leavetypes.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/create', '2021-07-15 11:10:56', '2021-07-15 11:10:56'),
(81, 3, 4, '105.225.58.131', 'admin.leavetypes.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-15 11:11:00', '2021-07-15 11:11:00'),
(82, 3, 4, '105.225.58.131', 'admin.leavetypes.ajax_list', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-15 11:11:00', '2021-07-15 11:11:00'),
(83, 3, 4, '105.225.58.131', 'admin.leavetypes.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-07-15 11:11:03', '2021-07-15 11:11:03'),
(84, 3, 4, '105.225.58.131', 'admin.leavetypes.ajax_list', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-07-15 11:11:04', '2021-07-15 11:11:04'),
(85, 3, 4, '105.225.58.131', 'admin.leavetypes.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/create', '2021-07-15 11:11:10', '2021-07-15 11:11:10'),
(86, 3, 4, '105.225.58.131', 'admin.attendances.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-15 11:11:13', '2021-07-15 11:11:13'),
(87, 3, 4, '105.225.58.131', 'admin.attendances.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-07-15/edit', '2021-07-15 11:11:13', '2021-07-15 11:11:13'),
(88, 3, 4, '105.225.58.131', 'admin.attendance_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings', '2021-07-15 11:11:19', '2021-07-15 11:11:19'),
(89, 3, 4, '105.225.58.131', 'admin.attendance_settings.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings/mark_attendance', '2021-07-15 11:11:49', '2021-07-15 11:11:49'),
(90, 3, 4, '105.225.58.131', 'admin.attendances.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-15 11:11:55', '2021-07-15 11:11:55'),
(91, 3, 4, '105.225.58.131', 'admin.attendances.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-07-15/edit', '2021-07-15 11:11:55', '2021-07-15 11:11:55'),
(92, 3, 4, '105.225.58.131', 'admin.attendance.ajax_attendance', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-07-15 11:11:56', '2021-07-15 11:11:56'),
(93, 3, 4, '105.225.58.131', 'admin.attendances.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/15-07-2021', '2021-07-15 11:12:10', '2021-07-15 11:12:10'),
(94, 3, 4, '105.225.58.131', 'admin.attendances.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-07-15/edit', '2021-07-15 11:12:10', '2021-07-15 11:12:10'),
(95, 3, 4, '105.225.58.131', 'admin.attendance.ajax_attendance', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-07-15 11:12:11', '2021-07-15 11:12:11'),
(96, 3, 4, '105.225.58.131', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-07-15 11:12:17', '2021-07-15 11:12:17'),
(97, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-15 11:12:17', '2021-07-15 11:12:17'),
(98, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-15 11:12:18', '2021-07-15 11:12:18'),
(99, 3, 4, '105.225.58.131', 'admin.general_setting.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-15 11:12:22', '2021-07-15 11:12:22'),
(100, 3, 4, '105.225.58.131', 'admin.general_setting.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-15 11:12:55', '2021-07-15 11:12:55'),
(101, 3, 4, '105.225.58.131', 'admin.general_setting.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-15 11:12:55', '2021-07-15 11:12:55'),
(102, 3, 4, '105.225.58.131', 'admin.general_setting.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-15 11:13:01', '2021-07-15 11:13:01'),
(103, 3, 4, '105.225.58.131', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-07-15 11:13:03', '2021-07-15 11:13:03'),
(104, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-15 11:13:03', '2021-07-15 11:13:03'),
(105, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-15 11:13:04', '2021-07-15 11:13:04'),
(106, 3, 4, '105.225.58.131', 'admin.departments.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-07-15 11:13:13', '2021-07-15 11:13:13'),
(107, 3, 4, '105.225.58.131', 'admin.departments.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/create', '2021-07-15 11:13:16', '2021-07-15 11:13:16'),
(108, 3, 4, '105.225.58.131', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-15 11:13:19', '2021-07-15 11:13:19'),
(109, 3, 4, '105.225.58.131', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-15 11:13:19', '2021-07-15 11:13:19'),
(110, 3, 4, '105.225.58.131', 'admin.employees.import', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/import', '2021-07-15 11:13:22', '2021-07-15 11:13:22'),
(111, 3, 4, '105.225.58.131', 'admin.employees.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/create', '2021-07-15 11:13:39', '2021-07-15 11:13:39'),
(112, 3, 4, '105.225.58.131', 'admin.departments.ajax_designation', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-07-15 11:13:39', '2021-07-15 11:13:39'),
(113, 3, 4, '105.225.58.131', 'admin.expenses.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-07-15 11:13:42', '2021-07-15 11:13:42'),
(114, 3, 4, '105.225.58.131', 'admin.ajax_expenses', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-07-15 11:13:43', '2021-07-15 11:13:43'),
(115, 3, 4, '105.225.58.131', 'admin.awards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/awards', '2021-07-15 11:13:48', '2021-07-15 11:13:48'),
(116, 3, 4, '105.225.58.131', 'admin.ajax_awards', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_awards', '2021-07-15 11:13:48', '2021-07-15 11:13:48'),
(117, 3, 4, '105.225.58.131', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-15 11:13:50', '2021-07-15 11:13:50'),
(118, 3, 4, '105.225.58.131', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-15 11:13:50', '2021-07-15 11:13:50'),
(119, 3, 4, '105.225.58.131', 'admin.payrolls.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/create', '2021-07-15 11:13:55', '2021-07-15 11:13:55'),
(120, 3, 4, '105.225.58.131', 'admin.payrolls.check', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/check', '2021-07-15 11:13:59', '2021-07-15 11:13:59'),
(121, 3, 4, '105.225.58.131', 'admin.payrolls.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-15 11:14:47', '2021-07-15 11:14:47'),
(122, 3, 4, '105.225.58.131', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-15 11:14:48', '2021-07-15 11:14:48'),
(123, 3, 4, '105.225.58.131', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-15 11:14:49', '2021-07-15 11:14:49'),
(124, 3, 4, '105.225.58.131', 'admin.payrolls.downloadpdf', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/downloadpdf/1', '2021-07-15 11:14:50', '2021-07-15 11:14:50'),
(125, 3, 4, '105.225.58.131', 'admin.noticeboards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-15 11:15:18', '2021-07-15 11:15:18'),
(126, 3, 4, '105.225.58.131', 'admin.ajax_notices', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_notices', '2021-07-15 11:15:19', '2021-07-15 11:15:19'),
(127, 3, 4, '105.225.58.131', 'admin.noticeboards.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards/create', '2021-07-15 11:15:21', '2021-07-15 11:15:21'),
(128, 3, 4, '105.225.58.131', 'admin.noticeboards.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-15 11:16:16', '2021-07-15 11:16:16'),
(129, 3, 4, '105.225.58.131', 'admin.noticeboards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-15 11:16:16', '2021-07-15 11:16:16'),
(130, 3, 4, '105.225.58.131', 'admin.ajax_notices', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_notices', '2021-07-15 11:16:17', '2021-07-15 11:16:17'),
(131, 3, 4, '105.225.58.131', 'admin.attendances.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-15 11:16:40', '2021-07-15 11:16:40'),
(132, 3, 4, '105.225.58.131', 'admin.attendances.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-07-15/edit', '2021-07-15 11:16:40', '2021-07-15 11:16:40'),
(133, 3, 4, '105.225.58.131', 'admin.attendance.ajax_attendance', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-07-15 11:16:41', '2021-07-15 11:16:41'),
(134, 3, 4, '105.225.58.131', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-07-15 11:16:53', '2021-07-15 11:16:53'),
(135, 3, 4, '105.225.58.131', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-07-15 11:16:53', '2021-07-15 11:16:53'),
(136, 3, 4, '105.225.58.131', 'admin.job_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-07-15 11:16:55', '2021-07-15 11:16:55'),
(137, 3, 4, '105.225.58.131', 'admin.ajax_jobs_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs_applications', '2021-07-15 11:16:55', '2021-07-15 11:16:55'),
(138, 3, 4, '105.225.58.131', 'admin.billing.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/billing', '2021-07-15 11:16:57', '2021-07-15 11:16:57'),
(139, 3, 4, '105.225.58.131', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-15 11:17:11', '2021-07-15 11:17:11'),
(140, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-21 10:14:06', '2021-07-21 10:14:06'),
(141, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-21 10:14:08', '2021-07-21 10:14:08'),
(142, 3, 4, '105.225.58.131', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-21 10:24:42', '2021-07-21 10:24:42'),
(143, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-21 10:25:24', '2021-07-21 10:25:24'),
(144, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-21 10:25:25', '2021-07-21 10:25:25'),
(145, 3, 4, '105.225.58.131', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-21 10:25:36', '2021-07-21 10:25:36'),
(146, 3, 4, '105.225.58.131', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-21 10:25:37', '2021-07-21 10:25:37'),
(147, 3, 4, '105.225.58.131', 'admin.employees.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/2/edit', '2021-07-21 10:25:41', '2021-07-21 10:25:41'),
(148, 3, 4, '105.225.58.131', 'admin.departments.ajax_designation', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-07-21 10:25:41', '2021-07-21 10:25:41'),
(149, 3, 4, '105.225.58.131', 'admin.employees.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/2', '2021-07-21 10:26:27', '2021-07-21 10:26:27'),
(150, 3, 4, '105.225.58.131', 'admin.employees.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/2', '2021-07-21 10:26:41', '2021-07-21 10:26:41'),
(151, 3, 4, '105.225.58.131', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-21 10:26:47', '2021-07-21 10:26:47'),
(152, 3, 4, '105.225.58.131', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-21 10:26:47', '2021-07-21 10:26:47'),
(153, 3, 4, '105.225.58.131', 'admin.payrolls.downloadpdf', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/downloadpdf/1', '2021-07-21 10:26:50', '2021-07-21 10:26:50'),
(154, 3, 4, '105.225.58.131', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-21 10:28:52', '2021-07-21 10:28:52'),
(155, 3, 4, '105.225.58.131', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-21 10:29:14', '2021-07-21 10:29:14'),
(156, 3, 4, '105.225.58.131', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-21 10:29:15', '2021-07-21 10:29:15'),
(157, 3, 4, '105.225.58.131', 'admin.noticeboards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-21 10:29:24', '2021-07-21 10:29:24'),
(158, 3, 4, '105.225.58.131', 'admin.ajax_notices', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_notices', '2021-07-21 10:29:24', '2021-07-21 10:29:24'),
(159, 3, 4, '105.225.58.131', 'admin.noticeboards.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards/create', '2021-07-21 10:29:27', '2021-07-21 10:29:27'),
(160, 3, 4, '105.225.58.131', 'admin.noticeboards.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-21 10:30:01', '2021-07-21 10:30:01'),
(161, 3, 4, '105.225.58.131', 'admin.noticeboards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-21 10:30:02', '2021-07-21 10:30:02'),
(162, 3, 4, '105.225.58.131', 'admin.ajax_notices', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_notices', '2021-07-21 10:30:02', '2021-07-21 10:30:02'),
(163, 3, 4, '105.225.58.131', 'admin.holidays.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-21 10:30:20', '2021-07-21 10:30:20'),
(164, 3, 4, '105.225.58.131', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-07-21 10:30:40', '2021-07-21 10:30:40'),
(165, 3, 4, '105.225.58.131', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-07-21 10:30:41', '2021-07-21 10:30:41'),
(166, 3, 4, '105.225.58.131', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-07-21 10:30:42', '2021-07-21 10:30:42'),
(167, 3, 4, '105.225.58.131', 'admin.jobs.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-07-21 10:32:20', '2021-07-21 10:32:20'),
(168, 3, 4, '105.225.58.131', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-07-21 10:32:20', '2021-07-21 10:32:20'),
(169, 3, 4, '105.225.58.131', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-07-21 10:32:21', '2021-07-21 10:32:21'),
(170, 3, 4, '105.225.58.131', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-21 10:32:32', '2021-07-21 10:32:32'),
(171, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-26 15:30:48', '2021-07-26 15:30:48'),
(172, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-26 15:30:49', '2021-07-26 15:30:49'),
(173, 3, 4, '105.186.236.140', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-26 15:31:08', '2021-07-26 15:31:08'),
(174, 3, 4, '105.186.236.140', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-26 15:31:09', '2021-07-26 15:31:09'),
(175, 3, 4, '105.186.236.140', 'admin.payrolls.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/1', '2021-07-26 15:31:15', '2021-07-26 15:31:15'),
(176, 3, 4, '105.186.236.140', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-07-26 15:34:23', '2021-07-26 15:34:23'),
(177, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-26 15:34:23', '2021-07-26 15:34:23'),
(178, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-26 15:34:24', '2021-07-26 15:34:24'),
(179, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-27 01:24:54', '2021-07-27 01:24:54'),
(180, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-27 01:24:54', '2021-07-27 01:24:54'),
(181, 3, 4, '105.186.236.140', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-27 01:25:06', '2021-07-27 01:25:06'),
(182, 3, 4, '105.186.236.140', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-27 01:25:06', '2021-07-27 01:25:06'),
(183, 3, 4, '105.186.236.140', 'admin.awards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/awards', '2021-07-27 01:25:22', '2021-07-27 01:25:22'),
(184, 3, 4, '105.186.236.140', 'admin.ajax_awards', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_awards', '2021-07-27 01:25:23', '2021-07-27 01:25:23'),
(185, 3, 4, '105.186.236.140', 'admin.expenses.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-07-27 01:25:24', '2021-07-27 01:25:24'),
(186, 3, 4, '105.186.236.140', 'admin.ajax_expenses', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-07-27 01:25:25', '2021-07-27 01:25:25'),
(187, 3, 4, '105.186.236.140', 'admin.expense.change_status', 'https://tchest.opticsoftwaresolutions.co.za/admin/expense_change_status/1', '2021-07-27 01:25:41', '2021-07-27 01:25:41'),
(188, 3, 4, '105.186.236.140', 'admin.ajax_expenses', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-07-27 01:25:41', '2021-07-27 01:25:41'),
(189, 3, 4, '105.186.236.140', 'admin.holidays.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/holidays', '2021-07-27 01:25:44', '2021-07-27 01:25:44'),
(190, 3, 4, '105.186.236.140', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-27 01:25:51', '2021-07-27 01:25:51'),
(191, 3, 4, '105.186.236.140', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-27 01:25:51', '2021-07-27 01:25:51'),
(192, 3, 4, '105.186.236.140', 'admin.noticeboards.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/noticeboards', '2021-07-27 01:25:59', '2021-07-27 01:25:59'),
(193, 3, 4, '105.186.236.140', 'admin.ajax_notices', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_notices', '2021-07-27 01:26:00', '2021-07-27 01:26:00'),
(194, 3, 4, '105.186.236.140', 'admin.attendances.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-07-27 01:26:05', '2021-07-27 01:26:05'),
(195, 3, 4, '105.186.236.140', 'admin.attendances.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-07-27/edit', '2021-07-27 01:26:05', '2021-07-27 01:26:05'),
(196, 3, 4, '105.186.236.140', 'admin.attendance.ajax_attendance', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-07-27 01:26:06', '2021-07-27 01:26:06'),
(197, 3, 4, '105.186.236.140', 'admin.billing.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/billing', '2021-07-27 01:26:22', '2021-07-27 01:26:22'),
(198, 3, 4, '105.186.236.140', 'admin.general_setting.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-27 01:26:28', '2021-07-27 01:26:28'),
(199, 3, 4, '105.186.236.140', 'admin.profile_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/profile-settings', '2021-07-27 01:26:34', '2021-07-27 01:26:34'),
(200, 3, 4, '105.186.236.140', 'admin.notification.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/notification-settings', '2021-07-27 01:26:39', '2021-07-27 01:26:39'),
(201, 3, 4, '105.186.236.140', 'admin.company_setting.theme', 'https://tchest.opticsoftwaresolutions.co.za/admin/company_setting_theme', '2021-07-27 01:26:42', '2021-07-27 01:26:42'),
(202, 3, 4, '105.186.236.140', 'admin.attendance_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings', '2021-07-27 01:26:49', '2021-07-27 01:26:49'),
(203, 3, 4, '105.186.236.140', 'admin.attendance_settings.update', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings/mark_attendance', '2021-07-27 01:27:18', '2021-07-27 01:27:18'),
(204, 3, 4, '105.186.236.140', 'admin.admin_users.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/admin_users', '2021-07-27 01:27:21', '2021-07-27 01:27:21'),
(205, 3, 4, '105.186.236.140', 'admin.ajax_admin_users', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_admin_users', '2021-07-27 01:27:21', '2021-07-27 01:27:21'),
(206, 3, 4, '105.186.236.140', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-27 01:27:28', '2021-07-27 01:27:28'),
(207, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-30 12:11:04', '2021-07-30 12:11:04'),
(208, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-30 12:11:05', '2021-07-30 12:11:05'),
(209, 3, 4, '105.186.236.140', 'admin.billing.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/billing', '2021-07-30 12:11:45', '2021-07-30 12:11:45'),
(210, 3, 4, '105.186.236.140', 'admin.general_setting.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-07-30 12:11:52', '2021-07-30 12:11:52'),
(211, 3, 4, '105.186.236.140', 'admin.profile_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/profile-settings', '2021-07-30 12:11:55', '2021-07-30 12:11:55'),
(212, 3, 4, '105.186.236.140', 'admin.notification.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/notification-settings', '2021-07-30 12:11:58', '2021-07-30 12:11:58'),
(213, 3, 4, '105.186.236.140', 'admin.company_setting.theme', 'https://tchest.opticsoftwaresolutions.co.za/admin/company_setting_theme', '2021-07-30 12:11:59', '2021-07-30 12:11:59'),
(214, 3, 4, '105.186.236.140', 'admin.attendance_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings', '2021-07-30 12:12:03', '2021-07-30 12:12:03'),
(215, 3, 4, '105.186.236.140', 'admin.admin_users.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/admin_users', '2021-07-30 12:12:06', '2021-07-30 12:12:06'),
(216, 3, 4, '105.186.236.140', 'admin.ajax_admin_users', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_admin_users', '2021-07-30 12:12:07', '2021-07-30 12:12:07'),
(217, 3, 4, '105.186.236.140', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-30 12:12:11', '2021-07-30 12:12:11'),
(218, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-30 14:06:12', '2021-07-30 14:06:12'),
(219, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-30 14:06:13', '2021-07-30 14:06:13'),
(220, 3, 4, '105.186.236.140', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-07-30 14:13:22', '2021-07-30 14:13:22'),
(221, 3, 4, '105.186.236.140', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-07-30 14:13:22', '2021-07-30 14:13:22'),
(222, 3, 4, '105.186.236.140', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-07-30 14:13:40', '2021-07-30 14:13:40'),
(223, 3, 4, '105.186.236.140', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-07-30 14:13:40', '2021-07-30 14:13:40'),
(224, 3, 4, '105.186.236.140', 'admin.payrolls.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/1', '2021-07-30 14:13:45', '2021-07-30 14:13:45'),
(225, 3, 4, '105.186.236.140', 'admin.leave_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-07-30 14:14:06', '2021-07-30 14:14:06'),
(226, 3, 4, '105.186.236.140', 'admin.leave_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-07-30 14:14:07', '2021-07-30 14:14:07'),
(227, 3, 4, '105.186.236.140', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-07-30 14:14:15', '2021-07-30 14:14:15'),
(228, 3, 4, '105.186.236.140', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-07-30 14:14:16', '2021-07-30 14:14:16'),
(229, 3, 4, '105.186.236.140', 'admin.job_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-07-30 14:14:26', '2021-07-30 14:14:26'),
(230, 3, 4, '105.186.236.140', 'admin.ajax_jobs_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs_applications', '2021-07-30 14:14:26', '2021-07-30 14:14:26'),
(231, 3, 4, '105.186.236.140', 'admin.billing.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/billing', '2021-07-30 14:14:30', '2021-07-30 14:14:30'),
(232, 3, 4, '105.186.236.140', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-30 14:14:37', '2021-07-30 14:14:37'),
(233, 3, 4, '105.186.236.140', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-07-30 14:15:18', '2021-07-30 14:15:18'),
(234, 3, 4, '105.186.236.140', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-07-30 14:15:18', '2021-07-30 14:15:18'),
(235, 3, 4, '105.186.236.140', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-07-30 14:15:27', '2021-07-30 14:15:27'),
(236, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:08:08', '2021-08-31 03:08:08'),
(237, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:08:12', '2021-08-31 03:08:12'),
(238, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:12:38', '2021-08-31 03:12:38'),
(239, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:12:51', '2021-08-31 03:12:51'),
(240, 3, 4, '37.111.199.84', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 03:13:13', '2021-08-31 03:13:13'),
(241, 3, 4, '37.111.199.84', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 03:13:21', '2021-08-31 03:13:21'),
(242, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:13:22', '2021-08-31 03:13:22'),
(243, 3, 4, '37.111.199.84', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 03:13:22', '2021-08-31 03:13:22'),
(244, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:13:23', '2021-08-31 03:13:23'),
(245, 3, 4, '37.111.199.84', 'admin.profile_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/profile-settings', '2021-08-31 03:13:36', '2021-08-31 03:13:36'),
(246, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:13:37', '2021-08-31 03:13:37'),
(247, 3, 4, '37.111.199.84', 'admin.profile_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/profile-settings', '2021-08-31 03:14:31', '2021-08-31 03:14:31'),
(248, 3, 4, '37.111.199.84', 'admin.attendance_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendance_settings', '2021-08-31 03:14:37', '2021-08-31 03:14:37'),
(249, 3, 4, '37.111.199.84', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 03:14:46', '2021-08-31 03:14:46'),
(250, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:14:47', '2021-08-31 03:14:47'),
(251, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:14:47', '2021-08-31 03:14:47'),
(252, 3, 4, '37.111.199.84', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-08-31 03:15:29', '2021-08-31 03:15:29'),
(253, 3, 4, '37.111.199.84', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-08-31 03:15:30', '2021-08-31 03:15:30'),
(254, 3, 4, '37.111.199.84', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-08-31 03:16:00', '2021-08-31 03:16:00'),
(255, 3, 4, '37.111.199.84', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-08-31 03:16:18', '2021-08-31 03:16:18'),
(256, 3, 4, '37.111.199.84', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-08-31 03:16:19', '2021-08-31 03:16:19'),
(257, 3, 4, '37.111.199.84', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-08-31 03:16:20', '2021-08-31 03:16:20'),
(258, 3, 4, '37.111.199.84', 'admin.jobs.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/pdfmake.min.js.map', '2021-08-31 03:17:04', '2021-08-31 03:17:04'),
(259, 3, 4, '37.111.199.84', 'admin.jobs.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/bootstrap-select.js.map', '2021-08-31 03:17:05', '2021-08-31 03:17:05'),
(260, 3, 4, '37.111.199.84', 'admin.jobs.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/pdfmake.min.js.map', '2021-08-31 03:17:05', '2021-08-31 03:17:05'),
(261, 3, 4, '37.111.199.84', 'admin.jobs.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/bootstrap-select.js.map', '2021-08-31 03:17:05', '2021-08-31 03:17:05'),
(262, 3, 4, '37.111.199.84', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-08-31 03:19:21', '2021-08-31 03:19:21'),
(263, 3, 4, '37.111.199.84', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-08-31 03:19:22', '2021-08-31 03:19:22'),
(264, 3, 4, '37.111.199.84', 'admin.payrolls.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/create', '2021-08-31 03:19:29', '2021-08-31 03:19:29'),
(265, 3, 4, '37.111.199.84', 'admin.payrolls.check', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/check', '2021-08-31 03:20:09', '2021-08-31 03:20:09'),
(266, 3, 4, '37.111.199.84', 'admin.job_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-08-31 03:23:16', '2021-08-31 03:23:16'),
(267, 3, 4, '37.111.199.84', 'admin.ajax_jobs_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs_applications', '2021-08-31 03:23:17', '2021-08-31 03:23:17'),
(268, 3, 4, '37.111.199.84', 'admin.departments.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments', '2021-08-31 03:23:23', '2021-08-31 03:23:23'),
(269, 3, 4, '37.111.199.84', 'admin.leave_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-08-31 03:23:32', '2021-08-31 03:23:32'),
(270, 3, 4, '37.111.199.84', 'admin.leave_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-08-31 03:23:34', '2021-08-31 03:23:34'),
(271, 3, 4, '37.111.199.84', 'admin.leavetypes.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes', '2021-08-31 03:23:37', '2021-08-31 03:23:37'),
(272, 3, 4, '37.111.199.84', 'admin.leavetypes.ajax_list', 'https://tchest.opticsoftwaresolutions.co.za/admin/leavetypes/ajax_list', '2021-08-31 03:23:38', '2021-08-31 03:23:38'),
(273, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:28:16', '2021-08-31 03:28:16'),
(274, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:28:27', '2021-08-31 03:28:27'),
(275, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:28:29', '2021-08-31 03:28:29'),
(276, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:28:30', '2021-08-31 03:28:30'),
(277, 3, 4, '37.111.199.84', 'admin.logout', 'http://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-08-31 03:28:32', '2021-08-31 03:28:32'),
(278, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:29:02', '2021-08-31 03:29:02'),
(279, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:29:03', '2021-08-31 03:29:03'),
(280, 3, 4, '37.111.199.84', 'admin.employees.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 03:30:27', '2021-08-31 03:30:27'),
(281, 3, 4, '37.111.199.84', 'admin.ajax_employees', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-08-31 03:30:29', '2021-08-31 03:30:29'),
(282, 3, 4, '37.111.199.84', 'admin.leave_applications.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-08-31 03:30:54', '2021-08-31 03:30:54'),
(283, 3, 4, '37.111.199.84', 'admin.leave_applications', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-08-31 03:30:56', '2021-08-31 03:30:56'),
(284, 3, 4, '37.111.199.84', 'admin.expenses.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-08-31 03:37:33', '2021-08-31 03:37:33'),
(285, 3, 4, '37.111.199.84', 'admin.ajax_expenses', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-08-31 03:37:34', '2021-08-31 03:37:34'),
(286, 3, 4, '37.111.199.84', 'admin.expenses.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/expenses/create', '2021-08-31 03:37:37', '2021-08-31 03:37:37'),
(287, 3, 4, '37.111.199.84', 'admin.expenses.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-08-31 03:37:43', '2021-08-31 03:37:43'),
(288, 3, 4, '37.111.199.84', 'admin.ajax_expenses', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-08-31 03:37:44', '2021-08-31 03:37:44'),
(289, 3, 4, '37.111.199.84', 'admin.admin_users.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/admin_users', '2021-08-31 03:49:04', '2021-08-31 03:49:04'),
(290, 3, 4, '37.111.199.84', 'admin.admin_users.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/admin_users', '2021-08-31 03:49:05', '2021-08-31 03:49:05'),
(291, 3, 4, '37.111.199.84', 'admin.ajax_admin_users', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_admin_users', '2021-08-31 03:49:05', '2021-08-31 03:49:05'),
(292, 3, 4, '37.111.199.84', 'admin.ajax_admin_users', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_admin_users', '2021-08-31 03:49:06', '2021-08-31 03:49:06'),
(293, 3, 4, '37.111.199.84', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 03:51:12', '2021-08-31 03:51:12'),
(294, 3, 4, '37.111.199.84', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 03:51:13', '2021-08-31 03:51:13'),
(295, 3, 4, '37.111.199.84', 'admin.logout', 'http://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-08-31 03:51:20', '2021-08-31 03:51:20'),
(296, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 04:07:19', '2021-08-31 04:07:19'),
(297, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 04:07:19', '2021-08-31 04:07:19'),
(298, 3, 4, '103.54.36.68', 'admin.employees.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 04:07:34', '2021-08-31 04:07:34'),
(299, 3, 4, '103.54.36.68', 'admin.ajax_employees', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-08-31 04:07:35', '2021-08-31 04:07:35'),
(300, 3, 4, '103.54.36.68', 'admin.jobs.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-08-31 04:14:31', '2021-08-31 04:14:31'),
(301, 3, 4, '103.54.36.68', 'admin.ajax_jobs', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-08-31 04:14:32', '2021-08-31 04:14:32'),
(302, 3, 4, '103.54.36.68', 'admin.jobs.edit', 'http://tchest.opticsoftwaresolutions.co.za/admin/jobs/1/edit', '2021-08-31 04:14:38', '2021-08-31 04:14:38'),
(303, 3, 4, '103.54.36.68', 'admin.jobs.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-08-31 04:14:45', '2021-08-31 04:14:45');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(304, 3, 4, '103.54.36.68', 'admin.ajax_jobs', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-08-31 04:14:46', '2021-08-31 04:14:46'),
(305, 3, 4, '103.54.36.68', 'admin.employees.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 04:15:00', '2021-08-31 04:15:00'),
(306, 3, 4, '103.54.36.68', 'admin.ajax_employees', 'http://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-08-31 04:15:00', '2021-08-31 04:15:00'),
(307, 3, 4, '103.54.36.68', 'admin.attendances.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances', '2021-08-31 04:15:23', '2021-08-31 04:15:23'),
(308, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:15:24', '2021-08-31 04:15:24'),
(309, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:15:42', '2021-08-31 04:15:42'),
(310, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:15:46', '2021-08-31 04:15:46'),
(311, 3, 4, '103.54.36.68', 'admin.leave_applications.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-08-31 04:16:05', '2021-08-31 04:16:05'),
(312, 3, 4, '103.54.36.68', 'admin.leave_applications', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-08-31 04:16:06', '2021-08-31 04:16:06'),
(313, 3, 4, '103.54.36.68', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-08-31 04:19:22', '2021-08-31 04:19:22'),
(314, 3, 4, '103.54.36.68', 'admin.attendances.edit', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-08-31/edit', '2021-08-31 04:19:22', '2021-08-31 04:19:22'),
(315, 3, 4, '103.54.36.68', 'admin.attendance.ajax_attendance', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-08-31 04:19:25', '2021-08-31 04:19:25'),
(316, 3, 4, '103.54.36.68', 'admin.attendance.update.row', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendance/update/row', '2021-08-31 04:21:52', '2021-08-31 04:21:52'),
(317, 3, 4, '103.54.36.68', 'admin.attendance.update.row', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendance/update/row', '2021-08-31 04:22:01', '2021-08-31 04:22:01'),
(318, 3, 4, '103.54.36.68', 'admin.leave_applications.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-08-31 04:22:09', '2021-08-31 04:22:09'),
(319, 3, 4, '103.54.36.68', 'admin.leave_applications', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-08-31 04:22:09', '2021-08-31 04:22:09'),
(320, 3, 4, '103.54.36.68', 'admin.attendances.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/create', '2021-08-31 04:22:11', '2021-08-31 04:22:11'),
(321, 3, 4, '103.54.36.68', 'admin.attendances.edit', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-08-31/edit', '2021-08-31 04:22:12', '2021-08-31 04:22:12'),
(322, 3, 4, '103.54.36.68', 'admin.attendance.ajax_attendance', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-08-31 04:22:12', '2021-08-31 04:22:12'),
(323, 3, 4, '103.54.36.68', 'admin.attendances.edit', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/2021-08-24/edit', '2021-08-31 04:25:22', '2021-08-31 04:25:22'),
(324, 3, 4, '103.54.36.68', 'admin.attendance.ajax_attendance', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_attendance', '2021-08-31 04:25:24', '2021-08-31 04:25:24'),
(325, 3, 4, '103.54.36.68', 'admin.attendances.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances', '2021-08-31 04:25:52', '2021-08-31 04:25:52'),
(326, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:25:54', '2021-08-31 04:25:54'),
(327, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:26:52', '2021-08-31 04:26:52'),
(328, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:26:59', '2021-08-31 04:26:59'),
(329, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:27:07', '2021-08-31 04:27:07'),
(330, 3, 4, '103.54.36.68', 'admin.attendances.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances', '2021-08-31 04:28:44', '2021-08-31 04:28:44'),
(331, 3, 4, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/filter', '2021-08-31 04:28:46', '2021-08-31 04:28:46'),
(332, 3, 4, '103.54.36.68', 'admin.job_applications.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-08-31 04:31:11', '2021-08-31 04:31:11'),
(333, 3, 4, '103.54.36.68', 'admin.ajax_jobs_applications', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs_applications', '2021-08-31 04:31:13', '2021-08-31 04:31:13'),
(334, 3, 4, '103.54.36.68', 'admin.jobs.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-08-31 04:31:27', '2021-08-31 04:31:27'),
(335, 3, 4, '103.54.36.68', 'admin.ajax_jobs', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-08-31 04:31:29', '2021-08-31 04:31:29'),
(336, 3, 4, '103.54.36.68', 'admin.leave_applications.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications', '2021-08-31 04:32:05', '2021-08-31 04:32:05'),
(337, 3, 4, '103.54.36.68', 'admin.leave_applications', 'http://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/ajaxApplications', '2021-08-31 04:32:05', '2021-08-31 04:32:05'),
(338, 3, 4, '103.54.36.68', 'admin.billing.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/billing', '2021-08-31 04:32:14', '2021-08-31 04:32:14'),
(339, 3, 4, '103.54.36.68', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 04:32:50', '2021-08-31 04:32:50'),
(340, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 04:32:51', '2021-08-31 04:32:51'),
(341, 3, 4, '103.54.36.68', 'admin.getlogin', 'http://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 04:32:52', '2021-08-31 04:32:52'),
(342, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 04:32:53', '2021-08-31 04:32:53'),
(343, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 04:32:54', '2021-08-31 04:32:54'),
(344, 3, 4, '103.54.36.68', 'admin.logout', 'http://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-08-31 04:33:15', '2021-08-31 04:33:15'),
(345, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 07:36:20', '2021-08-31 07:36:20'),
(346, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 07:36:31', '2021-08-31 07:36:31'),
(347, 3, 4, '103.54.36.68', 'admin.getlogin', 'https://tchest.opticsoftwaresolutions.co.za/admin', '2021-08-31 07:36:44', '2021-08-31 07:36:44'),
(348, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 07:36:44', '2021-08-31 07:36:44'),
(349, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 07:36:45', '2021-08-31 07:36:45'),
(350, 3, 4, '103.54.36.68', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-08-31 07:36:47', '2021-08-31 07:36:47'),
(378, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-08-31 09:00:23', '2021-08-31 09:00:23'),
(379, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-08-31 09:00:24', '2021-08-31 09:00:24'),
(380, 3, 4, '103.54.36.68', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 09:00:29', '2021-08-31 09:00:29'),
(381, 3, 4, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-08-31 09:00:30', '2021-08-31 09:00:30'),
(382, 3, 4, '103.54.36.68', 'admin.employees.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/create', '2021-08-31 09:00:31', '2021-08-31 09:00:31'),
(383, 3, 4, '103.54.36.68', 'admin.departments.ajax_designation', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-08-31 09:00:32', '2021-08-31 09:00:32'),
(384, 3, 4, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-08-31 09:21:11', '2021-08-31 09:21:11'),
(385, 3, 4, '103.54.36.68', 'admin.login', 'https://tchest.opticsoftwaresolutions.co.za/admin/login', '2021-08-31 09:21:29', '2021-08-31 09:21:29'),
(386, 3, 4, '103.54.36.68', 'admin.profile_settings.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/profile-settings', '2021-08-31 09:21:45', '2021-08-31 09:21:45'),
(387, 3, 4, '103.54.36.68', 'admin.employees.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees', '2021-08-31 09:21:53', '2021-08-31 09:21:53'),
(388, 3, 4, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/ajax_employees', '2021-08-31 09:21:54', '2021-08-31 09:21:54'),
(389, 3, 4, '103.54.36.68', 'admin.employees.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/employees/2/edit', '2021-08-31 09:21:57', '2021-08-31 09:21:57'),
(390, 3, 4, '103.54.36.68', 'admin.departments.ajax_designation', 'https://tchest.opticsoftwaresolutions.co.za/admin/departments/ajax_designation', '2021-08-31 09:21:58', '2021-08-31 09:21:58'),
(391, 3, 4, '103.54.36.68', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-08-31 09:40:23', '2021-08-31 09:40:23'),
(392, 3, 4, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-09-01 03:17:56', '2021-09-01 03:17:56'),
(393, 3, 4, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-09-01 03:18:00', '2021-09-01 03:18:00'),
(394, 3, 4, '103.54.36.68', 'admin.expenses.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-09-01 03:18:08', '2021-09-01 03:18:08'),
(395, 3, 4, '103.54.36.68', 'admin.expenses.create', 'http://tchest.opticsoftwaresolutions.co.za/admin/expenses/create', '2021-09-01 03:18:12', '2021-09-01 03:18:12'),
(396, 3, 4, '103.54.36.68', 'admin.expenses.index', 'http://tchest.opticsoftwaresolutions.co.za/admin/expenses', '2021-09-01 03:18:21', '2021-09-01 03:18:21'),
(397, 3, 4, '103.54.36.68', 'admin.ajax_expenses', 'http://tchest.opticsoftwaresolutions.co.za/admin/ajax_expenses', '2021-09-01 03:18:21', '2021-09-01 03:18:21'),
(398, 3, 4, '37.111.213.123', 'admin.screenlock.modal', 'http://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-09-01 05:10:16', '2021-09-01 05:10:16'),
(399, 3, 4, '119.30.32.235', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-09-02 03:56:02', '2021-09-02 03:56:02'),
(400, 3, 4, '119.30.32.235', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-09-02 03:56:17', '2021-09-02 03:56:17'),
(401, 3, 4, '119.30.32.235', 'admin.job_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-09-02 03:56:24', '2021-09-02 03:56:24'),
(402, 3, 4, '119.30.32.235', 'admin.ajax_jobs_applications', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs_applications', '2021-09-02 03:56:32', '2021-09-02 03:56:32'),
(403, 3, 4, '119.30.32.235', 'admin.general_setting.edit', 'https://tchest.opticsoftwaresolutions.co.za/admin/general-setting', '2021-09-02 03:56:38', '2021-09-02 03:56:38'),
(404, 3, 4, '119.30.32.235', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-09-02 03:56:45', '2021-09-02 03:56:45'),
(405, 3, 4, '119.30.32.235', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-09-02 03:56:45', '2021-09-02 03:56:45'),
(406, 3, 4, '119.30.32.235', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-09-02 03:56:47', '2021-09-02 03:56:47'),
(407, 3, 4, '37.111.218.89', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-09-02 09:07:36', '2021-09-02 09:07:36'),
(408, 3, 4, '37.111.218.89', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-09-02 09:07:37', '2021-09-02 09:07:37'),
(409, 3, 4, '37.111.218.89', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-09-02 09:07:50', '2021-09-02 09:07:50'),
(410, 3, 4, '37.111.218.89', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-09-02 09:07:51', '2021-09-02 09:07:51'),
(411, 3, 4, '37.111.218.89', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-09-02 09:07:52', '2021-09-02 09:07:52'),
(412, 3, 4, '37.111.218.89', 'admin.screenlock.modal', 'https://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-09-02 09:26:04', '2021-09-02 09:26:04'),
(413, 3, 4, '37.111.212.220', 'admin.screenlock.modal', 'https://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-09-02 09:44:04', '2021-09-02 09:44:04'),
(414, 3, 4, '37.111.212.220', 'admin.login', 'https://tchest.opticsoftwaresolutions.co.za/admin/login', '2021-09-02 09:51:20', '2021-09-02 09:51:20'),
(415, 3, 4, '37.111.212.220', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-09-02 09:51:44', '2021-09-02 09:51:44'),
(439, 1, 2, '103.126.149.7', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-09-03 19:34:25', '2021-09-03 19:34:25'),
(440, 1, 2, '103.126.149.7', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-09-03 19:34:30', '2021-09-03 19:34:30'),
(441, 1, 2, '103.126.149.7', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-09-03 19:34:38', '2021-09-03 19:34:38'),
(442, 1, 2, '103.126.149.7', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-09-03 19:34:39', '2021-09-03 19:34:39'),
(443, 1, 2, '103.126.149.7', 'admin.payrolls.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/create', '2021-09-03 19:34:42', '2021-09-03 19:34:42'),
(444, 1, 2, '103.126.149.7', 'admin.payrolls.check', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/check', '2021-09-03 19:34:49', '2021-09-03 19:34:49'),
(445, 1, 2, '103.126.149.7', 'admin.payrolls.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-09-03 19:34:52', '2021-09-03 19:34:52'),
(446, 1, 2, '103.126.149.7', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-09-03 19:34:58', '2021-09-03 19:34:58'),
(447, 1, 2, '103.126.149.7', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-09-03 19:34:59', '2021-09-03 19:34:59'),
(448, 1, 2, '103.126.149.7', 'admin.payrolls.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/2', '2021-09-03 19:35:03', '2021-09-03 19:35:03'),
(449, 1, 2, '103.126.149.7', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-09-03 19:35:59', '2021-09-03 19:35:59'),
(450, 1, 2, '103.126.149.7', 'admin.payrolls.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/create', '2021-09-03 19:36:01', '2021-09-03 19:36:01'),
(451, 1, 2, '103.126.149.7', 'admin.payrolls.check', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls/check', '2021-09-03 19:36:04', '2021-09-03 19:36:04'),
(452, 1, 2, '103.126.149.7', 'admin.payrolls.store', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-09-03 19:36:33', '2021-09-03 19:36:33'),
(453, 1, 2, '103.126.149.7', 'admin.payrolls.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/payrolls', '2021-09-03 19:36:34', '2021-09-03 19:36:34'),
(454, 1, 2, '103.126.149.7', 'admin.ajax_payrolls', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_payrolls', '2021-09-03 19:36:35', '2021-09-03 19:36:35'),
(455, 1, 2, '103.126.149.7', 'admin.screenlock.modal', 'https://tchest.opticsoftwaresolutions.co.za/screenlock/modal', '2021-09-03 19:54:37', '2021-09-03 19:54:37'),
(456, 3, 4, '37.111.213.88', 'admin.dashboard.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/dashboard', '2021-09-05 03:42:05', '2021-09-05 03:42:05'),
(457, 3, 4, '37.111.213.88', 'admin.attendance.ajax_load_calender', 'https://tchest.opticsoftwaresolutions.co.za/admin/attendances/ajax_load_calender', '2021-09-05 03:42:20', '2021-09-05 03:42:20'),
(458, 3, 4, '37.111.213.88', 'admin.job_applications.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/job_applications', '2021-09-05 03:42:30', '2021-09-05 03:42:30'),
(459, 3, 4, '37.111.213.88', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-09-05 03:42:34', '2021-09-05 03:42:34'),
(460, 3, 4, '37.111.213.88', 'admin.jobs.create', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs/create', '2021-09-05 03:42:49', '2021-09-05 03:42:49'),
(461, 3, 4, '37.111.213.88', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-09-05 03:42:50', '2021-09-05 03:42:50'),
(462, 3, 4, '37.111.213.88', 'admin.jobs.index', 'https://tchest.opticsoftwaresolutions.co.za/admin/jobs', '2021-09-05 03:42:52', '2021-09-05 03:42:52'),
(463, 3, 4, '37.111.213.88', 'admin.ajax_jobs', 'https://tchest.opticsoftwaresolutions.co.za/admin/ajax_jobs', '2021-09-05 03:42:54', '2021-09-05 03:42:54'),
(464, 3, 4, '37.111.213.88', 'admin.leave_applications.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/1', '2021-09-05 03:43:56', '2021-09-05 03:43:56'),
(465, 3, 4, '37.111.213.88', 'admin.leave_applications.show', 'https://tchest.opticsoftwaresolutions.co.za/admin/leave_applications/2', '2021-09-05 03:44:07', '2021-09-05 03:44:07'),
(466, 3, 4, '37.111.213.88', 'admin.logout', 'https://tchest.opticsoftwaresolutions.co.za/admin/logout', '2021-09-05 03:44:19', '2021-09-05 03:44:19'),
(467, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-09-13 02:55:14', '2021-09-13 02:55:14'),
(468, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-09-13 02:55:17', '2021-09-13 02:55:17'),
(469, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-09-13 02:57:07', '2021-09-13 02:57:07'),
(470, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-09-13 02:57:09', '2021-09-13 02:57:09'),
(471, 1, 2, '127.0.0.1', 'admin.logout', 'http://127.0.0.1:8000/admin/logout', '2021-09-13 02:57:21', '2021-09-13 02:57:21'),
(472, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-09-19 02:20:03', '2021-09-19 02:20:03'),
(473, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-09-19 02:20:08', '2021-09-19 02:20:08'),
(474, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 02:45:02', '2021-09-19 02:45:02'),
(475, 1, 2, '127.0.0.1', 'admin.login', 'http://127.0.0.1:8000/admin/login', '2021-09-19 02:57:41', '2021-09-19 02:57:41'),
(476, 1, 2, '127.0.0.1', 'admin.awards.index', 'http://127.0.0.1:8000/admin/awards', '2021-09-19 03:02:40', '2021-09-19 03:02:40'),
(477, 1, 2, '127.0.0.1', 'admin.ajax_awards', 'http://127.0.0.1:8000/admin/ajax_awards', '2021-09-19 03:02:42', '2021-09-19 03:02:42'),
(478, 1, 2, '127.0.0.1', 'admin.awards.create', 'http://127.0.0.1:8000/admin/awards/create', '2021-09-19 03:02:43', '2021-09-19 03:02:43'),
(479, 1, 2, '127.0.0.1', 'admin.awards.store', 'http://127.0.0.1:8000/admin/awards', '2021-09-19 03:03:20', '2021-09-19 03:03:20'),
(480, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 03:21:28', '2021-09-19 03:21:28'),
(481, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-09-19 04:40:55', '2021-09-19 04:40:55'),
(482, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-09-19 04:40:56', '2021-09-19 04:40:56'),
(483, 1, 2, '127.0.0.1', 'admin.expenses.index', 'http://127.0.0.1:8000/admin/expenses', '2021-09-19 04:40:59', '2021-09-19 04:40:59'),
(484, 1, 2, '127.0.0.1', 'admin.ajax_expenses', 'http://127.0.0.1:8000/admin/ajax_expenses', '2021-09-19 04:41:00', '2021-09-19 04:41:00'),
(485, 1, 2, '127.0.0.1', 'admin.expenses.create', 'http://127.0.0.1:8000/admin/expenses/create', '2021-09-19 04:41:00', '2021-09-19 04:41:00'),
(486, 1, 2, '127.0.0.1', 'admin.expenses.create', 'http://127.0.0.1:8000/admin/expenses/create', '2021-09-19 04:45:52', '2021-09-19 04:45:52'),
(487, 1, 2, '127.0.0.1', 'admin.expenses.store', 'http://127.0.0.1:8000/admin/expenses', '2021-09-19 04:46:16', '2021-09-19 04:46:16'),
(488, 1, 2, '127.0.0.1', 'admin.expenses.store', 'http://127.0.0.1:8000/admin/expenses', '2021-09-19 04:46:47', '2021-09-19 04:46:47'),
(489, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 05:14:16', '2021-09-19 05:14:16'),
(490, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 05:32:18', '2021-09-19 05:32:18'),
(491, 1, 2, '127.0.0.1', 'admin.login', 'http://127.0.0.1:8000/admin/login', '2021-09-19 05:34:30', '2021-09-19 05:34:30'),
(492, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://127.0.0.1:8000/admin/noticeboards', '2021-09-19 05:34:34', '2021-09-19 05:34:34'),
(493, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-09-19 05:34:35', '2021-09-19 05:34:35'),
(494, 1, 2, '127.0.0.1', 'admin.noticeboards.create', 'http://127.0.0.1:8000/admin/noticeboards/create', '2021-09-19 05:34:37', '2021-09-19 05:34:37'),
(495, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 05:52:46', '2021-09-19 05:52:46'),
(496, 1, 2, '127.0.0.1', 'admin.login', 'http://127.0.0.1:8000/admin/login', '2021-09-19 06:03:51', '2021-09-19 06:03:51'),
(497, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 06:22:04', '2021-09-19 06:22:04'),
(498, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 06:40:07', '2021-09-19 06:40:07'),
(499, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 06:58:10', '2021-09-19 06:58:10'),
(500, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 07:17:11', '2021-09-19 07:17:11'),
(501, 1, 2, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-09-19 07:35:11', '2021-09-19 07:35:11'),
(502, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-10-03 23:24:45', '2021-10-03 23:24:45'),
(503, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-10-03 23:24:48', '2021-10-03 23:24:48'),
(504, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://127.0.0.1:8000/admin/noticeboards', '2021-10-03 23:39:05', '2021-10-03 23:39:05'),
(505, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-03 23:39:07', '2021-10-03 23:39:07'),
(506, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-03 23:39:10', '2021-10-03 23:39:10'),
(507, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-03 23:39:12', '2021-10-03 23:39:12'),
(508, 1, 2, '127.0.0.1', 'admin.logout', 'http://127.0.0.1:8000/admin/logout', '2021-10-03 23:39:23', '2021-10-03 23:39:23'),
(509, 3, 4, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-10-03 23:39:59', '2021-10-03 23:39:59'),
(510, 3, 4, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-10-03 23:40:01', '2021-10-03 23:40:01'),
(511, 3, 4, '127.0.0.1', 'admin.noticeboards.index', 'http://127.0.0.1:8000/admin/noticeboards', '2021-10-03 23:40:03', '2021-10-03 23:40:03'),
(512, 3, 4, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-03 23:40:04', '2021-10-03 23:40:04'),
(513, 3, 4, '127.0.0.1', 'admin.noticeboards.edit', 'http://127.0.0.1:8000/admin/noticeboards/7/edit', '2021-10-03 23:40:07', '2021-10-03 23:40:07'),
(514, 3, 4, '127.0.0.1', 'admin.noticeboards.update', 'http://127.0.0.1:8000/admin/noticeboards/7', '2021-10-03 23:40:18', '2021-10-03 23:40:18'),
(515, 3, 4, '127.0.0.1', 'admin.screenlock.modal', 'http://127.0.0.1:8000/screenlock/modal', '2021-10-04 00:00:28', '2021-10-04 00:00:28'),
(516, 3, 4, '127.0.0.1', 'admin.screen.lock', 'http://127.0.0.1:8000/screenlock', '2021-10-04 00:06:12', '2021-10-04 00:06:12'),
(517, 3, 4, '127.0.0.1', 'admin.getlogin', 'http://127.0.0.1:8000/admin', '2021-10-04 00:06:13', '2021-10-04 00:06:13'),
(518, 3, 4, '127.0.0.1', 'admin.screen.lock', 'http://127.0.0.1:8000/screenlock', '2021-10-04 00:06:14', '2021-10-04 00:06:14'),
(519, 3, 4, '127.0.0.1', 'admin.login', 'http://127.0.0.1:8000/admin/login', '2021-10-04 00:06:22', '2021-10-04 00:06:22'),
(520, 3, 4, '127.0.0.1', 'admin.login', 'http://127.0.0.1:8000/admin/login', '2021-10-04 00:06:28', '2021-10-04 00:06:28'),
(521, 3, 4, '127.0.0.1', 'admin.noticeboards.edit', 'http://127.0.0.1:8000/admin/noticeboards/7/edit', '2021-10-04 00:06:28', '2021-10-04 00:06:28'),
(522, 3, 4, '127.0.0.1', 'admin.payrolls.index', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:06:33', '2021-10-04 00:06:33'),
(523, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:06:34', '2021-10-04 00:06:34'),
(524, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/1/edit', '2021-10-04 00:06:38', '2021-10-04 00:06:38'),
(525, 3, 4, '127.0.0.1', 'admin.payrolls.store', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:18:40', '2021-10-04 00:18:40'),
(526, 3, 4, '127.0.0.1', 'admin.payrolls.index', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:18:41', '2021-10-04 00:18:41'),
(527, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:18:42', '2021-10-04 00:18:42'),
(528, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/8/edit', '2021-10-04 00:18:44', '2021-10-04 00:18:44'),
(529, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:18:47', '2021-10-04 00:18:47'),
(530, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/8/edit', '2021-10-04 00:18:49', '2021-10-04 00:18:49'),
(531, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:18:51', '2021-10-04 00:18:51'),
(532, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/1/edit', '2021-10-04 00:18:54', '2021-10-04 00:18:54'),
(533, 3, 4, '127.0.0.1', 'admin.payrolls.store', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:19:40', '2021-10-04 00:19:40'),
(534, 3, 4, '127.0.0.1', 'admin.payrolls.index', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:19:41', '2021-10-04 00:19:41'),
(535, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:19:42', '2021-10-04 00:19:42'),
(536, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/8/edit', '2021-10-04 00:25:12', '2021-10-04 00:25:12'),
(537, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:25:15', '2021-10-04 00:25:15'),
(538, 3, 4, '127.0.0.1', 'admin.payrolls.index', 'http://127.0.0.1:8000/admin/payrolls', '2021-10-04 00:25:16', '2021-10-04 00:25:16'),
(539, 3, 4, '127.0.0.1', 'admin.ajax_payrolls', 'http://127.0.0.1:8000/admin/ajax_payrolls', '2021-10-04 00:25:17', '2021-10-04 00:25:17'),
(540, 3, 4, '127.0.0.1', 'admin.payrolls.edit', 'http://127.0.0.1:8000/admin/payrolls/1/edit', '2021-10-04 00:25:19', '2021-10-04 00:25:19'),
(541, 3, 4, '127.0.0.1', 'admin.expenses.index', 'http://127.0.0.1:8000/admin/expenses', '2021-10-04 00:35:46', '2021-10-04 00:35:46'),
(542, 3, 4, '127.0.0.1', 'admin.ajax_expenses', 'http://127.0.0.1:8000/admin/ajax_expenses', '2021-10-04 00:35:47', '2021-10-04 00:35:47'),
(543, 3, 4, '127.0.0.1', 'admin.expenses.edit', 'http://127.0.0.1:8000/admin/expenses/7/edit', '2021-10-04 00:35:50', '2021-10-04 00:35:50'),
(544, 3, 4, '127.0.0.1', 'admin.expenses.edit', 'http://127.0.0.1:8000/admin/expenses/7/edit', '2021-10-04 00:36:14', '2021-10-04 00:36:14'),
(545, 3, 4, '127.0.0.1', 'admin.expenses.edit', 'http://127.0.0.1:8000/admin/expenses/7/edit', '2021-10-04 00:52:02', '2021-10-04 00:52:02'),
(546, 3, 4, '127.0.0.1', 'admin.expenses.update', 'http://127.0.0.1:8000/admin/expenses/7', '2021-10-04 00:52:08', '2021-10-04 00:52:08'),
(547, 3, 4, '127.0.0.1', 'admin.logout', 'http://127.0.0.1:8000/admin/logout', '2021-10-04 00:56:09', '2021-10-04 00:56:09'),
(548, 3, 4, '127.0.0.1', 'admin.noticeboards.edit', 'http://127.0.0.1:8000/admin/noticeboards/7/edit', '2021-10-04 00:56:30', '2021-10-04 00:56:30'),
(549, 3, 4, '127.0.0.1', 'admin.logout', 'http://127.0.0.1:8000/admin/logout', '2021-10-04 00:56:34', '2021-10-04 00:56:34'),
(550, 1, 2, '127.0.0.1', 'admin.noticeboards.edit', 'http://127.0.0.1:8000/admin/noticeboards/7/edit', '2021-10-04 01:22:16', '2021-10-04 01:22:16'),
(551, 1, 2, '127.0.0.1', 'admin.noticeboards.index', 'http://127.0.0.1:8000/admin/noticeboards', '2021-10-04 01:22:25', '2021-10-04 01:22:25'),
(552, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-04 01:22:27', '2021-10-04 01:22:27'),
(553, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://127.0.0.1:8000/admin/attendances/create', '2021-10-04 01:24:51', '2021-10-04 01:24:51'),
(554, 1, 2, '127.0.0.1', 'admin.attendances.create', 'http://127.0.0.1:8000/admin/attendances/create', '2021-10-04 01:24:51', '2021-10-04 01:24:51'),
(555, 1, 2, '127.0.0.1', 'admin.ajax_notices', 'http://127.0.0.1:8000/admin/ajax_notices', '2021-10-04 01:24:55', '2021-10-04 01:24:55'),
(556, 1, 2, '127.0.0.1', 'admin.getlogin', 'http://127.0.0.1:8000/admin', '2021-10-04 01:27:24', '2021-10-04 01:27:24'),
(557, 1, 2, '127.0.0.1', 'admin.dashboard.index', 'http://127.0.0.1:8000/admin/dashboard', '2021-10-04 01:27:24', '2021-10-04 01:27:24'),
(558, 1, 2, '127.0.0.1', 'admin.attendance.ajax_load_calender', 'http://127.0.0.1:8000/admin/attendances/ajax_load_calender', '2021-10-04 01:27:26', '2021-10-04 01:27:26'),
(559, 1, 2, '127.0.0.1', 'admin.logout', 'http://127.0.0.1:8000/admin/logout', '2021-10-04 01:27:27', '2021-10-04 01:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_plan_id` int(10) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.png',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `currency_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `timezone` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '+00:00=29',
  `award_notification` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_notification` tinyint(1) NOT NULL DEFAULT 1,
  `leave_notification` tinyint(1) NOT NULL DEFAULT 1,
  `notice_notification` tinyint(1) NOT NULL DEFAULT 1,
  `payroll_notification` tinyint(1) NOT NULL DEFAULT 1,
  `expense_notification` tinyint(1) NOT NULL DEFAULT 1,
  `employee_add` tinyint(1) NOT NULL DEFAULT 1,
  `job_notification` tinyint(1) NOT NULL DEFAULT 1,
  `admin_add` tinyint(1) NOT NULL DEFAULT 1,
  `admin_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'darkblue',
  `front_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dark-blue',
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `active` tinyint(1) NOT NULL,
  `award_feature` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_feature` tinyint(1) NOT NULL DEFAULT 1,
  `leave_feature` tinyint(1) NOT NULL DEFAULT 1,
  `notice_feature` tinyint(1) NOT NULL DEFAULT 1,
  `payroll_feature` tinyint(1) NOT NULL DEFAULT 1,
  `expense_feature` tinyint(1) NOT NULL DEFAULT 1,
  `holidays_feature` tinyint(1) NOT NULL DEFAULT 1,
  `jobs_feature` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','license_expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `referral_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark_attendance` tinyint(1) NOT NULL DEFAULT 1,
  `office_start_time` time DEFAULT '00:00:00',
  `office_end_time` time DEFAULT '00:00:00',
  `attendance_setting_set` tinyint(1) NOT NULL DEFAULT 0,
  `late_mark_after` int(11) DEFAULT NULL,
  `billing_address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `license_expired` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `subscription_plan_id`, `package_type`, `email`, `name`, `logo`, `address`, `contact`, `currency`, `currency_symbol`, `timezone`, `award_notification`, `attendance_notification`, `leave_notification`, `notice_notification`, `payroll_notification`, `expense_notification`, `employee_add`, `job_notification`, `admin_add`, `admin_theme`, `front_theme`, `locale`, `active`, `award_feature`, `attendance_feature`, `leave_feature`, `notice_feature`, `payroll_feature`, `expense_feature`, `holidays_feature`, `jobs_feature`, `status`, `created_at`, `updated_at`, `deleted_at`, `country`, `referral_code`, `mark_attendance`, `office_start_time`, `office_end_time`, `attendance_setting_set`, `late_mark_after`, `billing_address`, `license_expired`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`) VALUES
(1, 'Optic Software Solutions', 1, 'monthly', 'divan@opticsoftwaresolutions.co.za', 'Divan Serfontein', '13234b6440c526d8ec3d9ff543ee36a1.png', '25 Spitfire Avenue', '+27834129305', 'ZAR', 'R', '=', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-07-13 16:17:50', '2021-07-13 16:17:50', NULL, 'South Africa', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL),
(3, 'Pharmadiv', 1, 'monthly', 'divan@pharmadiv.co.za', 'Divan Serfontein', 'c855420ca91c63db356ed13180e50b69.png', '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', '0834129305', 'ZAR', 'R', '+02:00=25', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-07-15 11:05:05', '2021-07-27 01:27:18', NULL, 'South Africa', NULL, 1, '05:30:00', '15:00:00', 1, 15, '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', 0, NULL, NULL, NULL, NULL, NULL),
(15, 'gftyhftgjugfcgdf', 1, 'monthly', 'as@gmail.com', 'gjgyujki', 'default.png', NULL, NULL, 'USD', '$', '+00:00=29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-10-04 04:24:00', '2021-10-04 04:24:00', NULL, '', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL),
(16, 'gftyhftgjugfcgdf', 1, 'monthly', 'as@gmail.com', 'gjgyujki', 'default.png', NULL, NULL, 'USD', '$', '+00:00=29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-10-04 04:25:23', '2021-10-04 04:25:23', NULL, '', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL),
(17, 'gftyhftgjugfcgdf', 1, 'monthly', 'as@gmail.com', 'gjgyujki', 'default.png', NULL, NULL, 'USD', '$', '+00:00=29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-10-04 04:29:21', '2021-10-04 04:29:21', NULL, '', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL),
(18, 'gftyhftgjugfcgdf', 1, 'monthly', 'as@gmail.com', 'gjgyujki', 'default.png', NULL, NULL, 'USD', '$', '+00:00=29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-10-04 04:30:10', '2021-10-04 04:30:10', NULL, '', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL),
(19, 'rahat', 1, 'monthly', 'as1@gmail.com', 'gjgyujki', 'default.png', NULL, NULL, 'USD', '$', '+00:00=29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-10-04 04:30:37', '2021-10-04 04:35:33', NULL, '', NULL, 1, '00:00:00', '00:00:00', 0, NULL, '', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE `contact_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Completed') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id_countries` int(3) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `iso_alpha2` varchar(2) DEFAULT NULL,
  `iso_alpha3` varchar(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_name` varchar(32) DEFAULT NULL,
  `currency_symbol` varchar(3) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id_countries`, `name`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `currency_code`, `currency_name`, `currency_symbol`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 'AFN', 'Afghani', '؋', 'AF.png'),
(2, 'Albania', 'AL', 'ALB', 8, 'ALL', 'Lek', 'Lek', 'AL.png'),
(3, 'Algeria', 'DZ', 'DZA', 12, 'DZD', 'Dinar', NULL, 'DZ.png'),
(4, 'American Samoa', 'AS', 'ASM', 16, 'USD', 'Dollar', '$', 'AS.png'),
(5, 'Andorra', 'AD', 'AND', 20, 'EUR', 'Euro', '€', 'AD.png'),
(6, 'Angola', 'AO', 'AGO', 24, 'AOA', 'Kwanza', 'Kz', 'AO.png'),
(7, 'Anguilla', 'AI', 'AIA', 660, 'XCD', 'Dollar', '$', 'AI.png'),
(8, 'Antarctica', 'AQ', 'ATA', 10, '', '', NULL, 'AQ.png'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 28, 'XCD', 'Dollar', '$', 'AG.png'),
(10, 'Argentina', 'AR', 'ARG', 32, 'ARS', 'Peso', '$', 'AR.png'),
(11, 'Armenia', 'AM', 'ARM', 51, 'AMD', 'Dram', NULL, 'AM.png'),
(12, 'Aruba', 'AW', 'ABW', 533, 'AWG', 'Guilder', 'ƒ', 'AW.png'),
(13, 'Australia', 'AU', 'AUS', 36, 'AUD', 'Dollar', '$', 'AU.png'),
(14, 'Austria', 'AT', 'AUT', 40, 'EUR', 'Euro', '€', 'AT.png'),
(15, 'Azerbaijan', 'AZ', 'AZE', 31, 'AZN', 'Manat', 'ман', 'AZ.png'),
(16, 'Bahamas', 'BS', 'BHS', 44, 'BSD', 'Dollar', '$', 'BS.png'),
(17, 'Bahrain', 'BH', 'BHR', 48, 'BHD', 'Dinar', NULL, 'BH.png'),
(18, 'Bangladesh', 'BD', 'BGD', 50, 'BDT', 'Taka', NULL, 'BD.png'),
(19, 'Barbados', 'BB', 'BRB', 52, 'BBD', 'Dollar', '$', 'BB.png'),
(20, 'Belarus', 'BY', 'BLR', 112, 'BYR', 'Ruble', 'p.', 'BY.png'),
(21, 'Belgium', 'BE', 'BEL', 56, 'EUR', 'Euro', '€', 'BE.png'),
(22, 'Belize', 'BZ', 'BLZ', 84, 'BZD', 'Dollar', 'BZ$', 'BZ.png'),
(23, 'Benin', 'BJ', 'BEN', 204, 'XOF', 'Franc', NULL, 'BJ.png'),
(24, 'Bermuda', 'BM', 'BMU', 60, 'BMD', 'Dollar', '$', 'BM.png'),
(25, 'Bhutan', 'BT', 'BTN', 64, 'BTN', 'Ngultrum', NULL, 'BT.png'),
(26, 'Bolivia', 'BO', 'BOL', 68, 'BOB', 'Boliviano', '$b', 'BO.png'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 'BAM', 'Marka', 'KM', 'BA.png'),
(28, 'Botswana', 'BW', 'BWA', 72, 'BWP', 'Pula', 'P', 'BW.png'),
(29, 'Bouvet Island', 'BV', 'BVT', 74, 'NOK', 'Krone', 'kr', 'BV.png'),
(30, 'Brazil', 'BR', 'BRA', 76, 'BRL', 'Real', 'R$', 'BR.png'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 'USD', 'Dollar', '$', 'IO.png'),
(32, 'British Virgin Islands', 'VG', 'VGB', 92, 'USD', 'Dollar', '$', 'VG.png'),
(33, 'Brunei', 'BN', 'BRN', 96, 'BND', 'Dollar', '$', 'BN.png'),
(34, 'Bulgaria', 'BG', 'BGR', 100, 'BGN', 'Lev', 'лв', 'BG.png'),
(35, 'Burkina Faso', 'BF', 'BFA', 854, 'XOF', 'Franc', NULL, 'BF.png'),
(36, 'Burundi', 'BI', 'BDI', 108, 'BIF', 'Franc', NULL, 'BI.png'),
(37, 'Cambodia', 'KH', 'KHM', 116, 'KHR', 'Riels', '៛', 'KH.png'),
(38, 'Cameroon', 'CM', 'CMR', 120, 'XAF', 'Franc', 'FCF', 'CM.png'),
(39, 'Canada', 'CA', 'CAN', 124, 'CAD', 'Dollar', '$', 'CA.png'),
(40, 'Cape Verde', 'CV', 'CPV', 132, 'CVE', 'Escudo', NULL, 'CV.png'),
(41, 'Cayman Islands', 'KY', 'CYM', 136, 'KYD', 'Dollar', '$', 'KY.png'),
(42, 'Central African Republic', 'CF', 'CAF', 140, 'XAF', 'Franc', 'FCF', 'CF.png'),
(43, 'Chad', 'TD', 'TCD', 148, 'XAF', 'Franc', NULL, 'TD.png'),
(44, 'Chile', 'CL', 'CHL', 152, 'CLP', 'Peso', NULL, 'CL.png'),
(45, 'China', 'CN', 'CHN', 156, 'CNY', 'Yuan Renminbi', '¥', 'CN.png'),
(46, 'Christmas Island', 'CX', 'CXR', 162, 'AUD', 'Dollar', '$', 'CX.png'),
(47, 'Cocos Islands', 'CC', 'CCK', 166, 'AUD', 'Dollar', '$', 'CC.png'),
(48, 'Colombia', 'CO', 'COL', 170, 'COP', 'Peso', '$', 'CO.png'),
(49, 'Comoros', 'KM', 'COM', 174, 'KMF', 'Franc', NULL, 'KM.png'),
(50, 'Cook Islands', 'CK', 'COK', 184, 'NZD', 'Dollar', '$', 'CK.png'),
(51, 'Costa Rica', 'CR', 'CRI', 188, 'CRC', 'Colon', '₡', 'CR.png'),
(52, 'Croatia', 'HR', 'HRV', 191, 'HRK', 'Kuna', 'kn', 'HR.png'),
(53, 'Cuba', 'CU', 'CUB', 192, 'CUP', 'Peso', '₱', 'CU.png'),
(54, 'Cyprus', 'CY', 'CYP', 196, 'CYP', 'Pound', NULL, 'CY.png'),
(55, 'Czech Republic', 'CZ', 'CZE', 203, 'CZK', 'Koruna', 'Kč', 'CZ.png'),
(56, 'Democratic Republic of the Congo', 'CD', 'COD', 180, 'CDF', 'Franc', NULL, 'CD.png'),
(57, 'Denmark', 'DK', 'DNK', 208, 'DKK', 'Krone', 'kr', 'DK.png'),
(58, 'Djibouti', 'DJ', 'DJI', 262, 'DJF', 'Franc', NULL, 'DJ.png'),
(59, 'Dominica', 'DM', 'DMA', 212, 'XCD', 'Dollar', '$', 'DM.png'),
(60, 'Dominican Republic', 'DO', 'DOM', 214, 'DOP', 'Peso', 'RD$', 'DO.png'),
(61, 'East Timor', 'TL', 'TLS', 626, 'USD', 'Dollar', '$', 'TL.png'),
(62, 'Ecuador', 'EC', 'ECU', 218, 'USD', 'Dollar', '$', 'EC.png'),
(63, 'Egypt', 'EG', 'EGY', 818, 'EGP', 'Pound', '£', 'EG.png'),
(64, 'El Salvador', 'SV', 'SLV', 222, 'SVC', 'Colone', '$', 'SV.png'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 'XAF', 'Franc', 'FCF', 'GQ.png'),
(66, 'Eritrea', 'ER', 'ERI', 232, 'ERN', 'Nakfa', 'Nfk', 'ER.png'),
(67, 'Estonia', 'EE', 'EST', 233, 'EEK', 'Kroon', 'kr', 'EE.png'),
(68, 'Ethiopia', 'ET', 'ETH', 231, 'ETB', 'Birr', NULL, 'ET.png'),
(69, 'Falkland Islands', 'FK', 'FLK', 238, 'FKP', 'Pound', '£', 'FK.png'),
(70, 'Faroe Islands', 'FO', 'FRO', 234, 'DKK', 'Krone', 'kr', 'FO.png'),
(71, 'Fiji', 'FJ', 'FJI', 242, 'FJD', 'Dollar', '$', 'FJ.png'),
(72, 'Finland', 'FI', 'FIN', 246, 'EUR', 'Euro', '€', 'FI.png'),
(73, 'France', 'FR', 'FRA', 250, 'EUR', 'Euro', '€', 'FR.png'),
(74, 'French Guiana', 'GF', 'GUF', 254, 'EUR', 'Euro', '€', 'GF.png'),
(75, 'French Polynesia', 'PF', 'PYF', 258, 'XPF', 'Franc', NULL, 'PF.png'),
(76, 'French Southern Territories', 'TF', 'ATF', 260, 'EUR', 'Euro  ', '€', 'TF.png'),
(77, 'Gabon', 'GA', 'GAB', 266, 'XAF', 'Franc', 'FCF', 'GA.png'),
(78, 'Gambia', 'GM', 'GMB', 270, 'GMD', 'Dalasi', 'D', 'GM.png'),
(79, 'Georgia', 'GE', 'GEO', 268, 'GEL', 'Lari', NULL, 'GE.png'),
(80, 'Germany', 'DE', 'DEU', 276, 'EUR', 'Euro', '€', 'DE.png'),
(81, 'Ghana', 'GH', 'GHA', 288, 'GHC', 'Cedi', '¢', 'GH.png'),
(82, 'Gibraltar', 'GI', 'GIB', 292, 'GIP', 'Pound', '£', 'GI.png'),
(83, 'Greece', 'GR', 'GRC', 300, 'EUR', 'Euro', '€', 'GR.png'),
(84, 'Greenland', 'GL', 'GRL', 304, 'DKK', 'Krone', 'kr', 'GL.png'),
(85, 'Grenada', 'GD', 'GRD', 308, 'XCD', 'Dollar', '$', 'GD.png'),
(86, 'Guadeloupe', 'GP', 'GLP', 312, 'EUR', 'Euro', '€', 'GP.png'),
(87, 'Guam', 'GU', 'GUM', 316, 'USD', 'Dollar', '$', 'GU.png'),
(88, 'Guatemala', 'GT', 'GTM', 320, 'GTQ', 'Quetzal', 'Q', 'GT.png'),
(89, 'Guinea', 'GN', 'GIN', 324, 'GNF', 'Franc', NULL, 'GN.png'),
(90, 'Guinea-Bissau', 'GW', 'GNB', 624, 'XOF', 'Franc', NULL, 'GW.png'),
(91, 'Guyana', 'GY', 'GUY', 328, 'GYD', 'Dollar', '$', 'GY.png'),
(92, 'Haiti', 'HT', 'HTI', 332, 'HTG', 'Gourde', 'G', 'HT.png'),
(93, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, 'AUD', 'Dollar', '$', 'HM.png'),
(94, 'Honduras', 'HN', 'HND', 340, 'HNL', 'Lempira', 'L', 'HN.png'),
(95, 'Hong Kong', 'HK', 'HKG', 344, 'HKD', 'Dollar', '$', 'HK.png'),
(96, 'Hungary', 'HU', 'HUN', 348, 'HUF', 'Forint', 'Ft', 'HU.png'),
(97, 'Iceland', 'IS', 'ISL', 352, 'ISK', 'Krona', 'kr', 'IS.png'),
(98, 'India', 'IN', 'IND', 356, 'INR', 'Rupee', '₹', 'IN.png'),
(99, 'Indonesia', 'ID', 'IDN', 360, 'IDR', 'Rupiah', 'Rp', 'ID.png'),
(100, 'Iran', 'IR', 'IRN', 364, 'IRR', 'Rial', '﷼', 'IR.png'),
(101, 'Iraq', 'IQ', 'IRQ', 368, 'IQD', 'Dinar', NULL, 'IQ.png'),
(102, 'Ireland', 'IE', 'IRL', 372, 'EUR', 'Euro', '€', 'IE.png'),
(103, 'Israel', 'IL', 'ISR', 376, 'ILS', 'Shekel', '₪', 'IL.png'),
(104, 'Italy', 'IT', 'ITA', 380, 'EUR', 'Euro', '€', 'IT.png'),
(105, 'Ivory Coast', 'CI', 'CIV', 384, 'XOF', 'Franc', NULL, 'CI.png'),
(106, 'Jamaica', 'JM', 'JAM', 388, 'JMD', 'Dollar', '$', 'JM.png'),
(107, 'Japan', 'JP', 'JPN', 392, 'JPY', 'Yen', '¥', 'JP.png'),
(108, 'Jordan', 'JO', 'JOR', 400, 'JOD', 'Dinar', NULL, 'JO.png'),
(109, 'Kazakhstan', 'KZ', 'KAZ', 398, 'KZT', 'Tenge', 'лв', 'KZ.png'),
(110, 'Kenya', 'KE', 'KEN', 404, 'KES', 'Shilling', NULL, 'KE.png'),
(111, 'Kiribati', 'KI', 'KIR', 296, 'AUD', 'Dollar', '$', 'KI.png'),
(112, 'Kuwait', 'KW', 'KWT', 414, 'KWD', 'Dinar', NULL, 'KW.png'),
(113, 'Kyrgyzstan', 'KG', 'KGZ', 417, 'KGS', 'Som', 'лв', 'KG.png'),
(114, 'Laos', 'LA', 'LAO', 418, 'LAK', 'Kip', '₭', 'LA.png'),
(115, 'Latvia', 'LV', 'LVA', 428, 'LVL', 'Lat', 'Ls', 'LV.png'),
(116, 'Lebanon', 'LB', 'LBN', 422, 'LBP', 'Pound', '£', 'LB.png'),
(117, 'Lesotho', 'LS', 'LSO', 426, 'LSL', 'Loti', 'L', 'LS.png'),
(118, 'Liberia', 'LR', 'LBR', 430, 'LRD', 'Dollar', '$', 'LR.png'),
(119, 'Libya', 'LY', 'LBY', 434, 'LYD', 'Dinar', NULL, 'LY.png'),
(120, 'Liechtenstein', 'LI', 'LIE', 438, 'CHF', 'Franc', 'CHF', 'LI.png'),
(121, 'Lithuania', 'LT', 'LTU', 440, 'LTL', 'Litas', 'Lt', 'LT.png'),
(122, 'Luxembourg', 'LU', 'LUX', 442, 'EUR', 'Euro', '€', 'LU.png'),
(123, 'Macao', 'MO', 'MAC', 446, 'MOP', 'Pataca', 'MOP', 'MO.png'),
(124, 'Macedonia', 'MK', 'MKD', 807, 'MKD', 'Denar', 'ден', 'MK.png'),
(125, 'Madagascar', 'MG', 'MDG', 450, 'MGA', 'Ariary', NULL, 'MG.png'),
(126, 'Malawi', 'MW', 'MWI', 454, 'MWK', 'Kwacha', 'MK', 'MW.png'),
(127, 'Malaysia', 'MY', 'MYS', 458, 'MYR', 'Ringgit', 'RM', 'MY.png'),
(128, 'Maldives', 'MV', 'MDV', 462, 'MVR', 'Rufiyaa', 'Rf', 'MV.png'),
(129, 'Mali', 'ML', 'MLI', 466, 'XOF', 'Franc', NULL, 'ML.png'),
(130, 'Malta', 'MT', 'MLT', 470, 'MTL', 'Lira', NULL, 'MT.png'),
(131, 'Marshall Islands', 'MH', 'MHL', 584, 'USD', 'Dollar', '$', 'MH.png'),
(132, 'Martinique', 'MQ', 'MTQ', 474, 'EUR', 'Euro', '€', 'MQ.png'),
(133, 'Mauritania', 'MR', 'MRT', 478, 'MRO', 'Ouguiya', 'UM', 'MR.png'),
(134, 'Mauritius', 'MU', 'MUS', 480, 'MUR', 'Rupee', '₨', 'MU.png'),
(135, 'Mayotte', 'YT', 'MYT', 175, 'EUR', 'Euro', '€', 'YT.png'),
(136, 'Mexico', 'MX', 'MEX', 484, 'MXN', 'Peso', '$', 'MX.png'),
(137, 'Micronesia', 'FM', 'FSM', 583, 'USD', 'Dollar', '$', 'FM.png'),
(138, 'Moldova', 'MD', 'MDA', 498, 'MDL', 'Leu', NULL, 'MD.png'),
(139, 'Monaco', 'MC', 'MCO', 492, 'EUR', 'Euro', '€', 'MC.png'),
(140, 'Mongolia', 'MN', 'MNG', 496, 'MNT', 'Tugrik', '₮', 'MN.png'),
(141, 'Montserrat', 'MS', 'MSR', 500, 'XCD', 'Dollar', '$', 'MS.png'),
(142, 'Morocco', 'MA', 'MAR', 504, 'MAD', 'Dirham', NULL, 'MA.png'),
(143, 'Mozambique', 'MZ', 'MOZ', 508, 'MZN', 'Meticail', 'MT', 'MZ.png'),
(144, 'Myanmar', 'MM', 'MMR', 104, 'MMK', 'Kyat', 'K', 'MM.png'),
(145, 'Namibia', 'NA', 'NAM', 516, 'NAD', 'Dollar', '$', 'NA.png'),
(146, 'Nauru', 'NR', 'NRU', 520, 'AUD', 'Dollar', '$', 'NR.png'),
(147, 'Nepal', 'NP', 'NPL', 524, 'NPR', 'Rupee', '₨', 'NP.png'),
(148, 'Netherlands', 'NL', 'NLD', 528, 'EUR', 'Euro', '€', 'NL.png'),
(149, 'Netherlands Antilles', 'AN', 'ANT', 530, 'ANG', 'Guilder', 'ƒ', 'AN.png'),
(150, 'New Caledonia', 'NC', 'NCL', 540, 'XPF', 'Franc', NULL, 'NC.png'),
(151, 'New Zealand', 'NZ', 'NZL', 554, 'NZD', 'Dollar', '$', 'NZ.png'),
(152, 'Nicaragua', 'NI', 'NIC', 558, 'NIO', 'Cordoba', 'C$', 'NI.png'),
(153, 'Niger', 'NE', 'NER', 562, 'XOF', 'Franc', NULL, 'NE.png'),
(154, 'Nigeria', 'NG', 'NGA', 566, 'NGN', 'Naira', '₦', 'NG.png'),
(155, 'Niue', 'NU', 'NIU', 570, 'NZD', 'Dollar', '$', 'NU.png'),
(156, 'Norfolk Island', 'NF', 'NFK', 574, 'AUD', 'Dollar', '$', 'NF.png'),
(157, 'North Korea', 'KP', 'PRK', 408, 'KPW', 'Won', '₩', 'KP.png'),
(158, 'Northern Mariana Islands', 'MP', 'MNP', 580, 'USD', 'Dollar', '$', 'MP.png'),
(159, 'Norway', 'NO', 'NOR', 578, 'NOK', 'Krone', 'kr', 'NO.png'),
(160, 'Oman', 'OM', 'OMN', 512, 'OMR', 'Rial', '﷼', 'OM.png'),
(161, 'Pakistan', 'PK', 'PAK', 586, 'PKR', 'Rupee', '₨', 'PK.png'),
(162, 'Palau', 'PW', 'PLW', 585, 'USD', 'Dollar', '$', 'PW.png'),
(163, 'Palestinian Territory', 'PS', 'PSE', 275, 'ILS', 'Shekel', '₪', 'PS.png'),
(164, 'Panama', 'PA', 'PAN', 591, 'PAB', 'Balboa', 'B/.', 'PA.png'),
(165, 'Papua New Guinea', 'PG', 'PNG', 598, 'PGK', 'Kina', NULL, 'PG.png'),
(166, 'Paraguay', 'PY', 'PRY', 600, 'PYG', 'Guarani', 'Gs', 'PY.png'),
(167, 'Peru', 'PE', 'PER', 604, 'PEN', 'Sol', 'S/.', 'PE.png'),
(168, 'Philippines', 'PH', 'PHL', 608, 'PHP', 'Peso', 'Php', 'PH.png'),
(169, 'Pitcairn', 'PN', 'PCN', 612, 'NZD', 'Dollar', '$', 'PN.png'),
(170, 'Poland', 'PL', 'POL', 616, 'PLN', 'Zloty', 'zł', 'PL.png'),
(171, 'Portugal', 'PT', 'PRT', 620, 'EUR', 'Euro', '€', 'PT.png'),
(172, 'Puerto Rico', 'PR', 'PRI', 630, 'USD', 'Dollar', '$', 'PR.png'),
(173, 'Qatar', 'QA', 'QAT', 634, 'QAR', 'Rial', '﷼', 'QA.png'),
(174, 'Republic of the Congo', 'CG', 'COG', 178, 'XAF', 'Franc', 'FCF', 'CG.png'),
(175, 'Reunion', 'RE', 'REU', 638, 'EUR', 'Euro', '€', 'RE.png'),
(176, 'Romania', 'RO', 'ROU', 642, 'RON', 'Leu', 'lei', 'RO.png'),
(177, 'Russia', 'RU', 'RUS', 643, 'RUB', 'Ruble', 'руб', 'RU.png'),
(178, 'Rwanda', 'RW', 'RWA', 646, 'RWF', 'Franc', NULL, 'RW.png'),
(179, 'Saint Helena', 'SH', 'SHN', 654, 'SHP', 'Pound', '£', 'SH.png'),
(180, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 'XCD', 'Dollar', '$', 'KN.png'),
(181, 'Saint Lucia', 'LC', 'LCA', 662, 'XCD', 'Dollar', '$', 'LC.png'),
(182, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'EUR', 'Euro', '€', 'PM.png'),
(183, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 'XCD', 'Dollar', '$', 'VC.png'),
(184, 'Samoa', 'WS', 'WSM', 882, 'WST', 'Tala', 'WS$', 'WS.png'),
(185, 'San Marino', 'SM', 'SMR', 674, 'EUR', 'Euro', '€', 'SM.png'),
(186, 'Sao Tome and Principe', 'ST', 'STP', 678, 'STD', 'Dobra', 'Db', 'ST.png'),
(187, 'Saudi Arabia', 'SA', 'SAU', 682, 'SAR', 'Rial', '﷼', 'SA.png'),
(188, 'Senegal', 'SN', 'SEN', 686, 'XOF', 'Franc', NULL, 'SN.png'),
(189, 'Serbia and Montenegro', 'CS', 'SCG', 891, 'RSD', 'Dinar', 'Дин', 'CS.png'),
(190, 'Seychelles', 'SC', 'SYC', 690, 'SCR', 'Rupee', '₨', 'SC.png'),
(191, 'Sierra Leone', 'SL', 'SLE', 694, 'SLL', 'Leone', 'Le', 'SL.png'),
(192, 'Singapore', 'SG', 'SGP', 702, 'SGD', 'Dollar', '$', 'SG.png'),
(193, 'Slovakia', 'SK', 'SVK', 703, 'SKK', 'Koruna', 'Sk', 'SK.png'),
(194, 'Slovenia', 'SI', 'SVN', 705, 'EUR', 'Euro', '€', 'SI.png'),
(195, 'Solomon Islands', 'SB', 'SLB', 90, 'SBD', 'Dollar', '$', 'SB.png'),
(196, 'Somalia', 'SO', 'SOM', 706, 'SOS', 'Shilling', 'S', 'SO.png'),
(197, 'South Africa', 'ZA', 'ZAF', 710, 'ZAR', 'Rand', 'R', 'ZA.png'),
(198, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 'GBP', 'Pound', '£', 'GS.png'),
(199, 'South Korea', 'KR', 'KOR', 410, 'KRW', 'Won', '₩', 'KR.png'),
(200, 'Spain', 'ES', 'ESP', 724, 'EUR', 'Euro', '€', 'ES.png'),
(201, 'Sri Lanka', 'LK', 'LKA', 144, 'LKR', 'Rupee', '₨', 'LK.png'),
(202, 'Sudan', 'SD', 'SDN', 736, 'SDD', 'Dinar', NULL, 'SD.png'),
(203, 'Suriname', 'SR', 'SUR', 740, 'SRD', 'Dollar', '$', 'SR.png'),
(204, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'NOK', 'Krone', 'kr', 'SJ.png'),
(205, 'Swaziland', 'SZ', 'SWZ', 748, 'SZL', 'Lilangeni', NULL, 'SZ.png'),
(206, 'Sweden', 'SE', 'SWE', 752, 'SEK', 'Krona', 'kr', 'SE.png'),
(207, 'Switzerland', 'CH', 'CHE', 756, 'CHF', 'Franc', 'CHF', 'CH.png'),
(208, 'Syria', 'SY', 'SYR', 760, 'SYP', 'Pound', '£', 'SY.png'),
(209, 'Taiwan', 'TW', 'TWN', 158, 'TWD', 'Dollar', 'NT$', 'TW.png'),
(210, 'Tajikistan', 'TJ', 'TJK', 762, 'TJS', 'Somoni', NULL, 'TJ.png'),
(211, 'Tanzania', 'TZ', 'TZA', 834, 'TZS', 'Shilling', NULL, 'TZ.png'),
(212, 'Thailand', 'TH', 'THA', 764, 'THB', 'Baht', '฿', 'TH.png'),
(213, 'Togo', 'TG', 'TGO', 768, 'XOF', 'Franc', NULL, 'TG.png'),
(214, 'Tokelau', 'TK', 'TKL', 772, 'NZD', 'Dollar', '$', 'TK.png'),
(215, 'Tonga', 'TO', 'TON', 776, 'TOP', 'Pa\"anga', 'T$', 'TO.png'),
(216, 'Trinidad and Tobago', 'TT', 'TTO', 780, 'TTD', 'Dollar', 'TT$', 'TT.png'),
(217, 'Tunisia', 'TN', 'TUN', 788, 'TND', 'Dinar', NULL, 'TN.png'),
(218, 'Turkey', 'TR', 'TUR', 792, 'TRY', 'Lira', 'YTL', 'TR.png'),
(219, 'Turkmenistan', 'TM', 'TKM', 795, 'TMM', 'Manat', 'm', 'TM.png'),
(220, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 'USD', 'Dollar', '$', 'TC.png'),
(221, 'Tuvalu', 'TV', 'TUV', 798, 'AUD', 'Dollar', '$', 'TV.png'),
(222, 'U.S. Virgin Islands', 'VI', 'VIR', 850, 'USD', 'Dollar', '$', 'VI.png'),
(223, 'Uganda', 'UG', 'UGA', 800, 'UGX', 'Shilling', NULL, 'UG.png'),
(224, 'Ukraine', 'UA', 'UKR', 804, 'UAH', 'Hryvnia', '₴', 'UA.png'),
(225, 'United Arab Emirates', 'AE', 'ARE', 784, 'AED', 'Dirham', NULL, 'AE.png'),
(226, 'United Kingdom', 'GB', 'GBR', 826, 'GBP', 'Pound', '£', 'GB.png'),
(227, 'United States', 'US', 'USA', 840, 'USD', 'Dollar', '$', 'US.png'),
(228, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, 'USD', 'Dollar ', '$', 'UM.png'),
(229, 'Uruguay', 'UY', 'URY', 858, 'UYU', 'Peso', '$U', 'UY.png'),
(230, 'Uzbekistan', 'UZ', 'UZB', 860, 'UZS', 'Som', 'лв', 'UZ.png'),
(231, 'Vanuatu', 'VU', 'VUT', 548, 'VUV', 'Vatu', 'Vt', 'VU.png'),
(232, 'Vatican', 'VA', 'VAT', 336, 'EUR', 'Euro', '€', 'VA.png'),
(233, 'Venezuela', 'VE', 'VEN', 862, 'VEF', 'Bolivar', 'Bs', 'VE.png'),
(234, 'Vietnam', 'VN', 'VNM', 704, 'VND', 'Dong', '₫', 'VN.png'),
(235, 'Wallis and Futuna', 'WF', 'WLF', 876, 'XPF', 'Franc', NULL, 'WF.png'),
(236, 'Western Sahara', 'EH', 'ESH', 732, 'MAD', 'Dirham', NULL, 'EH.png'),
(237, 'Yemen', 'YE', 'YEM', 887, 'YER', 'Rial', '﷼', 'YE.png'),
(238, 'Zambia', 'ZM', 'ZMB', 894, 'ZMK', 'Kwacha', 'ZK', 'ZM.png'),
(239, 'Zimbabwe', 'ZW', 'ZWE', 716, 'ZWD', 'Dollar', 'Z$', 'ZW.png');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Management', '2021-07-13 16:47:41', '2021-07-13 16:47:41'),
(2, 3, 'Web Developers', '2021-07-15 11:06:45', '2021-07-15 11:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `department_manager`
--

CREATE TABLE `department_manager` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `manager_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `department_id`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 'CEO', '2021-07-13 16:47:41', '2021-07-13 16:47:41'),
(2, 2, 'Managers', '2021-07-15 11:06:45', '2021-07-15 11:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_id`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'INVOICE_ONE_DAY_LEFT_NOTICE', '1 Day left for License Expired', 'Hi,<br/>\n                            <br/>\n                            \n                            Only 1 day is left for your license to get expired.\n                            Pay the invoice to continue using our services.<br/>\n                            <br/>\n                            An invoice is pending in your on HRM account. Details are as follows:<br/>\n                            <b>Product:</b> ##PRODUCT##<br/>\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\n                            <b>Amount:</b> ##AMOUNT##<br/>\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\n                            <br/>\n                            <br/>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(2, 'LICENSE_EXPIRED', 'License Expired', 'Hi,<br/>\n                            <br/>\n                            Your HRM license is expired due to non-payment of invoice. To pay now go to you account and pay. Details are as follows:<br/>\n                            <br/>\n                            <b>Product:</b> ##PRODUCT##<br/>\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\n                            <b>Amount:</b> ##AMOUNT##<br/>\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\n                            <br/>\n                            <br/><br/>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(3, 'NEW_INVOICE_GENERATED', 'New invoice has been generated', 'Hi,<br/>\n                            <br/>\n                            \n                            Invoice has been generated<br/>\n                            <br/>\n                            Details are as follows:<br/>\n                            <br>\n                            <b>Product:</b> ##PRODUCT##<br/>\n                            <b>Invoice Number:</b> ##INVOICE_NUMBER##<br/>\n                            <b>Amount:</b> ##AMOUNT##<br/>\n                            <b>Date Generated:</b> ##DATE_GENERATED##<br/>\n                            <b>Due Date:</b> ##DUE_DATE##<br/>\n                            <br/>\n                            <br/>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(4, 'NEW_ADMIN', 'New admin added', '\n		 	Hi!\n\n		    <b>##NAME## </b><br> Your account is created successfully on ##COMPANY_NAME##<br /><br/>\n		    <p>Login Details are Below</p>\n\n		    <p><strong>Email</strong>:  ##EMAIL##</p>\n		    <p><strong>Password</strong>: ##PASSWORD##</p>\n		    <br />\n		    <br />\n   		 <hr>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(5, 'NEW_ADMIN_EMAIL_VERIFICATION', 'Email Verification - hrm.com', '\n		 	Hi!\n		   <b>##NAME## </b><br><br>\n		      Please Verify your Email.Click the below link or copy paste on browser to verify your email<br>\n		    ##VERIFY_LINK##<br/>\n		    <br />\n   		 <hr>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(6, 'ATTENDANCE_MARKED', 'Attendance Marked', 'Hi\n\n		<b>##NAME##</b><br /><br/>\n    Your attendance dated <strong>##DATE##</strong>  has been marked.\n    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(7, 'AWARD', 'Award', 'Hi\n		<b>##NAME##</b><br /><br/>\n   You have been awarded with <strong>##AWARD##</strong>.\n    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(8, 'EMPLOYEE_ADD', 'Login Credentials', 'Hi\n		<b>##NAME## </b><br> You account is created successfully on ##COMPANY_NAME##<br /><br/>\n		    <p>Login Details are Below</p>\n		    <strong>Email</strong>:  ##EMAIL##\n		    <strong>Password</strong>: ##PASSWORD##\n\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(9, 'EXPENSE_APPROVAL', 'Expense Status', 'Hi\n		<br /><br/>\n        Your expense is ##STATUS## ON ##DATE##\n    	<br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(10, 'LEAVE_APPROVAL', 'Leave Status', 'Hi\n		<br /><br/>\n        	Your leave request of date <strong>##DATE##</strong> has been <strong>##STATUS##</strong>\n    	<br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(11, 'NEW_COMPANY_REQUEST_TO_ADMIN', 'Company Request', 'Hi\n			    <br>\n			    <br>\n			    Your company  <b>##COMPANY_NAME##</b> is registered with ##STATUS## status.Please wait for the Administator approval before you login\n			    <br>\n				', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(12, 'NEW_COMPANY_NOTIFICATION_SUPERADMIN', 'New company request', 'Hi\n		    <br>\n		    <br>\n		       <b>##COMPANY_NAME##</b> is registered with ##STATUS## status.Go Admin panel see the details and approve it\n		    <br>\n			', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(13, 'NEW_NOTICE', 'New Notice published', 'Hi!\n\n    <b> ##NAME## </b>\n    	<br /><br/>\n		    New Notice Published.Click ##LINK## to Visit the dashboard\n	    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(14, 'NEW_PAYSLIP', 'Payslip generated', 'Hi!\n\n		    <b>##NAME## </b><br /><br/>\n		    Your payslip generated for the month <strong>##MONTH_YEAR## <strong>\n\n		    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(15, 'ADMIN_RESET_PASSWORD', 'Reset Password', 'Hi!\n\n		 <b>##NAME## </b>\n    	<br /><br/>\n	   			 To reset your password, complete this form: ##CODE_LINK##<br/>\n\n	    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(16, 'FRONT_RESET_PASSWORD', 'Reset Password', 'Hi!\n\n		 <b>##NAME## </b>\n    	<br /><br/>\n	   			 To reset your password, complete this form: ##CODE_LINK##.<br/>\n\n	    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(17, 'RESET_PASSWORD_SUCCESS', 'Reset Password Success', 'Hi!\n\n		 <b>##NAME## </b>\n    	<br /><br/>\n	   			Your password is successfully reset.\n\n	    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(18, 'CHANGE_PASSWORD_EMPLOYEE', 'Password Reset', 'Hi!\n\n		 <b>##NAME## </b>\n    	<br /><br/>\n	   			Your password is successfully reset.\n\n	    <br /><br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(19, 'EXPENSE_CLAIM', 'Expense Claim request', 'Hi!\n\n		<b>##NAME##</b> your expense claim is submitted<br /><br/>\n\n		    <p><b>Item Name:</b>##ITEM_NAME##</p>\n		    <p><b>Purchase From:</b>##PURCHASE_FROM##</p>\n		    <p><b>Purchase Date:</b>##PURCHASE_DATE##</p>\n		    <p><b>Purchase Price:</b>  ##PRICE##</p>\n		    <br />\n		    <br />\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(20, 'JOB_APPLICATION_REQUEST', 'New job application submitted', 'Hi!\n\n		  <b>##NAME##</b> has submitted the job application<br /><br/>\n\n    <p><b>Position:</b>##POSITION##</p>\n    <p><b>Name:</b>    ##NAME##</p>\n    <p><b>Email:</b>   ##EMAIL##</p>\n    <p><b>Phone:</b>  ##PHONE##</p>\n    <p><b>Cover Letter:</b> ##COVER_LETTER##</p>\n\n    <br />\n    	Click resume  to view resume: ##LINK##</a>\n    <br />\n    <br />\n\n		', '2021-07-13 06:19:25', '2021-07-13 06:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `employeeID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `designation` int(10) UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'default.jpg',
  `local_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `annual_leave` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `reset_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employeeID`, `company_id`, `full_name`, `email`, `password`, `gender`, `father_name`, `mobile_number`, `date_of_birth`, `designation`, `joining_date`, `profile_image`, `local_address`, `permanent_address`, `annual_leave`, `status`, `last_login`, `remember_token`, `exit_date`, `reset_code`, `created_at`, `updated_at`) VALUES
(1, '1001', 1, 'Divan Serfontein', 'divanserfontein@gmail.com', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', 'male', 'Lukas Serfontein', '0834129305', '1995-08-07', 1, '2021-07-13', 'e00c78a32c3d6f2a42ab18dbbfe807b6.jpg', '25 Spitfire Avenue', '25 Spitfire Avenue', 0, 'active', NULL, NULL, NULL, NULL, '2021-07-13 16:51:47', '2021-07-13 16:51:47'),
(2, '1001', 3, 'Divan Serfontein', 'info@pharmadiv.co.za', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', 'male', 'Lukas Serfontein', '0834129305', '1995-08-07', 2, '2021-01-01', 'e2008d79dd8302a935de024f343d2aa2.jpg', '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', 2, 'active', NULL, NULL, NULL, NULL, '2021-07-15 11:10:00', '2021-07-21 10:26:27'),
(24, '10014', 3, 'sikder', 'mohsin12@gmail.com', '$2y$10$Aa1bKVqUF5zuPGLdYHu66uGQZPl7qyEsIz3lHyZOnGMQPxLOdcu9m', 'male', 'solaiman sikder', '4123546358', '1996-08-07', NULL, '2020-08-07', 'null', 'saver', 'urfi', 0, 'active', NULL, NULL, NULL, NULL, '2021-09-06 01:16:18', '2021-09-06 22:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `bill` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `item_name`, `slug`, `purchase_date`, `purchase_from`, `price`, `bill`, `created_at`, `updated_at`, `company_id`, `employee_id`, `status`) VALUES
(7, 'rahat', 'mohsin', '2021-09-20', 'yu7gikol8', 1, NULL, '2021-09-19 04:57:00', '2021-10-04 00:53:10', 3, 2, 'pending'),
(8, 'Mohsin', 'mohsin-1', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-19 04:57:21', '2021-09-19 04:57:21', 3, 2, 'approved'),
(9, 'Mohsin', 'mohsin-2', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-19 04:57:49', '2021-09-19 04:57:49', 3, 2, 'approved'),
(10, 'Mohsin', 'mohsin-3', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-20 05:42:10', '2021-09-20 05:42:10', 1, 2, 'approved'),
(11, 'Mohsin', 'mohsin-4', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-20 05:55:55', '2021-09-20 05:55:55', 1, 2, 'approved'),
(12, 'Mohsin', 'mohsin-5', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-20 05:58:30', '2021-09-20 05:58:30', 1, 2, 'approved'),
(13, 'Mohsin', 'mohsin-6', '2021-09-13', 'wr4rft4e', 12123, NULL, '2021-09-20 05:59:58', '2021-09-20 05:59:58', 1, 2, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `failed_records`
--

CREATE TABLE `failed_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `fail_reason` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8_unicode_ci NOT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `title`, `content_text`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, 'fdghyugkiuloi', 'esrtfgd5yt6uyhjy7iioutrertrwerwrrwe', 1, '2021-10-04 01:58:50', '2021-10-04 02:49:25'),
(2, 'etrfy56utuyujgtyuj', 'ewrt5yhujhy', 1, '2021-10-04 02:46:39', '2021-10-04 02:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE `faq_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faq_category`
--

INSERT INTO `faq_category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'rahat', 'active', '2021-10-04 01:58:31', '2021-10-04 02:39:39'),
(2, 'mohsin', 'active', '2021-10-04 02:30:51', '2021-10-04 02:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Comprehensive Employee Dashboard', 'Employee Dashboard has been designed to give easy access to the relevant information on a single page.The Dashboard also makes doing common tasks very easy. An Employee can track his attendance on the calendar, view his leaves, check latest notices on the Notice Board, see upcoming holidays and birthdays, and even download salary slip of every month.', 'employee_dashboard.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(2, 'Expense Claim', 'HRM makes it very easy to manage expenses made by employees and reimburse them. Be it online bill, mobile recharge, field expenses, etc. employees can add expenses they have made with all details including the bill. Approved expenses are automatically added to salary in payroll.', 'expense.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(3, 'Leave Management', 'Applying for leaves is a cake walk with HRM. An Employee can apply for leaves on\n                                specific days or by using a date range when he wants to apply for a long leave -\n                                for example, sick or maternity leaves.\n                                Leave request is sent to the HR Manager for the approval. After approval or rejection,\n                                the employee is notified by an email.', 'apply_leaves.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(4, 'Job Application', 'Job Application section allows employees to refer people to open job applications in\n                                the organization. This promotes their involvement in referring good candidates for open\n                                jobs\n                                and makes it easy for the manager to manage the referrals.', 'job_vacency.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(5, 'Admin Dashboard', 'HRM focuses on providing easy access to information. Admin dashboard has common stats to give a good overview of what\'s going on in the organization. Stats like total employees, total departments, awards, attendance, company expenses, current month birthdays, awards list, etc. are available at hand on the dashboard itself.', 'admin_dash.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(6, 'Employee Management', 'You can easily manage all the employees in the organization and their data with HRM. Tasks like adding new employees, updating employee information, deleting any existing employee, and others can now be done without much hassle. You can also assign Credit Leaves (Annual Leaves) to an employee based on his experience and performance.', 'employee_admin.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(7, 'Pay Slip Generator', 'Why to use a separate payroll software for generating pay slips when it can be done in HRM itself. HRM provides a simple interface to make generating pay slip both easy and fun. Now add hourly payments, allowances, and deductions, and generate, edit and email payslips to employees, all using HRM.', 'payroll.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(8, 'Awards Management', 'Being a good HR Manager, you frequently give awards and appreciation to employees. But, as a number of employees increase, keeping the track of them becomes difficult. No worries, with HRM you can comfortably manage all the awards, achievements, and appreciations given in your organization.', 'awards.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(9, 'Notice Board', 'With HRM\'s notice board feature, you can make company-wide announcements. Notices are visible on employee dashboard and employees are also notified by email.', 'notice.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(10, 'Company Expense Management', 'Now keep track of all the company expenses conveniently. Any expense, from a small pencil to big purchases like laptops, bills, party expenditure, etc. can be added the to the expense management. HRM shows monthly expense stats to help you know if you are overspending and take measures on time.', 'expense_admin.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(11, 'Attendance Management', 'You can mark attendance of all the employees with just one click. All you need to do is specify which employees are absent and then mark attendance.\n\nYou can also see the attendance of employees month wise.', 'attendance.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(12, 'Holidays List', 'Company Holidays are also now very easy to manage. Any holidays for the current year can be pre-planned and added. Employees can see all the upcoming holidays on their dashboard and make plans accordingly.', 'holidays.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(13, 'Admin Job Application', 'You can easily review the resumes submitted by employees and accept the best candidates. He can also preview the submitted resume without downloading them.', 'job_admin.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(14, 'Customize to Your Needs', 'HRM provides many options to customize HRM according to your needs. You can change details like the logo, company address, contact number, email and currency to use on Settings Page.', 'settings.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(15, 'Multiple Admins', 'HRM supports multiple admins. Add admins without any restrictions to minimize your headache. You just need to create a new admin and email them the details of the new account.', 'admins.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(16, 'Multiple Themes', 'HRM has 11 front end themes. Choose a theme that everyone likes, or the one that blends well with your company logo.', 'themes.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(17, 'etrfy56utuyujgtyuj', 'ertgr6yht', 'C:\\xampp\\tmp\\php3B6C.tmp', '2021-10-04 02:57:33', '2021-10-04 02:57:33'),
(18, 'sdfdg', 'derftgrfytr', 'http://127.0.0.1:8000/user_file.file', '2021-10-04 02:59:28', '2021-10-04 03:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `occassion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `company_id`, `date`, `occassion`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-07-18', 'Nelson Mandela Day', '2021-07-13 16:55:40', '2021-07-13 16:55:40'),
(2, 1, '2021-08-09', 'National Women\'s Day', '2021-07-13 16:55:40', '2021-07-13 16:55:40'),
(3, 3, '2021-08-09', 'National Woman\'s Day', '2021-07-15 11:10:42', '2021-07-15 11:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `holidays_list`
--

CREATE TABLE `holidays_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_number` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `currencySymbol` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '$',
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Paid','Unpaid','Cancelled','Error') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('Item','Tax','Discount') COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `posted_date` date NOT NULL,
  `last_date` date NOT NULL,
  `close_date` date NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `company_id`, `position`, `description`, `posted_date`, `last_date`, `close_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Marketing Analyst', 'A new position as a marketing analyst has opened and is available to apply for. Applications close 30 July 2021', '2021-07-21', '2021-07-30', '2021-07-31', 'active', '2021-07-21 10:32:20', '2021-07-21 10:32:20'),
(2, NULL, 'developer', 'ftgyhtfcyhuj', '0000-00-00', '0000-00-00', '0000-00-00', 'active', '2021-09-08 04:01:06', '2021-09-08 04:01:06'),
(3, NULL, 'developer', 'ftgyhtfcyhuj', '0000-00-00', '0000-00-00', '0000-00-00', 'active', '2021-09-08 04:01:41', '2021-09-08 04:01:41'),
(4, 1, 'developer', 'ftgyhtfcyhuj', '2021-09-07', '2021-09-09', '2021-09-09', 'active', '2021-09-08 04:07:12', '2021-09-08 04:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `job_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `resume` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cover_letter` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('selected','rejected','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `submitted_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `company_id`, `job_id`, `name`, `email`, `phone`, `resume`, `cover_letter`, `status`, `submitted_by`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Mohsin Sikder', 'mohsinsikder895@gmail.com', '01715486265', 'd3a549a35225e5798ed6d987d1412f1c.pdf', 'esrfet', 'pending', 2, '2021-09-03 01:29:50', '2021-09-03 01:29:50'),
(12, 3, 1, 'rahat', 'mohsin12@gmail.com', '1423563.56', 'tyuhjy', 'tyhut6uj67', 'pending', 2, '2021-09-06 23:43:50', '2021-09-06 23:43:50'),
(13, 3, 1, 'rahat', 'mohsin12@gmail.com', '1423563.56', 'tyuhjy', 'tyhut6uj67', 'pending', 2, '2021-09-06 23:46:24', '2021-09-06 23:46:24'),
(15, 3, 1, 'rahat', 'mohsin12@gmail.com', '1423563.56', 'tyuhjy', 'e6t546', 'pending', 2, '2021-09-06 23:52:24', '2021-09-06 23:52:24'),
(16, 3, 1, 'rahat', 'mohsin12@gmail.com', '1423563.56', 'tyuhjy', 'e6t546', 'pending', 2, '2021-09-06 23:59:46', '2021-09-06 23:59:46'),
(24, 1, 1, 'grtfgg', 'ryhrt6yh', 'tryhthty', 'rtyh', 'rdytfyh', 'pending', 2, '2021-09-09 06:15:16', '2021-09-09 06:15:16'),
(25, 1, 1, 'grtfgg', 'ryhrt6yh', 'tryhthty', 'C:\\xampp\\tmp\\php1393.tmp', 'rdytfyh', 'pending', 2, '2021-09-09 06:20:49', '2021-09-09 06:20:49'),
(26, 3, 1, 'mohsin', 'mohsin@gmail.com', '1213434', 'C:\\xampp\\tmp\\php1574.tmp', 'gtrf', 'pending', 2, '2021-09-14 05:08:27', '2021-09-14 05:08:27'),
(27, 3, 1, 'mohsin', 'mohsin@gmail.com', '1213434', 'C:\\xampp\\tmp\\php9B0B.tmp', 'gtrf', 'pending', 2, '2021-09-14 05:21:02', '2021-09-14 05:21:02'),
(28, 3, 1, 'mohsin', 'mohsin@gmail.com', '1213434', 'C:\\xampp\\tmp\\phpFEE6.tmp', 'gtrf', 'pending', 2, '2021-09-14 05:21:28', '2021-09-14 05:21:28'),
(29, 3, 1, 'mohsin', 'mohsin@gmail.com', '1213434', 'C:\\xampp\\tmp\\phpD03C.tmp', 'gtrf', 'pending', 2, '2021-09-14 05:23:27', '2021-09-14 05:23:27'),
(30, 1, 1, 'hjkuj', 'mohsin@g,ail.com', '425365', 'C:\\xampp\\tmp\\php55DE.tmp', 'dgdfgt', 'pending', 2, '2021-09-15 22:32:37', '2021-09-15 22:32:37'),
(31, 1, 1, 'hjkuj', 'mohsin@g,ail.com', '425365', 'C:\\xampp\\tmp\\phpB5E3.tmp', 'dgdfgt', 'pending', 2, '2021-09-15 22:36:18', '2021-09-15 22:36:18'),
(32, 1, 1, 'hjkuj', 'mohsin@g,ail.com', '425365', 'user_file.file', 'dgdfgt', 'pending', 2, '2021-09-15 22:37:15', '2021-09-15 22:37:15'),
(33, 1, 1, 'hjkuj', 'mohsin@g,ail.com', '425365', 'http://127.0.0.1:8000/user_file.file', 'dgdfgt', 'pending', 2, '2021-09-15 22:38:09', '2021-09-15 22:38:09'),
(34, 1, 1, 'hjkuj', 'mohsin@g,ail.com', '425365', 'http://127.0.0.1:8000/user_file.file', 'dgdfgt', 'pending', 2, '2021-09-20 05:32:17', '2021-09-20 05:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `locale`, `language`, `active`) VALUES
(1, 'en', 'US English', 1),
(2, 'es', 'Spanish', 1),
(3, 'fr', 'French', 1),
(4, 'pt', 'Portuguese', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `num_of_leave` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leavetypes`
--

INSERT INTO `leavetypes` (`id`, `company_id`, `leaveType`, `num_of_leave`, `created_at`, `updated_at`) VALUES
(1, 1, 'Normal Leave', 15, '2021-07-13 16:57:33', '2021-07-13 16:57:33'),
(2, 1, 'Sick Leave', 9, '2021-07-13 16:57:45', '2021-07-13 16:57:45'),
(3, 3, 'Normal Leave', 15, '2021-07-15 11:10:55', '2021-07-15 11:10:55'),
(4, 3, 'Sick Leave', 9, '2021-07-15 11:11:00', '2021-07-15 11:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `leaveType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `halfDayType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `days` int(11) NOT NULL,
  `applied_on` date DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `application_status` enum('approved','rejected','pending') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `company_id`, `employee_id`, `leaveType`, `halfDayType`, `last_updated_by`, `start_date`, `end_date`, `days`, `applied_on`, `reason`, `application_status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Sick Leave', 'no', NULL, '2021-09-06', NULL, 1, '2021-09-03', '', 'approved', '2021-09-02 23:14:58', '2021-09-09 03:56:05'),
(2, 3, 2, 'Sick Leave', 'yes', NULL, '2021-09-07', NULL, 1, '2021-09-03', 'ffgb', 'approved', '2021-09-03 17:59:54', '2021-09-03 17:59:54'),
(4, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-07', 'nothing', 'rejected', '2021-09-07 01:00:34', '2021-09-09 04:07:26'),
(5, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-07', 'nothing', 'pending', '2021-09-07 01:00:49', '2021-09-07 01:00:49'),
(6, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-07', 'nothing', 'pending', '2021-09-07 01:01:11', '2021-09-07 01:01:11'),
(7, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-07', 'nothing', 'pending', '2021-09-07 01:01:40', '2021-09-07 01:01:40'),
(8, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-07', 'nothing', 'pending', '2021-09-07 01:05:48', '2021-09-07 01:05:48'),
(9, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-08', 'nothing', 'pending', '2021-09-07 23:26:43', '2021-09-07 23:26:43'),
(10, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-08', 'nothing', 'pending', '2021-09-07 23:28:18', '2021-09-07 23:28:18'),
(12, 3, 2, 'check Leave', NULL, NULL, '2021-09-03', '2021-09-03', 2, '2021-09-08', 'nothing', 'rejected', '2021-09-07 23:29:23', '2021-09-09 03:19:31'),
(13, 1, 2, 'check', 'yes', NULL, '2021-09-08', '2021-09-08', 2, '2021-09-08', 'tyujygj', 'rejected', '2021-09-08 05:02:17', '2021-09-09 03:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `license_number` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subdomain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `license_type_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('Valid','Expired','Disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Valid',
  `expires_on` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_country_pricing`
--

CREATE TABLE `license_country_pricing` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_type_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

CREATE TABLE `license_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `free_users` tinyint(4) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `type` enum('Cloud','Multi-Company','On-Premise') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Cloud',
  `status` enum('Enabled','Disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_062329_create_revissions_table', 1),
(2, '2013_10_08_070623_create_subscription_plans', 1),
(3, '2014_01_28_050545_create_company_table', 1),
(4, '2014_04_02_193005_create_translations_table', 1),
(5, '2015_01_01_113224_create_department_table', 1),
(6, '2015_01_02_113252_create_designation_table', 1),
(7, '2015_01_03_051233_create_employees_table', 1),
(8, '2015_01_14_095049_create_leavetypes_table', 1),
(9, '2015_01_15_061824_create_admins_table', 1),
(10, '2015_01_15_062941_create_bank_details_table', 1),
(11, '2015_01_15_104831_create_employee_documents_table', 1),
(12, '2015_01_15_105222_create_awards_table', 1),
(13, '2015_01_15_110029_create_holidays_table', 1),
(14, '2015_01_15_110255_create_attendance_table', 1),
(15, '2015_01_20_100417_create_salary_table', 1),
(16, '2015_01_22_150640_create_expenses_table', 1),
(17, '2015_02_10_044023_create_noticeboards_table', 1),
(18, '2015_05_18_041236_create_country_table', 1),
(19, '2015_05_20_081903_create_leave_applications', 1),
(20, '2015_05_23_063217_create_payrolls_table', 1),
(21, '2015_06_02_174830_create_jobs_table', 1),
(22, '2015_06_03_124443_create_jobApplications_table', 1),
(23, '2015_06_07_112126_add_employeeID_to_expense_table', 1),
(24, '2015_06_08_051127_add_expense_to_payrolls', 1),
(25, '2015_06_10_040042_add_bsb_bank_details', 1),
(26, '2015_06_11_094005_create_language_table', 1),
(27, '2015_08_27_124551_add_superadmintype_table', 1),
(28, '2015_08_28_073542_create_settings_table', 1),
(29, '2015_09_21_121944_create_emailTemplates_table', 1),
(30, '2015_12_01_094436_contact_form', 1),
(31, '2015_12_01_121511_create_jobs_queued_table', 1),
(32, '2015_12_02_042829_licenses_types', 1),
(33, '2015_12_02_141828_licenses', 1),
(34, '2015_12_03_085826_transactions', 1),
(35, '2015_12_07_141042_add_soft_delete_companies_table', 1),
(36, '2015_12_11_043103_country_wise_pricing', 1),
(37, '2015_12_11_044747_combine_price_column', 1),
(38, '2015_12_19_045656_add_country_company', 1),
(39, '2015_12_29_055336_drop_leave_app_foreign_keys', 1),
(40, '2015_12_31_052753_rename_ifsc_and_pan_column', 1),
(41, '2016_01_07_103507_referral_member_table', 1),
(42, '2016_01_07_113732_add_referral_code_companies', 1),
(43, '2016_01_09_081051_browse_history_table', 1),
(44, '2016_01_11_071613_add_status_to_referral_members', 1),
(45, '2016_01_23_060953_CreateDatabaseBackupsTable', 1),
(46, '2016_01_25_094404_add_supervisor', 1),
(47, '2016_01_28_101227_create_dept_manager', 1),
(48, '2016_01_30_073216_failed_records_table', 1),
(49, '2016_02_10_051740_add_clock_attendence_table', 1),
(50, '2016_02_10_133843_timezone_field', 1),
(51, '2016_02_10_165940_holidays_list_country', 1),
(52, '2016_02_11_152050_updates', 1),
(53, '2016_02_12_064233_updates_read', 1),
(54, '2016_02_16_071246_add_mark_attendance_companies', 1),
(55, '2016_02_17_050720_number_of_logins', 1),
(56, '2016_02_18_043238_set_default_companies_office_time', 1),
(57, '2016_02_22_070410_Add_attendance_settings_col_company', 1),
(58, '2016_02_22_070558_Add_is_late_col_attendance', 1),
(59, '2016_02_24_044525_invoice_tables', 1),
(60, '2016_02_25_042354_license_link_columns', 1),
(61, '2016_03_02_060333_add_office_start_end_time_to_attendance', 1),
(62, '2016_03_02_093444_billing_address', 1),
(63, '2016_03_04_083135_drop_half_day_foreign_key', 1),
(64, '2016_03_04_091447_remove_updated_by_column', 1),
(65, '2016_03_06_165923_employee_company_id_column', 1),
(66, '2016_03_07_115548_update_timezone_currency', 1),
(67, '2016_03_31_095011_jobs_type_medium_text', 1),
(68, '2016_04_15_070953_license_expired_column', 1),
(69, '2016_11_11_095228_add_invoice_emails_template', 1),
(70, '2018_10_08_062013_add_cashier_columns', 1),
(71, '2018_12_03_062040_update_subscription_table', 1),
(72, '2018_12_03_121300_add_stripe_columns_in_company_table', 1),
(73, '2018_12_03_122119_create_subscriptions_table', 1),
(74, '2019_01_18_095252_create_faq_category_table', 1),
(75, '2019_01_18_095308_create_faq_table', 1),
(76, '2019_01_18_095309_create_stripe_invoices_table', 1),
(77, '2019_03_06_083339_add_stripe_setting_column_in_settings_table', 1),
(78, '2019_03_11_045839_update_set_nullable_companies_table', 1),
(79, '2019_03_11_092232_nullable_employees_table', 1),
(80, '2019_03_11_093614_nullable_expense_table', 1),
(81, '2019_03_11_111346_awards_nullable_table', 1),
(82, '2019_03_12_041352_insert_smtp_settings_from_env', 1),
(83, '2019_03_18_100657_alter_companies_table', 1),
(84, '2019_03_18_140009_add_gdpr_to_users_table', 1),
(85, '2019_03_19_062146_employees_admin_gdpr_columns_extend', 1),
(86, '2019_04_24_064209_add_pt_language_in_languages_table', 1),
(87, '2019_05_13_070209_add_currency_id_in_settings_table', 1),
(88, '2019_06_05_091741_alter_allowances_column_payrolls_table', 1),
(89, '2019_06_10_072120_add_status_column_in_payrolls_table', 1),
(90, '2019_08_01_052902_alter_mail_encryption_in_settings_table', 1),
(91, '2019_08_12_073129_update_settings_add_envato_key', 1),
(92, '2019_08_13_073129_update_settings_add_support_key', 1),
(93, '2019_08_18_151918_create_features_table', 1),
(94, '2019_08_28_081847_update_smtp_setting_verified', 1),
(95, '2019_09_25_083712_update_setting_cron_job', 1),
(96, '2019_09_26_074828_add_new_invoice_generated', 1),
(97, '2019_11_06_042543_alter_leave_application_data', 1),
(98, '2019_11_12_054145_add_system_update_column_in_settings_table', 1),
(99, '2019_11_28_090611_add_paypal_column_in_settings_table', 1),
(100, '2019_11_29_111053_add_paypal_mode_column_in_settings_table', 1),
(101, '2019_12_06_091241_add_column_end_on_in_stripe_invoices_table', 1),
(102, '2020_02_01_101914_update_settings_review', 1),
(103, '2020_03_03_121750_add_stripe_active_subscription', 1),
(104, '2020_10_22_065125_update_smtp_from_email', 1),
(105, '2021_06_14_112939_setting_update_favicon_table', 1),
(106, '2021_06_17_052911_languages_status_column', 1),
(107, '2021_06_17_065532_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `noticeboards`
--

CREATE TABLE `noticeboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `noticeboards`
--

INSERT INTO `noticeboards` (`id`, `company_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Meeting 15 July 2021 5pm', '<p>This meeting is about introducing our new employee</p>', 'active', '2021-07-15 11:16:16', '2021-07-15 11:16:16'),
(2, 3, 'Public Holiday', '<p>9 August is National Women\'s day</p>', 'active', '2021-07-21 10:30:01', '2021-07-21 10:30:01'),
(3, NULL, '', '', 'active', '2021-09-19 05:57:14', '2021-09-19 05:57:14'),
(4, NULL, '', '', 'active', '2021-09-19 05:57:49', '2021-09-19 05:57:49'),
(5, NULL, 'sfdszfvf', 'dfgdfgg', 'active', '2021-09-19 05:58:58', '2021-09-19 05:58:58'),
(6, NULL, 'sfdszfvf', 'dfgdfgg', 'active', '2021-09-19 06:01:36', '2021-09-19 06:01:36'),
(7, 3, 'kdfjjjikrfh', '3qw42r535ty66', 'inactive', '2021-09-19 06:02:32', '2021-10-04 00:00:12'),
(8, NULL, 'sfdszfvf', 'dfgdfgg', 'active', '2021-09-19 06:03:31', '2021-09-19 06:03:31'),
(9, NULL, 'sfdszfvf', 'dfgdfggjn   hjkyhvujyhuj', 'active', '2021-09-19 06:22:51', '2021-09-19 06:22:51'),
(10, NULL, 'ghjngjn', 'ertfgesrtg', 'active', '2021-10-11 06:27:38', '2021-10-11 06:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Terms of Service', 'terms-of-service', '<p> THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting-&gt;main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purposes in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending an email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days\' advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with the use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to a) provide true, accurate, current, and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign-up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such a third party has assumed an administrator role for your organization. Make sure that you enter into a suitable agreement with such a third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring the confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking the necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable, and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third-party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations, and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification, or other obligation or liability with respect to Your Modifications or their combination, interaction, or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities, and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice insufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on the server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>The personal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining the confidentiality of your username, password, and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages, and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of the use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to the disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under the monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then-current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms &amp; conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe the intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and the option to back up your data. In the case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing, or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and maybe crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license, or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization, or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third-party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to the determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR-FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE, OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES, OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines, and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity, or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account at your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user accounts such as your email address and password, and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>.</p>', '2021-07-13 06:19:25', '2021-07-13 16:03:30'),
(2, 1, 'Privacy Policy', 'privacy-policy', '<p> <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to the use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to using of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4></h4><h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request your name, email address, and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events, and changes in this Privacy Policy Statement.\n                        <br><br>\n                        HRM SAAS will have access to third-party personal information provided by you as part of using HRM SAAS Services. This information may include third-party names, email addresses, phone numbers, and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third-party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one-time email. Your friend may contact us at <a href=\"mailto:admin@tchest.co.za\"><a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a></a>&nbsp;to request that we remove this information from our database.\n                        <br><br>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br><br>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used, and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails, and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the cardholder, the expiry date, and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5></h5><h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if an option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign-up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data with our affiliates, resellers, service providers, and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include but are not limited to, data storage, database management, web analytics, and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases, HRM SAAS will also ensure that such affiliates, resellers, service providers, and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry-appropriate data collection, storage, and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure, or destruction of your Personal Information, username, password, transaction information, and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt-out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases, and upcoming events. You may opt-out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br><br>\n                        Accessing, Updating, and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>. Such changes may take up to 48 hours to take effect. We respond to all inquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending an email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days\' advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in the disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br><br>\n                        HRM SAAS also supports third-party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing them.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@tchest.co.za\">admin@tchest.co.za</a><a href=\"mailto:admin@example.com\"></a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.</p>', '2021-07-13 06:19:25', '2021-07-13 15:57:14'),
(3, 1, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>T-Chest is an outsourcing services provider for small and medium businesses, based in&nbsp;Bedfordview, Johannesburg.&nbsp;Established in 2015 July, a solutions company that dwells in the industry of Telecoms, Recruitment, and Construction. Operating in the African market and on a global scale level, assisting third-party investors in coming into the African and Asian markets. Currently, a level 1 BEE compliant company, offering consulting services in the recruitment sector, telecoms projects, and construction solutions.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market unless the existing products can be greatly improved upon.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 15:50:38');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(4, 2, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(5, 2, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4>Children\'s Online Privacy Protection</h4>\n\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\n\n                        <h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\n                        <br><br/>\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\n                        <br/><br/>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br/><br/>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\n\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\n\n                        <h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br/><br/>\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br/><br/>\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(6, 2, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 06:19:25');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(7, 3, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(8, 3, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4>Children\'s Online Privacy Protection</h4>\n\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\n\n                        <h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\n                        <br><br/>\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\n                        <br/><br/>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br/><br/>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\n\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\n\n                        <h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br/><br/>\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br/><br/>\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(9, 3, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 06:19:25');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(10, 4, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(11, 4, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4>Children\'s Online Privacy Protection</h4>\n\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\n\n                        <h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\n                        <br><br/>\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\n                        <br/><br/>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br/><br/>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\n\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\n\n                        <h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br/><br/>\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br/><br/>\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(12, 4, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 06:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `month` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('cash','paypal','bank_transfer','cheque') COLLATE utf8_unicode_ci NOT NULL,
  `basic` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `overtime_pay` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `allowances` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_allowance` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `deductions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_deduction` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `additionals` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `total_additional` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `net_salary` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `pay_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expense` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `status` enum('paid','unpaid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `employee_id`, `month`, `year`, `payment_mode`, `basic`, `overtime_hours`, `overtime_pay`, `allowances`, `total_allowance`, `deductions`, `total_deduction`, `additionals`, `total_additional`, `net_salary`, `pay_date`, `created_at`, `updated_at`, `expense`, `company_id`, `status`) VALUES
(1, 2, '7', '2021', 'cash', '10000', '160', '10000', '{\"Bonus\":\"12\"}', '12.00', '[]', '0.00', '', '', '20012.00', '0000-00-00', '2021-07-15 11:14:48', '2021-10-04 00:19:41', '0', 3, 'unpaid'),
(2, 1, '9', '2021', 'cash', '234', '2', '12334', '[]', '121', '[]', '0', '', '', '3454', '0000-00-00', '2021-09-03 19:34:57', '2021-09-08 04:24:49', '0', 1, ''),
(7, 1, '10', '', 'cash', '234', '2', '12334', '', '121', '', '0', '', '', '3454', '0000-00-00', '2021-09-08 04:27:20', '2021-09-08 04:27:20', '0', 1, 'paid'),
(8, 2, '10', '', 'cash', '234', '2', '12334', '', '12123', '', '0', '', '', '3454', '0000-00-00', '2021-09-08 04:33:04', '2021-10-04 00:41:10', '0', 1, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `queued_jobs`
--

CREATE TABLE `queued_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_member`
--

CREATE TABLE `referral_member` (
  `id` int(10) UNSIGNED NOT NULL,
  `referral_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `agreement` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_agreement` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `salary` double NOT NULL,
  `remarks` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `employee_id`, `type`, `salary`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 'basic', 0, 'Basic Salary', '2021-07-13 16:51:47', '2021-07-13 16:51:47'),
(2, 1, 'hourly_rate', 0, 'Hourly Rate', '2021-07-13 16:51:47', '2021-07-13 16:51:47'),
(3, 2, 'basic', 20000, 'Basic Salary', '2021-07-15 11:10:00', '2021-07-21 10:26:27'),
(4, 2, 'hourly_rate', 62.5, 'Hourly Rate', '2021-07-15 11:10:00', '2021-07-15 11:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `admin_theme` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 1,
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 1,
  `mail_driver` enum('smtp','mail') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'mail',
  `mail_host` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_port` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_encryption` enum('tls','ssl','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gdpr` tinyint(1) NOT NULL DEFAULT 0,
  `currency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `cron_job_set` tinyint(1) NOT NULL DEFAULT 0,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `paypal_mode` enum('sandbox','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sandbox',
  `show_review_modal` tinyint(1) NOT NULL DEFAULT 1,
  `mail_from_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from_email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `main_name`, `email`, `name`, `logo`, `address`, `contact`, `admin_theme`, `locale`, `status`, `created_at`, `updated_at`, `stripe_key`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `gdpr`, `currency`, `currency_symbol`, `purchase_code`, `supported_until`, `verified`, `cron_job_set`, `system_update`, `paypal_mode`, `show_review_modal`, `mail_from_name`, `mail_from_email`, `favicon`) VALUES
(1, 'T-Chest', 'admin@tchest.co.za', 'Administrator', '877fe906f5b6cc9ac9b7151aad8fb62e.png', '33 Harcus Rd, Bedfordview, Johannesburg, 2008', '+27 76 083 5138', 'blue', 'en', 'active', '2021-07-13 06:19:25', '2021-07-27 01:21:45', NULL, NULL, NULL, 1, NULL, NULL, 1, 'mail', NULL, NULL, 'Superadmin@example.com', '123456', '', 0, 'ZAR', 'R', NULL, NULL, 0, 0, 1, 'sandbox', 1, 'T-Chest Admin', 'admin@tchest.co.za', '0015a41d4dc1a66c3866cf8a35917746.png');

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `payment_method` enum('stripe','paypal') COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subscription_plan_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_status` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `plan_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `start_user_count` int(11) NOT NULL,
  `end_user_count` int(11) NOT NULL,
  `monthly_price` double NOT NULL,
  `annual_price` double NOT NULL,
  `stripe_annual_plan_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_monthly_plan_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `plan_name`, `start_user_count`, `end_user_count`, `monthly_price`, `annual_price`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 0, 5, 0, 0, 'hrm_basic_plan_annual', 'hrm_basic_plan_monthly', 1, '2021-07-13 06:19:25', '2021-07-15 10:59:23'),
(2, 'Advanced', 5, 50, 250, 2500, 'hrm_advanced_plan_annual', 'hrm_advanced_plan_montly', 1, '2021-07-13 06:19:25', '2021-07-13 16:30:59'),
(3, 'Premium', 51, 100, 450, 4500, 'hrm_premium_plan_annual', 'hrm_premium_plan_montly', 1, '2021-07-13 06:19:25', '2021-07-13 16:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_number` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payer_fname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `payer_lname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_details` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `failure_data` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Unpublished','Published') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates_read`
--

CREATE TABLE `updates_read` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `update_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_employee_id_date_unique` (`employee_id`,`date`),
  ADD KEY `attendance_leavetype_index` (`leaveType`),
  ADD KEY `attendance_halfdaytype_index` (`halfDayType`),
  ADD KEY `attendance_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id_foreign` (`company_id`),
  ADD KEY `awards_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_details_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `browse_history`
--
ALTER TABLE `browse_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `browse_history_company_id_foreign` (`company_id`),
  ADD KEY `browse_history_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `contact_requests`
--
ALTER TABLE `contact_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_countries`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_company_id_foreign` (`company_id`);

--
-- Indexes for table `department_manager`
--
ALTER TABLE `department_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_manager_department_id_foreign` (`department_id`),
  ADD KEY `department_manager_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designation_department_id_foreign` (`department_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_designation_foreign` (`designation`),
  ADD KEY `employees_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `failed_records`
--
ALTER TABLE `failed_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `holidays_date_company_id_unique` (`date`,`company_id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`);

--
-- Indexes for table `holidays_list`
--
ALTER TABLE `holidays_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_license_number_foreign` (`license_number`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_company_id_foreign` (`company_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_company_id_foreign` (`company_id`),
  ADD KEY `job_applications_job_id_foreign` (`job_id`),
  ADD KEY `job_applications_submitted_by_foreign` (`submitted_by`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leavetypes_company_id_foreign` (`company_id`),
  ADD KEY `leavetypes_leavetype_index` (`leaveType`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_applications_company_id_foreign` (`company_id`),
  ADD KEY `leave_applications_employee_id_foreign` (`employee_id`),
  ADD KEY `leave_applications_leavetype_index` (`leaveType`),
  ADD KEY `leave_applications_halfdaytype_index` (`halfDayType`),
  ADD KEY `leave_applications_last_updated_by_foreign` (`last_updated_by`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`license_number`),
  ADD KEY `licenses_license_type_id_foreign` (`license_type_id`),
  ADD KEY `licenses_company_id_foreign` (`company_id`);

--
-- Indexes for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license_country_pricing_license_type_id_foreign` (`license_type_id`);

--
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noticeboards_company_id_foreign` (`company_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_language_id_foreign` (`language_id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_employee_id_foreign` (`employee_id`),
  ADD KEY `payrolls_company_id_foreign` (`company_id`);

--
-- Indexes for table `queued_jobs`
--
ALTER TABLE `queued_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queued_jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`);

--
-- Indexes for table `referral_member`
--
ALTER TABLE `referral_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_member_referral_code_index` (`referral_code`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_license_number_foreign` (`license_number`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates_read`
--
ALTER TABLE `updates_read`
  ADD UNIQUE KEY `updates_read_admin_id_update_id_unique` (`admin_id`,`update_id`),
  ADD KEY `updates_read_update_id_foreign` (`update_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `browse_history`
--
ALTER TABLE `browse_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contact_requests`
--
ALTER TABLE `contact_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id_countries` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department_manager`
--
ALTER TABLE `department_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_records`
--
ALTER TABLE `failed_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `holidays_list`
--
ALTER TABLE `holidays_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license_types`
--
ALTER TABLE `license_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `noticeboards`
--
ALTER TABLE `noticeboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `queued_jobs`
--
ALTER TABLE `queued_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_member`
--
ALTER TABLE `referral_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD CONSTRAINT `bank_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `browse_history`
--
ALTER TABLE `browse_history`
  ADD CONSTRAINT `browse_history_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `browse_history_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department_manager`
--
ALTER TABLE `department_manager`
  ADD CONSTRAINT `department_manager_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `department_manager_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `designation_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_designation_foreign` FOREIGN KEY (`designation`) REFERENCES `designation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_license_number_foreign` FOREIGN KEY (`license_number`) REFERENCES `licenses` (`license_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_applications_submitted_by_foreign` FOREIGN KEY (`submitted_by`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD CONSTRAINT `leavetypes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_applications_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_applications_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `licenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `licenses_license_type_id_foreign` FOREIGN KEY (`license_type_id`) REFERENCES `license_types` (`id`);

--
-- Constraints for table `license_country_pricing`
--
ALTER TABLE `license_country_pricing`
  ADD CONSTRAINT `license_country_pricing_license_type_id_foreign` FOREIGN KEY (`license_type_id`) REFERENCES `license_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noticeboards`
--
ALTER TABLE `noticeboards`
  ADD CONSTRAINT `noticeboards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payrolls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD CONSTRAINT `stripe_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stripe_invoices_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_license_number_foreign` FOREIGN KEY (`license_number`) REFERENCES `licenses` (`license_number`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `updates_read`
--
ALTER TABLE `updates_read`
  ADD CONSTRAINT `updates_read_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `updates_read_update_id_foreign` FOREIGN KEY (`update_id`) REFERENCES `updates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
