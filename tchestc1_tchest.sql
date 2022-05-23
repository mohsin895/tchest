-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2022 at 03:52 PM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tchestc1_tchest`
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
(1, NULL, 'SuperAdmin', 'admin@gmail.com', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', NULL, '2022-04-01 11:00:14', 'yes', NULL, NULL, '2021-07-13 06:19:25', '2022-04-01 09:00:14', 'superadmin', 0, 114, NULL, NULL, 0),
(2, 1, 'Divan Serfontein', 'divan@opticsoftwaresolutions.co.za', '$2a$04$/YMIS.SK7SyZCTu5Zly3u.PWWt9nf/.W4v5idkA7uyKVSQw8jABV6', NULL, '2022-04-25 16:11:17', 'yes', NULL, NULL, '2021-07-13 16:17:50', '2022-04-25 14:11:17', 'admin', 0, 171, NULL, NULL, 0),
(5, NULL, 'SAdmin', 'sadmin@gmail.com', '$2y$10$J0yKg1Oiio5vVMp6NDqlDODvAV/Fi4bt786FmAkS9Gy6fkm4rKWF.', NULL, '2022-04-15 11:24:36', 'no', NULL, NULL, '2021-09-23 08:04:30', '2022-04-15 09:24:36', 'superadmin', 0, 25, NULL, NULL, 0),
(6, NULL, 'SU', 'su@admin.com', '$2y$10$F22mEUU0lDUK7L68RAgPe.DENsNcHWl.fB9COH0rXtB2AxtKeX5SW', NULL, '2021-10-06 11:45:19', 'no', NULL, NULL, '2021-10-06 09:39:10', '2021-10-06 09:45:19', 'superadmin', 0, 1, NULL, NULL, 0),
(8, NULL, 'su2', 'su2@gmail.com', '$2y$10$xbx19wlfvkwZwsBljvXqUOJRt7RHzw4ZdGHzkjyPBx0FGLKHDumj.', NULL, NULL, 'no', NULL, NULL, '2021-10-06 10:18:29', '2021-10-06 10:18:29', 'superadmin', 0, 0, NULL, NULL, 0),
(17, 12, 'Heather Scott', 'heather@chintglobal.com', '$2y$10$2oVtbhGmPZhIJ0wmGFhYRerFpNcJ1Vk/ZRht6FK8PQqUpFV717cTK', NULL, '2022-04-19 17:42:29', 'yes', NULL, NULL, '2022-04-01 08:16:04', '2022-04-19 15:42:29', 'admin', 0, 12, NULL, NULL, 0);

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
(2, 1, '2021-09-21', 'absent', 'Normal Leave', 'no', 2, 'Mr. Stark. I don\'t feel so good.', 'approved', '2021-09-13', '2021-09-14 03:55:22', '2021-09-14 03:55:22', NULL, NULL, NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(6, 1, '2021-09-15', '', NULL, NULL, NULL, '', NULL, NULL, '2021-09-15 09:56:06', '2021-09-15 09:56:06', '05:56:00', '05:56:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(15, 1, '2021-09-16', '', NULL, NULL, NULL, '', NULL, NULL, '2021-09-16 06:18:31', '2021-09-16 13:35:20', '02:18:00', '05:35:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(19, 1, '2021-09-19', '', NULL, NULL, NULL, '', NULL, NULL, '2021-09-19 02:00:58', '2021-09-19 02:48:55', '10:00:00', '10:48:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(26, 1, '2021-10-06', '', NULL, NULL, NULL, '', NULL, NULL, '2021-10-06 12:07:48', '2021-10-06 12:07:56', '08:07:00', '08:07:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(27, 1, '2021-10-07', '', NULL, NULL, NULL, '', NULL, NULL, '2021-10-07 16:27:54', '2021-10-07 16:27:59', '08:27:00', '08:27:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(29, 1, '2021-10-12', '', NULL, NULL, NULL, '', NULL, NULL, '2021-10-12 07:10:56', '2021-10-12 07:11:03', '11:10:00', '11:11:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(30, 1, '2021-11-08', '', NULL, NULL, NULL, '', NULL, NULL, '2021-11-08 05:46:47', '2021-11-08 05:46:47', '09:46:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(32, 1, '2021-11-22', '', NULL, NULL, NULL, '', NULL, NULL, '2021-11-22 14:02:31', '2021-11-22 14:02:47', '06:02:00', '06:02:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(36, 1, '2021-12-12', 'present', NULL, NULL, NULL, '', NULL, NULL, '2021-12-12 07:02:40', '2021-12-12 07:02:44', '09:02:40', '09:02:44', '103.213.242.5', '103.213.242.5', NULL, NULL, 0, '06:00:00', '12:00:00'),
(37, 1, '2021-12-13', '', NULL, NULL, NULL, '', NULL, NULL, '2021-12-13 07:11:51', '2021-12-13 07:11:58', '11:11:00', '11:11:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(43, 1, '2021-12-16', '', NULL, NULL, NULL, '', NULL, NULL, '2021-12-16 03:09:24', '2021-12-16 03:09:24', '07:09:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(44, 1, '2021-12-19', '', NULL, NULL, NULL, '', NULL, NULL, '2021-12-19 04:11:01', '2021-12-19 04:11:10', '12:10:00', '12:11:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(45, 1, '2021-12-23', '', NULL, NULL, NULL, '', NULL, NULL, '2021-12-23 16:59:20', '2021-12-23 16:59:24', '08:59:00', '08:59:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(46, 1, '2022-04-01', '', NULL, NULL, NULL, '', NULL, NULL, '2022-04-01 08:23:59', '2022-04-01 08:23:59', '12:23:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(47, 9, '2022-04-05', '', NULL, NULL, NULL, '', NULL, NULL, '2022-04-05 06:28:02', '2022-04-05 06:28:02', '10:28:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(48, 1, '2022-04-13', '', NULL, NULL, NULL, '', NULL, NULL, '2022-04-13 19:37:25', '2022-04-13 19:37:25', '11:37:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(49, 1, '2022-04-17', '', NULL, NULL, NULL, '', NULL, NULL, '2022-04-17 05:06:57', '2022-04-17 05:06:57', '09:06:00', '00:00:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL),
(50, 1, '2022-04-19', '', NULL, NULL, NULL, '', NULL, NULL, '2022-04-19 10:35:26', '2022-04-19 10:35:32', '02:35:00', '02:35:00', NULL, NULL, 'Office', NULL, 0, NULL, NULL);

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
(8, 1, 9, 'Employee of the month', 'Cash Insentive', '530', 'march', '2022', '2022-03-21 14:32:30', '2022-03-21 14:32:30');

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
(4, 9, 'Chris Moolman', '166590649', 'Standard Bank', NULL, 'Universal', '051001', '2022-03-01 17:25:18', '2022-03-21 14:26:30'),
(5, 1, 'Divan Serfontein', '62814386787', 'FNB', NULL, 'Universal', '250655', '2022-03-01 17:27:27', '2022-03-01 17:27:27');

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
(236, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-09-13 04:47:09', '2021-09-13 04:47:09'),
(244, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-13 09:39:54', '2021-09-13 09:39:54'),
(245, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-13 09:40:06', '2021-09-13 09:40:06'),
(246, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-13 09:40:15', '2021-09-13 09:40:15'),
(247, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-13 09:40:27', '2021-09-13 09:40:27'),
(248, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-13 09:40:41', '2021-09-13 09:40:41'),
(249, 1, 2, '103.54.36.68', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-09-13 09:40:45', '2021-09-13 09:40:45'),
(250, 1, 2, '103.54.36.68', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-09-13 09:40:47', '2021-09-13 09:40:47'),
(251, 1, 2, '103.54.36.68', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2021-09-13 09:42:19', '2021-09-13 09:42:19'),
(252, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-13 09:42:22', '2021-09-13 09:42:22'),
(253, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-13 09:42:23', '2021-09-13 09:42:23'),
(254, 1, 2, '103.54.36.68', 'admin.employees.destroy', 'https://tchest.co.za/admin/employees/3', '2021-09-13 09:44:14', '2021-09-13 09:44:14'),
(255, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-13 09:44:15', '2021-09-13 09:44:15'),
(256, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-13 10:03:14', '2021-09-13 10:03:14'),
(257, 1, 2, '103.54.36.68', 'admin.login', 'https://tchest.co.za/admin/login', '2021-09-13 10:17:47', '2021-09-13 10:17:47'),
(258, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-13 10:17:50', '2021-09-13 10:17:50'),
(259, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-13 10:17:51', '2021-09-13 10:17:51'),
(260, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-13 10:17:53', '2021-09-13 10:17:53'),
(261, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-13 10:18:00', '2021-09-13 10:18:00'),
(262, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-09-13 10:21:54', '2021-09-13 10:21:54'),
(263, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-13 10:21:56', '2021-09-13 10:21:56'),
(264, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'http://tchest.co.za/admin/payrolls', '2021-09-13 10:22:30', '2021-09-13 10:22:30'),
(265, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'http://tchest.co.za/admin/ajax_payrolls', '2021-09-13 10:22:40', '2021-09-13 10:22:40'),
(266, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'http://tchest.co.za/admin/payrolls/create', '2021-09-13 10:23:16', '2021-09-13 10:23:16'),
(267, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'http://tchest.co.za/admin/payrolls/check', '2021-09-13 10:23:28', '2021-09-13 10:23:28'),
(268, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'http://tchest.co.za/admin/payrolls/check', '2021-09-13 10:23:33', '2021-09-13 10:23:33'),
(269, 1, 2, '103.54.36.68', 'admin.getlogin', 'http://tchest.co.za/admin', '2021-09-13 10:23:38', '2021-09-13 10:23:38'),
(270, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-09-13 10:23:39', '2021-09-13 10:23:39'),
(271, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-13 10:23:39', '2021-09-13 10:23:39'),
(272, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'http://tchest.co.za/admin/payrolls', '2021-09-13 10:23:42', '2021-09-13 10:23:42'),
(273, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'http://tchest.co.za/admin/ajax_payrolls', '2021-09-13 10:23:43', '2021-09-13 10:23:43'),
(274, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'http://tchest.co.za/admin/payrolls/create', '2021-09-13 10:23:45', '2021-09-13 10:23:45'),
(275, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'http://tchest.co.za/admin/payrolls/check', '2021-09-13 10:23:50', '2021-09-13 10:23:50'),
(276, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-13 10:24:22', '2021-09-13 10:24:22'),
(277, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-13 10:24:23', '2021-09-13 10:24:23'),
(278, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-13 10:24:26', '2021-09-13 10:24:26'),
(279, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-14 02:03:33', '2021-09-14 02:03:33'),
(280, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-14 02:03:34', '2021-09-14 02:03:34'),
(281, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:03:40', '2021-09-14 02:03:40'),
(282, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:03:42', '2021-09-14 02:03:42'),
(283, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-14 02:03:44', '2021-09-14 02:03:44'),
(284, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-14 02:03:49', '2021-09-14 02:03:49'),
(285, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:05:23', '2021-09-14 02:05:23'),
(286, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:05:23', '2021-09-14 02:05:23'),
(287, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-14 02:05:26', '2021-09-14 02:05:26'),
(288, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-14 02:05:31', '2021-09-14 02:05:31'),
(289, 1, 2, '103.54.36.68', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:06:20', '2021-09-14 02:06:20'),
(290, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:06:23', '2021-09-14 02:06:23'),
(291, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:06:24', '2021-09-14 02:06:24'),
(292, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:06:29', '2021-09-14 02:06:29'),
(293, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:06:31', '2021-09-14 02:06:31'),
(294, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-14 02:09:09', '2021-09-14 02:09:09'),
(295, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-14 02:11:37', '2021-09-14 02:11:37'),
(296, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-14 02:11:48', '2021-09-14 02:11:48'),
(297, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:12:51', '2021-09-14 02:12:51'),
(298, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:12:51', '2021-09-14 02:12:51'),
(299, 1, 2, '103.54.36.68', 'admin.payrolls.downloadpdf', 'https://tchest.co.za/admin/payrolls/downloadpdf/2', '2021-09-14 02:13:00', '2021-09-14 02:13:00'),
(300, 1, 2, '103.54.36.68', 'admin.jobs.index', 'https://tchest.co.za/admin/jobs', '2021-09-14 02:15:27', '2021-09-14 02:15:27'),
(301, 1, 2, '103.54.36.68', 'admin.ajax_jobs', 'https://tchest.co.za/admin/ajax_jobs', '2021-09-14 02:15:28', '2021-09-14 02:15:28'),
(302, 1, 2, '103.54.36.68', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-09-14 02:15:37', '2021-09-14 02:15:37'),
(303, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-14 02:15:38', '2021-09-14 02:15:38'),
(304, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-14 02:15:41', '2021-09-14 02:15:41'),
(305, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-14 02:15:42', '2021-09-14 02:15:42'),
(306, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-14 02:16:03', '2021-09-14 02:16:03'),
(307, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-14 02:16:03', '2021-09-14 02:16:03'),
(308, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-14 02:16:06', '2021-09-14 02:16:06'),
(309, 1, 2, '103.54.36.68', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-14 02:16:13', '2021-09-14 02:16:13'),
(310, 1, 2, '103.54.36.68', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-14 02:57:21', '2021-09-14 02:57:21'),
(311, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-09-14 03:52:06', '2021-09-14 03:52:06'),
(312, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-14 03:52:08', '2021-09-14 03:52:08'),
(313, 1, 2, '103.54.36.68', 'admin.attendances.index', 'http://tchest.co.za/admin/attendances', '2021-09-14 03:52:35', '2021-09-14 03:52:35'),
(314, 1, 2, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.co.za/admin/attendances/filter', '2021-09-14 03:52:36', '2021-09-14 03:52:36'),
(315, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:52:40', '2021-09-14 03:52:40'),
(316, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:52:41', '2021-09-14 03:52:41'),
(317, 1, 2, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.co.za/admin/attendances/filter', '2021-09-14 03:52:46', '2021-09-14 03:52:46'),
(318, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:52:49', '2021-09-14 03:52:49'),
(319, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:52:50', '2021-09-14 03:52:50'),
(320, 1, 2, '103.54.36.68', 'admin.attendance.filter', 'http://tchest.co.za/admin/attendances/filter', '2021-09-14 03:53:21', '2021-09-14 03:53:21'),
(321, 1, 2, '103.54.36.68', 'admin.leavetypes.index', 'http://tchest.co.za/admin/leavetypes', '2021-09-14 03:53:24', '2021-09-14 03:53:24'),
(322, 1, 2, '103.54.36.68', 'admin.leavetypes.ajax_list', 'http://tchest.co.za/admin/leavetypes/ajax_list', '2021-09-14 03:53:25', '2021-09-14 03:53:25'),
(323, 1, 2, '103.54.36.68', 'admin.leave_applications.index', 'http://tchest.co.za/admin/leave_applications', '2021-09-14 03:53:26', '2021-09-14 03:53:26'),
(324, 1, 2, '103.54.36.68', 'admin.leave_applications', 'http://tchest.co.za/admin/leave_applications/ajaxApplications', '2021-09-14 03:53:27', '2021-09-14 03:53:27'),
(325, 1, 2, '103.54.36.68', 'admin.jobs.index', 'http://tchest.co.za/admin/jobs', '2021-09-14 03:53:29', '2021-09-14 03:53:29'),
(326, 1, 2, '103.54.36.68', 'admin.ajax_jobs', 'http://tchest.co.za/admin/ajax_jobs', '2021-09-14 03:53:29', '2021-09-14 03:53:29'),
(327, 1, 2, '103.54.36.68', 'admin.job_applications.index', 'http://tchest.co.za/admin/job_applications', '2021-09-14 03:53:31', '2021-09-14 03:53:31'),
(328, 1, 2, '103.54.36.68', 'admin.ajax_jobs_applications', 'http://tchest.co.za/admin/ajax_jobs_applications', '2021-09-14 03:53:32', '2021-09-14 03:53:32'),
(329, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:53:33', '2021-09-14 03:53:33'),
(330, 1, 2, '103.54.36.68', 'admin.attendances.create', 'http://tchest.co.za/admin/attendances/create', '2021-09-14 03:53:35', '2021-09-14 03:53:35'),
(331, 1, 2, '103.54.36.68', 'admin.ajax_jobs_applications', 'http://tchest.co.za/admin/ajax_jobs_applications', '2021-09-14 03:54:54', '2021-09-14 03:54:54'),
(332, 1, 2, '103.54.36.68', 'admin.attendance_settings.edit', 'http://tchest.co.za/admin/attendance_settings', '2021-09-14 03:54:56', '2021-09-14 03:54:56'),
(333, 1, 2, '103.54.36.68', 'admin.attendance_settings.edit', 'http://tchest.co.za/admin/attendance_settings', '2021-09-14 03:55:00', '2021-09-14 03:55:00'),
(334, 1, 2, '103.54.36.68', 'admin.attendance_settings.edit', 'http://tchest.co.za/admin/attendance_settings', '2021-09-14 03:55:01', '2021-09-14 03:55:01'),
(335, 1, 2, '103.54.36.68', 'admin.ajax_jobs_applications', 'http://tchest.co.za/admin/ajax_jobs_applications', '2021-09-14 03:55:08', '2021-09-14 03:55:08'),
(336, 1, 2, '103.54.36.68', 'admin.leave_applications.show', 'http://tchest.co.za/admin/leave_applications/1', '2021-09-14 03:55:15', '2021-09-14 03:55:15'),
(337, 1, 2, '103.54.36.68', 'admin.leave_applications.update', 'http://tchest.co.za/admin/leave_applications/1', '2021-09-14 03:55:22', '2021-09-14 03:55:22'),
(338, 1, 2, '103.54.36.68', 'admin.leave_applications.index', 'http://tchest.co.za/admin/leave_applications', '2021-09-14 03:55:25', '2021-09-14 03:55:25'),
(339, 1, 2, '103.54.36.68', 'admin.leave_applications', 'http://tchest.co.za/admin/leave_applications/ajaxApplications', '2021-09-14 03:55:26', '2021-09-14 03:55:26'),
(340, 1, 2, '103.54.36.68', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2021-09-14 03:55:37', '2021-09-14 03:55:37'),
(341, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2021-09-14 03:55:38', '2021-09-14 03:55:38'),
(342, 1, 2, '103.54.36.68', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2021-09-14 03:55:42', '2021-09-14 03:55:42'),
(343, 1, 2, '103.54.36.68', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2021-09-14 03:55:44', '2021-09-14 03:55:44'),
(344, 1, 2, '103.54.36.68', 'admin.getlogin', 'http://tchest.co.za/admin', '2021-09-14 03:55:46', '2021-09-14 03:55:46'),
(345, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-09-14 03:55:47', '2021-09-14 03:55:47'),
(346, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-14 03:55:48', '2021-09-14 03:55:48'),
(347, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-14 04:35:47', '2021-09-14 04:35:47'),
(348, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-14 04:35:48', '2021-09-14 04:35:48'),
(349, 1, 2, '103.54.36.68', 'admin.leave_applications.index', 'https://tchest.co.za/admin/leave_applications', '2021-09-14 04:35:54', '2021-09-14 04:35:54'),
(350, 1, 2, '103.54.36.68', 'admin.leave_applications', 'https://tchest.co.za/admin/leave_applications/ajaxApplications', '2021-09-14 04:35:55', '2021-09-14 04:35:55'),
(351, 1, 2, '103.54.36.68', 'admin.leave_applications.show', 'https://tchest.co.za/admin/leave_applications/1', '2021-09-14 04:36:31', '2021-09-14 04:36:31'),
(352, 1, 2, '103.54.36.68', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-14 04:37:05', '2021-09-14 04:37:05'),
(353, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-14 07:33:00', '2021-09-14 07:33:00'),
(354, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-14 07:33:03', '2021-09-14 07:33:03'),
(355, 1, 2, '103.54.36.68', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-09-14 07:33:08', '2021-09-14 07:33:08'),
(356, 1, 2, '103.54.36.68', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-09-14 07:33:09', '2021-09-14 07:33:09'),
(357, 1, 2, '103.54.36.68', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-09-14 07:34:27', '2021-09-14 07:34:27'),
(358, 1, 2, '103.54.36.68', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-09-14 07:34:28', '2021-09-14 07:34:28'),
(359, 1, 2, '103.54.36.68', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-09-14 07:34:38', '2021-09-14 07:34:38'),
(360, 1, 2, '103.54.36.68', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-14 07:34:55', '2021-09-14 07:34:55'),
(368, 1, 2, '105.224.247.252', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-16 13:30:00', '2021-09-16 13:30:00'),
(369, 1, 2, '105.224.247.252', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-16 13:30:02', '2021-09-16 13:30:02'),
(370, 1, 2, '105.224.247.252', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2021-09-16 13:31:15', '2021-09-16 13:31:15'),
(371, 1, 2, '105.224.247.252', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-09-16 13:31:17', '2021-09-16 13:31:17'),
(372, 1, 2, '105.224.247.252', 'admin.general_setting.update', 'https://tchest.co.za/admin/general-setting', '2021-09-16 13:31:36', '2021-09-16 13:31:36'),
(373, 1, 2, '105.224.247.252', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2021-09-16 13:31:39', '2021-09-16 13:31:39'),
(374, 1, 2, '105.224.247.252', 'admin.notification.edit', 'https://tchest.co.za/admin/notification-settings', '2021-09-16 13:31:43', '2021-09-16 13:31:43'),
(375, 1, 2, '105.224.247.252', 'admin.company_setting.theme', 'https://tchest.co.za/admin/company_setting_theme', '2021-09-16 13:31:46', '2021-09-16 13:31:46'),
(376, 1, 2, '105.224.247.252', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2021-09-16 13:31:59', '2021-09-16 13:31:59'),
(377, 1, 2, '105.224.247.252', 'admin.admin_users.index', 'https://tchest.co.za/admin/admin_users', '2021-09-16 13:32:05', '2021-09-16 13:32:05'),
(378, 1, 2, '105.224.247.252', 'admin.ajax_admin_users', 'https://tchest.co.za/admin/ajax_admin_users', '2021-09-16 13:32:06', '2021-09-16 13:32:06'),
(379, 1, 2, '105.224.247.252', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-16 13:32:15', '2021-09-16 13:32:15'),
(380, 1, 2, '105.224.247.252', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-16 13:33:44', '2021-09-16 13:33:44'),
(381, 1, 2, '105.224.247.252', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-16 13:33:45', '2021-09-16 13:33:45'),
(382, 1, 2, '105.224.247.252', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-16 13:33:48', '2021-09-16 13:33:48'),
(383, 1, 2, '105.224.247.252', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-16 13:33:48', '2021-09-16 13:33:48'),
(384, 1, 2, '105.224.247.252', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-09-16 13:33:56', '2021-09-16 13:33:56'),
(385, 1, 2, '105.224.247.252', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-09-16 13:33:56', '2021-09-16 13:33:56'),
(386, 1, 2, '105.224.247.252', 'admin.getlogin', 'https://tchest.co.za/admin', '2021-09-16 13:34:40', '2021-09-16 13:34:40'),
(387, 1, 2, '105.224.247.252', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-16 13:34:40', '2021-09-16 13:34:40'),
(388, 1, 2, '105.224.247.252', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-16 13:34:41', '2021-09-16 13:34:41'),
(389, 1, 2, '105.224.247.252', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-09-16 13:34:50', '2021-09-16 13:34:50'),
(390, 1, 2, '105.224.247.252', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-16 13:34:53', '2021-09-16 13:34:53'),
(391, 1, 2, '105.224.247.252', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-16 13:34:53', '2021-09-16 13:34:53'),
(392, 1, 2, '105.224.247.252', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-09-16 13:35:06', '2021-09-16 13:35:06'),
(393, 1, 2, '105.224.247.252', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-09-16 13:35:07', '2021-09-16 13:35:07'),
(394, 1, 2, '105.224.247.252', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2021-09-16 13:37:45', '2021-09-16 13:37:45'),
(395, 1, 2, '105.224.247.252', 'admin.awards.store', 'https://tchest.co.za/admin/awards', '2021-09-16 13:38:13', '2021-09-16 13:38:13'),
(396, 1, 2, '105.224.247.252', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-09-16 13:38:18', '2021-09-16 13:38:18'),
(397, 1, 2, '105.224.247.252', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-09-16 13:38:18', '2021-09-16 13:38:18'),
(398, 1, 2, '105.224.247.252', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-16 13:38:28', '2021-09-16 13:38:28'),
(399, 1, 2, '105.224.247.252', 'admin.holidays.store', 'https://tchest.co.za/admin/holidays', '2021-09-16 13:39:14', '2021-09-16 13:39:14'),
(400, 1, 2, '105.224.247.252', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-16 13:39:15', '2021-09-16 13:39:15'),
(401, 1, 2, '105.224.247.252', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-16 13:39:23', '2021-09-16 13:39:23'),
(402, 1, 2, '105.224.247.252', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-16 13:39:24', '2021-09-16 13:39:24'),
(403, 1, 2, '105.224.247.252', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-09-16 13:39:37', '2021-09-16 13:39:37'),
(404, 1, 2, '105.224.247.252', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-09-16 13:39:37', '2021-09-16 13:39:37'),
(405, 1, 2, '105.224.247.252', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-16 13:42:55', '2021-09-16 13:42:55'),
(406, 1, 2, '105.224.247.252', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-16 13:42:55', '2021-09-16 13:42:55'),
(407, 1, 2, '105.224.247.252', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-16 13:43:01', '2021-09-16 13:43:01'),
(408, 1, 2, '105.224.247.252', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-09-16 13:43:08', '2021-09-16 13:43:08'),
(409, 1, 2, '105.224.247.252', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2021-09-16 13:43:57', '2021-09-16 13:43:57'),
(410, 1, 2, '105.224.247.252', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-16 13:44:00', '2021-09-16 13:44:00'),
(411, 1, 2, '105.224.247.252', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-16 13:44:00', '2021-09-16 13:44:00'),
(412, 1, 2, '105.224.247.252', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-16 13:44:29', '2021-09-16 13:44:29'),
(413, 1, 2, '105.224.247.252', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-16 13:59:13', '2021-09-16 13:59:13'),
(414, 1, 2, '105.224.247.252', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-16 13:59:14', '2021-09-16 13:59:14'),
(415, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-19 03:17:46', '2021-09-19 03:17:46'),
(416, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-19 03:17:55', '2021-09-19 03:17:55'),
(417, 1, 2, '103.54.36.68', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-19 03:18:32', '2021-09-19 03:18:32'),
(418, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-19 03:19:43', '2021-09-19 03:19:43'),
(419, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-19 03:19:44', '2021-09-19 03:19:44'),
(420, 1, 2, '103.54.36.68', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2021-09-19 03:19:48', '2021-09-19 03:19:48'),
(421, 1, 2, '103.54.36.68', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-09-19 03:19:49', '2021-09-19 03:19:49'),
(422, 1, 2, '103.54.36.68', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-09-19 03:20:14', '2021-09-19 03:20:14'),
(423, 1, 2, '103.54.36.68', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-09-19 03:20:15', '2021-09-19 03:20:15'),
(424, 1, 2, '103.54.36.68', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2021-09-19 03:20:19', '2021-09-19 03:20:19'),
(425, 1, 2, '103.54.36.68', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-09-19 03:26:19', '2021-09-19 03:26:19'),
(426, 1, 2, '103.54.36.68', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-09-19 03:26:20', '2021-09-19 03:26:20'),
(427, 1, 2, '103.54.36.68', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-09-19 03:26:23', '2021-09-19 03:26:23'),
(428, 1, 2, '103.54.36.68', 'admin.getlogin', 'https://tchest.co.za/admin', '2021-09-19 03:28:47', '2021-09-19 03:28:47'),
(429, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-19 03:28:47', '2021-09-19 03:28:47'),
(430, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-19 03:28:48', '2021-09-19 03:28:48'),
(431, 1, 2, '103.54.36.68', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-09-19 03:29:08', '2021-09-19 03:29:08'),
(432, 1, 2, '103.54.36.68', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-09-19 03:34:01', '2021-09-19 03:34:01'),
(433, 1, 2, '103.54.36.68', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-09-19 03:34:02', '2021-09-19 03:34:02'),
(434, 1, 2, '103.54.36.68', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-09-19 03:34:16', '2021-09-19 03:34:16'),
(435, 1, 2, '103.54.36.68', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-09-19 03:34:36', '2021-09-19 03:34:36'),
(436, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-19 03:49:55', '2021-09-19 03:49:55'),
(437, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-19 03:49:55', '2021-09-19 03:49:55'),
(438, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-19 03:50:00', '2021-09-19 03:50:00'),
(439, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-19 03:50:00', '2021-09-19 03:50:00'),
(440, 1, 2, '103.54.36.68', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-09-19 03:50:12', '2021-09-19 03:50:12'),
(441, 1, 2, '103.54.36.68', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-09-19 03:50:12', '2021-09-19 03:50:12'),
(442, 1, 2, '103.54.36.68', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-19 03:50:18', '2021-09-19 03:50:18'),
(443, 1, 2, '103.54.36.68', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-19 03:50:19', '2021-09-19 03:50:19'),
(444, 1, 2, '103.54.36.68', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2021-09-19 03:50:33', '2021-09-19 03:50:33'),
(445, 1, 2, '103.54.36.68', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-09-19 03:52:20', '2021-09-19 03:52:20'),
(446, 1, 2, '103.54.36.68', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2021-09-19 03:52:31', '2021-09-19 03:52:31'),
(447, 1, 2, '103.54.36.68', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-19 03:52:58', '2021-09-19 03:52:58'),
(499, 1, 2, '103.54.36.68', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-21 03:03:00', '2021-09-21 03:03:00'),
(500, 1, 2, '103.54.36.68', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-21 03:03:01', '2021-09-21 03:03:01'),
(501, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 03:49:04', '2021-09-21 03:49:04'),
(502, 1, 2, '103.54.36.68', 'admin.login', 'https://tchest.co.za/admin/login', '2021-09-21 04:01:01', '2021-09-21 04:01:01'),
(503, 1, 2, '103.54.36.68', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-21 04:01:16', '2021-09-21 04:01:16'),
(504, 1, 2, '103.54.36.68', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-09-21 04:34:21', '2021-09-21 04:34:21'),
(505, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:34:22', '2021-09-21 04:34:22'),
(506, 1, 2, '103.54.36.68', 'admin.expenses.create', 'https://tchest.co.za/admin/expenses/create', '2021-09-21 04:34:24', '2021-09-21 04:34:24'),
(507, 1, 2, '103.54.36.68', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-09-21 04:35:56', '2021-09-21 04:35:56'),
(508, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:35:56', '2021-09-21 04:35:56'),
(509, 1, 2, '103.54.36.68', 'admin.expense.change_status', 'https://tchest.co.za/admin/expense_change_status/8', '2021-09-21 04:36:02', '2021-09-21 04:36:02'),
(510, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:36:03', '2021-09-21 04:36:03'),
(511, 1, 2, '103.54.36.68', 'admin.expense.change_status', 'https://tchest.co.za/admin/expense_change_status/7', '2021-09-21 04:36:08', '2021-09-21 04:36:08'),
(512, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:36:08', '2021-09-21 04:36:08'),
(513, 1, 2, '103.54.36.68', 'admin.expense.change_status', 'https://tchest.co.za/admin/expense_change_status/6', '2021-09-21 04:36:10', '2021-09-21 04:36:10'),
(514, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:36:11', '2021-09-21 04:36:11'),
(515, 1, 2, '103.54.36.68', 'admin.expense.change_status', 'https://tchest.co.za/admin/expense_change_status/2', '2021-09-21 04:36:12', '2021-09-21 04:36:12'),
(516, 1, 2, '103.54.36.68', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-21 04:36:12', '2021-09-21 04:36:12'),
(517, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-21 04:37:05', '2021-09-21 04:37:05'),
(518, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-21 04:37:05', '2021-09-21 04:37:05'),
(519, 1, 2, '103.54.36.68', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-09-21 04:37:08', '2021-09-21 04:37:08'),
(520, 1, 2, '103.54.36.68', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-21 04:37:12', '2021-09-21 04:37:12'),
(521, 1, 2, '103.54.36.68', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-21 04:37:12', '2021-09-21 04:37:12'),
(522, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 05:20:03', '2021-09-21 05:20:03'),
(523, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 05:38:04', '2021-09-21 05:38:04'),
(524, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 05:56:03', '2021-09-21 05:56:03'),
(525, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 06:14:03', '2021-09-21 06:14:03'),
(526, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 06:36:08', '2021-09-21 06:36:08'),
(527, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 06:54:09', '2021-09-21 06:54:09'),
(531, 1, 2, '103.54.36.68', 'admin.login', 'https://tchest.co.za/admin/login', '2021-09-21 07:05:00', '2021-09-21 07:05:00'),
(532, 1, 2, '103.54.36.68', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-21 07:05:06', '2021-09-21 07:05:06'),
(533, 1, 2, '103.54.36.68', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-09-21 07:06:33', '2021-09-21 07:06:33'),
(534, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 07:26:42', '2021-09-21 07:26:42'),
(535, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 07:44:44', '2021-09-21 07:44:44'),
(536, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 08:03:19', '2021-09-21 08:03:19'),
(537, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 08:22:19', '2021-09-21 08:22:19'),
(538, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 08:41:19', '2021-09-21 08:41:19'),
(539, 1, 2, '103.54.36.68', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-21 09:00:19', '2021-09-21 09:00:19'),
(540, 1, 2, '41.114.55.137', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-23 07:26:10', '2021-09-23 07:26:10'),
(541, 1, 2, '41.114.55.137', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-23 07:26:11', '2021-09-23 07:26:11'),
(542, 1, 2, '41.114.55.137', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-09-23 07:26:19', '2021-09-23 07:26:19'),
(543, 1, 2, '41.114.55.137', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-23 07:53:49', '2021-09-23 07:53:49'),
(544, 1, 2, '41.114.55.137', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-23 07:53:50', '2021-09-23 07:53:50'),
(545, 1, 2, '41.114.55.137', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-23 07:53:59', '2021-09-23 07:53:59'),
(546, 1, 2, '41.114.55.137', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-23 08:33:35', '2021-09-23 08:33:35'),
(547, 1, 2, '41.114.55.137', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-23 08:33:36', '2021-09-23 08:33:36'),
(548, 1, 2, '41.114.55.137', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-23 08:33:48', '2021-09-23 08:33:48'),
(549, 1, 2, '41.114.55.137', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-23 08:33:49', '2021-09-23 08:33:49'),
(550, 1, 2, '41.114.55.137', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-09-23 08:34:12', '2021-09-23 08:34:12'),
(551, 1, 2, '41.114.55.137', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-09-23 08:34:13', '2021-09-23 08:34:13'),
(552, 1, 2, '41.114.55.137', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-09-23 08:34:27', '2021-09-23 08:34:27'),
(553, 1, 2, '41.114.55.137', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2021-09-23 08:34:48', '2021-09-23 08:34:48'),
(554, 1, 2, '41.114.55.137', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-09-23 08:34:51', '2021-09-23 08:34:51'),
(555, 1, 2, '41.114.55.137', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-09-23 08:34:52', '2021-09-23 08:34:52'),
(556, 1, 2, '41.114.55.137', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-09-23 08:35:20', '2021-09-23 08:35:20'),
(557, 1, 2, '41.114.55.137', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-23 08:35:57', '2021-09-23 08:35:57'),
(558, 1, 2, '41.114.55.137', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-23 08:35:58', '2021-09-23 08:35:58'),
(559, 1, 2, '41.114.55.137', 'admin.payrolls.show', 'https://tchest.co.za/admin/payrolls/2', '2021-09-23 08:36:08', '2021-09-23 08:36:08'),
(560, 1, 2, '41.114.55.137', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-09-23 08:36:23', '2021-09-23 08:36:23'),
(561, 1, 2, '41.114.55.137', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-09-23 08:36:23', '2021-09-23 08:36:23'),
(562, 1, 2, '41.114.55.137', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-09-23 08:40:35', '2021-09-23 08:40:35'),
(563, 1, 2, '41.114.55.137', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-23 08:40:44', '2021-09-23 08:40:44'),
(564, 1, 2, '41.114.55.137', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-23 08:40:45', '2021-09-23 08:40:45'),
(565, 1, 2, '41.114.55.137', 'admin.employees.import', 'https://tchest.co.za/admin/employees/import', '2021-09-23 08:40:51', '2021-09-23 08:40:51'),
(566, 1, 2, '41.114.55.137', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-09-23 08:41:02', '2021-09-23 08:41:02'),
(567, 1, 2, '41.114.55.137', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-09-23 08:41:03', '2021-09-23 08:41:03'),
(568, 1, 2, '41.114.55.137', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-23 08:41:06', '2021-09-23 08:41:06'),
(569, 1, 2, '41.114.55.137', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-23 08:41:07', '2021-09-23 08:41:07'),
(570, 1, 2, '41.114.55.137', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-09-23 08:41:20', '2021-09-23 08:41:20'),
(571, 1, 2, '41.114.55.137', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-09-23 08:41:21', '2021-09-23 08:41:21'),
(572, 1, 2, '41.114.55.137', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-09-23 08:41:39', '2021-09-23 08:41:39'),
(573, 1, 2, '41.114.55.137', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-09-23 08:41:40', '2021-09-23 08:41:40'),
(574, 1, 2, '41.114.55.137', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-09-23 08:43:49', '2021-09-23 08:43:49'),
(575, 1, 2, '41.114.55.137', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2021-09-23/edit', '2021-09-23 08:43:50', '2021-09-23 08:43:50'),
(576, 1, 2, '41.114.55.137', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-09-23 08:43:59', '2021-09-23 08:43:59'),
(577, 1, 2, '41.114.55.137', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-09-23 08:44:00', '2021-09-23 08:44:00'),
(578, 1, 2, '41.114.55.137', 'admin.leavetypes.index', 'https://tchest.co.za/admin/leavetypes', '2021-09-23 08:44:16', '2021-09-23 08:44:16'),
(579, 1, 2, '41.114.55.137', 'admin.leavetypes.ajax_list', 'https://tchest.co.za/admin/leavetypes/ajax_list', '2021-09-23 08:44:17', '2021-09-23 08:44:17'),
(580, 1, 2, '41.114.55.137', 'admin.leavetypes.edit', 'https://tchest.co.za/admin/leavetypes/2/edit', '2021-09-23 08:44:27', '2021-09-23 08:44:27'),
(581, 1, 2, '41.114.55.137', 'admin.leave_applications.index', 'https://tchest.co.za/admin/leave_applications', '2021-09-23 08:45:47', '2021-09-23 08:45:47'),
(582, 1, 2, '41.114.55.137', 'admin.leave_applications', 'https://tchest.co.za/admin/leave_applications/ajaxApplications', '2021-09-23 08:45:48', '2021-09-23 08:45:48'),
(583, 1, 2, '41.114.55.137', 'admin.jobs.index', 'https://tchest.co.za/admin/jobs', '2021-09-23 08:48:13', '2021-09-23 08:48:13'),
(584, 1, 2, '41.114.55.137', 'admin.ajax_jobs', 'https://tchest.co.za/admin/ajax_jobs', '2021-09-23 08:48:14', '2021-09-23 08:48:14'),
(585, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 09:07:51', '2021-09-23 09:07:51'),
(586, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 09:36:40', '2021-09-23 09:36:40'),
(587, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 09:54:39', '2021-09-23 09:54:39'),
(588, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 10:12:40', '2021-09-23 10:12:40');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(589, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 10:30:40', '2021-09-23 10:30:40'),
(590, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 10:48:40', '2021-09-23 10:48:40'),
(591, 1, 2, '41.114.55.137', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-09-23 11:06:40', '2021-09-23 11:06:40'),
(592, 1, 2, '105.226.130.197', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-29 03:50:10', '2021-09-29 03:50:10'),
(593, 1, 2, '105.226.130.197', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-29 03:50:12', '2021-09-29 03:50:12'),
(594, 1, 2, '105.226.130.197', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-29 03:54:44', '2021-09-29 03:54:44'),
(595, 1, 2, '105.226.130.197', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-29 04:06:09', '2021-09-29 04:06:09'),
(596, 1, 2, '105.226.130.197', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-29 04:06:10', '2021-09-29 04:06:10'),
(597, 1, 2, '105.226.130.197', 'admin.leavetypes.index', 'https://tchest.co.za/admin/leavetypes', '2021-09-29 04:06:18', '2021-09-29 04:06:18'),
(598, 1, 2, '105.226.130.197', 'admin.leavetypes.ajax_list', 'https://tchest.co.za/admin/leavetypes/ajax_list', '2021-09-29 04:06:18', '2021-09-29 04:06:18'),
(599, 1, 2, '105.226.130.197', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-09-29 04:06:25', '2021-09-29 04:06:25'),
(600, 1, 2, '105.226.130.197', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-09-29 04:06:25', '2021-09-29 04:06:25'),
(601, 1, 2, '105.226.130.197', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2021-09-29 04:06:27', '2021-09-29 04:06:27'),
(602, 1, 2, '105.226.130.197', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-09-29 04:06:28', '2021-09-29 04:06:28'),
(603, 1, 2, '105.226.130.197', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-29 04:07:12', '2021-09-29 04:07:12'),
(604, 1, 2, '105.226.130.197', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-09-29 04:07:30', '2021-09-29 04:07:30'),
(605, 1, 2, '105.226.130.197', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-09-29 04:07:30', '2021-09-29 04:07:30'),
(606, 1, 2, '105.226.130.197', 'admin.leave_applications.index', 'https://tchest.co.za/admin/leave_applications', '2021-09-29 04:07:36', '2021-09-29 04:07:36'),
(607, 1, 2, '105.226.130.197', 'admin.leave_applications', 'https://tchest.co.za/admin/leave_applications/ajaxApplications', '2021-09-29 04:07:37', '2021-09-29 04:07:37'),
(608, 1, 2, '105.226.130.197', 'admin.leavetypes.index', 'https://tchest.co.za/admin/leavetypes', '2021-09-29 04:07:39', '2021-09-29 04:07:39'),
(609, 1, 2, '105.226.130.197', 'admin.leavetypes.ajax_list', 'https://tchest.co.za/admin/leavetypes/ajax_list', '2021-09-29 04:07:39', '2021-09-29 04:07:39'),
(610, 1, 2, '105.226.130.197', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-09-29 04:09:16', '2021-09-29 04:09:16'),
(611, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-10-04 04:22:07', '2021-10-04 04:22:07'),
(612, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-04 04:22:11', '2021-10-04 04:22:11'),
(613, 1, 2, '103.230.62.3', 'admin.noticeboards.index', 'http://tchest.co.za/admin/noticeboards', '2021-10-04 04:22:54', '2021-10-04 04:22:54'),
(614, 1, 2, '103.230.62.3', 'admin.ajax_notices', 'http://tchest.co.za/admin/ajax_notices', '2021-10-04 04:23:09', '2021-10-04 04:23:09'),
(615, 1, 2, '103.230.62.3', 'admin.noticeboards.edit', 'http://tchest.co.za/admin/noticeboards/3/edit', '2021-10-04 04:25:05', '2021-10-04 04:25:05'),
(616, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-10-04 04:48:33', '2021-10-04 04:48:33'),
(617, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-04 04:48:37', '2021-10-04 04:48:37'),
(618, 1, 2, '103.230.62.3', 'admin.awards.index', 'http://tchest.co.za/admin/awards', '2021-10-04 04:50:56', '2021-10-04 04:50:56'),
(619, 1, 2, '103.230.62.3', 'admin.ajax_awards', 'http://tchest.co.za/admin/ajax_awards', '2021-10-04 04:50:58', '2021-10-04 04:50:58'),
(620, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-04 04:51:08', '2021-10-04 04:51:08'),
(621, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-10-04 05:47:57', '2021-10-04 05:47:57'),
(622, 1, 2, '103.230.62.3', 'admin.screen.lock', 'http://tchest.co.za/screenlock', '2021-10-04 06:09:53', '2021-10-04 06:09:53'),
(623, 1, 2, '103.230.62.3', 'admin.login', 'http://tchest.co.za/admin/login', '2021-10-04 06:09:59', '2021-10-04 06:09:59'),
(624, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-10-04 06:09:59', '2021-10-04 06:09:59'),
(625, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-04 06:10:00', '2021-10-04 06:10:00'),
(626, 1, 2, '103.230.62.3', 'admin.noticeboards.index', 'http://tchest.co.za/admin/noticeboards', '2021-10-04 06:10:07', '2021-10-04 06:10:07'),
(627, 1, 2, '103.230.62.3', 'admin.ajax_notices', 'http://tchest.co.za/admin/ajax_notices', '2021-10-04 06:10:07', '2021-10-04 06:10:07'),
(628, 1, 2, '103.230.62.3', 'admin.noticeboards.edit', 'http://tchest.co.za/admin/noticeboards/3/edit', '2021-10-04 06:10:47', '2021-10-04 06:10:47'),
(629, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-10-04 06:30:30', '2021-10-04 06:30:30'),
(630, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-10-04 06:48:32', '2021-10-04 06:48:32'),
(631, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-10-04 07:07:20', '2021-10-04 07:07:20'),
(632, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-10-04 07:26:21', '2021-10-04 07:26:21'),
(633, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-05 02:33:50', '2021-10-05 02:33:50'),
(634, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-05 02:33:58', '2021-10-05 02:33:58'),
(635, 1, 2, '103.230.62.3', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-10-05 02:34:03', '2021-10-05 02:34:03'),
(636, 1, 2, '103.230.62.3', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-10-05 02:34:05', '2021-10-05 02:34:05'),
(637, 1, 2, '103.230.62.3', 'admin.expenses.edit', 'https://tchest.co.za/admin/expenses/2/edit', '2021-10-05 02:34:09', '2021-10-05 02:34:09'),
(638, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-05 02:41:28', '2021-10-05 02:41:28'),
(639, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-05 02:41:29', '2021-10-05 02:41:29'),
(640, 1, 2, '103.230.62.3', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-10-05 02:41:34', '2021-10-05 02:41:34'),
(641, 1, 2, '103.230.62.3', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-10-05 02:41:35', '2021-10-05 02:41:35'),
(642, 1, 2, '103.230.62.3', 'admin.expenses.edit', 'https://tchest.co.za/admin/expenses/2/edit', '2021-10-05 02:41:37', '2021-10-05 02:41:37'),
(643, 1, 2, '103.230.62.3', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-10-05 02:42:26', '2021-10-05 02:42:26'),
(644, 1, 2, '103.230.62.3', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-05 02:42:26', '2021-10-05 02:42:26'),
(645, 1, 2, '103.230.62.3', 'admin.payrolls.edit', 'https://tchest.co.za/admin/payrolls/2/edit', '2021-10-05 02:42:28', '2021-10-05 02:42:28'),
(646, 1, 2, '103.230.62.3', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-05 02:44:25', '2021-10-05 02:44:25'),
(647, 1, 2, '103.230.62.3', 'admin.payrolls.show', 'https://tchest.co.za/admin/payrolls/2', '2021-10-05 02:44:28', '2021-10-05 02:44:28'),
(648, 1, 2, '103.230.62.3', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-05 02:44:37', '2021-10-05 02:44:37'),
(649, 1, 2, '103.230.62.3', 'admin.payrolls.edit', 'https://tchest.co.za/admin/payrolls/2/edit', '2021-10-05 02:44:38', '2021-10-05 02:44:38'),
(650, 1, 2, '103.230.62.3', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-05 02:44:40', '2021-10-05 02:44:40'),
(651, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 03:05:14', '2021-10-05 03:05:14'),
(652, 1, 2, '103.230.62.3', 'admin.login', 'https://tchest.co.za/admin/login', '2021-10-05 03:11:15', '2021-10-05 03:11:15'),
(653, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 03:29:17', '2021-10-05 03:29:17'),
(654, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 03:47:20', '2021-10-05 03:47:20'),
(655, 1, 2, '103.230.62.3', 'admin.login', 'https://tchest.co.za/admin/login', '2021-10-05 04:00:58', '2021-10-05 04:00:58'),
(656, 1, 2, '103.230.62.3', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-05 04:01:03', '2021-10-05 04:01:03'),
(657, 1, 2, '103.230.62.3', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-10-05 05:00:08', '2021-10-05 05:00:08'),
(658, 1, 2, '103.230.62.3', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-05 05:00:09', '2021-10-05 05:00:09'),
(659, 1, 2, '103.230.62.3', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-10-05 05:00:14', '2021-10-05 05:00:14'),
(660, 1, 2, '103.230.62.3', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-10-05 05:00:15', '2021-10-05 05:00:15'),
(661, 1, 2, '103.230.62.3', 'admin.expenses.edit', 'https://tchest.co.za/admin/expenses/2/edit', '2021-10-05 05:00:20', '2021-10-05 05:00:20'),
(662, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 05:20:27', '2021-10-05 05:20:27'),
(663, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 05:44:28', '2021-10-05 05:44:28'),
(664, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 06:03:13', '2021-10-05 06:03:13'),
(665, 1, 2, '103.230.62.3', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-05 06:21:11', '2021-10-05 06:21:11'),
(666, 1, 2, '103.230.62.3', 'admin.login', 'https://tchest.co.za/admin/login', '2021-10-05 06:33:46', '2021-10-05 06:33:46'),
(667, 1, 2, '103.230.62.3', 'admin.login', 'https://tchest.co.za/admin/login', '2021-10-05 06:33:50', '2021-10-05 06:33:50'),
(668, 1, 2, '103.230.62.3', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-05 06:33:54', '2021-10-05 06:33:54'),
(672, 1, 2, '8.29.105.60', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-07 07:51:00', '2021-10-07 07:51:00'),
(673, 1, 2, '8.29.105.60', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-07 07:51:01', '2021-10-07 07:51:01'),
(674, 1, 2, '8.29.105.60', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-07 07:51:26', '2021-10-07 07:51:26'),
(675, 1, 2, '8.29.105.60', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-07 08:06:15', '2021-10-07 08:06:15'),
(676, 1, 2, '8.29.105.60', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-07 08:06:16', '2021-10-07 08:06:16'),
(677, 1, 2, '8.29.105.60', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-07 08:06:28', '2021-10-07 08:06:28'),
(743, 1, 2, '105.226.154.192', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-07 12:28:45', '2021-10-07 12:28:45'),
(744, 1, 2, '105.226.154.192', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-07 12:28:46', '2021-10-07 12:28:46'),
(745, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:28:56', '2021-10-07 12:28:56'),
(746, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:28:57', '2021-10-07 12:28:57'),
(747, 1, 2, '105.226.154.192', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-10-07 12:30:04', '2021-10-07 12:30:04'),
(748, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:30:05', '2021-10-07 12:30:05'),
(749, 1, 2, '105.226.154.192', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2021-10-07 12:36:35', '2021-10-07 12:36:35'),
(750, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:36:36', '2021-10-07 12:36:36'),
(751, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:36:37', '2021-10-07 12:36:37'),
(752, 1, 2, '105.226.154.192', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-10-07 12:36:40', '2021-10-07 12:36:40'),
(753, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:36:41', '2021-10-07 12:36:41'),
(754, 1, 2, '105.226.154.192', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2021-10-07 12:41:32', '2021-10-07 12:41:32'),
(755, 1, 2, '105.226.154.192', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2021-10-07 12:41:59', '2021-10-07 12:41:59'),
(756, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:44:21', '2021-10-07 12:44:21'),
(757, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:44:21', '2021-10-07 12:44:21'),
(758, 1, 2, '105.226.154.192', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-10-07 12:44:22', '2021-10-07 12:44:22'),
(759, 1, 2, '105.226.154.192', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-10-07 12:44:25', '2021-10-07 12:44:25'),
(760, 1, 2, '105.226.154.192', 'admin.departments.store', 'https://tchest.co.za/admin/departments', '2021-10-07 12:44:53', '2021-10-07 12:44:53'),
(761, 1, 2, '105.226.154.192', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-10-07 12:44:53', '2021-10-07 12:44:53'),
(762, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:44:58', '2021-10-07 12:44:58'),
(763, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:44:59', '2021-10-07 12:44:59'),
(764, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:45:08', '2021-10-07 12:45:08'),
(765, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:45:09', '2021-10-07 12:45:09'),
(766, 1, 2, '105.226.154.192', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-10-07 12:45:11', '2021-10-07 12:45:11'),
(767, 1, 2, '105.226.154.192', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-10-07 12:45:13', '2021-10-07 12:45:13'),
(768, 1, 2, '105.226.154.192', 'admin.departments.store', 'https://tchest.co.za/admin/departments', '2021-10-07 12:45:21', '2021-10-07 12:45:21'),
(769, 1, 2, '105.226.154.192', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-10-07 12:45:22', '2021-10-07 12:45:22'),
(770, 1, 2, '105.226.154.192', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2021-10-07 12:45:24', '2021-10-07 12:45:24'),
(771, 1, 2, '105.226.154.192', 'admin.departments.store', 'https://tchest.co.za/admin/departments', '2021-10-07 12:45:31', '2021-10-07 12:45:31'),
(772, 1, 2, '105.226.154.192', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2021-10-07 12:45:32', '2021-10-07 12:45:32'),
(773, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:45:35', '2021-10-07 12:45:35'),
(774, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:45:36', '2021-10-07 12:45:36'),
(775, 1, 2, '105.226.154.192', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/4/edit', '2021-10-07 12:45:38', '2021-10-07 12:45:38'),
(776, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:45:39', '2021-10-07 12:45:39'),
(777, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:45:52', '2021-10-07 12:45:52'),
(778, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:45:56', '2021-10-07 12:45:56'),
(779, 1, 2, '105.226.154.192', 'admin.employees.update', 'https://tchest.co.za/admin/employees/4', '2021-10-07 12:46:01', '2021-10-07 12:46:01'),
(780, 1, 2, '105.226.154.192', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-10-07 12:46:24', '2021-10-07 12:46:24'),
(781, 1, 2, '105.226.154.192', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-10-07 12:46:24', '2021-10-07 12:46:24'),
(782, 1, 2, '105.226.154.192', 'admin.getlogin', 'https://tchest.co.za/admin', '2021-10-07 12:46:26', '2021-10-07 12:46:26'),
(783, 1, 2, '105.226.154.192', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-07 12:46:26', '2021-10-07 12:46:26'),
(784, 1, 2, '105.226.154.192', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-07 12:46:27', '2021-10-07 12:46:27'),
(785, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:46:31', '2021-10-07 12:46:31'),
(786, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:46:31', '2021-10-07 12:46:31'),
(787, 1, 2, '105.226.154.192', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-10-07 12:46:35', '2021-10-07 12:46:35'),
(788, 1, 2, '105.226.154.192', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:47:19', '2021-10-07 12:47:19'),
(789, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:47:26', '2021-10-07 12:47:26'),
(790, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:47:27', '2021-10-07 12:47:27'),
(791, 1, 2, '105.226.154.192', 'admin.noticeboards.destroy', 'https://tchest.co.za/admin/noticeboards/3', '2021-10-07 12:47:33', '2021-10-07 12:47:33'),
(792, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:47:33', '2021-10-07 12:47:33'),
(793, 1, 2, '105.226.154.192', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-10-07 12:47:41', '2021-10-07 12:47:41'),
(794, 1, 2, '105.226.154.192', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:48:25', '2021-10-07 12:48:25'),
(795, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:48:30', '2021-10-07 12:48:30'),
(796, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:48:31', '2021-10-07 12:48:31'),
(797, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:48:35', '2021-10-07 12:48:35'),
(798, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:48:36', '2021-10-07 12:48:36'),
(799, 1, 2, '105.226.154.192', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/4/edit', '2021-10-07 12:48:41', '2021-10-07 12:48:41'),
(800, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:48:41', '2021-10-07 12:48:41'),
(801, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:48:49', '2021-10-07 12:48:49'),
(802, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:48:50', '2021-10-07 12:48:50'),
(803, 1, 2, '105.226.154.192', 'admin.noticeboards.edit', 'https://tchest.co.za/admin/noticeboards/9/edit', '2021-10-07 12:48:54', '2021-10-07 12:48:54'),
(804, 1, 2, '105.226.154.192', 'admin.noticeboards.update', 'https://tchest.co.za/admin/noticeboards/9', '2021-10-07 12:49:02', '2021-10-07 12:49:02'),
(805, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:49:06', '2021-10-07 12:49:06'),
(806, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:49:07', '2021-10-07 12:49:07'),
(807, 1, 2, '105.226.154.192', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-10-07 12:49:08', '2021-10-07 12:49:08'),
(808, 1, 2, '105.226.154.192', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:50:41', '2021-10-07 12:50:41'),
(809, 1, 2, '105.226.154.192', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-07 12:50:43', '2021-10-07 12:50:43'),
(810, 1, 2, '105.226.154.192', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-07 12:50:44', '2021-10-07 12:50:44'),
(811, 1, 2, '105.226.154.192', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-10-07 12:50:50', '2021-10-07 12:50:50'),
(812, 1, 2, '105.226.154.192', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-07 12:50:50', '2021-10-07 12:50:50'),
(813, 1, 2, '105.226.154.192', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-10-07 12:50:56', '2021-10-07 12:50:56'),
(814, 1, 2, '105.226.154.192', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-10-07 12:50:59', '2021-10-07 12:50:59'),
(815, 1, 2, '105.226.154.192', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2021-10-07 12:52:00', '2021-10-07 12:52:00'),
(816, 1, 2, '105.226.154.192', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-10-07 12:52:03', '2021-10-07 12:52:03'),
(817, 1, 2, '105.226.154.192', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-07 12:52:04', '2021-10-07 12:52:04'),
(818, 1, 2, '105.226.154.192', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2021-10-07 12:52:06', '2021-10-07 12:52:06'),
(819, 1, 2, '105.226.154.192', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2021-10-07 12:52:12', '2021-10-07 12:52:12'),
(820, 1, 2, '105.226.154.192', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2021-10-07 12:52:45', '2021-10-07 12:52:45'),
(821, 1, 2, '105.226.154.192', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-10-07 12:52:45', '2021-10-07 12:52:45'),
(822, 1, 2, '105.226.154.192', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-10-07 12:52:46', '2021-10-07 12:52:46'),
(823, 1, 2, '105.226.154.192', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-10-07 12:52:49', '2021-10-07 12:52:49'),
(824, 1, 2, '105.226.154.192', 'admin.holidays.store', 'https://tchest.co.za/admin/holidays', '2021-10-07 12:53:46', '2021-10-07 12:53:46'),
(825, 1, 2, '105.226.154.192', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-10-07 12:53:46', '2021-10-07 12:53:46'),
(826, 1, 2, '105.226.154.192', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-10-07 12:53:52', '2021-10-07 12:53:52'),
(827, 1, 2, '105.226.154.192', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-10-07 12:53:53', '2021-10-07 12:53:53'),
(828, 1, 2, '105.226.154.192', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2021-10-07 12:53:57', '2021-10-07 12:53:57'),
(829, 1, 2, '105.226.154.192', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-10-07 12:54:00', '2021-10-07 12:54:00'),
(830, 1, 2, '105.226.154.192', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-10-07 12:54:00', '2021-10-07 12:54:00'),
(831, 1, 2, '105.226.154.192', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2021-10-07 12:54:03', '2021-10-07 12:54:03'),
(832, 1, 2, '105.226.154.192', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2021-10-07 12:54:04', '2021-10-07 12:54:04'),
(833, 1, 2, '105.226.154.192', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2021-10-07 12:54:11', '2021-10-07 12:54:11'),
(834, 1, 2, '105.226.154.192', 'admin.awards.store', 'https://tchest.co.za/admin/awards', '2021-10-07 12:54:26', '2021-10-07 12:54:26'),
(835, 1, 2, '105.226.154.192', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2021-10-07 12:54:26', '2021-10-07 12:54:26'),
(836, 1, 2, '105.226.154.192', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2021-10-07 12:54:27', '2021-10-07 12:54:27'),
(837, 1, 2, '105.226.154.192', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2021-10-07 12:54:36', '2021-10-07 12:54:36'),
(838, 1, 2, '105.226.154.192', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-07 12:54:43', '2021-10-07 12:54:43'),
(839, 1, 2, '105.226.154.192', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-07 12:54:53', '2021-10-07 12:54:53'),
(840, 1, 2, '105.226.154.192', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-07 12:54:54', '2021-10-07 12:54:54'),
(841, 1, 2, '105.226.154.192', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2021-10-07 12:56:02', '2021-10-07 12:56:02'),
(842, 1, 2, '105.226.154.192', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2021-10-07 12:56:03', '2021-10-07 12:56:03'),
(843, 1, 2, '105.226.154.192', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2021-10-07 12:56:04', '2021-10-07 12:56:04'),
(844, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:56:05', '2021-10-07 12:56:05'),
(845, 1, 2, '105.226.154.192', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2021-10-07 12:57:33', '2021-10-07 12:57:33'),
(846, 1, 2, '105.226.154.192', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2021-10-07 12:58:22', '2021-10-07 12:58:22'),
(847, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-09 07:54:23', '2021-10-09 07:54:23'),
(848, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-09 07:54:24', '2021-10-09 07:54:24'),
(849, 1, 2, '103.230.62.3', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2021-10-09 07:54:42', '2021-10-09 07:54:42'),
(850, 1, 2, '103.230.62.3', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-10-09 07:54:55', '2021-10-09 07:54:55'),
(851, 1, 2, '103.230.62.3', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2021-10-09 07:55:01', '2021-10-09 07:55:01'),
(852, 1, 2, '103.230.62.3', 'admin.admin_users.index', 'https://tchest.co.za/admin/admin_users', '2021-10-09 07:55:05', '2021-10-09 07:55:05'),
(853, 1, 2, '103.230.62.3', 'admin.ajax_admin_users', 'https://tchest.co.za/admin/ajax_admin_users', '2021-10-09 07:55:05', '2021-10-09 07:55:05'),
(854, 1, 2, '103.230.62.3', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2021-10-09 07:58:01', '2021-10-09 07:58:01'),
(855, 1, 2, '103.230.62.3', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-09 07:58:09', '2021-10-09 07:58:09'),
(856, 1, 2, '103.230.62.3', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-11 03:54:21', '2021-10-11 03:54:21'),
(857, 1, 2, '103.230.62.3', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-11 03:54:21', '2021-10-11 03:54:21'),
(858, 1, 2, '103.230.62.3', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2021-10-11 03:54:27', '2021-10-11 03:54:27'),
(859, 1, 2, '103.230.62.3', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-10-11 03:54:31', '2021-10-11 03:54:31'),
(869, 1, 2, '103.230.62.0', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-10-11 10:08:25', '2021-10-11 10:08:25'),
(870, 1, 2, '103.230.62.0', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-10-11 10:08:26', '2021-10-11 10:08:26'),
(871, 1, 2, '103.230.62.0', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-10-11 10:08:39', '2021-10-11 10:08:39'),
(872, 1, 2, '103.230.62.0', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-10-11 10:08:40', '2021-10-11 10:08:40'),
(873, 1, 2, '103.230.62.0', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-10-11 10:33:11', '2021-10-11 10:33:11'),
(874, 1, 2, '105.226.116.22', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-10 11:26:55', '2021-11-10 11:26:55'),
(875, 1, 2, '105.226.116.22', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-10 11:26:57', '2021-11-10 11:26:57'),
(876, 1, 2, '105.226.116.22', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2021-11-10 11:48:54', '2021-11-10 11:48:54'),
(951, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 12:56:04', '2021-11-22 12:56:04'),
(952, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 12:56:05', '2021-11-22 12:56:05'),
(953, 1, 2, '105.186.246.236', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-11-22 12:56:16', '2021-11-22 12:56:16'),
(954, 1, 2, '105.186.246.236', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-11-22 12:56:16', '2021-11-22 12:56:16'),
(955, 1, 2, '105.186.246.236', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-11-22 12:57:48', '2021-11-22 12:57:48'),
(956, 1, 2, '105.186.246.236', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-11-22 12:57:48', '2021-11-22 12:57:48'),
(957, 1, 2, '105.186.246.236', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-11-22 12:57:49', '2021-11-22 12:57:49'),
(958, 1, 2, '105.186.246.236', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2021-11-22/edit', '2021-11-22 12:57:49', '2021-11-22 12:57:49'),
(959, 1, 2, '105.186.246.236', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2021-11-22 12:57:55', '2021-11-22 12:57:55'),
(960, 1, 2, '105.186.246.236', 'admin.attendance_settings.update', 'https://tchest.co.za/admin/attendance_settings/mark_attendance', '2021-11-22 12:58:07', '2021-11-22 12:58:07'),
(961, 1, 2, '105.186.246.236', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-11-22 12:58:10', '2021-11-22 12:58:10'),
(962, 1, 2, '105.186.246.236', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-11-22 12:58:10', '2021-11-22 12:58:10'),
(963, 1, 2, '105.186.246.236', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-11-22 12:58:12', '2021-11-22 12:58:12'),
(964, 1, 2, '105.186.246.236', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2021-11-22/edit', '2021-11-22 12:58:12', '2021-11-22 12:58:12'),
(965, 1, 2, '105.186.246.236', 'admin.attendance.ajax_attendance', 'https://tchest.co.za/admin/attendances/ajax_attendance', '2021-11-22 12:58:12', '2021-11-22 12:58:12'),
(966, 1, 2, '105.186.246.236', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2021-11-22 12:58:30', '2021-11-22 12:58:30'),
(967, 1, 2, '105.186.246.236', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2021-11-22 12:58:31', '2021-11-22 12:58:31'),
(968, 1, 2, '105.186.246.236', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-11-22 12:59:40', '2021-11-22 12:59:40'),
(969, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 13:04:35', '2021-11-22 13:04:35'),
(970, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 13:04:36', '2021-11-22 13:04:36'),
(971, 1, 2, '105.186.246.236', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2021-11-22 13:04:40', '2021-11-22 13:04:40'),
(972, 1, 2, '105.186.246.236', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2021-11-22/edit', '2021-11-22 13:04:40', '2021-11-22 13:04:40'),
(973, 1, 2, '105.186.246.236', 'admin.attendance.ajax_attendance', 'https://tchest.co.za/admin/attendances/ajax_attendance', '2021-11-22 13:04:40', '2021-11-22 13:04:40'),
(974, 1, 2, '105.186.246.236', 'admin.getlogin', 'https://tchest.co.za/admin', '2021-11-22 13:11:16', '2021-11-22 13:11:16'),
(975, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 13:11:17', '2021-11-22 13:11:17'),
(976, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 13:11:17', '2021-11-22 13:11:17'),
(977, 1, 2, '105.186.246.236', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-11-22 13:11:20', '2021-11-22 13:11:20'),
(978, 1, 2, '105.186.246.236', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-11-22 13:11:20', '2021-11-22 13:11:20'),
(979, 1, 2, '105.186.246.236', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2021-11-22 13:12:26', '2021-11-22 13:12:26'),
(980, 1, 2, '105.186.246.236', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2021-11-22 13:12:29', '2021-11-22 13:12:29'),
(981, 1, 2, '105.186.246.236', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2021-11-22 13:12:30', '2021-11-22 13:12:30'),
(982, 1, 2, '105.186.246.236', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-11-22 13:12:50', '2021-11-22 13:12:50'),
(983, 1, 2, '105.186.246.236', 'admin.holidays.store', 'https://tchest.co.za/admin/holidays', '2021-11-22 13:13:21', '2021-11-22 13:13:21'),
(984, 1, 2, '105.186.246.236', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2021-11-22 13:13:21', '2021-11-22 13:13:21'),
(985, 1, 2, '105.186.246.236', 'admin.getlogin', 'https://tchest.co.za/admin', '2021-11-22 13:15:30', '2021-11-22 13:15:30'),
(986, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 13:15:30', '2021-11-22 13:15:30'),
(987, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 13:15:31', '2021-11-22 13:15:31'),
(988, 1, 2, '105.186.246.236', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2021-11-22 13:15:35', '2021-11-22 13:15:35'),
(989, 1, 2, '105.186.246.236', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-11-22 13:15:37', '2021-11-22 13:15:37'),
(990, 1, 2, '105.186.246.236', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-11-22 13:16:22', '2021-11-22 13:16:22'),
(991, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 13:17:41', '2021-11-22 13:17:41'),
(992, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 13:17:43', '2021-11-22 13:17:43'),
(993, 1, 2, '105.186.246.236', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2021-11-22 13:17:53', '2021-11-22 13:17:53'),
(994, 1, 2, '105.186.246.236', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2021-11-22 13:17:54', '2021-11-22 13:17:54'),
(995, 1, 2, '105.186.246.236', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-11-22 13:19:40', '2021-11-22 13:19:40'),
(996, 1, 2, '105.186.246.236', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-11-22 13:19:40', '2021-11-22 13:19:40'),
(997, 1, 2, '105.186.246.236', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-11-22 13:21:02', '2021-11-22 13:21:02'),
(998, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 13:41:52', '2021-11-22 13:41:52'),
(999, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 13:41:53', '2021-11-22 13:41:53'),
(1000, 1, 2, '105.186.246.236', 'admin.logout', 'https://tchest.co.za/admin/logout', '2021-11-22 13:42:19', '2021-11-22 13:42:19'),
(1001, 1, 2, '105.186.246.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-11-22 14:03:54', '2021-11-22 14:03:54'),
(1002, 1, 2, '105.186.246.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-11-22 14:03:55', '2021-11-22 14:03:55'),
(1003, 1, 2, '105.186.246.236', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2021-11-22 14:03:58', '2021-11-22 14:03:58'),
(1004, 1, 2, '105.186.246.236', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2021-11-22 14:04:01', '2021-11-22 14:04:01'),
(1034, 1, 2, '8.38.148.148', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-12-14 06:16:45', '2021-12-14 06:16:45'),
(1035, 1, 2, '8.38.148.148', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-12-14 06:16:49', '2021-12-14 06:16:49'),
(1036, 1, 2, '8.38.148.148', 'admin.payrolls.index', 'http://tchest.co.za/admin/payrolls', '2021-12-14 06:17:03', '2021-12-14 06:17:03'),
(1037, 1, 2, '8.38.148.148', 'admin.ajax_payrolls', 'http://tchest.co.za/admin/ajax_payrolls', '2021-12-14 06:17:07', '2021-12-14 06:17:07'),
(1038, 1, 2, '8.38.148.148', 'admin.payrolls.index', 'http://tchest.co.za/admin/payrolls', '2021-12-14 06:18:23', '2021-12-14 06:18:23'),
(1039, 1, 2, '8.38.148.148', 'admin.ajax_payrolls', 'http://tchest.co.za/admin/ajax_payrolls', '2021-12-14 06:18:24', '2021-12-14 06:18:24'),
(1040, 1, 2, '8.38.148.148', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-12-14 06:46:09', '2021-12-14 06:46:09'),
(1041, 1, 2, '8.38.148.148', 'admin.login', 'http://tchest.co.za/admin/login', '2021-12-14 06:46:43', '2021-12-14 06:46:43'),
(1042, 1, 2, '8.38.148.148', 'admin.holidays.index', 'http://tchest.co.za/admin/holidays', '2021-12-14 06:46:48', '2021-12-14 06:46:48'),
(1043, 1, 2, '8.38.148.148', 'admin.holidays.index', 'http://tchest.co.za/admin/holidays', '2021-12-14 07:38:03', '2021-12-14 07:38:03'),
(1044, 1, 2, '8.38.148.148', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-12-15 06:55:41', '2021-12-15 06:55:41'),
(1045, 1, 2, '8.38.148.148', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-12-15 06:55:43', '2021-12-15 06:55:43'),
(1046, 1, 2, '8.38.148.148', 'admin.expenses.index', 'http://tchest.co.za/admin/expenses', '2021-12-15 06:55:56', '2021-12-15 06:55:56'),
(1047, 1, 2, '8.38.148.148', 'admin.expenses.create', 'http://tchest.co.za/admin/expenses/create', '2021-12-15 06:55:58', '2021-12-15 06:55:58'),
(1048, 1, 2, '8.38.148.148', 'admin.expenses.create', 'http://tchest.co.za/admin/expenses/create', '2021-12-15 06:58:28', '2021-12-15 06:58:28'),
(1049, 1, 2, '8.38.148.148', 'admin.expenses.store', 'http://tchest.co.za/admin/expenses', '2021-12-15 06:58:37', '2021-12-15 06:58:37'),
(1050, 1, 2, '8.38.148.148', 'admin.expenses.store', 'http://tchest.co.za/admin/expenses', '2021-12-15 06:58:41', '2021-12-15 06:58:41'),
(1051, 1, 2, '8.38.148.148', 'admin.expenses.index', 'http://tchest.co.za/admin/expenses', '2021-12-15 06:58:43', '2021-12-15 06:58:43'),
(1052, 1, 2, '8.38.148.148', 'admin.ajax_expenses', 'http://tchest.co.za/admin/ajax_expenses', '2021-12-15 06:58:44', '2021-12-15 06:58:44'),
(1053, 1, 2, '8.38.148.148', 'admin.expenses.create', 'http://tchest.co.za/admin/expenses/create', '2021-12-15 07:01:09', '2021-12-15 07:01:09'),
(1054, 1, 2, '8.38.148.148', 'admin.screenlock.modal', 'http://tchest.co.za/screenlock/modal', '2021-12-15 07:19:43', '2021-12-15 07:19:43'),
(1055, 1, 2, '103.213.242.5', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-12-15 09:17:51', '2021-12-15 09:17:51'),
(1056, 1, 2, '103.213.242.5', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-12-15 09:17:52', '2021-12-15 09:17:52'),
(1057, 1, 2, '103.213.242.5', 'admin.expenses.index', 'http://tchest.co.za/admin/expenses', '2021-12-15 09:17:57', '2021-12-15 09:17:57'),
(1058, 1, 2, '103.213.242.5', 'admin.ajax_expenses', 'http://tchest.co.za/admin/ajax_expenses', '2021-12-15 09:17:58', '2021-12-15 09:17:58'),
(1059, 1, 2, '103.213.242.5', 'admin.expenses.edit', 'http://tchest.co.za/admin/expenses/2/edit', '2021-12-15 09:18:09', '2021-12-15 09:18:09'),
(1060, 1, 2, '103.213.242.5', 'admin.expenses.index', 'http://tchest.co.za/admin/expenses', '2021-12-15 09:18:14', '2021-12-15 09:18:14'),
(1061, 1, 2, '103.213.242.5', 'admin.ajax_expenses', 'http://tchest.co.za/admin/ajax_expenses', '2021-12-15 09:18:15', '2021-12-15 09:18:15'),
(1062, 1, 2, '103.213.242.5', 'admin.getlogin', 'http://tchest.co.za/admin', '2021-12-15 09:18:44', '2021-12-15 09:18:44'),
(1063, 1, 2, '103.213.242.5', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2021-12-15 09:18:45', '2021-12-15 09:18:45'),
(1064, 1, 2, '103.213.242.5', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2021-12-15 09:18:45', '2021-12-15 09:18:45'),
(1065, 1, 2, '103.213.242.5', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2021-12-15 09:19:04', '2021-12-15 09:19:04'),
(1066, 1, 2, '103.213.242.5', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2021-12-15 09:19:05', '2021-12-15 09:19:05'),
(1067, 1, 2, '103.213.242.5', 'admin.employees.edit', 'http://tchest.co.za/admin/employees/4/edit', '2021-12-15 09:19:08', '2021-12-15 09:19:08'),
(1068, 1, 2, '103.213.242.5', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2021-12-15 09:19:10', '2021-12-15 09:19:10'),
(1069, 1, 2, '105.226.116.234', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2021-12-17 09:26:02', '2021-12-17 09:26:02'),
(1070, 1, 2, '105.226.116.234', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2021-12-17 09:26:03', '2021-12-17 09:26:03'),
(1071, 1, 2, '105.226.116.234', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-12-17 09:26:12', '2021-12-17 09:26:12'),
(1072, 1, 2, '105.226.116.234', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-12-17 09:26:13', '2021-12-17 09:26:13'),
(1073, 1, 2, '105.226.116.234', 'admin.expenses.create', 'https://tchest.co.za/admin/expenses/create', '2021-12-17 09:26:24', '2021-12-17 09:26:24'),
(1074, 1, 2, '105.226.116.234', 'admin.expenses.store', 'https://tchest.co.za/admin/expenses', '2021-12-17 09:26:54', '2021-12-17 09:26:54'),
(1075, 1, 2, '105.226.116.234', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2021-12-17 09:27:00', '2021-12-17 09:27:00'),
(1076, 1, 2, '105.226.116.234', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2021-12-17 09:27:00', '2021-12-17 09:27:00'),
(1085, 1, 2, '105.187.41.236', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-03-01 17:21:54', '2022-03-01 17:21:54'),
(1086, 1, 2, '105.187.41.236', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-01 17:21:56', '2022-03-01 17:21:56'),
(1087, 1, 2, '105.187.41.236', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-01 17:22:02', '2022-03-01 17:22:02'),
(1088, 1, 2, '105.187.41.236', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-01 17:22:03', '2022-03-01 17:22:03'),
(1089, 1, 2, '105.187.41.236', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-03-01 17:22:07', '2022-03-01 17:22:07'),
(1090, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:22:07', '2022-03-01 17:22:07'),
(1091, 1, 2, '105.187.41.236', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2022-03-01 17:25:15', '2022-03-01 17:25:15'),
(1092, 1, 2, '105.187.41.236', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-01 17:25:19', '2022-03-01 17:25:19'),
(1093, 1, 2, '105.187.41.236', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-01 17:25:19', '2022-03-01 17:25:19'),
(1094, 1, 2, '105.187.41.236', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-01 17:25:26', '2022-03-01 17:25:26'),
(1095, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:25:26', '2022-03-01 17:25:26'),
(1096, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:27:01', '2022-03-01 17:27:01'),
(1097, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:27:04', '2022-03-01 17:27:04'),
(1098, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:27:06', '2022-03-01 17:27:06'),
(1099, 1, 2, '105.187.41.236', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-01 17:27:07', '2022-03-01 17:27:07'),
(1100, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:27:27', '2022-03-01 17:27:27'),
(1101, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:27:31', '2022-03-01 17:27:31'),
(1102, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:27:33', '2022-03-01 17:27:33'),
(1103, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:28:11', '2022-03-01 17:28:11'),
(1104, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:28:41', '2022-03-01 17:28:41'),
(1105, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:28:42', '2022-03-01 17:28:42'),
(1106, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:28:43', '2022-03-01 17:28:43'),
(1107, 1, 2, '105.187.41.236', 'admin.employees.update', 'https://tchest.co.za/admin/employees/1', '2022-03-01 17:28:47', '2022-03-01 17:28:47'),
(1108, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 17:49:33', '2022-03-01 17:49:33'),
(1109, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 18:07:35', '2022-03-01 18:07:35'),
(1110, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 18:25:43', '2022-03-01 18:25:43'),
(1111, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 18:44:43', '2022-03-01 18:44:43'),
(1112, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 19:03:43', '2022-03-01 19:03:43'),
(1113, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 19:21:43', '2022-03-01 19:21:43'),
(1114, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 19:40:44', '2022-03-01 19:40:44'),
(1115, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 19:59:43', '2022-03-01 19:59:43');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(1116, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 20:18:43', '2022-03-01 20:18:43'),
(1117, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 20:37:44', '2022-03-01 20:37:44'),
(1118, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 20:56:42', '2022-03-01 20:56:42'),
(1119, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 21:15:43', '2022-03-01 21:15:43'),
(1120, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 21:34:44', '2022-03-01 21:34:44'),
(1121, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 21:53:44', '2022-03-01 21:53:44'),
(1122, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 22:12:42', '2022-03-01 22:12:42'),
(1123, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 22:31:42', '2022-03-01 22:31:42'),
(1124, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 22:50:43', '2022-03-01 22:50:43'),
(1125, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 23:09:43', '2022-03-01 23:09:43'),
(1126, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 23:28:42', '2022-03-01 23:28:42'),
(1127, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-01 23:47:43', '2022-03-01 23:47:43'),
(1128, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 00:06:43', '2022-03-02 00:06:43'),
(1129, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 00:25:44', '2022-03-02 00:25:44'),
(1130, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 00:44:42', '2022-03-02 00:44:42'),
(1131, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 01:03:42', '2022-03-02 01:03:42'),
(1132, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 01:22:43', '2022-03-02 01:22:43'),
(1133, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 01:41:43', '2022-03-02 01:41:43'),
(1134, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 02:00:43', '2022-03-02 02:00:43'),
(1135, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 02:19:42', '2022-03-02 02:19:42'),
(1136, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 02:38:43', '2022-03-02 02:38:43'),
(1137, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 02:57:43', '2022-03-02 02:57:43'),
(1138, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 03:16:43', '2022-03-02 03:16:43'),
(1139, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 03:35:42', '2022-03-02 03:35:42'),
(1140, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 03:53:43', '2022-03-02 03:53:43'),
(1141, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 04:12:42', '2022-03-02 04:12:42'),
(1142, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 04:31:43', '2022-03-02 04:31:43'),
(1143, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 04:50:43', '2022-03-02 04:50:43'),
(1144, 1, 2, '105.187.41.236', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-03-02 05:09:42', '2022-03-02 05:09:42'),
(1145, 1, 2, '45.221.32.244', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-03-21 14:17:56', '2022-03-21 14:17:56'),
(1146, 1, 2, '45.221.32.244', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-21 14:17:58', '2022-03-21 14:17:58'),
(1147, 1, 2, '45.221.32.244', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-03-21 14:18:09', '2022-03-21 14:18:09'),
(1148, 1, 2, '45.221.32.244', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-21 14:18:25', '2022-03-21 14:18:25'),
(1149, 1, 2, '45.221.32.244', 'admin.general_setting.update', 'https://tchest.co.za/admin/general-setting', '2022-03-21 14:19:02', '2022-03-21 14:19:02'),
(1150, 1, 2, '45.221.32.244', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2022-03-21 14:19:18', '2022-03-21 14:19:18'),
(1151, 1, 2, '45.221.32.244', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-03-21 14:19:26', '2022-03-21 14:19:26'),
(1152, 1, 2, '45.221.32.244', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2022-03-21 14:19:29', '2022-03-21 14:19:29'),
(1153, 1, 2, '45.221.32.244', 'admin.notification.edit', 'https://tchest.co.za/admin/notification-settings', '2022-03-21 14:19:32', '2022-03-21 14:19:32'),
(1154, 1, 2, '45.221.32.244', 'admin.company_setting.theme', 'https://tchest.co.za/admin/company_setting_theme', '2022-03-21 14:19:41', '2022-03-21 14:19:41'),
(1155, 1, 2, '45.221.32.244', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2022-03-21 14:19:49', '2022-03-21 14:19:49'),
(1156, 1, 2, '45.221.32.244', 'admin.attendance_settings.update', 'https://tchest.co.za/admin/attendance_settings/mark_attendance', '2022-03-21 14:20:02', '2022-03-21 14:20:02'),
(1157, 1, 2, '45.221.32.244', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-21 14:20:09', '2022-03-21 14:20:09'),
(1158, 1, 2, '45.221.32.244', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-21 14:20:10', '2022-03-21 14:20:10'),
(1159, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:20:19', '2022-03-21 14:20:19'),
(1160, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:20:20', '2022-03-21 14:20:20'),
(1161, 1, 2, '45.221.32.244', 'admin.expenses.create', 'https://tchest.co.za/admin/expenses/create', '2022-03-21 14:20:24', '2022-03-21 14:20:24'),
(1162, 1, 2, '45.221.32.244', 'admin.expenses.store', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:23:59', '2022-03-21 14:23:59'),
(1163, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:24:04', '2022-03-21 14:24:04'),
(1164, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:05', '2022-03-21 14:24:05'),
(1165, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/2', '2022-03-21 14:24:21', '2022-03-21 14:24:21'),
(1166, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:21', '2022-03-21 14:24:21'),
(1167, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/8', '2022-03-21 14:24:25', '2022-03-21 14:24:25'),
(1168, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:25', '2022-03-21 14:24:25'),
(1169, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:24:30', '2022-03-21 14:24:30'),
(1170, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:31', '2022-03-21 14:24:31'),
(1171, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/6', '2022-03-21 14:24:35', '2022-03-21 14:24:35'),
(1172, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:36', '2022-03-21 14:24:36'),
(1173, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/12', '2022-03-21 14:24:39', '2022-03-21 14:24:39'),
(1174, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:39', '2022-03-21 14:24:39'),
(1175, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/11', '2022-03-21 14:24:42', '2022-03-21 14:24:42'),
(1176, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:42', '2022-03-21 14:24:42'),
(1177, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/14', '2022-03-21 14:24:45', '2022-03-21 14:24:45'),
(1178, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:45', '2022-03-21 14:24:45'),
(1179, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/15', '2022-03-21 14:24:49', '2022-03-21 14:24:49'),
(1180, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:49', '2022-03-21 14:24:49'),
(1181, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/16', '2022-03-21 14:24:52', '2022-03-21 14:24:52'),
(1182, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:52', '2022-03-21 14:24:52'),
(1183, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/17', '2022-03-21 14:24:55', '2022-03-21 14:24:55'),
(1184, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:56', '2022-03-21 14:24:56'),
(1185, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/18', '2022-03-21 14:24:58', '2022-03-21 14:24:58'),
(1186, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:24:58', '2022-03-21 14:24:58'),
(1187, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/19', '2022-03-21 14:25:01', '2022-03-21 14:25:01'),
(1188, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:25:02', '2022-03-21 14:25:02'),
(1189, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/22', '2022-03-21 14:25:05', '2022-03-21 14:25:05'),
(1190, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:25:06', '2022-03-21 14:25:06'),
(1191, 1, 2, '45.221.32.244', 'admin.expenses.destroy', 'https://tchest.co.za/admin/expenses/13', '2022-03-21 14:25:13', '2022-03-21 14:25:13'),
(1192, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:25:13', '2022-03-21 14:25:13'),
(1193, 1, 2, '45.221.32.244', 'admin.expenses.create', 'https://tchest.co.za/admin/expenses/create', '2022-03-21 14:25:23', '2022-03-21 14:25:23'),
(1194, 1, 2, '45.221.32.244', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-21 14:25:26', '2022-03-21 14:25:26'),
(1195, 1, 2, '45.221.32.244', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-21 14:25:27', '2022-03-21 14:25:27'),
(1196, 1, 2, '45.221.32.244', 'admin.employees.destroy', 'https://tchest.co.za/admin/employees/4', '2022-03-21 14:25:33', '2022-03-21 14:25:33'),
(1197, 1, 2, '45.221.32.244', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-21 14:25:33', '2022-03-21 14:25:33'),
(1198, 1, 2, '45.221.32.244', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/9/edit', '2022-03-21 14:25:39', '2022-03-21 14:25:39'),
(1199, 1, 2, '45.221.32.244', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-21 14:25:39', '2022-03-21 14:25:39'),
(1200, 1, 2, '45.221.32.244', 'admin.employees.update', 'https://tchest.co.za/admin/employees/9', '2022-03-21 14:26:30', '2022-03-21 14:26:30'),
(1201, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:26:43', '2022-03-21 14:26:43'),
(1202, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:26:44', '2022-03-21 14:26:44'),
(1203, 1, 2, '45.221.32.244', 'admin.expenses.create', 'https://tchest.co.za/admin/expenses/create', '2022-03-21 14:26:49', '2022-03-21 14:26:49'),
(1204, 1, 2, '45.221.32.244', 'admin.expenses.store', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:29:04', '2022-03-21 14:29:04'),
(1205, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:29:06', '2022-03-21 14:29:06'),
(1206, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:29:07', '2022-03-21 14:29:07'),
(1207, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:29:11', '2022-03-21 14:29:11'),
(1208, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:29:12', '2022-03-21 14:29:12'),
(1209, 1, 2, '45.221.32.244', 'admin.awards.destroy', 'https://tchest.co.za/admin/awards/1', '2022-03-21 14:29:20', '2022-03-21 14:29:20'),
(1210, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:29:20', '2022-03-21 14:29:20'),
(1211, 1, 2, '45.221.32.244', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2022-03-21 14:29:22', '2022-03-21 14:29:22'),
(1212, 1, 2, '45.221.32.244', 'admin.awards.store', 'https://tchest.co.za/admin/awards', '2022-03-21 14:30:04', '2022-03-21 14:30:04'),
(1213, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:30:09', '2022-03-21 14:30:09'),
(1214, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:30:10', '2022-03-21 14:30:10'),
(1215, 1, 2, '45.221.32.244', 'admin.awards.destroy', 'https://tchest.co.za/admin/awards/4', '2022-03-21 14:30:17', '2022-03-21 14:30:17'),
(1216, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:30:17', '2022-03-21 14:30:17'),
(1217, 1, 2, '45.221.32.244', 'admin.awards.edit', 'https://tchest.co.za/admin/awards/7/edit', '2022-03-21 14:30:20', '2022-03-21 14:30:20'),
(1218, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:30:35', '2022-03-21 14:30:35'),
(1219, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:30:35', '2022-03-21 14:30:35'),
(1220, 1, 2, '45.221.32.244', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2022-03-21 14:30:38', '2022-03-21 14:30:38'),
(1221, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:30:47', '2022-03-21 14:30:47'),
(1222, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:30:48', '2022-03-21 14:30:48'),
(1223, 1, 2, '45.221.32.244', 'admin.awards.edit', 'https://tchest.co.za/admin/awards/7/edit', '2022-03-21 14:31:02', '2022-03-21 14:31:02'),
(1224, 1, 2, '45.221.32.244', 'admin.awards.update', 'https://tchest.co.za/admin/awards/7', '2022-03-21 14:31:28', '2022-03-21 14:31:28'),
(1225, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:31:37', '2022-03-21 14:31:37'),
(1226, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:31:37', '2022-03-21 14:31:37'),
(1227, 1, 2, '45.221.32.244', 'admin.awards.edit', 'https://tchest.co.za/admin/awards/7/edit', '2022-03-21 14:31:40', '2022-03-21 14:31:40'),
(1228, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:31:51', '2022-03-21 14:31:51'),
(1229, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:31:51', '2022-03-21 14:31:51'),
(1230, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:31:53', '2022-03-21 14:31:53'),
(1231, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:31:53', '2022-03-21 14:31:53'),
(1232, 1, 2, '45.221.32.244', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2022-03-21 14:31:57', '2022-03-21 14:31:57'),
(1233, 1, 2, '45.221.32.244', 'admin.awards.destroy', 'https://tchest.co.za/admin/awards/7', '2022-03-21 14:32:05', '2022-03-21 14:32:05'),
(1234, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:32:05', '2022-03-21 14:32:05'),
(1235, 1, 2, '45.221.32.244', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2022-03-21 14:32:07', '2022-03-21 14:32:07'),
(1236, 1, 2, '45.221.32.244', 'admin.awards.store', 'https://tchest.co.za/admin/awards', '2022-03-21 14:32:28', '2022-03-21 14:32:28'),
(1237, 1, 2, '45.221.32.244', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-03-21 14:32:31', '2022-03-21 14:32:31'),
(1238, 1, 2, '45.221.32.244', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-03-21 14:32:31', '2022-03-21 14:32:31'),
(1239, 1, 2, '45.221.32.244', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-03-21 14:32:36', '2022-03-21 14:32:36'),
(1240, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:32:36', '2022-03-21 14:32:36'),
(1241, 1, 2, '45.221.32.244', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2022-03-21 14:32:39', '2022-03-21 14:32:39'),
(1242, 1, 2, '45.221.32.244', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:32:44', '2022-03-21 14:32:44'),
(1243, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:32:44', '2022-03-21 14:32:44'),
(1244, 1, 2, '45.221.32.244', 'admin.payrolls.destroy', 'https://tchest.co.za/admin/payrolls/2', '2022-03-21 14:33:03', '2022-03-21 14:33:03'),
(1245, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:33:03', '2022-03-21 14:33:03'),
(1246, 1, 2, '45.221.32.244', 'admin.payrolls.destroy', 'https://tchest.co.za/admin/payrolls/3', '2022-03-21 14:33:08', '2022-03-21 14:33:08'),
(1247, 1, 2, '45.221.32.244', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-03-21 14:33:08', '2022-03-21 14:33:08'),
(1248, 1, 2, '45.221.32.244', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2022-03-21 14:33:10', '2022-03-21 14:33:10'),
(1249, 1, 2, '45.221.32.244', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2022-03-21 14:33:16', '2022-03-21 14:33:16'),
(1250, 1, 2, '45.221.32.244', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-03-21 14:34:11', '2022-03-21 14:34:11'),
(1251, 1, 2, '45.221.32.244', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-03-21 14:34:11', '2022-03-21 14:34:11'),
(1252, 1, 2, '45.221.32.244', 'admin.noticeboards.destroy', 'https://tchest.co.za/admin/noticeboards/17', '2022-03-21 14:34:19', '2022-03-21 14:34:19'),
(1253, 1, 2, '45.221.32.244', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-03-21 14:34:19', '2022-03-21 14:34:19'),
(1254, 1, 2, '45.221.32.244', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-03-21 14:34:34', '2022-03-21 14:34:34'),
(1255, 1, 2, '45.221.32.244', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-03-21 14:34:34', '2022-03-21 14:34:34'),
(1256, 1, 2, '45.221.32.244', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-21 14:34:35', '2022-03-21 14:34:35'),
(1257, 1, 2, '45.221.32.244', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:36:09', '2022-03-21 14:36:09'),
(1258, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:36:09', '2022-03-21 14:36:09'),
(1259, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:36:12', '2022-03-21 14:36:12'),
(1260, 1, 2, '45.221.32.244', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2022-03-21 14:36:18', '2022-03-21 14:36:18'),
(1261, 1, 2, '45.221.32.244', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2022-03-21 14:36:21', '2022-03-21 14:36:21'),
(1262, 1, 2, '45.221.32.244', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:36:48', '2022-03-21 14:36:48'),
(1263, 1, 2, '45.221.32.244', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:36:51', '2022-03-21 14:36:51'),
(1264, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:36:51', '2022-03-21 14:36:51'),
(1265, 1, 2, '45.221.32.244', 'admin.payrolls.destroy', 'https://tchest.co.za/admin/payrolls/5', '2022-03-21 14:38:51', '2022-03-21 14:38:51'),
(1266, 1, 2, '45.221.32.244', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2022-03-21 14:38:54', '2022-03-21 14:38:54'),
(1267, 1, 2, '45.221.32.244', 'admin.payrolls.check', 'https://tchest.co.za/admin/payrolls/check', '2022-03-21 14:38:59', '2022-03-21 14:38:59'),
(1268, 1, 2, '45.221.32.244', 'admin.payrolls.store', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:39:06', '2022-03-21 14:39:06'),
(1269, 1, 2, '45.221.32.244', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-03-21 14:39:08', '2022-03-21 14:39:08'),
(1270, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:39:09', '2022-03-21 14:39:09'),
(1271, 1, 2, '45.221.32.244', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-03-21 14:39:15', '2022-03-21 14:39:15'),
(1272, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-03-28 16:25:07', '2022-03-28 16:25:07'),
(1273, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-28 16:25:07', '2022-03-28 16:25:07'),
(1274, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-28 16:25:10', '2022-03-28 16:25:10'),
(1275, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-28 16:25:10', '2022-03-28 16:25:10'),
(1276, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 16:25:13', '2022-03-28 16:25:13'),
(1277, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 16:25:13', '2022-03-28 16:25:13'),
(1278, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 16:35:45', '2022-03-28 16:35:45'),
(1279, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 16:35:46', '2022-03-28 16:35:46'),
(1280, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 16:42:58', '2022-03-28 16:42:58'),
(1281, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 16:42:59', '2022-03-28 16:42:59'),
(1282, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 16:47:55', '2022-03-28 16:47:55'),
(1283, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 16:47:55', '2022-03-28 16:47:55'),
(1284, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 17:04:02', '2022-03-28 17:04:02'),
(1285, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 17:04:02', '2022-03-28 17:04:02'),
(1286, 1, 2, '105.186.180.191', 'admin.logout', 'https://tchest.co.za/admin/logout', '2022-03-28 17:04:07', '2022-03-28 17:04:07'),
(1287, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-03-28 17:08:30', '2022-03-28 17:08:30'),
(1288, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-03-28 17:08:30', '2022-03-28 17:08:30'),
(1289, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-03-28 17:08:33', '2022-03-28 17:08:33'),
(1290, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-03-28 17:08:34', '2022-03-28 17:08:34'),
(1291, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/1/edit', '2022-03-28 17:08:36', '2022-03-28 17:08:36'),
(1292, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-03-28 17:08:37', '2022-03-28 17:08:37'),
(1293, 1, 2, '105.186.180.191', 'admin.logout', 'https://tchest.co.za/admin/logout', '2022-03-28 17:09:42', '2022-03-28 17:09:42'),
(1294, 1, 2, '103.130.175.33', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 03:13:20', '2022-04-01 03:13:20'),
(1295, 1, 2, '103.130.175.33', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 03:13:23', '2022-04-01 03:13:23'),
(1296, 1, 2, '103.130.175.33', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 03:13:28', '2022-04-01 03:13:28'),
(1297, 1, 2, '103.130.175.33', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 03:13:32', '2022-04-01 03:13:32'),
(1298, 1, 2, '103.130.175.33', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 03:13:39', '2022-04-01 03:13:39'),
(1299, 1, 2, '103.130.175.33', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 03:13:45', '2022-04-01 03:13:45'),
(1300, 1, 2, '103.130.175.33', 'admin.departments.index', 'http://tchest.co.za/admin/departments', '2022-04-01 03:14:40', '2022-04-01 03:14:40'),
(1301, 1, 2, '103.130.175.33', 'admin.departments.create', 'http://tchest.co.za/admin/departments/create', '2022-04-01 03:14:44', '2022-04-01 03:14:44'),
(1302, 1, 2, '103.130.175.33', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 03:14:49', '2022-04-01 03:14:49'),
(1303, 1, 2, '103.130.175.33', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 03:14:50', '2022-04-01 03:14:50'),
(1304, 1, 2, '103.130.175.33', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 03:14:53', '2022-04-01 03:14:53'),
(1305, 1, 2, '103.130.175.33', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 03:14:54', '2022-04-01 03:14:54'),
(1306, 1, 2, '103.130.175.33', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 03:16:00', '2022-04-01 03:16:00'),
(1307, 1, 2, '103.130.175.33', 'admin.getlogin', 'http://tchest.co.za/admin', '2022-04-01 03:16:18', '2022-04-01 03:16:18'),
(1308, 1, 2, '103.130.175.33', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 03:16:21', '2022-04-01 03:16:21'),
(1309, 1, 2, '103.130.175.33', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 03:16:23', '2022-04-01 03:16:23'),
(1310, 1, 2, '103.130.175.33', 'admin.logout', 'http://tchest.co.za/admin/logout', '2022-04-01 03:16:49', '2022-04-01 03:16:49'),
(1326, 1, 2, '103.130.175.33', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 03:21:31', '2022-04-01 03:21:31'),
(1327, 1, 2, '103.130.175.33', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 03:21:33', '2022-04-01 03:21:33'),
(1328, 1, 2, '103.130.175.33', 'admin.departments.index', 'http://tchest.co.za/admin/departments', '2022-04-01 03:21:38', '2022-04-01 03:21:38'),
(1329, 1, 2, '103.130.175.33', 'admin.logout', 'http://tchest.co.za/admin/logout', '2022-04-01 03:22:00', '2022-04-01 03:22:00'),
(1365, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 06:22:39', '2022-04-01 06:22:39'),
(1366, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 06:22:40', '2022-04-01 06:22:40'),
(1367, 1, 2, '105.186.180.191', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-04-01 06:22:54', '2022-04-01 06:22:54'),
(1368, 1, 2, '105.186.180.191', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-04-01 06:22:55', '2022-04-01 06:22:55'),
(1369, 1, 2, '105.186.180.191', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2022-04-01 06:22:59', '2022-04-01 06:22:59'),
(1370, 1, 2, '105.186.180.191', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2022-04-01 06:23:10', '2022-04-01 06:23:10'),
(1371, 1, 2, '105.186.180.191', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-04-01 06:23:15', '2022-04-01 06:23:15'),
(1372, 1, 2, '105.186.180.191', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-04-01 06:23:15', '2022-04-01 06:23:15'),
(1389, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 06:31:17', '2022-04-01 06:31:17'),
(1390, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 06:31:17', '2022-04-01 06:31:17'),
(1391, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 06:31:19', '2022-04-01 06:31:19'),
(1392, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 06:31:20', '2022-04-01 06:31:20'),
(1393, 1, 2, '105.186.180.191', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 06:31:21', '2022-04-01 06:31:21'),
(1394, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 06:31:21', '2022-04-01 06:31:21'),
(1395, 1, 2, '105.186.180.191', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2022-04-01 06:32:25', '2022-04-01 06:32:25'),
(1396, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 06:32:30', '2022-04-01 06:32:30'),
(1397, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 06:32:30', '2022-04-01 06:32:30'),
(1398, 1, 2, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-01 06:32:42', '2022-04-01 06:32:42'),
(1399, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 06:32:42', '2022-04-01 06:32:42'),
(1400, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 06:32:42', '2022-04-01 06:32:42'),
(1401, 1, 2, '105.186.180.191', 'admin.logout', 'https://tchest.co.za/admin/logout', '2022-04-01 06:34:36', '2022-04-01 06:34:36'),
(1425, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 06:42:00', '2022-04-01 06:42:00'),
(1431, 1, 2, '103.130.175.33', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 06:48:23', '2022-04-01 06:48:23'),
(1432, 1, 2, '103.130.175.33', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 06:48:26', '2022-04-01 06:48:26'),
(1433, 1, 2, '103.130.175.33', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 06:48:44', '2022-04-01 06:48:44'),
(1434, 1, 2, '103.130.175.33', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 06:48:46', '2022-04-01 06:48:46'),
(1435, 1, 2, '103.130.175.33', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 06:48:47', '2022-04-01 06:48:47'),
(1436, 1, 2, '103.130.175.33', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 06:48:49', '2022-04-01 06:48:49'),
(1437, 1, 2, '103.130.175.33', 'admin.logout', 'http://tchest.co.za/admin/logout', '2022-04-01 06:49:05', '2022-04-01 06:49:05'),
(1438, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 07:00:02', '2022-04-01 07:00:02'),
(1439, 1, 2, '103.130.175.33', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 07:08:44', '2022-04-01 07:08:44'),
(1440, 1, 2, '103.130.175.33', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 07:08:47', '2022-04-01 07:08:47'),
(1441, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 07:24:38', '2022-04-01 07:24:38'),
(1442, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 07:42:40', '2022-04-01 07:42:40'),
(1443, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 08:01:21', '2022-04-01 08:01:21'),
(1444, 12, 17, '197.91.142.76', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 08:17:22', '2022-04-01 08:17:22'),
(1445, 12, 17, '197.91.142.76', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 08:17:24', '2022-04-01 08:17:24'),
(1446, 12, 17, '197.91.142.76', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-04-01 08:18:02', '2022-04-01 08:18:02'),
(1447, 12, 17, '197.91.142.76', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-01 08:18:18', '2022-04-01 08:18:18'),
(1448, 12, 17, '197.91.142.76', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 08:18:18', '2022-04-01 08:18:18'),
(1449, 12, 17, '197.91.142.76', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 08:18:19', '2022-04-01 08:18:19'),
(1450, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 08:20:20', '2022-04-01 08:20:20'),
(1451, 12, 17, '197.91.142.76', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2022-04-01 08:20:27', '2022-04-01 08:20:27'),
(1452, 12, 17, '197.91.142.76', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2022-04-01 08:20:29', '2022-04-01 08:20:29'),
(1453, 12, 17, '197.91.142.76', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 08:20:41', '2022-04-01 08:20:41'),
(1454, 12, 17, '197.91.142.76', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 08:20:42', '2022-04-01 08:20:42'),
(1455, 12, 17, '197.91.142.76', 'admin.employees.import', 'https://tchest.co.za/admin/employees/import', '2022-04-01 08:20:58', '2022-04-01 08:20:58'),
(1456, 12, 17, '197.91.142.76', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 08:21:02', '2022-04-01 08:21:02'),
(1457, 12, 17, '197.91.142.76', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 08:21:03', '2022-04-01 08:21:03'),
(1458, 12, 17, '197.91.142.76', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 08:21:05', '2022-04-01 08:21:05'),
(1459, 12, 17, '197.91.142.76', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 08:21:07', '2022-04-01 08:21:07'),
(1460, 12, 17, '197.91.142.76', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2022-04-01 08:21:09', '2022-04-01 08:21:09'),
(1461, 12, 17, '197.91.142.76', 'admin.departments.create', 'https://tchest.co.za/admin/departments/create', '2022-04-01 08:21:13', '2022-04-01 08:21:13'),
(1462, 12, 17, '197.91.142.76', 'admin.departments.store', 'https://tchest.co.za/admin/departments', '2022-04-01 08:21:23', '2022-04-01 08:21:23'),
(1463, 12, 17, '197.91.142.76', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2022-04-01 08:21:24', '2022-04-01 08:21:24'),
(1464, 12, 17, '197.91.142.76', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 08:21:26', '2022-04-01 08:21:26'),
(1465, 12, 17, '197.91.142.76', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 08:21:27', '2022-04-01 08:21:27'),
(1466, 12, 17, '197.91.142.76', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 08:21:30', '2022-04-01 08:21:30'),
(1467, 12, 17, '197.91.142.76', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 08:21:31', '2022-04-01 08:21:31'),
(1468, 12, 17, '197.91.142.76', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-04-01 08:21:55', '2022-04-01 08:21:55'),
(1469, 12, 17, '197.91.142.76', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-04-01 08:21:56', '2022-04-01 08:21:56'),
(1470, 12, 17, '197.91.142.76', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2022-04-01 08:21:58', '2022-04-01 08:21:58'),
(1471, 12, 17, '197.91.142.76', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-04-01 08:22:04', '2022-04-01 08:22:04'),
(1472, 12, 17, '197.91.142.76', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-04-01 08:22:05', '2022-04-01 08:22:05'),
(1473, 12, 17, '197.91.142.76', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2022-04-01 08:23:19', '2022-04-01 08:23:19'),
(1474, 12, 17, '197.91.142.76', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-04-01 08:23:28', '2022-04-01 08:23:28'),
(1475, 12, 17, '197.91.142.76', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-04-01 08:23:29', '2022-04-01 08:23:29'),
(1476, 12, 17, '197.91.142.76', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2022-04-01 08:23:50', '2022-04-01 08:23:50'),
(1477, 12, 17, '197.91.142.76', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2022-04-01/edit', '2022-04-01 08:23:50', '2022-04-01 08:23:50'),
(1478, 12, 17, '197.91.142.76', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2022-04-01 08:24:38', '2022-04-01 08:24:38'),
(1479, 12, 17, '197.91.142.76', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2022-04-01 08:24:39', '2022-04-01 08:24:39'),
(1480, 12, 17, '197.91.142.76', 'admin.leavetypes.index', 'https://tchest.co.za/admin/leavetypes', '2022-04-01 08:24:47', '2022-04-01 08:24:47'),
(1481, 12, 17, '197.91.142.76', 'admin.leavetypes.ajax_list', 'https://tchest.co.za/admin/leavetypes/ajax_list', '2022-04-01 08:24:47', '2022-04-01 08:24:47'),
(1482, 12, 17, '197.91.142.76', 'admin.leavetypes.create', 'https://tchest.co.za/admin/leavetypes/create', '2022-04-01 08:24:49', '2022-04-01 08:24:49'),
(1483, 12, 17, '197.91.142.76', 'admin.leave_applications.index', 'https://tchest.co.za/admin/leave_applications', '2022-04-01 08:24:55', '2022-04-01 08:24:55'),
(1484, 12, 17, '197.91.142.76', 'admin.leave_applications', 'https://tchest.co.za/admin/leave_applications/ajaxApplications', '2022-04-01 08:24:55', '2022-04-01 08:24:55'),
(1485, 12, 17, '197.91.142.76', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-04-01 08:25:18', '2022-04-01 08:25:18'),
(1486, 12, 17, '197.91.142.76', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-04-01 08:25:19', '2022-04-01 08:25:19'),
(1487, 12, 17, '197.91.142.76', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2022-04-01 08:25:20', '2022-04-01 08:25:20'),
(1488, 12, 17, '197.91.142.76', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-04-01 08:25:40', '2022-04-01 08:25:40'),
(1489, 12, 17, '197.91.142.76', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-04-01 08:25:40', '2022-04-01 08:25:40'),
(1490, 12, 17, '197.91.142.76', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2022-04-01 08:25:46', '2022-04-01 08:25:46'),
(1491, 12, 17, '197.91.142.76', 'admin.jobs.index', 'https://tchest.co.za/admin/jobs', '2022-04-01 08:25:55', '2022-04-01 08:25:55'),
(1492, 12, 17, '197.91.142.76', 'admin.ajax_jobs', 'https://tchest.co.za/admin/ajax_jobs', '2022-04-01 08:25:56', '2022-04-01 08:25:56'),
(1493, 12, 17, '197.91.142.76', 'admin.company_setting.theme', 'https://tchest.co.za/admin/company_setting_theme', '2022-04-01 08:26:50', '2022-04-01 08:26:50'),
(1494, 12, 17, '197.91.142.76', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2022-04-01 08:26:56', '2022-04-01 08:26:56'),
(1495, 12, 17, '197.91.142.76', 'admin.attendance_settings.update', 'https://tchest.co.za/admin/attendance_settings/mark_attendance', '2022-04-01 08:27:02', '2022-04-01 08:27:02'),
(1496, 12, 17, '197.91.142.76', 'admin.admin_users.index', 'https://tchest.co.za/admin/admin_users', '2022-04-01 08:27:06', '2022-04-01 08:27:06'),
(1497, 12, 17, '197.91.142.76', 'admin.ajax_admin_users', 'https://tchest.co.za/admin/ajax_admin_users', '2022-04-01 08:27:07', '2022-04-01 08:27:07'),
(1498, 12, 17, '197.91.142.76', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-04-01 08:27:17', '2022-04-01 08:27:17'),
(1499, 12, 17, '197.91.142.76', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2022-04-01 08:27:24', '2022-04-01 08:27:24'),
(1500, 12, 17, '197.91.142.76', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-01 08:27:28', '2022-04-01 08:27:28'),
(1501, 12, 17, '197.91.142.76', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 08:27:28', '2022-04-01 08:27:28'),
(1502, 12, 17, '197.91.142.76', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 08:27:28', '2022-04-01 08:27:28'),
(1503, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 08:39:20', '2022-04-01 08:39:20'),
(1504, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 08:45:28', '2022-04-01 08:45:28'),
(1505, 12, 17, '119.160.59.10', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-01 09:03:30', '2022-04-01 09:03:30'),
(1506, 12, 17, '119.160.59.10', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 09:03:33', '2022-04-01 09:03:33'),
(1507, 12, 17, '119.160.59.10', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 09:03:34', '2022-04-01 09:03:34'),
(1508, 12, 17, '119.160.59.10', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 09:03:36', '2022-04-01 09:03:36'),
(1509, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:03:41', '2022-04-01 09:03:41'),
(1510, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:03:46', '2022-04-01 09:03:46'),
(1511, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:34:00', '2022-04-01 09:34:00'),
(1512, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:34:30', '2022-04-01 09:34:30'),
(1513, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:34:43', '2022-04-01 09:34:43'),
(1514, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:34:45', '2022-04-01 09:34:45'),
(1515, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:37:07', '2022-04-01 09:37:07'),
(1516, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:37:19', '2022-04-01 09:37:19'),
(1517, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:40:44', '2022-04-01 09:40:44'),
(1518, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:40:46', '2022-04-01 09:40:46'),
(1519, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:41:17', '2022-04-01 09:41:17'),
(1520, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:41:18', '2022-04-01 09:41:18'),
(1521, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:41:32', '2022-04-01 09:41:32'),
(1522, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:41:59', '2022-04-01 09:41:59'),
(1523, 12, 17, '119.160.59.10', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-01 09:49:18', '2022-04-01 09:49:18'),
(1524, 12, 17, '119.160.59.10', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 09:49:19', '2022-04-01 09:49:19'),
(1525, 12, 17, '119.160.59.10', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-01 09:49:22', '2022-04-01 09:49:22'),
(1526, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 09:49:26', '2022-04-01 09:49:26'),
(1527, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:49:55', '2022-04-01 09:49:55'),
(1528, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 09:51:14', '2022-04-01 09:51:14'),
(1529, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 09:51:45', '2022-04-01 09:51:45'),
(1530, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 09:56:10', '2022-04-01 09:56:10'),
(1531, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 09:59:35', '2022-04-01 09:59:35'),
(1532, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 09:59:37', '2022-04-01 09:59:37'),
(1533, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:01:24', '2022-04-01 10:01:24'),
(1534, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:02:08', '2022-04-01 10:02:08'),
(1535, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:06:14', '2022-04-01 10:06:14'),
(1536, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:06:16', '2022-04-01 10:06:16'),
(1537, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:07:42', '2022-04-01 10:07:42'),
(1538, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:10:08', '2022-04-01 10:10:08'),
(1539, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 10:10:38', '2022-04-01 10:10:38'),
(1540, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:23:25', '2022-04-01 10:23:25'),
(1541, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:23:53', '2022-04-01 10:23:53'),
(1542, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:23:54', '2022-04-01 10:23:54'),
(1543, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:25:36', '2022-04-01 10:25:36'),
(1544, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:26:33', '2022-04-01 10:26:33'),
(1545, 12, 17, '119.160.59.10', 'admin.getlogin', 'http://tchest.co.za/admin', '2022-04-01 10:26:48', '2022-04-01 10:26:48'),
(1546, 12, 17, '119.160.59.10', 'admin.dashboard.index', 'http://tchest.co.za/admin/dashboard', '2022-04-01 10:26:53', '2022-04-01 10:26:53'),
(1547, 12, 17, '119.160.59.10', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 10:27:10', '2022-04-01 10:27:10');
INSERT INTO `browse_history` (`id`, `company_id`, `admin_id`, `ip`, `route`, `url`, `created_at`, `updated_at`) VALUES
(1548, 12, 17, '119.160.59.10', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 10:27:11', '2022-04-01 10:27:11'),
(1549, 12, 17, '119.160.59.10', 'admin.attendance.ajax_load_calender', 'http://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-01 10:27:12', '2022-04-01 10:27:12'),
(1550, 12, 17, '119.160.59.10', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 10:27:17', '2022-04-01 10:27:17'),
(1551, 12, 17, '119.160.59.10', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 10:27:33', '2022-04-01 10:27:33'),
(1552, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:28:03', '2022-04-01 10:28:03'),
(1553, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:28:06', '2022-04-01 10:28:06'),
(1554, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:29:23', '2022-04-01 10:29:23'),
(1555, 12, 17, '119.160.59.10', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:29:25', '2022-04-01 10:29:25'),
(1556, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 10:29:38', '2022-04-01 10:29:38'),
(1557, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:29:51', '2022-04-01 10:29:51'),
(1558, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:32:07', '2022-04-01 10:32:07'),
(1559, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:32:30', '2022-04-01 10:32:30'),
(1560, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:35:09', '2022-04-01 10:35:09'),
(1561, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:35:40', '2022-04-01 10:35:40'),
(1562, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:35:59', '2022-04-01 10:35:59'),
(1563, 12, 17, '119.160.59.10', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:39:16', '2022-04-01 10:39:16'),
(1564, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:44:34', '2022-04-01 10:44:34'),
(1565, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:45:00', '2022-04-01 10:45:00'),
(1566, 12, 17, '119.160.59.10', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:47:06', '2022-04-01 10:47:06'),
(1567, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 10:48:27', '2022-04-01 10:48:27'),
(1568, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:48:50', '2022-04-01 10:48:50'),
(1569, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:48:51', '2022-04-01 10:48:51'),
(1570, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:48:59', '2022-04-01 10:48:59'),
(1571, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:10', '2022-04-01 10:49:10'),
(1572, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:49:14', '2022-04-01 10:49:14'),
(1573, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:18', '2022-04-01 10:49:18'),
(1574, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:49:25', '2022-04-01 10:49:25'),
(1575, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:39', '2022-04-01 10:49:39'),
(1576, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:44', '2022-04-01 10:49:44'),
(1577, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:44', '2022-04-01 10:49:44'),
(1578, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:49:49', '2022-04-01 10:49:49'),
(1579, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:52:26', '2022-04-01 10:52:26'),
(1580, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:52:56', '2022-04-01 10:52:56'),
(1581, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 10:56:44', '2022-04-01 10:56:44'),
(1582, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 10:56:45', '2022-04-01 10:56:45'),
(1583, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:57:03', '2022-04-01 10:57:03'),
(1584, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 10:57:08', '2022-04-01 10:57:08'),
(1585, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:00:00', '2022-04-01 11:00:00'),
(1586, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 11:00:01', '2022-04-01 11:00:01'),
(1587, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 11:02:54', '2022-04-01 11:02:54'),
(1588, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:05:54', '2022-04-01 11:05:54'),
(1589, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:05:55', '2022-04-01 11:05:55'),
(1590, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:05:57', '2022-04-01 11:05:57'),
(1591, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 11:05:59', '2022-04-01 11:05:59'),
(1592, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 11:06:38', '2022-04-01 11:06:38'),
(1593, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 11:07:07', '2022-04-01 11:07:07'),
(1594, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:14:45', '2022-04-01 11:14:45'),
(1595, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 11:14:50', '2022-04-01 11:14:50'),
(1596, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:16:35', '2022-04-01 11:16:35'),
(1597, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:16:37', '2022-04-01 11:16:37'),
(1598, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 11:16:39', '2022-04-01 11:16:39'),
(1599, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 11:19:51', '2022-04-01 11:19:51'),
(1600, 12, 17, '119.160.59.235', 'admin.employees.store', 'http://tchest.co.za/admin/employees', '2022-04-01 11:24:03', '2022-04-01 11:24:03'),
(1601, 12, 17, '119.160.59.235', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 11:24:09', '2022-04-01 11:24:09'),
(1602, 12, 17, '119.160.59.235', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 11:24:15', '2022-04-01 11:24:15'),
(1603, 12, 17, '119.160.59.235', 'admin.employees.index', 'http://tchest.co.za/admin/employees', '2022-04-01 11:24:42', '2022-04-01 11:24:42'),
(1604, 12, 17, '119.160.59.235', 'admin.ajax_employees', 'http://tchest.co.za/admin/employees/ajax_employees', '2022-04-01 11:24:45', '2022-04-01 11:24:45'),
(1605, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-01 11:25:38', '2022-04-01 11:25:38'),
(1606, 12, 17, '119.160.59.235', 'admin.employees.create', 'http://tchest.co.za/admin/employees/create', '2022-04-01 11:29:56', '2022-04-01 11:29:56'),
(1607, 12, 17, '119.160.59.235', 'admin.departments.ajax_designation', 'http://tchest.co.za/admin/departments/ajax_designation', '2022-04-01 11:29:57', '2022-04-01 11:29:57'),
(1608, 12, 17, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-04 06:06:34', '2022-04-04 06:06:34'),
(1609, 12, 17, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-04 06:06:35', '2022-04-04 06:06:35'),
(1610, 12, 17, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-04 06:06:43', '2022-04-04 06:06:43'),
(1611, 12, 17, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-04 06:06:43', '2022-04-04 06:06:43'),
(1612, 12, 17, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-04 06:06:53', '2022-04-04 06:06:53'),
(1613, 12, 17, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-04 06:06:53', '2022-04-04 06:06:53'),
(1614, 12, 17, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-04 06:06:54', '2022-04-04 06:06:54'),
(1615, 12, 17, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-04 06:10:08', '2022-04-04 06:10:08'),
(1616, 12, 17, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-04 06:10:08', '2022-04-04 06:10:08'),
(1617, 12, 17, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-04 06:10:20', '2022-04-04 06:10:20'),
(1618, 12, 17, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-04 06:10:21', '2022-04-04 06:10:21'),
(1619, 12, 17, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-04 06:10:21', '2022-04-04 06:10:21'),
(1620, 12, 17, '105.186.180.191', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2022-04-04 06:10:36', '2022-04-04 06:10:36'),
(1621, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 06:37:11', '2022-04-04 06:37:11'),
(1622, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 06:55:13', '2022-04-04 06:55:13'),
(1623, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 07:13:47', '2022-04-04 07:13:47'),
(1624, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 07:32:47', '2022-04-04 07:32:47'),
(1625, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 07:51:47', '2022-04-04 07:51:47'),
(1626, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 08:10:47', '2022-04-04 08:10:47'),
(1627, 12, 17, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-04 08:29:47', '2022-04-04 08:29:47'),
(1628, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-05 06:16:05', '2022-04-05 06:16:05'),
(1629, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-05 06:16:06', '2022-04-05 06:16:06'),
(1630, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-05 06:16:23', '2022-04-05 06:16:23'),
(1631, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-05 06:16:23', '2022-04-05 06:16:23'),
(1632, 1, 2, '105.186.180.191', 'admin.employees.edit', 'https://tchest.co.za/admin/employees/9/edit', '2022-04-05 06:16:26', '2022-04-05 06:16:26'),
(1633, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-05 06:16:27', '2022-04-05 06:16:27'),
(1634, 1, 2, '105.186.180.191', 'admin.employees.update', 'https://tchest.co.za/admin/employees/9', '2022-04-05 06:17:17', '2022-04-05 06:17:17'),
(1635, 1, 2, '105.186.180.191', 'admin.logout', 'https://tchest.co.za/admin/logout', '2022-04-05 06:17:55', '2022-04-05 06:17:55'),
(1636, 12, 17, '197.91.142.76', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-13 07:43:57', '2022-04-13 07:43:57'),
(1637, 12, 17, '197.91.142.76', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-13 07:43:58', '2022-04-13 07:43:58'),
(1638, 12, 17, '197.91.142.76', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-13 07:44:08', '2022-04-13 07:44:08'),
(1639, 12, 17, '197.91.142.76', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-13 07:44:08', '2022-04-13 07:44:08'),
(1640, 12, 17, '197.91.142.76', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-13 07:44:14', '2022-04-13 07:44:14'),
(1641, 12, 17, '197.91.142.76', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-13 07:44:14', '2022-04-13 07:44:14'),
(1642, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 08:02:44', '2022-04-13 08:02:44'),
(1643, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 08:20:46', '2022-04-13 08:20:46'),
(1644, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 08:39:28', '2022-04-13 08:39:28'),
(1645, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 08:57:30', '2022-04-13 08:57:30'),
(1646, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 09:16:29', '2022-04-13 09:16:29'),
(1647, 12, 17, '197.91.142.76', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-13 09:35:29', '2022-04-13 09:35:29'),
(1648, 12, 17, '197.91.142.76', 'admin.login', 'https://tchest.co.za/admin/login', '2022-04-13 10:22:15', '2022-04-13 10:22:15'),
(1649, 12, 17, '197.91.142.76', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2022-04-13 10:22:27', '2022-04-13 10:22:27'),
(1650, 12, 17, '197.91.142.76', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-04-13 10:27:05', '2022-04-13 10:27:05'),
(1651, 12, 17, '197.91.142.76', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2022-04-13 10:27:53', '2022-04-13 10:27:53'),
(1652, 12, 17, '197.91.142.76', 'admin.attendance_settings.update', 'https://tchest.co.za/admin/attendance_settings/mark_attendance', '2022-04-13 10:29:28', '2022-04-13 10:29:28'),
(1653, 12, 17, '197.91.142.76', 'admin.notification.edit', 'https://tchest.co.za/admin/notification-settings', '2022-04-13 10:29:42', '2022-04-13 10:29:42'),
(1654, 12, 17, '197.91.142.76', 'admin.notification.update', 'https://tchest.co.za/admin/notification-settings', '2022-04-13 10:29:59', '2022-04-13 10:29:59'),
(1655, 1, 2, '45.221.47.98', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-15 09:25:45', '2022-04-15 09:25:45'),
(1656, 1, 2, '45.221.47.98', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-15 09:25:46', '2022-04-15 09:25:46'),
(1657, 1, 2, '45.221.47.98', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-15 09:25:49', '2022-04-15 09:25:49'),
(1658, 1, 2, '45.221.47.98', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-15 09:25:49', '2022-04-15 09:25:49'),
(1659, 1, 2, '45.221.47.98', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-15 09:25:51', '2022-04-15 09:25:51'),
(1660, 1, 2, '45.221.47.98', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-15 09:25:52', '2022-04-15 09:25:52'),
(1661, 1, 2, '45.221.47.98', 'admin.employees.store', 'https://tchest.co.za/admin/employees', '2022-04-15 09:28:27', '2022-04-15 09:28:27'),
(1662, 1, 2, '45.221.47.98', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-15 09:28:28', '2022-04-15 09:28:28'),
(1663, 1, 2, '45.221.47.98', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-15 09:28:29', '2022-04-15 09:28:29'),
(1664, 1, 2, '45.221.47.98', 'admin.employees.destroy', 'https://tchest.co.za/admin/employees/11', '2022-04-15 09:28:35', '2022-04-15 09:28:35'),
(1665, 1, 2, '45.221.47.98', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-15 09:28:35', '2022-04-15 09:28:35'),
(1666, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-18 10:26:07', '2022-04-18 10:26:07'),
(1667, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-18 10:26:08', '2022-04-18 10:26:08'),
(1668, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-18 10:26:10', '2022-04-18 10:26:10'),
(1669, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-18 10:26:11', '2022-04-18 10:26:11'),
(1670, 1, 2, '105.186.180.191', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-18 10:26:16', '2022-04-18 10:26:16'),
(1671, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-18 10:26:16', '2022-04-18 10:26:16'),
(1672, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-18 10:26:25', '2022-04-18 10:26:25'),
(1673, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-18 10:26:26', '2022-04-18 10:26:26'),
(1674, 1, 2, '105.186.180.191', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2022-04-18 10:26:31', '2022-04-18 10:26:31'),
(1675, 1, 2, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-18 10:26:37', '2022-04-18 10:26:37'),
(1676, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-18 10:26:37', '2022-04-18 10:26:37'),
(1677, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-18 10:26:38', '2022-04-18 10:26:38'),
(1678, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 10:44:49', '2022-04-18 10:44:49'),
(1679, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 11:02:51', '2022-04-18 11:02:51'),
(1680, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 11:20:58', '2022-04-18 11:20:58'),
(1681, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 11:39:58', '2022-04-18 11:39:58'),
(1682, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 11:58:58', '2022-04-18 11:58:58'),
(1683, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 12:16:59', '2022-04-18 12:16:59'),
(1684, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 12:35:59', '2022-04-18 12:35:59'),
(1685, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 12:54:58', '2022-04-18 12:54:58'),
(1686, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-18 13:13:59', '2022-04-18 13:13:59'),
(1687, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 08:22:41', '2022-04-19 08:22:41'),
(1688, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:22:43', '2022-04-19 08:22:43'),
(1689, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 08:34:23', '2022-04-19 08:34:23'),
(1690, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 08:34:23', '2022-04-19 08:34:23'),
(1691, 1, 2, '105.186.180.191', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 08:34:26', '2022-04-19 08:34:26'),
(1692, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 08:34:27', '2022-04-19 08:34:27'),
(1693, 1, 2, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-19 08:34:48', '2022-04-19 08:34:48'),
(1694, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 08:34:49', '2022-04-19 08:34:49'),
(1695, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:34:49', '2022-04-19 08:34:49'),
(1696, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 08:35:19', '2022-04-19 08:35:19'),
(1697, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 08:35:19', '2022-04-19 08:35:19'),
(1698, 1, 2, '105.186.180.191', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 08:35:27', '2022-04-19 08:35:27'),
(1699, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 08:35:28', '2022-04-19 08:35:28'),
(1700, 1, 2, '105.186.180.191', 'admin.departments.index', 'https://tchest.co.za/admin/departments', '2022-04-19 08:35:46', '2022-04-19 08:35:46'),
(1701, 1, 2, '105.186.180.191', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 08:35:53', '2022-04-19 08:35:53'),
(1702, 1, 2, '105.186.180.191', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 08:35:54', '2022-04-19 08:35:54'),
(1703, 1, 2, '105.186.180.191', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 08:35:55', '2022-04-19 08:35:55'),
(1704, 1, 2, '105.186.180.191', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 08:35:55', '2022-04-19 08:35:55'),
(1705, 1, 2, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-19 08:37:44', '2022-04-19 08:37:44'),
(1706, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 08:37:44', '2022-04-19 08:37:44'),
(1707, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:37:45', '2022-04-19 08:37:45'),
(1708, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:39:30', '2022-04-19 08:39:30'),
(1709, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:39:31', '2022-04-19 08:39:31'),
(1710, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:39:32', '2022-04-19 08:39:32'),
(1711, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:39:37', '2022-04-19 08:39:37'),
(1712, 1, 2, '105.186.180.191', 'admin.awards.index', 'https://tchest.co.za/admin/awards', '2022-04-19 08:40:05', '2022-04-19 08:40:05'),
(1713, 1, 2, '105.186.180.191', 'admin.ajax_awards', 'https://tchest.co.za/admin/ajax_awards', '2022-04-19 08:40:06', '2022-04-19 08:40:06'),
(1714, 1, 2, '105.186.180.191', 'admin.awards.create', 'https://tchest.co.za/admin/awards/create', '2022-04-19 08:40:09', '2022-04-19 08:40:09'),
(1715, 1, 2, '105.186.180.191', 'admin.expenses.index', 'https://tchest.co.za/admin/expenses', '2022-04-19 08:40:35', '2022-04-19 08:40:35'),
(1716, 1, 2, '105.186.180.191', 'admin.ajax_expenses', 'https://tchest.co.za/admin/ajax_expenses', '2022-04-19 08:40:36', '2022-04-19 08:40:36'),
(1717, 1, 2, '105.186.180.191', 'admin.holidays.index', 'https://tchest.co.za/admin/holidays', '2022-04-19 08:40:48', '2022-04-19 08:40:48'),
(1718, 1, 2, '105.186.180.191', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-04-19 08:40:57', '2022-04-19 08:40:57'),
(1719, 1, 2, '105.186.180.191', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-04-19 08:40:57', '2022-04-19 08:40:57'),
(1720, 1, 2, '105.186.180.191', 'admin.payrolls.create', 'https://tchest.co.za/admin/payrolls/create', '2022-04-19 08:40:59', '2022-04-19 08:40:59'),
(1721, 1, 2, '105.186.180.191', 'admin.payrolls.index', 'https://tchest.co.za/admin/payrolls', '2022-04-19 08:41:10', '2022-04-19 08:41:10'),
(1722, 1, 2, '105.186.180.191', 'admin.ajax_payrolls', 'https://tchest.co.za/admin/ajax_payrolls', '2022-04-19 08:41:11', '2022-04-19 08:41:11'),
(1723, 1, 2, '105.186.180.191', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-04-19 08:41:19', '2022-04-19 08:41:19'),
(1724, 1, 2, '105.186.180.191', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-04-19 08:41:20', '2022-04-19 08:41:20'),
(1725, 1, 2, '105.186.180.191', 'admin.noticeboards.create', 'https://tchest.co.za/admin/noticeboards/create', '2022-04-19 08:41:33', '2022-04-19 08:41:33'),
(1726, 1, 2, '105.186.180.191', 'admin.noticeboards.store', 'https://tchest.co.za/admin/noticeboards', '2022-04-19 08:42:01', '2022-04-19 08:42:01'),
(1727, 1, 2, '105.186.180.191', 'admin.noticeboards.index', 'https://tchest.co.za/admin/noticeboards', '2022-04-19 08:42:06', '2022-04-19 08:42:06'),
(1728, 1, 2, '105.186.180.191', 'admin.ajax_notices', 'https://tchest.co.za/admin/ajax_notices', '2022-04-19 08:42:08', '2022-04-19 08:42:08'),
(1729, 1, 2, '105.186.180.191', 'admin.attendances.create', 'https://tchest.co.za/admin/attendances/create', '2022-04-19 08:42:32', '2022-04-19 08:42:32'),
(1730, 1, 2, '105.186.180.191', 'admin.attendances.edit', 'https://tchest.co.za/admin/attendances/2022-04-19/edit', '2022-04-19 08:42:32', '2022-04-19 08:42:32'),
(1731, 1, 2, '105.186.180.191', 'admin.attendance.ajax_attendance', 'https://tchest.co.za/admin/attendances/ajax_attendance', '2022-04-19 08:42:33', '2022-04-19 08:42:33'),
(1732, 1, 2, '105.186.180.191', 'admin.attendances.index', 'https://tchest.co.za/admin/attendances', '2022-04-19 08:43:14', '2022-04-19 08:43:14'),
(1733, 1, 2, '105.186.180.191', 'admin.attendance.filter', 'https://tchest.co.za/admin/attendances/filter', '2022-04-19 08:43:15', '2022-04-19 08:43:15'),
(1734, 1, 2, '105.186.180.191', 'admin.leavetypes.index', 'https://tchest.co.za/admin/leavetypes', '2022-04-19 08:43:26', '2022-04-19 08:43:26'),
(1735, 1, 2, '105.186.180.191', 'admin.leavetypes.ajax_list', 'https://tchest.co.za/admin/leavetypes/ajax_list', '2022-04-19 08:43:27', '2022-04-19 08:43:27'),
(1736, 1, 2, '105.186.180.191', 'admin.leavetypes.create', 'https://tchest.co.za/admin/leavetypes/create', '2022-04-19 08:43:36', '2022-04-19 08:43:36'),
(1737, 1, 2, '105.186.180.191', 'admin.leave_applications.index', 'https://tchest.co.za/admin/leave_applications', '2022-04-19 08:43:49', '2022-04-19 08:43:49'),
(1738, 1, 2, '105.186.180.191', 'admin.leave_applications', 'https://tchest.co.za/admin/leave_applications/ajaxApplications', '2022-04-19 08:43:49', '2022-04-19 08:43:49'),
(1739, 1, 2, '105.186.180.191', 'admin.jobs.index', 'https://tchest.co.za/admin/jobs', '2022-04-19 08:44:26', '2022-04-19 08:44:26'),
(1740, 1, 2, '105.186.180.191', 'admin.ajax_jobs', 'https://tchest.co.za/admin/ajax_jobs', '2022-04-19 08:44:27', '2022-04-19 08:44:27'),
(1741, 1, 2, '105.186.180.191', 'admin.jobs.create', 'https://tchest.co.za/admin/jobs/create', '2022-04-19 08:44:44', '2022-04-19 08:44:44'),
(1742, 1, 2, '105.186.180.191', 'admin.job_applications.index', 'https://tchest.co.za/admin/job_applications', '2022-04-19 08:44:55', '2022-04-19 08:44:55'),
(1743, 1, 2, '105.186.180.191', 'admin.ajax_jobs_applications', 'https://tchest.co.za/admin/ajax_jobs_applications', '2022-04-19 08:44:56', '2022-04-19 08:44:56'),
(1744, 1, 2, '105.186.180.191', 'admin.job_applications.show', 'https://tchest.co.za/admin/job_applications/15', '2022-04-19 08:45:03', '2022-04-19 08:45:03'),
(1745, 1, 2, '105.186.180.191', 'admin.getlogin', 'https://tchest.co.za/admin', '2022-04-19 08:45:44', '2022-04-19 08:45:44'),
(1746, 1, 2, '105.186.180.191', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 08:45:44', '2022-04-19 08:45:44'),
(1747, 1, 2, '105.186.180.191', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 08:45:45', '2022-04-19 08:45:45'),
(1748, 1, 2, '105.186.180.191', 'admin.billing.index', 'https://tchest.co.za/admin/billing', '2022-04-19 08:45:54', '2022-04-19 08:45:54'),
(1749, 1, 2, '105.186.180.191', 'admin.general_setting.edit', 'https://tchest.co.za/admin/general-setting', '2022-04-19 08:46:10', '2022-04-19 08:46:10'),
(1750, 1, 2, '105.186.180.191', 'admin.profile_settings.edit', 'https://tchest.co.za/admin/profile-settings', '2022-04-19 08:46:19', '2022-04-19 08:46:19'),
(1751, 1, 2, '105.186.180.191', 'admin.notification.edit', 'https://tchest.co.za/admin/notification-settings', '2022-04-19 08:46:23', '2022-04-19 08:46:23'),
(1752, 1, 2, '105.186.180.191', 'admin.company_setting.theme', 'https://tchest.co.za/admin/company_setting_theme', '2022-04-19 08:46:32', '2022-04-19 08:46:32'),
(1753, 1, 2, '105.186.180.191', 'admin.attendance_settings.edit', 'https://tchest.co.za/admin/attendance_settings', '2022-04-19 08:46:48', '2022-04-19 08:46:48'),
(1754, 1, 2, '105.186.180.191', 'admin.admin_users.index', 'https://tchest.co.za/admin/admin_users', '2022-04-19 08:47:06', '2022-04-19 08:47:06'),
(1755, 1, 2, '105.186.180.191', 'admin.ajax_admin_users', 'https://tchest.co.za/admin/ajax_admin_users', '2022-04-19 08:47:07', '2022-04-19 08:47:07'),
(1756, 1, 2, '105.186.180.191', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-19 10:31:08', '2022-04-19 10:31:08'),
(1757, 1, 2, '105.186.180.191', 'admin.login', 'https://tchest.co.za/admin/login', '2022-04-19 10:33:54', '2022-04-19 10:33:54'),
(1758, 12, 17, '197.90.72.200', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 14:57:23', '2022-04-19 14:57:23'),
(1759, 12, 17, '197.90.72.200', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 14:57:24', '2022-04-19 14:57:24'),
(1760, 12, 17, '197.90.72.200', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 14:57:43', '2022-04-19 14:57:43'),
(1761, 12, 17, '197.90.72.200', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 14:57:44', '2022-04-19 14:57:44'),
(1762, 12, 17, '197.90.72.200', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-19 15:15:58', '2022-04-19 15:15:58'),
(1763, 12, 17, '197.90.72.200', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-19 15:34:00', '2022-04-19 15:34:00'),
(1764, 12, 17, '197.90.72.200', 'admin.login', 'https://tchest.co.za/admin/login', '2022-04-19 15:42:03', '2022-04-19 15:42:03'),
(1765, 12, 17, '197.90.72.200', 'admin.login', 'https://tchest.co.za/admin/login', '2022-04-19 15:42:29', '2022-04-19 15:42:29'),
(1766, 12, 17, '197.90.72.200', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 15:42:47', '2022-04-19 15:42:47'),
(1767, 12, 17, '197.90.72.200', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 15:42:47', '2022-04-19 15:42:47'),
(1768, 12, 17, '197.90.72.200', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2022-04-19 15:42:54', '2022-04-19 15:42:54'),
(1769, 12, 17, '197.90.72.200', 'admin.ajax_update_notification', 'https://tchest.co.za/admin/ajax_update_notification', '2022-04-19 15:42:57', '2022-04-19 15:42:57'),
(1770, 12, 17, '197.90.72.200', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 15:50:45', '2022-04-19 15:50:45'),
(1771, 12, 17, '197.90.72.200', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 15:50:45', '2022-04-19 15:50:45'),
(1772, 12, 17, '197.90.72.200', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 15:50:54', '2022-04-19 15:50:54'),
(1773, 12, 17, '197.90.72.200', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 15:50:54', '2022-04-19 15:50:54'),
(1774, 12, 17, '197.90.72.200', 'admin.dashboard.index', 'https://tchest.co.za/admin/dashboard', '2022-04-19 16:08:57', '2022-04-19 16:08:57'),
(1775, 12, 17, '197.90.72.200', 'admin.attendance.ajax_load_calender', 'https://tchest.co.za/admin/attendances/ajax_load_calender', '2022-04-19 16:08:58', '2022-04-19 16:08:58'),
(1776, 12, 17, '197.90.72.200', 'admin.employees.index', 'https://tchest.co.za/admin/employees', '2022-04-19 16:09:04', '2022-04-19 16:09:04'),
(1777, 12, 17, '197.90.72.200', 'admin.ajax_employees', 'https://tchest.co.za/admin/employees/ajax_employees', '2022-04-19 16:09:04', '2022-04-19 16:09:04'),
(1778, 12, 17, '197.90.72.200', 'admin.employees.create', 'https://tchest.co.za/admin/employees/create', '2022-04-19 16:09:38', '2022-04-19 16:09:38'),
(1779, 12, 17, '197.90.72.200', 'admin.departments.ajax_designation', 'https://tchest.co.za/admin/departments/ajax_designation', '2022-04-19 16:09:39', '2022-04-19 16:09:39'),
(1780, 12, 17, '197.90.72.200', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-19 16:27:42', '2022-04-19 16:27:42'),
(1781, 12, 17, '197.90.72.200', 'admin.screenlock.modal', 'https://tchest.co.za/screenlock/modal', '2022-04-19 16:45:44', '2022-04-19 16:45:44');

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
(1, 'Optic Software Solutions', 1, 'monthly', 'divan@opticsoftwaresolutions.co.za', 'Divan Serfontein', '13234b6440c526d8ec3d9ff543ee36a1.png', '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', '+27834129305', 'ZAR', 'R', '+02:00=25', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2021-07-13 16:17:50', '2022-03-21 14:31:57', NULL, 'South Africa', NULL, 1, '06:00:00', '15:00:00', 1, 20, '25 Spitfire Avenue, Pierre van Ryneveld, Pretoria, 0157', 0, NULL, NULL, NULL, NULL, NULL),
(12, 'Chint Global', 1, 'monthly', 'heather@chintglobal.com', 'Heather Scott', 'default.png', '18 Mona Avenue Highway Gardens Germiston', '+27104439791', 'ZAR', 'R', '+02:00=25', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'darkblue', 'dark-blue', 'en', 0, 1, 1, 1, 1, 1, 1, 1, 1, 'active', '2022-04-01 08:16:04', '2022-04-19 15:42:57', NULL, 'South Africa', NULL, 1, '05:30:00', '14:00:00', 1, 10, '18 Mona Avenue Highway Gardens Germiston', 0, NULL, NULL, NULL, NULL, NULL);

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
(3, 1, 'General Worker', '2021-10-07 12:44:53', '2021-10-07 12:44:53'),
(4, 1, 'Management', '2021-10-07 12:45:22', '2021-10-07 12:45:22'),
(5, 1, 'Management', '2021-10-07 12:45:31', '2021-10-07 12:45:31'),
(8, 12, 'HR', '2022-04-01 08:21:23', '2022-04-01 08:21:23');

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
(3, 3, 'General Worker', '2021-10-07 12:44:53', '2021-10-07 12:44:53'),
(4, 4, 'Director', '2021-10-07 12:45:22', '2021-10-07 12:45:22'),
(5, 5, 'CFO', '2021-10-07 12:45:31', '2021-10-07 12:45:31'),
(9, 8, 'Management', '2022-04-01 08:21:23', '2022-04-01 08:21:23');

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
(1, '1001', 1, 'Divan Serfontein', 'divanserfontein@gmail.com', '$2y$10$5o3f178RGd1ESivc1lpLOeVzSNyJG.QXZ4J1su5.quXqp91I3bfG6', 'male', 'Serfontein', '0834129305', '1995-08-07', 4, '2021-07-13', 'e00c78a32c3d6f2a42ab18dbbfe807b6.jpg', '25 Spitfire Avenue', '25 Spitfire Avenue', 10, 'active', NULL, NULL, NULL, NULL, '2021-07-13 16:51:47', '2022-03-01 17:28:41'),
(9, '10001', 1, 'Chris Moolman', 'chriskersie@gmail.com', '$2y$10$kFOqqleWfHW2VJnBlRbfW.Blgg9cgOQZCG/ZWmpcF/TOkGm5DnAcu', 'male', 'Moolman', '0833094742', '1988-02-28', 1, '2022-03-01', 'default.jpg', '25 Spitfire Avenue, Pierre van ryneveld, 0157, Pretoria', '25 Spitfire Avenue, Pierre van ryneveld, 0157, Pretoria', 0, 'active', NULL, NULL, NULL, NULL, '2022-03-01 17:25:18', '2022-04-05 06:24:05'),
(10, '24343', 12, 'Testing', 'testing@gmil.com', '$2y$10$sm4P5Sx5W2O18CTucoWUGuZ3y4Al7JmlmHl/s4cN.2Wyw55oyO6fi', 'male', 'test', '6348796348973', '2022-04-08', 9, '2022-04-01', 'd152fd4bb50bcf483bd3262aa100335f.png', 'TestingTestingTestingTestingTesting', 'TestingTestingTestingTesting', 0, 'active', NULL, NULL, NULL, NULL, '2022-04-01 11:24:08', '2022-04-01 11:24:08');

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

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `type`, `filename`, `created_at`, `updated_at`) VALUES
(1, 1, 'resume', '951348a3468754b8ebbce0925a1753d2.pdf', '2022-03-01 17:28:11', '2022-03-01 17:28:47'),
(2, 1, 'IDProof', '3cf0110f6d89017a5808262c19e5a911.jpg', '2022-03-01 17:28:11', '2022-03-01 17:28:47');

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
(23, 'Boxes', 'boxes', '2022-03-15', 'Boxes Online', 322, NULL, '2022-03-21 14:24:04', '2022-03-21 14:24:04', 1, 9, 'approved'),
(24, 'Adobe XD', 'adobe-xd', '2022-03-16', 'Adobe', 148, NULL, '2022-03-21 14:29:06', '2022-03-21 14:29:06', 1, 9, 'approved'),
(25, 'Business', 'business', '2022-04-15', 'Optic Software Solutions', 2500, NULL, '2022-04-25 13:52:53', '2022-04-25 14:12:32', 1, 9, 'approved'),
(26, 'Groceries', 'groceries', '2022-04-20', 'Spar', 600, NULL, '2022-04-25 14:01:42', '2022-04-25 14:12:27', 1, 9, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `failed_records`
--

CREATE TABLE `failed_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `fail_reason` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `failed_records`
--

INSERT INTO `failed_records` (`id`, `data`, `fail_reason`) VALUES
(1, 'false', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'ID_number\' in \'field list\' (SQL: insert into `employees` (`employeeID`, `company_id`, `full_name`, `email`, `password`, `gender`, `ID_number`, `mobile_number`, `date_of_birth`, `designation`, `joining_date`, `local_address`, `permanent_address`, `annual_leave`, `status`, `updated_at`, `created_at`) values (11-100111, 11, Divan, divan@pharmadiv.co.za, $2y$10$rfBdcfcTkvVbXErR2OZ3wOfZp9EZSz311yGTSlx2V6.vGeHiLGPma, male, 10001, 0834129305, 2022-04-01, 8, 1970-01-01, , , , Active, 2022-04-01 08:39:38, 2022-04-01 08:39:38))');

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
(1, 'How to use T-CHEST?', 'T-CHEST helps manage the employees within your organization. You can monitor their activities and manage their payrolls and expenses.', 2, '2021-10-06 06:20:19', '2022-03-28 13:23:20');

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
(2, 'Usability', 'active', '2021-10-06 06:18:41', '2021-10-06 06:18:41'),
(3, 'About', 'active', '2021-10-06 07:41:40', '2021-10-06 07:41:40');

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
(1, 'Comprehensive Employee Dashboard', 'Employee Dashboard has been designed to give easy access to the relevant information on a single page. The Dashboard also makes doing common tasks very easy. An Employee can track his attendance on the calendar, view his leaves, check the latest notices on the Notice Board, see upcoming holidays and birthdays, and even download the salary slip for every month.', 'employee_dashboard.png', '2021-07-13 06:19:25', '2022-03-28 13:31:05'),
(2, 'Expense Claim', 'T-CHEST makes it very easy to manage expenses made by employees and reimburse them. Be it online bill, mobile recharge, field expenses, etc. employees can add expenses they have made with all details including the bill. Approved expenses are automatically added to the salary on the payroll.', 'expense.png', '2021-07-13 06:19:25', '2022-03-28 13:23:54'),
(3, 'Leave Management', 'Applying for leaves is a cakewalk with T-CHEST. An Employee can apply for leaves on\r\n                                specific days or by using a date range when he wants to apply for a long leave -\r\n                                for example, sick or maternity leaves.\r\n                                Leave request is sent to the HR Manager for approval. After approval or rejection,\r\n                                the employee is notified by email.', 'apply_leaves.png', '2021-07-13 06:19:25', '2022-03-28 13:31:52'),
(4, 'Job Application', 'The job Application section allows employees to refer people to open job applications in\r\n                                the organization. This promotes their involvement in referring good candidates for open\r\n                                jobs\r\n                                and makes it easy for the manager to manage the referrals.', 'job_vacency.png', '2021-07-13 06:19:25', '2022-03-28 13:32:06'),
(5, 'Admin Dashboard', 'T-CHEST focuses on providing easy access to information. Admin dashboard has common stats to give a good overview of what\'s going on in the organization. Stats like total employees, total departments, awards, attendance, company expenses, current month birthdays, awards list, etc. are available at hand on the dashboard itself.', 'admin_dash.png', '2021-07-13 06:19:25', '2022-03-28 13:24:42'),
(6, 'Employee Management', 'You can easily manage all the employees in the organization and their data with T-CHEST. Tasks like adding new employees, updating employee information, deleting any existing employee, and others can now be done without much hassle. You can also assign Credit Leaves (Annual Leaves) to an employee based on his experience and performance.', 'employee_admin.png', '2021-07-13 06:19:25', '2022-03-28 13:24:56'),
(7, 'Pay Slip Generator', 'Why use separate payroll software for generating payslips when it can be done in T-CHEST itself. T-CHEST provides a simple interface to make generating payslips both easy and fun. Now add hourly payments, allowances, and deductions, and generate, edit and email payslips to employees, all using T-CHEST.', 'payroll.png', '2021-07-13 06:19:25', '2022-03-28 13:33:22'),
(8, 'Awards Management', 'Being a good HR Manager, you frequently give awards and appreciation to employees. But, as the number of employees increases, keeping the track of them becomes difficult. No worries, with T-CHEST you can comfortably manage all the awards, achievements, and appreciation given in your organization.', 'awards.png', '2021-07-13 06:19:25', '2022-03-28 13:25:34'),
(9, 'Notice Board', 'With T-CHEST\'S notice board feature, you can make company-wide announcements. Notices are visible on the employee dashboard and employees are also notified by email.', 'notice.png', '2021-07-13 06:19:25', '2022-03-28 13:28:48'),
(10, 'Company Expense Management', 'Now keep track of all the company expenses conveniently. Any expense, from a small pencil to big purchases like laptops, bills, party expenditures, etc. can be added to the expense management. T-CHEST shows monthly expense stats to help you know if you are overspending and take measures on time.', 'expense_admin.png', '2021-07-13 06:19:25', '2022-03-28 13:29:05'),
(11, 'Attendance Management', 'You can mark attendance of all the employees with just one click. All you need to do is specify which employees are absent and then mark attendance.\n\nYou can also see the attendance of employees month wise.', 'attendance.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(12, 'Holidays List', 'Company Holidays are also now very easy to manage. Any holidays for the current year can be pre-planned and added. Employees can see all the upcoming holidays on their dashboard and make plans accordingly.', 'holidays.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(13, 'Admin Job Application', 'You can easily review the resumes submitted by employees and accept the best candidates. He can also preview the submitted resume without downloading them.', 'job_admin.png', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(14, 'Customize to Your Needs', 'T-CHEST provides many options to customize T-CHEST according to your needs. You can change details like the logo, company address, contact number, email, and currency to use on the Settings Page.', 'settings.png', '2021-07-13 06:19:25', '2022-03-28 13:29:50'),
(15, 'Multiple Admins', 'T-CHEST supports multiple admins. Add admins without any restrictions to minimize your headache. You just need to create a new admin and email them the details of the new account.', 'admins.png', '2021-07-13 06:19:25', '2022-03-28 13:30:02'),
(16, 'Multiple Themes', 'T-CHEST has 11 front-end themes. Choose a theme that everyone likes or the one that blends well with your company logo.', 'themes.png', '2021-07-13 06:19:25', '2022-03-28 13:30:24');

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
(1, 1, '2021-07-18', 'Office Off', '2021-07-13 16:55:40', '2021-09-16 13:39:14'),
(2, 1, '2021-08-09', 'National Women\'s Day', '2021-07-13 16:55:40', '2021-07-13 16:55:40'),
(4, 1, '2021-09-24', 'Office Off', '2021-09-16 13:39:14', '2021-10-07 12:53:46'),
(5, 1, '2021-10-10', 'Office Off', '2021-10-07 12:53:46', '2021-11-22 13:13:21'),
(6, 1, '2021-10-15', 'Office Off', '2021-10-07 12:53:46', '2021-11-22 13:13:21'),
(8, 1, '2021-12-26', 'Boxing Day', '2021-11-22 13:13:21', '2021-11-22 13:13:21'),
(9, 1, '2021-12-16', '16 december', '2021-12-14 07:32:22', '2021-12-14 07:32:22'),
(10, 1, '2021-12-25', 'Christmas', '2021-12-15 09:05:04', '2021-12-15 09:05:04');

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
(2, 1, 'Business Analyst', 'Analyze client provided business plans.', '2021-09-14', '2021-10-15', '2021-10-16', 'active', '2021-09-14 09:55:11', '2021-09-14 09:55:11'),
(3, 1, 'IT Engineer', 'engineer', '2021-09-15', '2021-09-30', '2021-10-01', 'active', '2021-09-15 10:24:02', '2021-09-15 10:24:02');

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
(15, 1, 2, 'Divan Serfontein', 'divanserfontein@gmail.com', '0834129305', '/tmp/php65abwz', 'cover letter', 'pending', 1, '2021-09-15 09:35:32', '2021-09-15 09:35:32'),
(16, 1, 2, 'Divan Serfontein', 'divanserfontein@gmail.com', '0834129305', '/tmp/phplWvzEC', 'Cover Letter', 'pending', 1, '2021-09-15 10:17:58', '2021-09-15 10:17:58'),
(17, 1, 3, 'Divan Serfontein', 'divanserfontein@gmail.com', '0834129305', '/tmp/phprqMLI0', 'idjfojsdofhasoduf', 'pending', 1, '2021-09-15 10:50:07', '2021-09-15 10:50:07');

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
(2, 1, 'Sick Leave', 9, '2021-07-13 16:57:45', '2021-07-13 16:57:45');

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
(1, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-21', '2021-09-21', 1, '2021-09-13', 'Mr. Stark. I don\'t feel so good.', 'approved', '2021-09-13 08:11:06', '2021-09-14 03:55:22'),
(2, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-28', NULL, 1, '2021-09-14', 'blah', 'approved', '2021-09-14 04:37:37', '2021-09-15 10:13:57'),
(3, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-23', '2021-09-23', 1, '2021-09-15', 'sick', 'approved', '2021-09-15 10:19:18', '2021-10-29 07:16:30'),
(4, 1, 1, 'Sick Leave', 'null', NULL, '2021-10-01', '2021-10-04', 4, '2021-09-16', 'sick', 'approved', '2021-09-16 02:57:16', '2021-11-08 06:46:13'),
(5, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-30', '2021-09-30', 1, '2021-09-16', 'something else', 'approved', '2021-09-16 03:03:52', '2021-09-17 08:55:37'),
(6, 1, 1, 'Sick Leave', 'no', NULL, '2021-09-23', '2021-09-29', 6, '2021-09-16', '1456\n3417.', 'approved', '2021-09-16 03:07:10', '2021-11-08 06:46:15'),
(7, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-23', '2021-09-25', 2, '2021-09-16', 'oiuygfcgvmbkl.jhg', 'approved', '2021-09-16 03:11:45', '2021-09-17 08:55:27'),
(8, 1, 1, 'Normal Leave', 'no', NULL, '2021-09-17', '2021-09-17', 1, '2021-09-16', 'uyteszxcvbn,', 'approved', '2021-09-16 03:12:10', '2021-09-17 08:55:46'),
(10, 1, 1, 'Normal Leave', 'no', NULL, '2021-11-23', NULL, 1, '2021-11-22', 'Need to watch soccer', 'pending', '2021-11-22 13:00:24', '2021-11-22 13:00:24'),
(11, 1, 1, 'Normal Leave', NULL, NULL, '2021-12-20', '2021-12-31', 12, '2021-11-22', 'December Holiday', 'approved', '2021-11-22 13:01:09', '2021-12-19 04:22:28'),
(12, 1, 1, 'Sick Leave', 'no', NULL, '2021-11-23', NULL, 1, '2021-11-22', 'Sick', 'approved', '2021-11-22 13:01:25', '2021-12-12 04:48:33'),
(13, 1, 1, 'Normal Leave', 'yes', NULL, '2021-12-13', '2021-12-13', 1, '2021-12-13', 'I am feeling sick.I will leave office at 12pm to go to the doctor', 'rejected', '2021-12-13 07:11:34', '2021-12-17 09:24:03'),
(14, 1, 1, 'Sick Leave', 'yes', NULL, '2021-12-17', '2021-12-17', 1, '2021-12-17', 'Need to go to the doctor', 'approved', '2021-12-17 09:19:02', '2021-12-17 09:23:54'),
(15, 1, 1, 'Normal Leave', 'no', NULL, '2021-12-30', '2022-01-08', 9, '2021-12-23', 'adg', 'rejected', '2021-12-23 17:01:05', '2022-04-01 08:29:08');

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
(5, NULL, 'pdnff', 'dfmalkdflkmsdf', 'active', '2021-10-05 02:23:58', '2021-10-05 02:23:58'),
(6, NULL, 'notice', 'notice', 'active', '2021-10-05 02:28:48', '2021-10-05 02:28:48'),
(7, NULL, 'oasd', 'aslkddn', 'active', '2021-10-05 02:30:09', '2021-10-05 02:30:09'),
(8, 1, 'Meeting 08/10/2021', 'Good day, all. Tomorrow morning at 8am we will have a management meeting.', 'active', '2021-10-07 12:47:19', '2021-10-11 10:06:04'),
(9, 1, 'Birthday', 'Please remember that Derick, our CFO\'s birthday is next week the 10th of October', 'active', '2021-10-07 12:48:25', '2021-10-11 10:00:31'),
(10, 1, 'Attendance', 'During the past week, many of you have forgotten to either clock in or clock out. Please note that continuing to do so may have future consequences.', 'active', '2021-10-07 12:50:41', '2021-10-11 10:03:36'),
(11, NULL, 'New Notice', 'Notice body', 'active', '2021-10-11 10:04:18', '2021-10-11 10:04:18'),
(12, NULL, 'New notice again', 'notice body', 'active', '2021-10-11 10:05:05', '2021-10-11 10:05:05'),
(13, NULL, 'New notice', 'notice body', 'active', '2021-10-11 10:13:55', '2021-10-11 10:13:55'),
(14, NULL, 'Notice', 'Description', 'active', '2021-10-11 10:20:57', '2021-10-11 10:20:57'),
(15, NULL, 'ghjngjn', 'ertfgesrtg', 'active', '2021-10-11 10:32:16', '2021-10-11 10:32:16'),
(16, 1, 'New Notice', 'Notice body', 'active', '2021-10-11 10:33:38', '2021-10-11 10:35:22'),
(18, 1, 'Test', '<p>Test</p>', 'active', '2022-04-01 06:23:10', '2022-04-01 06:23:10'),
(19, 1, 'Today we\'ll be testing the app and website', '<p>Today we\'ll be testing the app and website on the 19th of April<br></p>', 'active', '2022-04-19 08:42:01', '2022-04-19 08:42:01'),
(20, 1, 'Notice added from phone', 'Notice added from phone', 'active', '2022-04-19 10:37:48', '2022-04-19 10:37:48');

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
(1, 1, 'Terms of Service', 'terms-of-service', '<p style=\"margin-top:15.0pt;margin-right:0cm;margin-bottom:15.0pt;margin-left:\n0cm\"><span style=\"font-size: 10pt;\">THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT\n(hereinafter \"You\" or \"Your\") AND T-CHEST (hereinafter\n\"T-CHEST\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM\n(hereinafter the \"Software\").<o:p></o:p></span></p>\n\n<h4 style=\"margin: 7.5pt 0cm;\"><span style=\"font-size: 13.5pt;\">1. Acceptance of Terms<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">This Agreement consists of\nthe following terms and conditions referred to as the \"Terms\". You\nmust be of legal age to enter into a binding agreement to accept the Terms. If\nyou do not agree to the Terms, do not use the Software. You can accept the\nTerms by checking a checkbox or clicking on a button indicating your acceptance\nof the terms or by actually using the Software.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">2. Description of Software<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">{{ $setting-&gt;main_name\n}}, an HR Management solution. You may use the Software for your personal and\nbusiness use or for internal business purposes in the organization that you\nrepresent. You may connect to the Software using any Internet browser supported\nby the Software. You are responsible for obtaining access to the Internet and\nthe equipment necessary to use the Software. You can create and edit content\nwith your user account and if you choose to do so, you can publish and share\nsuch content.</span><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">3. Modification of Terms of Software<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We may modify the Terms\nupon notice to you at any time through a service announcement or by sending an\nemail to your primary email address. If we make significant changes to the\nTerms that affect your rights, you will be provided with at least 30 days\nadvance notice of the changes by email to your primary email address. You may\nterminate your use of the Software by providing T-CHEST notice by email within\n30 days of being notified of the availability of the modified Terms if the\nTerms are modified in a manner that substantially affects your rights in\nconnection with the use of the Software. In the event of such termination, you\nwill be entitled to prorated refund of the unused portion of any prepaid fees.\nYour continued use of the Software after the effective date of any change to\nthe Terms will be deemed to be your agreement to the modified Terms.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">4. User Sign up Obligations<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You need to sign up for a\nuser account by providing all the required information to access or use the\nSoftware. If you represent an organization and wish to use the Software for\ncorporate internal use, we recommend that you, and all other users from your\norganization, sign up for user accounts by providing your corporate contact\ninformation. In particular, we recommend that you use your corporate email\naddress. You agree to a) provide true, accurate, current, and complete\ninformation about yourself as prompted by the sign-up process; and b) maintain\nand promptly update the information provided during sign-up to keep it true,\naccurate, current, and complete. If you provide any information that is untrue,\ninaccurate, outdated, or incomplete, or if T-CHEST has reasonable grounds to\nsuspect that such information is untrue, inaccurate, outdated, or incomplete, T-CHEST\nmay terminate your user account and refuse current or future use of the\nSoftware.</span><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">5. Organization Accounts and Administrators<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">When you sign up for an\naccount for your organization you may specify one or more administrators. The\nadministrators will have the right to configure the Software based on your\nrequirements and manage end users in your organization account. If your\norganization account is created and configured on your behalf by a third party,\nsuch a third party has likely assumed an administrator role for your organization.\nMake sure that you enter into a suitable agreement with such a third party\nspecifying such party’s roles and restrictions as an administrator of your\norganization account. You are responsible for:</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<ol start=\"1\" type=\"1\">\n <li class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 10pt;\">ensuring the\n     confidentiality of your organization account password,<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 10pt;\">appointing\n     competent individuals as administrators for managing your organization’s\n     account, and<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 10pt;\">Ensure that\n     all activities that occur in connection with your organization’s account\n     comply with this Agreement. You understand that T-CHEST is not responsible\n     for account administration and internal management of the Software for\n     you.<o:p></o:p></span></li>\n</ol>\n\n\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You are responsible for taking the necessary steps for ensuring that\nyour organization does not lose control of the administrator accounts. You may\nspecify a process to be followed for recovering control in the event of such\nloss of control of the administrator accounts by sending an email to&nbsp;</span><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; line-height: 107%;\">admin@tchest.co.za</span></a><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">, provided that the process is acceptable to T-CHEST.\nIn the absence of any specified administrator account recovery process, T-CHEST\nmay provide control of an administrator account to an individual providing\nproof satisfactory to T-CHEST demonstrating authorization to act on behalf of\nthe organization. You agree not to hold T-CHEST liable for the consequences of\nany action taken by T-CHEST in good faith in this regard.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">6. Self-Hosted Terms<o:p></o:p></span></h4>\n\n<h5 style=\"margin: 7.5pt 0cm;\"><span style=\"font-size: 10.5pt;\">6.1 Your License Rights<o:p></o:p></span></h5>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Subject to the terms and\nconditions of this Agreement, T-CHEST grants you a non-exclusive,\nnon-sublicensable, and non-transferable license to install and use the Software\nduring the applicable License Term by this Agreement.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h5 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 10.5pt;\">6.2 Number of Instances<o:p></o:p></span></h5>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Unless otherwise specified\nin your Order, for each Software license that you purchase, you may install one\ninstance of the Software on systems owned or operated by you (or your\nthird-party service providers so long as you remain responsible for their\ncompliance with the terms and conditions of this Agreement).</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h5 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 10.5pt;\">6.3 Your Modifications<o:p></o:p></span></h5>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Subject to the terms and\nconditions of this Agreement:</span><span style=\"font-size:12.0pt;\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<ol start=\"1\" type=\"1\">\n <li class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 10pt;\">for any\n     elements of the Software provided by T-CHEST in source code form, and to\n     the extent permitted in the Documentation, you may modify such source code\n     solely for purposes of developing bug fixes, customizations, and\n     additional features for the Software and<o:p></o:p></span></li>\n <li class=\"MsoNormal\" style=\"line-height: normal;\"><span style=\"font-size: 10pt;\">you may also\n     modify the Documentation to reflect your permitted modifications of the\n     Software source code or the particular use of the Products within your\n     organization.<o:p></o:p></span></li>\n</ol>\n\n\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Any modified source code or Documentation constitutes \"Your\nModifications\". You may use Your Modifications solely concerning your instances\nin support of your permitted use of the Software but you may not distribute the\ncode of Your Modifications to any third party. Notwithstanding anything in this\nAgreement to the contrary, T-CHEST has no support, warranty, indemnification,\nor other obligation or liability concerning Your Modifications or their\ncombination, interaction, or use with our Products. You shall indemnify, defend\nand hold us harmless from and against any claims, costs, damages, losses,\nliabilities, and expenses (including reasonable attorneys’ fees and costs)\narising out of or in connection with any claim brought against us by a third\nparty relating to Your Modifications (including but not limited to any\nrepresentations or warranties you make about Your Modifications or the\nSoftware) or your breach of this Section 6.3. This indemnification obligation\nis subject to your receiving (i) prompt written notice of such claim (but in\nany event notice insufficient time for you to respond without prejudice); (ii)\nthe exclusive right to control and direct the investigation, defense, or\nsettlement of such claim; and (iii) all reasonably necessary cooperation of T-CHEST\nat your expense.</span><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h5 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 10.5pt;\">6.4 Attribution<o:p></o:p></span></h5>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">In any use of the\nSoftware, you must include the following attribution to T-CHEST on all user\ninterfaces in the following format: \"Powered by T-CHEST\" which must\nin every case include a hyperlink to http://www.solutionrack.com, and which\nmust be in the same format as delivered in the Software. If no such attribution\nis delivered with the Software, it is not required to include such attribution.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h5 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 10.5pt;\">6.5 Support<o:p></o:p></span></h5>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">The support provided by T-CHEST\nfor self-hosted services is limited to the issues arising because of bugs in\nthe Software delivered. It does not include (i) issues arising as a result of\noutdated software running on the server on which you choose to install the\nSoftware (ii) issues arising as a result of Your Modifications as described in\nsection 6.5 (iii) issues arising because server not meeting System Requirements\nfor the Software.</span><span style=\"font-size:12.0pt;line-height:107%;\nfont-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">7. Personal Information and Privacy<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">The personal information\nyou provide to T-CHEST through the Software is governed by the TIME TRACKER\nSYSTEM – HRM Privacy Policy. Your election to use the Software indicates your\nacceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You\nare responsible for maintaining the confidentiality of your username, password,\nand other sensitive information. You are responsible for all activities that\noccur in your user account and you agree to inform us immediately of any\nunauthorized use of your user account by email to&nbsp;</span><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; line-height: 107%;\">admin@tchest.co.za</span></a><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">. We are not responsible for any loss or damage to\nyou or any third party incurred as a result of any unauthorized access and/or\nuse of your user account, or otherwise.</span><span style=\"font-size:\n12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">8. Communications from T-CHEST<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">The Software may include\ncertain communications from T-CHEST, such as service announcements,\nadministrative messages, and newsletters. You understand that these\ncommunications shall be considered part of using the Software. As part of our\npolicy to provide you total privacy, we also provide you the option of opting\nout of receiving newsletters from us. However, you will not be able to opt-out\nfrom receiving service announcements and administrative messages.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">9. Complaints<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">If we receive a complaint\nfrom any person against you concerning your activities as part of the use of\nthe Software, we will forward the complaint to the primary email address of\nyour user account. You must respond to the complainant directly within 10 days\nof receiving the complaint forwarded by us and copy T-CHEST in the\ncommunication. If you do not respond to the complainant within 10 days from the\ndate of our email to you, we may disclose your name and contact information to\nthe complainant for enabling the complainant to take legal action against you. You\nunderstand that your failure to respond to the forwarded complaint within the\n10 days time limit will be construed as your consent to the disclosure of your\nname and contact information by T-CHEST to the complainant.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">10. Fees and Payments<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">The Software is available\nunder the monthly subscription plan. Your subscription can be automatically\nrenewed at the end of each month unless you downgrade your paid subscription\nplan to a free plan or inform us that you do not wish to renew the\nsubscription. If you do not wish to renew the subscription, you must inform us\nat least seven days before the renewal date. If you have not downgraded to a\nfree plan and if you have not informed us that you do not wish to renew the\nsubscription, you will be presumed to have authorized T-CHEST to charge the\nsubscription fee. From time to time, we may change the price of any Software or\ncharge for use of Services that are currently available free of charge. Any\nincrease in charges will not apply until the expiry of your then-current\nbilling cycle. You will not be charged for using any Software unless you have\nopted for a paid subscription plan.</span><span style=\"font-size:12.0pt;\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">11. Restrictions on Use<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">In addition to all other\nterms and conditions of this Agreement, you shall not: (i) transfer the\nSoftware or otherwise make it available to any third party; (ii) provide any\nservice based on the Software without prior written permission; (iii) use the\nthird party links to sites without agreeing to their website terms &amp;\nconditions; (iv) post links to third party sites or use their logo, company\nname, etc. without their prior written permission; (v) publish any personal or\nconfidential information belonging to any person or entity without obtaining\nconsent from such person or entity; (vi) use the Software in any manner that\ncould damage, disable, overburden, impair or harm any server, network, computer\nsystem, resource of T-CHEST; (vii) violate any applicable local, state,\nnational or international law; and (viii) create a false identity to mislead\nany person as to the identity or origin of any communication.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">12. Spamming and Illegal Activities<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You agree to be solely\nresponsible for the contents of your transmissions through the Software. You\nagree not to use the Software for illegal purposes or for the transmission of\nmaterial that is unlawful, defamatory, harassing, libelous, invasive of\nanother\'s privacy, abusive, threatening, harmful, vulgar, pornographic,\nobscene, or is otherwise objectionable, offends religious sentiments, promotes\nracism, contains viruses or malicious code, or that which infringes or may\ninfringe the intellectual property or other rights of another. You agree not to\nuse the Software for the transmission of \"junk mail\",\n\"spam\", \"chain letters\", \"phishing\" or\nunsolicited mass distribution of email. We reserve the right to terminate your\naccess to the Software if there are reasonable grounds to believe that you have\nused the Software for any illegal or unauthorized activity.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">13. Inactive User Accounts Policy<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We reserve the right to\nterminate unpaid user accounts that are inactive for a continuous period of 120\ndays. In the event of such termination, all data associated with such user accounts\nwill be deleted. We will provide you with prior notice of such termination and\nthe option to back up your data. In the case of accounts with more than one\nuser, if at least one of the users is active, the account will not be\nconsidered inactive.</span><span style=\"font-size:12.0pt;line-height:\n107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">14. Data Ownership<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We respect your right to\nownership of content created or stored by you. You own the content created or\nstored by you. Unless specifically permitted by you, your use of the Software\ndoes not grant T-CHEST the license to use, reproduce, adapt, modify, publish or\ndistribute the content created by you or stored in your user account for T-CHEST\'s\ncommercial, marketing, or any similar purpose. But you grant T-CHEST permission\nto access, copy, distribute, store, transmit, reformat, publicly display and\npublicly perform the content of your user account solely as required for providing\nthe Software to you.</span><span style=\"font-size:12.0pt;line-height:\n107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">15. User Generated Content<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You may transmit or\npublish content created by you using the Software or otherwise. However, you\nshall be solely responsible for such content and the consequences of its\ntransmission or publication. Any content made public will be publicly\naccessible through the internet and may be crawled and indexed by search\nengines. You are responsible for ensuring that you do not accidentally make any\nprivate content publicly available. Any content that you may receive from other\nusers of the Software is provided to you AS IS for your information and\npersonal use only and you agree not to use, copy, reproduce, distribute,\ntransmit, broadcast, display, sell, license, or otherwise exploit such content\nfor any purpose, without the express written consent of the person who owns the\nrights to such content. In the course of using the Software, if you come across\nany content with copyright notice(s) or any copy protection feature(s), you\nagree not to remove such copyright notice(s) or disable such copy protection\nfeature(s) as the case may be. By making any copyrighted/copyrightable content\navailable on the Software you affirm that you have the consent, authorization,\nor permission, as the case may be from every person who may claim any rights in\nsuch content to make such content available in such manner. Further, by making\nany content available in the manner aforementioned, you expressly agree that T-CHEST\nwill have the right to block access to or remove such content made available by\nyou if T-CHEST receives complaints concerning any illegality or infringement of\nthird-party rights in such content. By using the Software and transmitting or\npublishing any content using such Software, you expressly consent to the\ndetermination of questions of illegality or infringement of third party rights\nin such content by the agent designated by T-CHEST for this purpose.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">16. Disclaimer of Warranties<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">YOU EXPRESSLY UNDERSTAND\nAND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE\nPROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. T-CHEST EXPRESSLY DISCLAIMS ALL\nWARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED\nTO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR\nPURPOSE. T-CHEST MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED,\nTIMELY, SECURE, OR ERROR-FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED\nTHROUGH THE USE OF THE SERVICES SHALL BE AT YOUR DISCRETION AND RISK AND YOU\nWILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE\nTELEPHONE, WIRELESS DEVICE, OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR\nTHE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR\nORAL, OBTAINED BY YOU FROM T-CHEST, ITS EMPLOYEES, OR REPRESENTATIVES SHALL\nCREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">17. Limitation of Liability<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">YOU AGREE THAT T-CHEST\nSHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT,\nSPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS\nPROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION,\nOR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE\nSERVICE, EVEN IF T-CHEST HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN\nNO EVENT SHALL T-CHEST\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE,\nWHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">18. Indemnification<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You agree to indemnify and\nhold harmless T-CHEST, its officers, directors, employees, suppliers, and\naffiliates, from and against any losses, damages, fines, and expenses\n(including attorney\'s fees and costs) arising out of or relating to any claims\nthat you have used the Software in violation of another party\'s rights, in\nviolation of any law, in violations of any provisions of the Terms, or any\nother claim related to your use of the Software, except where such use is\nauthorized by T-CHEST.</span><span style=\"font-size:12.0pt;line-height:\n107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">19. Suspension and Termination<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We may suspend your user\naccount or temporarily disable access to whole or part of any Software in the\nevent of any suspected illegal activity, extended periods of inactivity, or\nrequests by law enforcement or other government agencies. Objections to\nsuspension or disabling of user accounts should be made to&nbsp;</span><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; line-height: 107%;\">admin@tchest.co.za</span></a><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;within thirty days of being notified about\nthe suspension. We may terminate a suspended or disabled user account after\nthirty days. We will also terminate your user account at your request. In\naddition, we reserve the right to terminate your user account and deny the\nSoftware upon reasonable belief that you have violated the Terms. You have the\nright to terminate your user account if T-CHEST breaches its obligations under\nthese Terms and in such event, you will be entitled to prorated refund of\naccess to the Software, deletion of information in your user accounts such as\nyour email address and password, and deletion of all data in your user account.</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif\"><o:p></o:p></span></p>\n\n<h4 style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;margin-left:\n0cm\"><span style=\"font-size: 13.5pt;\">20. END OF TERMS OF SERVICE<o:p></o:p></span></h4>\n\n\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">If you have any questions\nor concerns regarding this Agreement, please contact us at&nbsp;</span><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; line-height: 107%;\">admin@tchest.co.za</span></a><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">.</span><o:p></o:p></p><p></p><p></p>', '2021-07-13 06:19:25', '2022-03-28 13:22:19');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, 'Privacy Policy', 'privacy-policy', '<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:4;tab-stops:183.0pt\"><span style=\"font-size: 13.5pt;\">General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">At T-CHEST,\nwe respect your need for online privacy and protect any Personal Information\nthat you may share with us, appropriately. Our practice concerning the use of\nyour Personal Information is as set forth below in this Privacy Policy Statement.\nAs a condition to using T-CHEST Services, you consent to the terms of the\nPrivacy Policy Statement as it may be updated from time to time.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:4\"><span style=\"font-size: 13.5pt;\">Information Recorded and Use:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Personal Information<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">During\nthe Registration Process for creating a user account, we request your name,\nemail address, and company name. You will also be asked to choose a password,\nwhich will be used solely to provide access to your user account. Your name and\nemail address will be used to inform you regarding new services, releases,\nupcoming events, and changes in this Privacy Policy Statement.</span><span style=\"font-size: 10pt;\"><br>\n<br>\n<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">T-CHEST will have access to third-party personal\ninformation provided by you as part of using T-CHEST Services. This information\nmay include third-party names, email addresses, phone numbers, and physical\naddresses and will be used for servicing your requirements as expressed by you\nto T-CHEST and solely as part and parcel of your use of T-CHEST Services. We do\nnot share this third-party personal information with anyone for promotional\npurposes, nor do we utilize it for any purposes not expressly consented to by\nyou. When you elect to refer friends to the website, we request their email addresses\nand name to facilitate the request and deliver a one-time email. Your friend\nmay contact us at&nbsp;</span></span><span style=\"font-size:12.0pt;font-family:\n&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:\nEN-ZA\"><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; font-family: &quot;Open Sans&quot;, sans-serif;\">admin@tchest.co.za</span></a></span><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;to\nrequest that we remove this information from our database.</span><span style=\"font-size: 10pt;\"><br>\n<br>\n<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We post user testimonials on our website. These\ntestimonials may include names and other Personal Information and we acquire\npermission from our users before posting these on our website.</span><br>\n<br>\n<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">T-CHEST is not responsible for the Personal\nInformation users elect to post within their testimonials.</span></span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Usage Details<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Your\nusage details such as time, frequency, duration and pattern of use, features\nused, and the amount of storage used will be recorded by us to enhance your\nexperience of the T-CHEST Services and to help us provide you the best possible\nservice.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Contents of your User Account<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nstore and maintain files, documents, emails, and other data stored in your user\naccount at servers provided by cloud services like Microsoft Azure. To prevent\nloss of data due to errors or system failures, we also keep backup copies of\ndata including the contents of your user account. Hence your files and data may\nremain on our servers even after the deletion or termination of your user\naccount. We may retain and use your Personal Information and data as necessary\nto comply with our legal obligations, resolve disputes, and enforce our rights.\nWe assure you that the contents of your user account will not be disclosed to\nanyone and will not be accessible even to employees of T-CHEST except in\ncircumstances specifically mentioned in this Privacy Policy Statement and Terms\nof Services. We also do not scan the contents of your user account for serving\ntargeted advertisements.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Payment Information<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">In\ncase of services requiring payment, we request credit card or other payment\naccount information, which will be used solely for processing payments. Your\nfinancial information will not be stored by us except for the name and address\nof the cardholder, the expiry date, and the last four digits of the Credit Card\nnumber. Subject to your prior consent and where necessary for processing future\npayments, your financial information will be stored in encrypted form on secure\nservers of our reputed Payment Gateway Service Provider who is beholden to\ntreating your Personal Information by this Privacy Policy Statement.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Links from our website<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Some\npages of our website contain external links. You are advised to verify the\nprivacy practices of such other websites. We are not responsible for the manner\nof use or misuse of information made available by you at such other websites.\nWe encourage you not to provide Personal Information, without assuring\nyourselves of the Privacy Policy Statement of other websites.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Federated Authentication<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">You\ncan log in to our site, if an option is available, using federated\nauthentication providers such as Facebook Connect. These services will\nauthenticate your identity and provide you the option to share certain Personal\nInformation with us such as your name and email address to pre-populate our\nsign-up form.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">With whom we share Information<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nmay need to share your Personal Information and your data with our affiliates,\nresellers, service providers, and business partners solely to provide T-CHEST\nServices to you. The purposes for which we may disclose your Personal\nInformation or data to our service providers may include but are not limited\nto, data storage, database management, web analytics, and payment processing.\nThese service providers are authorized to use your Personal Information or data\nonly as necessary to provide these services to us. In such cases, T-CHEST will\nalso ensure that such affiliates, resellers, service providers, and business\npartners comply with this Privacy Policy Statement and adopt appropriate\nconfidentiality and security measures. We will obtain your prior specific\nconsent before we share your Personal Information or data with any person\noutside T-CHEST for any purpose that is not directly connected with providing T-CHEST\nServices to you. We will share your Personal Information with third parties\nonly in the ways that are described in this Privacy Policy Statement. We do not\nsell your Personal Information to third parties. We may share generic\naggregated demographic information not linked to any Personal Information\nregarding visitors and users with our business partners and advertisers. Please\nbe aware that laws in various jurisdictions in which we operate may obligate us\nto disclose user information and the contents of your user account to the local\nlaw enforcement authorities under a legal process or an enforceable government\nrequest. In addition, we may also disclose Personal Information and contents of\nyour user account to law enforcement authorities if such disclosure is\ndetermined to be necessary by T-CHEST in our sole and absolute discretion for\nprotecting the safety of our users, employees, or the general public. If T-CHEST\nis involved in a merger, acquisition, or sale of all or a portion of its\nbusiness or assets, you will be notified via email and/or a prominent notice on\nour website of any change in ownership or uses of your Personal Information, as\nwell as any choices you may have regarding your Personal Information.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">How secure is your Information?<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nadopt industry-appropriate data collection, storage, and processing practices\nand security measures, as well as physical security measures to protect against\nunauthorized access, alteration, disclosure, or destruction of your Personal\nInformation, username, password, transaction information, and data stored in\nyour user account. Access to your name and email address is restricted to our\nemployees who need to know such information in connection with providing T-CHEST\nServices to you and are bound by confidentiality obligations.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Your Choice in Information Use<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">In\nthe event we decide to use your Personal Information for any purpose other than\nas stated in this Privacy Policy Statement, we will offer you an effective way\nto opt out of the use of your Personal Information for those other purposes.\nFrom time to time, we may send emails to you regarding new services, releases,\nand upcoming events. You may opt out of receiving newsletters and other\nsecondary messages from T-CHEST by selecting the ‘unsubscribe’ function present\nin every email we send. However, you will continue to receive essential\ntransactional emails.</span><span style=\"font-size: 10pt;\"><br>\n<br>\n<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Accessing, Updating, and Removing Personal\nInformation Users who wish to correct, update, or remove any Personal\nInformation, including those from a public forum, directory, or testimonial on\nour site, may do so by accessing their user account or by contacting them T-CHEST\nCustomer Support Services at&nbsp;</span></span><span style=\"font-size:12.0pt;\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:EN-ZA\"><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; font-family: &quot;Open Sans&quot;, sans-serif;\">admin@tchest.co.za</span></a></span><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">.\nSuch changes may take up to 48 hours to take effect. We respond to all\ninquiries within 30 days. Investigation of Illegal Activity We may need to\nprovide access to your Personal Information and the contents of your user\naccount to our employees and service providers to investigate any suspected\nillegal activity or potential violation of the terms and conditions for use of T-CHEST\nServices. However, T-CHEST will ensure that such access complies with this\nPrivacy Policy Statement and is subject to appropriate confidentiality and\nsecurity measures.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Enforcement of Privacy Policy<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nmake every effort, including periodic reviews to ensure that Personal\nInformation provided by you is used in conformity with this Privacy Policy\nStatement. If you have any concerns regarding our adherence to this Privacy\nPolicy Statement or how Personal Information is used to provide T-CHEST\nServices, kindly contact T-CHEST Customer Support Services at&nbsp;</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; font-family: &quot;Open Sans&quot;, sans-serif;\">admin@tchest.co.za</span></a></span><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">. We\nwill contact you to address your concerns and we will also co-operate with\nregulatory authorities in this regard if needed.</span><span style=\"font-size:\n12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\nmso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Notification of Changes<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nmay modify the Privacy Policy Statement upon notice to you at any time through\na service announcement or by sending an email to your primary email address. If\nwe make significant changes in the Privacy Policy Statement that affect your\nrights, You will be provided with at least 30 days advance notice of the\nchanges by email to your primary email address. You may terminate your use of T-CHEST\nServices by providing T-CHEST notice by email within 30 days of being notified\nof the availability of the modified Privacy Policy Statement if the Privacy\nPolicy Statement is modified in a manner that substantially affects your rights\nin connection with the use of T-CHEST Services. Your continued use of T-CHEST\nServices after the effective date of any change to the Privacy Policy Statement\nwill be deemed to be your agreement to the modified Privacy Policy Statement.\nYou will not receive email notification of minor changes to the Privacy Policy\nStatement. If you are concerned about how your Personal Information is used,\nyou should check back at our privacy policy periodically.</span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">Blogs and Forums<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-bottom:0cm;line-height:normal\"><span style=\"font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">We\nprovide the capacity for users to post information in blogs and forums for\nsharing information in a public space on the website. This information is\npublicly available to all users of these forums and visitors to our website. We\nrequire registration to publish information, but given the public nature of\nboth platforms, any Personal Information disclosed within these forums may be\nused to contact users with unsolicited messages. We encourage users to be\ncautious in the disclosure of Personal Information in public forums as T-CHEST\nis not responsible for the Personal Information users elect to disclose.</span><span style=\"font-size: 10pt;\"><br>\n<br>\n<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">T-CHEST also supports third-party widgets such\nas Facebook and Twitter buttons on the website that allow users to share\narticles and other information on different platforms. These widgets may\ncollect your IP address, which page you are visiting on our site, and may set a\ncookie to enable the widgets to function properly. These widgets do not collect\nor store any Personal Information from users on the website and simply act as a\nbridge for your convenience in sharing information. Your interactions with\nthese widgets are governed by the privacy policy of the company providing them.</span></span><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:\n&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"margin-top:7.5pt;margin-right:0cm;margin-bottom:7.5pt;\nmargin-left:0cm;line-height:normal;mso-outline-level:5\"><span style=\"font-size: 10.5pt;\">END OF PRIVACY POLICY<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\"><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">If you have any questions or\nconcerns regarding this Privacy Policy Statement, please contact us at&nbsp;</span><span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif;\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-ZA\"><a href=\"mailto:admin@tchest.co.za\"><span style=\"font-size: 10pt; line-height: 107%; font-family: &quot;Open Sans&quot;, sans-serif;\">admin@tchest.co.za</span></a></span><span style=\"font-size: 10pt; line-height: 107%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">. Upon ascertaining your identity, we shall respond\nto all inquiries within 30 days of receipt.</span><o:p></o:p></p><p> </p><h4></h4><p></p>', '2021-07-13 06:19:25', '2022-03-28 13:19:49'),
(3, 1, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>T-Chest is an outsourcing services provider for small and medium businesses, based in&nbsp;Bedfordview, Johannesburg.&nbsp;Established in 2015 July, a solutions company that dwells in the industry of Telecoms, Recruitment, and Construction. Operating in the African market and on a global scale level, assisting third-party investors in coming into the African and Asian markets. Currently, a level 1 BEE compliant company, offering consulting services in the recruitment sector, telecoms projects, and construction solutions.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market unless the existing products can be greatly improved upon.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 15:50:38'),
(4, 2, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(5, 2, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4>Children\'s Online Privacy Protection</h4>\n\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\n\n                        <h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\n                        <br><br/>\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\n                        <br/><br/>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br/><br/>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\n\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\n\n                        <h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br/><br/>\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br/><br/>\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(6, 2, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(7, 3, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(8, 3, 'Privacy Policy', 'privacy-policy', ' <h4>General</h4>\n\n                        At HRM SAAS, we respect your need for online privacy and protect any Personal Information that you may share with us, in an appropriate manner. Our practice with respect to use of your Personal Information is as set forth below in this Privacy Policy Statement. As a condition to use of HRM SAAS Services, you consent to the terms of the Privacy Policy Statement as it may be updated from time to time.\n\n                        <h4>Children\'s Online Privacy Protection</h4>\n\n                        HRM SAAS does not knowingly collect Personal Information from users who are under 13 years of age.\n\n                        <h4>Information Recorded and Use:</h4>\n\n                        <h5>Personal Information</h5>\n\n            During the Registration Process for creating a user account, we request for your name, email address and company name. You will also be asked to choose a password, which will be used solely for the purpose of providing access to your user account. Your name and email address will be used to inform you regarding new services, releases, upcoming events and changes in this Privacy Policy Statement.\n                        <br><br/>\n                        HRM SAAS will have access to third party personal information provided by you as part of using HRM SAAS Services. This information may include third party names, email addresses, phone numbers and physical addresses and will be used for servicing your requirements as expressed by you to HRM SAAS and solely as part and parcel of your use of HRM SAAS Services. We do not share this third party personal information with anyone for promotional purposes, nor do we utilize it for any purposes not expressly consented to by you. When you elect to refer friends to the website, we request their email address and name to facilitate the request and deliver a one time email. Your friend may contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a> to request that we remove this information from our database.\n                        <br/><br/>\n                        We post user testimonials on our website. These testimonials may include names and other Personal Information and we acquire permission from our users prior to posting these on our website.\n                        <br/><br/>\n                        HRM SAAS is not responsible for the Personal Information users elect to post within their testimonials.\n\n                        <h5>Usage Details</h5>\n\n            Your usage details such as time, frequency, duration and pattern of use, features used and the amount of storage used will be recorded by us in order to enhance your experience of the HRM SAAS Services and to help us provide you the best possible service.\n\n                        <h5>Contents of your User Account</h5>\n\n            We store and maintain files, documents, emails and other data stored in your user account at servers provided by cloud services like Microsoft Azure. In order to prevent loss of data due to errors or system failures, we also keep backup copies of data including the contents of your user account. Hence your files and data may remain on our servers even after deletion or termination of your user account. We may retain and use your Personal Information and data as necessary to comply with our legal obligations, resolve disputes, and enforce our rights. We assure you that the contents of your user account will not be disclosed to anyone and will not be accessible even to employees of HRM SAAS except in circumstances specifically mentioned in this Privacy Policy Statement and Terms of Services. We also do not scan the contents of your user account for serving targeted advertisements.\n\n                        <h5>Payment Information</h5>\n\n            In case of services requiring payment, we request credit card or other payment account information, which will be used solely for processing payments. Your financial information will not be stored by us except for the name and address of the card holder, the expiry date and the last four digits of the Credit Card number. Subject to your prior consent and where necessary for processing future payments, your financial information will be stored in encrypted form on secure servers of our reputed Payment Gateway Service Provider who is beholden to treating your Personal Information in accordance with this Privacy Policy Statement.\n\n\n                        <h5>Behavioral Targeting/Re-Targeting</h5>\n\n                        We partner with third parties to manage our advertisements on other sites. Our third-party partners may use technologies such as cookies to gather information about your activities on this site and other sites in order to provide you advertising based upon your browsing activities and interests. If you wish to not have this information used for the purpose of serving you interest-based advertisements, you may opt-out by <a href=\"http://preferences-mgr.truste.com/\" target=\"_blank\">clicking here</a> (or if located in the European Union <a href=\"http://www.youronlinechoices.eu/\" _target=\"blank\">click here</a>). However, you will continue to receive generic advertisements on other websites that display advertisements.\n\n                        <h5>Links from our website</h5>\n\n                        Some pages of our website contain external links. You are advised to verify the privacy practices of such other websites. We are not responsible for the manner of use or misuse of information made available by you at such other websites. We encourage you not to provide Personal Information, without assuring yourselves of the Privacy Policy Statement of other websites.\n\n                        <h5>Federated Authentication</h5>\n\n                        You can log in to our site, if option available, using federated authentication providers such as Facebook Connect. These services will authenticate your identity and provide you the option to share certain Personal Information with us such as your name and email address to pre-populate our sign up form.\n\n                        <h5>With whom we share Information</h5>\n\n                        We may need to share your Personal Information and your data to our affiliates, resellers, service providers and business partners solely for the purpose of providing HRM SAAS Services to you. The purposes for which we may disclose your Personal Information or data to our service providers may include, but are not limited to, data storage, database management, web analytics and payment processing. These service providers are authorized to use your Personal Information or data only as necessary to provide these services to us. In such cases HRM SAAS will also ensure that such affiliates, resellers, service providers and business partners comply with this Privacy Policy Statement and adopt appropriate confidentiality and security measures. We will obtain your prior specific consent before we share your Personal Information or data to any person outside HRM SAAS for any purpose that is not directly connected with providing HRM SAAS Services to you. We will share your Personal Information with third parties only in the ways that are described in this Privacy Policy Statement. We do not sell your Personal Information to third parties. We may share generic aggregated demographic information not linked to any Personal Information regarding visitors and users with our business partners and advertisers. Please be aware that laws in various jurisdictions in which we operate may obligate us to disclose user information and the contents of your user account to the local law enforcement authorities under a legal process or an enforceable government request. In addition, we may also disclose Personal Information and contents of your user account to law enforcement authorities if such disclosure is determined to be necessary by HRM SAAS in our sole and absolute discretion for protecting the safety of our users, employees, or the general public. If HRM SAAS is involved in a merger, acquisition, or sale of all or a portion of its business or assets, you will be notified via email and/or a prominent notice on our website of any change in ownership or uses of your Personal Information, as well as any choices you may have regarding your Personal Information.\n\n                        <h5>How secure is your Information</h5>\n\n                        We adopt industry appropriate data collection, storage and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Information, username, password, transaction information and data stored in your user account. Access to your name and email address is restricted to our employees who need to know such information in connection with providing HRM SAAS Services to you and are bound by confidentiality obligations.\n\n                        <h5>Your Choice in Information Use</h5>\n\n                        In the event we decide to use your Personal Information for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the use of your Personal Information for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events. You may opt out of receiving newsletters and other secondary messages from HRM SAAS by selecting the ‘unsubscribe’ function present in every email we send. However, you will continue to receive essential transactional emails.\n                        <br/><br/>\n                        Accessing, Updating and Removing Personal Information Users who wish to correct, update or remove any Personal Information including those from a public forum, directory or testimonial on our site may do so either by accessing their user account or by contacting HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. Such changes may take up to 48 hours to take effect. We respond to all enquiries within 30 days. Investigation of Illegal Activity We may need to provide access to your Personal Information and the contents of your user account to our employees and service providers for the purpose of investigating any suspected illegal activity or potential violation of the terms and conditions for use of HRM SAAS Services. However, HRM SAAS will ensure that such access is in compliance with this Privacy Policy Statement and subject to appropriate confidentiality and security measures.\n\n                        <h5>Enforcement of Privacy Policy</h5>\n\n                        We make every effort, including periodic reviews to ensure that Personal Information provided by you is used in conformity with this Privacy Policy Statement. If you have any concerns regarding our adherence to this Privacy Policy Statement or the manner in which Personal Information is used for the purpose of providing HRM SAAS Services, kindly contact HRM SAAS Customer Support Services at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We will contact you to address your concerns and we will also co-operate with regulatory authorities in this regard if needed.\n\n                        <h5>Notification of Changes</h5>\n\n                        We may modify the Privacy Policy Statement upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes in the Privacy Policy Statement that affect your rights, You will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of HRM SAAS Services by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Privacy Policy Statement if the Privacy Policy Statement is modified in a manner that substantially affects your rights in connection with use of HRM SAAS Services. Your continued use of HRM SAAS Services after the effective date of any change to the Privacy Policy Statement will be deemed to be your agreement to the modified Privacy Policy Statement. You will not receive email notification of minor changes to the Privacy Policy Statement. If you are concerned about how your Personal Information is used, you should check back at our privacy policy periodically.\n\n                        <h5>Blogs and Forums</h5>\n\n                        We provide the capacity for users to post information in blogs and forums for sharing information in a public space on the website. This information is publicly available to all users of these forums and visitors to our website. We require registration to publish information, but given the public nature of both platforms, any Personal Information disclosed within these forums may be used to contact users with unsolicited messages. We encourage users to be cautious in disclosure of Personal Information in public forums as HRM SAAS is not responsible for the Personal Information users elect to disclose.\n                        <br/><br/>\n                        HRM SAAS also supports third party widgets such as Facebook and Twitter buttons on the website that allow users to share articles and other information on different platforms. These widgets may collect your IP address, which page you are visiting on our site, and may set a cookie to enable the widgets to function properly. These widgets do not collect or store any Personal Information from users on the website and simply act as a bridge for your convenience in sharing information. Your interactions with these widgets are governed by the privacy policy of the company providing it.\n\n                        <h5>END OF PRIVACY POLICY</h5>\n\n                        If you have any questions or concerns regarding this Privacy Policy Statement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>. We shall respond to all inquiries within 30 days of receipt upon ascertaining your identity.', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(9, 3, 'About Us', 'about-us', '<div class=\"col-sm-12\"><h2 class=\"main-heading sea-green\">Overview</h2><div class=\"page-content\"><p>Froiden is an outsourcing services provider for small and medium businesses, based in <a href=\"https://en.wikipedia.org/wiki/Jaipur\" target=\"_blank\" rel=\"noopener noreferrer\">Jaipur, Rajasthan</a>. It is a young company incorporated in the year 2014.</p><p>We exclusively focus on providing services related to web applications. We do have plans for expanding to other emerging domains in near future.</p><p>We are not limited to providing outsourcing services. We have equal focus on developing our own products. While our products also are web applications and supporting mobile applications, we do not focus on any particular subject or industry. Our products tend to provide solutions to common problems faced by people. We do not develop products if similar ones are already in the market, unless the existing products can be greatly improved upon.</p><br></div><h2 class=\"main-heading sea-green\">Difference Matters</h2><div class=\"page-content\"><p>While working with Froiden, one thing that you will experience the most is the difference from others in the way we work and see things, and why is this difference so important.</p><p>Even smallest of things done differently can result in exceptional outcomes. This is what drives us to do things the way we think is right, and not just going by the book. This leads to innovations you find at Froiden.</p></div><h2 class=\"main-heading sea-green\">More About Froiden</h2><div class=\"page-content\"><p>Here are some links to learn more about us:</p><ul><li><a href=\"/about/history\">History</a>: The story of Froiden - how it started and what lies ahead</li></ul></div><h2 class=\"main-heading sea-green\">The Road Ahead</h2><div class=\"page-content\"><p>At the time this site was published, Froiden was about to complete three years. It had lived the hardest period of a startup.</p><p>Our journey of three years has made us stronger and braver. Our team has grown to 14 members and together have achieved many milestones in terms of revenue.</p><p>Our goal for next few years is to take our products to new heights. To support that, we will keep growing our services business. We believe in <em>small team - big impact</em>, so we will expand our team to a limit.</p><p>Lastly, and obviously, we will keep working on new technologies and ideas, build new products, focus on innovation and build Froiden as a brand.</p></div></div>', '2021-07-13 06:19:25', '2021-07-13 06:19:25'),
(10, 4, 'Terms of Service', 'terms-of-service', ' THIS IS AN AGREEMENT BETWEEN YOU OR THE ENTITY THAT YOU REPRESENT (hereinafter \"You\" or \"Your\") AND HRM SAAS (hereinafter \"HRM SAAS\") GOVERNING YOUR USE OF TIME TRACKER SYSTEM – HRM (hereinafter the \"Software\").\n\n<h4>1. Acceptance of Terms</h4>\n\nThis Agreement consists of the following terms and conditions referred to as the \"Terms\". You must be of legal age to enter into a binding agreement in order to accept the Terms. If you do not agree to the Terms, do not use the Software. You can accept the Terms by checking a checkbox or clicking on a button indicating your acceptance of the terms or by actually using the Software.\n\n<h4>2. Description of Software</h4>\n\n{{ $setting->main_name }}, an HR Management solution. You may use the Software for your personal and business use or for internal business purpose in the organization that you represent. You may connect to the Software using any Internet browser supported by the Software. You are responsible for obtaining access to the Internet and the equipment necessary to use the Software. You can create and edit content with your user account and if you choose to do so, you can publish and share such content.\n\n<h4>3. Modification of Terms of Software</h4>\n\nWe may modify the Terms upon notice to you at any time through a service announcement or by sending email to your primary email address. If we make significant changes to the Terms that affect your rights, you will be provided with at least 30 days advance notice of the changes by email to your primary email address. You may terminate your use of the Software by providing HRM SAAS notice by email within 30 days of being notified of the availability of the modified Terms if the Terms are modified in a manner that substantially affects your rights in connection with use of the Software. In the event of such termination, you will be entitled to prorated refund of the unused portion of any prepaid fees. Your continued use of the Software after the effective date of any change to the Terms will be deemed to be your agreement to the modified Terms.\n\n<h4>4. User Sign up Obligations</h4>\n\nYou need to sign up for a user account by providing all required information in order to access or use the Software. If you represent an organization and wish to use the Software for corporate internal use, we recommend that you, and all other users from your organization, sign up for user accounts by providing your corporate contact information. In particular, we recommend that you use your corporate email address. You agree to: a) provide true, accurate, current and complete information about yourself as prompted by the sign-up process; and b) maintain and promptly update the information provided during sign up to keep it true, accurate, current, and complete. If you provide any information that is untrue, inaccurate, outdated, or incomplete, or if HRM SAAS has reasonable grounds to suspect that such information is untrue, inaccurate, outdated, or incomplete, HRM SAAS may terminate your user account and refuse current or future use of the Software.\n\n<h4>5. Organization Accounts and Administrators</h4>\n\nWhen you sign up for an account for your organization you may specify one or more administrators. The administrators will have the right to configure the Software based on your requirements and manage end users in your organization account. If your organization account is created and configured on your behalf by a third party, it is likely that such third party has assumed administrator role for your organization. Make sure that you enter into a suitable agreement with such third party specifying such party’s roles and restrictions as an administrator of your organization account. You are responsible for:\n<ol>\n<li>ensuring confidentiality of your organization account password,</li>\n<li>appointing competent individuals as administrators for managing your organization account, and</li>\n<li>ensuring that all activities that occur in connection with your organization account comply with this Agreement. You understand that HRM SAAS is not responsible for account administration and internal management of the Software for you.</li>\n</ol>\nYou are responsible for taking necessary steps for ensuring that your organization does not lose control of the administrator accounts. You may specify a process to be followed for recovering control in the event of such loss of control of the administrator accounts by sending an email to <a href=\"mailto:admin@example.com\">admin@example.com</a>, provided that the process is acceptable to HRM SAAS. In the absence of any specified administrator account recovery process, HRM SAAS may provide control of an administrator account to an individual providing proof satisfactory to HRM SAAS demonstrating authorization to act on behalf of the organization. You agree not to hold HRM SAAS liable for the consequences of any action taken by HRM SAAS in good faith in this regard.\n\n<h4>6. Self-Hosted Terms</h4>\n\n<h5>6.1 Your License Rights</h5>\n\nSubject to the terms and conditions of this Agreement, HRM SAAS grants you a non-exclusive, non-sublicensable and non-transferable license to install and use the Software during the applicable License Term in accordance with this Agreement.\n\n<h5>6.2 Number of Instances</h5>\n\nUnless otherwise specified in your Order, for each Software license that you purchase, you may install one instance of the Software on systems owned or operated by you (or your third party service providers so long as you remain responsible for their compliance with the terms and conditions of this Agreement).\n\n<h5>6.3 Your Modifications</h5>\n\nSubject to the terms and conditions of this Agreement:\n\n<ol>\n<li>for any elements of the Software provided by HRM SAAS in source code form, and to the extent permitted in the Documentation, you may modify such source code solely for purposes of developing bug fixes, customizations and additional features for the Software and</li>\n\n<li>you may also modify the Documentation to reflect your permitted modifications of the Software source code or the particular use of the Products within your organization.</li>\n</ol>\n\nAny modified source code or Documentation constitutes \"Your Modifications\". You may use Your Modifications solely with respect to your own instances in support of your permitted use of the Software but you may not distribute the code of Your Modifications to any third party. Notwithstanding anything in this Agreement to the contrary, HRM SAAS has no support, warranty, indemnification or other obligation or liability with respect to Your Modifications or their combination, interaction or use with our Products. You shall indemnify, defend and hold us harmless from and against any and all claims, costs, damages, losses, liabilities and expenses (including reasonable attorneys’ fees and costs) arising out of or in connection with any claim brought against us by a third party relating to Your Modifications (including but not limited to any representations or warranties you make about Your Modifications or the Software) or your breach of this Section 6.3. This indemnification obligation is subject to your receiving (i) prompt written notice of such claim (but in any event notice in sufficient time for you to respond without prejudice); (ii) the exclusive right to control and direct the investigation, defense, or settlement of such claim; and (iii) all reasonably necessary cooperation of HRM SAAS at your expense.\n\n<h5>6.4 Attribution</h5>\n\nIn any use of the Software, you must include the following attribution to HRM SAAS on all user interfaces in the following format: \"Powered by HRM SAAS\" which must in every case include a hyperlink to http://www.solutionrack.com, and which must be in the same format as delivered in the Software. If no such attribution is delivered with the Software, it is not required to include such attribution.\n\n<h5>6.5 Support</h5>\n\nThe support provided by HRM SAAS for self-hosted services is limited to the issues arising because of bugs in the Software delivered. It does not include (i) issues arising as a result of outdated software running on server on which you choose to install the Software (ii) issues arising as a result\n\nof Your Modifications as described in section 6.5 (iii) issues arising because server not meeting System Requirements for the Software.\n\n<h4>7. Personal Information and Privacy</h4>\n\nPersonal information you provide to HRM SAAS through the Software is governed by TIME TRACKER SYSTEM – HRM Privacy Policy. Your election to use the Software indicates your acceptance of the terms of the TIME TRACKER SYSTEM – HRM Privacy Policy. You are responsible for maintaining confidentiality of your username, password and other sensitive information. You are responsible for all activities that occur in your user account and you agree to inform us immediately of any unauthorized use of your user account by email to <a href=\"mailto:admin@example.com\">admin@example.com</a>. We are not responsible for any loss or damage to you or to any third party incurred as a result of any unauthorized access and/or use of your user account, or otherwise.\n\n<h4>8. Communications from HRM SAAS</h4>\n\nThe Software may include certain communications from HRM SAAS, such as service announcements, administrative messages and newsletters. You understand that these communications shall be considered part of using the Software. As part of our policy to provide you total privacy, we also provide you the option of opting out from receiving newsletters from us. However, you will not be able to opt-out from receiving service announcements and administrative messages.\n\n<h4>9. Complaints</h4>\n\nIf we receive a complaint from any person against you with respect to your activities as part of use of the Software, we will forward the complaint to the primary email address of your user account. You must respond to the complainant directly within 10 days of receiving the complaint forwarded by us and copy HRM SAAS in the communication. If you do not respond to the complainant within 10 days from the date of our email to you, we may disclose your name and contact information to the complainant for enabling the complainant to take legal action against you. You understand that your failure to respond to the forwarded complaint within the 10 days’ time limit will be construed as your consent to disclosure of your name and contact information by HRM SAAS to the complainant.\n\n<h4>10. Fees and Payments</h4>\n\nThe Software is available under monthly subscription plan. Your subscription can be automatically renewed at the end of each month unless you downgrade your paid subscription plan to a free plan or inform us that you do not wish to renew the subscription. If you do not wish to renew the subscription, you must inform us at least seven days prior to the renewal date. If you have not downgraded to a free plan and if you have not informed us that you do not wish to renew the subscription, you will be presumed to have authorized HRM SAAS to charge the subscription fee. From time to time, we may change the price of any Software or charge for use of Services that are currently available free of charge. Any increase in charges will not apply until the expiry of your then current billing cycle. You will not be charged for using any Software unless you have opted for a paid subscription plan.\n\n<h4>11. Restrictions on Use</h4>\n\nIn addition to all other terms and conditions of this Agreement, you shall not: (i) transfer the Software or otherwise make it available to any third party; (ii) provide any service based on the Software without prior written permission; (iii) use the third party links to sites without agreeing to their website terms & conditions; (iv) post links to third party sites or use their logo, company name, etc. without their prior written permission; (v) publish any personal or confidential information belonging to any person or entity without obtaining consent from such person or entity; (vi) use the Software in any manner that could damage, disable, overburden, impair or harm any server, network, computer system, resource of HRM SAAS; (vii) violate any applicable local, state, national or international law; and (viii) create a false identity to mislead any person as to the identity or origin of any communication.\n\n<h4>12. Spamming and Illegal Activities</h4>\n\nYou agree to be solely responsible for the contents of your transmissions through the Software. You agree not to use the Software for illegal purposes or for the transmission of material that is unlawful, defamatory, harassing, libelous, invasive of another\'s privacy, abusive, threatening, harmful, vulgar, pornographic, obscene, or is otherwise objectionable, offends religious sentiments, promotes racism, contains viruses or malicious code, or that which infringes or may infringe intellectual property or other rights of another. You agree not to use the Software for the transmission of \"junk mail\", \"spam\", \"chain letters\", \"phishing\" or unsolicited mass distribution of email. We reserve the right to terminate your access to the Software if there are reasonable grounds to believe that you have used the Software for any illegal or unauthorized activity.\n\n<h4>13. Inactive User Accounts Policy</h4>\n\n            We reserve the right to terminate unpaid user accounts that are inactive for a continuous period of 120 days. In the event of such termination, all data associated with such user account will be deleted. We will provide you prior notice of such termination and option to back-up your data. In case of accounts with more than one user, if at least one of the users is active, the account will not be considered inactive.\n\n<h4>14. Data Ownership</h4>\n\n            We respect your right to ownership of content created or stored by you. You own the content created or stored by you. Unless specifically permitted by you, your use of the Software does not grant HRM SAAS the license to use, reproduce, adapt, modify, publish or distribute the content created by you or stored in your user account for HRM SAAS\'s commercial, marketing or any similar purpose. But you grant HRM SAAS permission to access, copy, distribute, store, transmit, reformat, publicly display and publicly perform the content of your user account solely as required for the purpose of providing the Software to you.\n\n<h4>15. User Generated Content</h4>\n\nYou may transmit or publish content created by you using the Software or otherwise. However, you shall be solely responsible for such content and the consequences of its transmission or publication. Any content made public will be publicly accessible through the internet and may be crawled and indexed by search engines. You are responsible for ensuring that you do not accidentally make any private content publicly available. Any content that you may receive from other users of the Software, is provided to you AS IS for your information and personal use only and you agree not to use, copy, reproduce, distribute, transmit, broadcast, display, sell, license or otherwise exploit such content for any purpose, without the express written consent of the person who owns the rights to such content. In the course of using the Software, if you come across any content with copyright notice(s) or any copy protection feature(s), you agree not to remove such copyright notice(s) or disable such copy protection feature(s) as the case may be. By making any copyrighted/copyrightable content available on the Software you affirm that you have the consent, authorization or permission, as the case may be from every person who may claim any rights in such content to make such content available in such manner. Further, by making any content available in the manner aforementioned, you expressly agree that HRM SAAS will have the right to block access to or remove such content made available by you if HRM SAAS receives complaints\n\nconcerning any illegality or infringement of third party rights in such content. By using the Software and transmitting or publishing any content using such Software, you expressly consent to determination of questions of illegality or infringement of third party rights in such content by the agent designated by HRM SAAS for this purpose.\n\n<h4>16. Disclaimer of Warranties</h4>\n\nYOU EXPRESSLY UNDERSTAND AND AGREE THAT THE USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICES ARE PROVIDED ON AN AS-IS-AND-AS-AVAILABLE BASIS. HRM SAAS EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. HRM SAAS MAKES NO WARRANTY THAT THE SERVICES WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USE OF ANY MATERIAL DOWNLOADED OR OBTAINED THROUGH THE USE OF THE SERVICES SHALL BE AT YOUR OWN DISCRETION AND RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM, MOBILE TELEPHONE, WIRELESS DEVICE OR DATA THAT RESULTS FROM THE USE OF THE SERVICE OR THE DOWNLOAD OF ANY SUCH MATERIAL. NO ADVICE OR INFORMATION, WHETHER WRITTEN OR ORAL, OBTAINED BY YOU FROM HRM SAAS, ITS EMPLOYEES OR REPRESENTATIVES SHALL CREATE ANY WARRANTY NOT EXPRESSLY STATED IN THE TERMS.\n\n<h4>17. Limitation of Liability</h4>\n\nYOU AGREE THAT HRM SAAS SHALL, IN NO EVENT, BE LIABLE FOR ANY CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, OR OTHER LOSS OR DAMAGE WHATSOEVER OR FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, COMPUTER FAILURE, LOSS OF BUSINESS INFORMATION, OR OTHER LOSS ARISING OUT OF OR CAUSED BY YOUR USE OF OR INABILITY TO USE THE SERVICE, EVEN IF HRM SAAS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. IN NO EVENT SHALL HRM SAAS\'S ENTIRE LIABILITY TO YOU IN RESPECT OF THE SERVICE, WHETHER DIRECT OR INDIRECT, EXCEED THE FEES PAID BY YOU TOWARDS SUCH SERVICE.\n\n<h4>18. Indemnification</h4>\n\n            You agree to indemnify and hold harmless HRM SAAS, its officers, directors, employees, suppliers, and affiliates, from and against any losses, damages, fines and expenses (including attorney\'s fees and costs) arising out of or relating to any claims that you have used the Software in violation of another party\'s rights, in violation of any law, in violations of any provisions of the Terms, or any other claim related to your use of the Software, except where such use is authorized by HRM SAAS.\n\n<h4>19. Suspension and Termination</h4>\n\n            We may suspend your user account or temporarily disable access to whole or part of any Software in the event of any suspected illegal activity, extended periods of inactivity or requests by law enforcement or other government agencies. Objections to suspension or disabling of user accounts should be made to <a href=\"mailto:admin@example.com\">admin@example.com</a> within thirty days of being notified about the suspension. We may terminate a suspended or disabled user account after thirty days. We will also terminate your user account on your request. In addition, we reserve the right to terminate your user account and deny the Software upon reasonable belief that you have violated the Terms. You have the right to terminate your user account if HRM SAAS breaches its obligations under these Terms and in such event, you will be entitled to prorated refund of\n\naccess to the Software, deletion of information in your user account such as your email address and password and deletion of all data in your user account.\n\n<h4>20. END OF TERMS OF SERVICE</h4>\n\nIf you have any questions or concerns regarding this Agreement, please contact us at <a href=\"mailto:admin@example.com\">admin@example.com</a>.', '2021-07-13 06:19:25', '2021-07-13 06:19:25');
INSERT INTO `pages` (`id`, `language_id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
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
(8, 1, '3', '2022', 'cash', '10000', '0', '0', '{\"Bonus\":\"500\"}', '500.00', '[]', '0.00', '', '', '11500.00', '0000-00-00', '2022-03-21 14:36:50', '2022-03-21 14:36:50', '1000', 1, 'paid'),
(9, 9, '3', '2022', 'cash', '6000', '0', '0', '{\"Bonus\":\"530\"}', '530.00', '[]', '0.00', '', '', '7000.00', '0000-00-00', '2022-03-21 14:39:08', '2022-03-21 14:39:08', '470', 1, 'paid');

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
(1, 1, 'basic', 10000, 'Basic Salary', '2021-07-13 16:51:47', '2022-03-01 17:27:31'),
(2, 1, 'hourly_rate', 0, 'Hourly Rate', '2021-07-13 16:51:47', '2021-07-13 16:51:47'),
(11, 9, 'basic', 6000, 'Basic Salary', '2022-03-01 17:25:18', '2022-03-01 17:25:18'),
(12, 9, 'hourly_rate', 0, 'Hourly Rate', '2022-03-01 17:25:18', '2022-03-01 17:25:18'),
(13, 10, 'basic', 0, 'Basic Salary', '2022-04-01 11:24:08', '2022-04-01 11:24:08'),
(14, 10, 'hourly_rate', 0, 'Hourly Rate', '2022-04-01 11:24:08', '2022-04-01 11:24:08');

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
(1, 'T-Chest', 'admin@tchest.co.za', 'Administrator', '877fe906f5b6cc9ac9b7151aad8fb62e.png', '33 Harcus Rd, Bedfordview, Johannesburg, 2008', '+27 76 083 5138', 'blue', 'en', 'active', '2021-07-13 06:19:25', '2022-03-28 13:40:31', NULL, NULL, NULL, 1, NULL, NULL, 1, 'mail', NULL, NULL, 'Superadmin@example.com', '123456', '', 0, 'ZAR', 'R', '4aaf5d43-0126-47bb-a715-b6fe5b88f1ce', '2022-03-13 01:03:14', 0, 0, 1, 'sandbox', 0, 'T-Chest Admin', 'admin@tchest.co.za', '0b0a5614dce37c4c5bbc6a79fcf6caf7.ico');

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
(1, 'Basic', 0, 5, 0, 0, 'tchest_basic_plan_annual', 'tchest_basic_plan_monthly', 1, '2021-07-13 06:19:25', '2022-04-01 06:11:18'),
(2, 'Advanced', 5, 50, 250, 2500, 'tchest_advanced_plan_annual', 'tchest_advanced_plan_montly', 1, '2021-07-13 06:19:25', '2022-04-01 06:11:30'),
(3, 'Premium', 51, 100, 450, 4500, 'tchest_premium_plan_annual', 'tchest_premium_plan_montly', 1, '2021-07-13 06:19:25', '2022-04-01 06:11:40');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `browse_history`
--
ALTER TABLE `browse_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1782;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department_manager`
--
ALTER TABLE `department_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `failed_records`
--
ALTER TABLE `failed_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `holidays_list`
--
ALTER TABLE `holidays_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
