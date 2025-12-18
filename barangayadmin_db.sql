-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2025 at 08:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangayadmin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `citizens`
--

CREATE TABLE `citizens` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `has_consented` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `citizens`
--

INSERT INTO `citizens` (`id`, `full_name`, `address`, `contact_no`, `has_consented`, `is_active`, `registered_at`) VALUES
(1, 'ace cabrera', 'purok 1 barangay ugong pasig', '09913503142', 0, 1, '2025-11-01 12:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `citizen_action_logs`
--

CREATE TABLE `citizen_action_logs` (
  `id` int(11) NOT NULL,
  `citizen_id` int(11) NOT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  `admin_user_name` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `citizen_action_logs`
--

INSERT INTO `citizen_action_logs` (`id`, `citizen_id`, `admin_user_id`, `admin_user_name`, `action`, `details`, `timestamp`) VALUES
(1, 1, 1, 'System Administrator', 'Archive', 'Citizen \'ace cabrera\' was deactivated (archived).', '2025-11-14 13:50:06'),
(2, 1, 1, 'System Administrator', 'Restore', 'Citizen \'ace cabrera\' was restored from archive.', '2025-11-14 13:52:09'),
(3, 1, 1, 'System Administrator', 'Archive', 'Citizen \'ace cabrera\' was deactivated (archived).', '2025-11-14 13:52:17'),
(4, 1, 1, 'System Administrator', 'Restore', 'Citizen \'ace cabrera\' was restored from archive.', '2025-11-14 13:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `cons_clearance`
--

CREATE TABLE `cons_clearance` (
  `ref_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_action`
--

CREATE TABLE `file_action` (
  `ref_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indi_info`
--

CREATE TABLE `indi_info` (
  `ref_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `username`, `login_time`) VALUES
(1, 1, 'admin', '2025-11-01 15:35:01'),
(2, 2, 'acab382354', '2025-11-01 16:35:39'),
(3, 1, 'admin', '2025-11-01 16:36:30'),
(4, 1, 'admin', '2025-11-01 16:44:44'),
(5, 1, 'admin', '2025-11-02 09:08:40'),
(6, 1, 'admin', '2025-11-02 11:21:14'),
(7, 1, 'admin', '2025-11-04 15:59:16'),
(8, 1, 'admin', '2025-11-04 16:38:06'),
(9, 1, 'admin', '2025-11-04 16:40:24'),
(10, 1, 'admin', '2025-11-06 03:59:27'),
(11, 1, 'admin', '2025-11-06 03:59:28'),
(12, 1, 'admin', '2025-11-06 04:02:22'),
(13, 6, 'staff', '2025-11-06 04:03:27'),
(14, 6, 'staff', '2025-11-06 04:04:23'),
(15, 1, 'admin', '2025-11-12 03:02:54'),
(16, 1, 'admin', '2025-11-12 03:46:04'),
(17, 1, 'admin', '2025-11-13 05:48:36'),
(19, 1, 'admin', '2025-11-13 05:52:56'),
(20, 1, 'admin', '2025-12-14 14:32:06'),
(21, 1, 'admin', '2025-12-17 04:16:03'),
(22, 1, 'admin', '2025-12-17 04:29:14'),
(23, 1, 'admin', '2025-12-17 04:30:02'),
(24, 1, 'admin', '2025-12-17 04:32:33'),
(25, 1, 'admin', '2025-12-17 04:37:29'),
(26, 1, 'admin', '2025-12-17 04:44:35'),
(27, 1, 'admin', '2025-12-17 04:55:47'),
(28, 1, 'admin', '2025-12-17 05:15:55'),
(30, 1, 'admin', '2025-12-17 05:53:22'),
(31, 8, 'acab3823543', '2025-12-17 06:41:40'),
(32, 1, 'admin', '2025-12-17 06:57:56'),
(34, 1, 'admin', '2025-12-17 06:58:50'),
(35, 1, 'admin', '2025-12-17 06:59:16'),
(36, 1, 'admin', '2025-12-17 07:19:02'),
(37, 1, 'admin', '2025-12-17 07:19:32'),
(38, 8, 'acab3823543', '2025-12-17 07:23:09'),
(39, 1, 'admin', '2025-12-17 07:23:57'),
(40, 13, 'dasdasd', '2025-12-17 07:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `ref_number` varchar(20) NOT NULL,
  `citizen_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` enum('on_queue','processing','payment_pending','ready_for_pick_up','released','cancelled','completed') NOT NULL,
  `is_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `form_path` varchar(255) DEFAULT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `ref_number`, `citizen_id`, `type_id`, `status`, `is_viewed`, `form_path`, `requested_at`, `updated_at`) VALUES
(1, '1', 1, 1, 'completed', 1, NULL, '2025-11-01 17:10:25', '2025-11-02 12:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `request_types`
--

CREATE TABLE `request_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `form_template` varchar(100) NOT NULL DEFAULT 'Custom',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_archived` tinyint(1) NOT NULL DEFAULT 0,
  `inactive_since` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_types`
--

INSERT INTO `request_types` (`id`, `name`, `fee`, `form_template`, `is_active`, `is_archived`, `inactive_since`, `created_at`) VALUES
(1, 'Barangay Clearance', 25.00, 'Custom', 0, 1, '2025-11-01 16:34:17', '2025-11-01 12:57:38'),
(3, 'Residency Certificate', 100.00, 'Custom', 1, 0, NULL, '2025-11-01 12:58:39'),
(4, 'Business Permit Endorsement', 520.00, 'Custom', 1, 0, NULL, '2025-11-01 12:59:36'),
(5, 'Solo Parent Certificate', 100.00, 'Individual Information Sheet', 1, 0, NULL, '2025-11-01 13:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `request_type_logs`
--

CREATE TABLE `request_type_logs` (
  `id` int(11) NOT NULL,
  `request_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_type_logs`
--

INSERT INTO `request_type_logs` (`id`, `request_type_id`, `user_id`, `user_name`, `action`, `details`, `timestamp`) VALUES
(1, 1, 1, 'System Administrator', 'Edit', 'Fee changed from 50.00 to 25', '2025-11-01 16:33:52'),
(2, 1, 1, 'System Administrator', 'Edit', 'Status changed from Active to Inactive', '2025-11-01 16:34:17'),
(3, 1, 1, 'System Administrator', 'Archive', 'Item was archived.', '2025-11-01 17:15:38'),
(4, 5, 1, 'System Administrator', 'Edit', 'Status changed from Active to Inactive', '2025-11-04 16:55:14'),
(5, 5, 1, 'System Administrator', 'Archive', 'Item was archived.', '2025-11-04 16:55:19'),
(6, 4, 1, 'System Administrator', 'Archive', 'Request Type \'Business Permit Endorsement\' was archived.', '2025-11-14 13:01:20'),
(7, 4, 1, 'System Administrator', 'Edit', 'Fee changed from 250.00 to 50', '2025-11-14 13:01:41'),
(8, 4, 1, 'System Administrator', 'Edit', 'Edited type \'Business Permit Endorsement\': Fee changed from 50.00 to 520', '2025-11-14 13:10:51'),
(9, 4, 1, 'System Administrator', 'Archive', 'Request Type \'Business Permit Endorsement\' was archived.', '2025-11-14 13:11:00'),
(12, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:20:56'),
(14, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:21:44'),
(15, 1, 1, 'System Administrator', 'Archive', 'Request Type \'Barangay Clearance\' was archived.', '2025-11-14 13:21:47'),
(18, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:24:43'),
(20, 5, 1, 'System Administrator', 'Edit', 'Edited type \'Solo Parent Certificate\': Fee changed from 50.00 to 100', '2025-11-14 13:25:16'),
(21, 5, 1, 'System Administrator', 'Edit', 'No changes made to type \'Solo Parent Certificate\'.', '2025-11-14 13:25:26'),
(22, 5, 1, 'System Administrator', 'Edit', 'Edited type \'Solo Parent Certificate\': Status changed from Inactive to Active', '2025-11-14 13:25:42'),
(23, 5, 1, 'System Administrator', 'Edit', 'No changes made to type \'Solo Parent Certificate\'.', '2025-11-14 13:25:51'),
(24, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:27:32'),
(26, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:30:09'),
(29, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:33:18'),
(30, 5, 0, 'System', 'Restore', 'Request Type \'Solo Parent Certificate\' was restored from archive.', '2025-11-14 13:33:22'),
(31, 3, 1, 'System Administrator', 'Archive', 'Request Type \'Residency Certificate\' was archived.', '2025-11-14 13:33:41'),
(32, 3, 0, 'System', 'Restore', 'Request Type \'Residency Certificate\' was restored from archive.', '2025-11-14 13:33:44'),
(33, 5, 1, 'System Administrator', 'Archive', 'Request Type \'Solo Parent Certificate\' was archived.', '2025-11-14 13:35:46'),
(34, 5, 1, 'System Administrator', 'Restore', 'Request Type \'Solo Parent Certificate\' was restored from archive.', '2025-11-14 13:35:50'),
(35, 5, 1, 'System Administrator', 'Edit', 'No changes made to type \'Solo Parent Certificate\'.', '2025-11-14 13:36:16'),
(36, 5, 1, 'System Administrator', 'Edit', 'Edited type \'Solo Parent Certificate\': Form changed from \'Custom\' to \'Individual Information Sheet\'', '2025-11-14 13:41:09'),
(37, 1, 1, 'System Administrator', 'Restore', 'Request Type \'Barangay Clearance\' was restored from archive.', '2025-11-14 13:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('Admin','Staff','Kiosk') NOT NULL DEFAULT 'Staff',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `full_name`, `email`, `role`, `is_active`, `must_change_password`, `created_at`, `updated_at`, `reset_token`, `reset_token_expiry`) VALUES
(1, 'admin', '$2y$10$jUwzfT5./XASXMYo20MaOOuDUH9YWZBKOUZe/hoyjYdkmTffSV34S', 'System Administrator', NULL, 'Admin', 1, 0, '2025-11-01 11:48:29', '2025-11-01 11:48:29', NULL, NULL),
(2, 'acab382354', '$2y$10$LNOYRtOyRPUJS1AlMt0SvuO0nicJaVHkXai/BukbwwREHqdpFGC1O', 'ace cabrera', 'cabrairh@gmail.com', 'Staff', 1, 0, '2025-11-01 13:32:11', '2025-11-14 13:11:50', NULL, NULL),
(4, 'jdoe123', '$2y$10$H6jcBpHDvGR/zzmv6KTD6O3/PCJm5Dn54xYLDAn5pQ29IQ95Esoa.', 'john doe', NULL, 'Staff', 1, 0, '2025-11-01 13:47:01', '2025-11-14 12:54:05', NULL, NULL),
(5, 'msmith', '$2y$10$HQRxYmaFNZ8RcUD5bKq5t.vmJsIdoh1jCDCe5HnYLlgEVGLmKR2aC', 'mark smith', NULL, 'Staff', 1, 0, '2025-11-01 14:43:33', '2025-11-14 13:10:10', NULL, NULL),
(6, 'staff', '$2y$10$ySBJNMUyUmzCwrx5d4g1y.Bk1Vyc0yPImjL63d6AbLwKWVL3NszpW', 'Staff', NULL, 'Staff', 1, 0, '2025-11-06 04:03:10', '2025-11-06 04:03:41', NULL, NULL),
(8, 'acab3823543', '$2y$10$sA9K6IVeNx.w55BsFLOCSumrzAme10D7pbMOZtaOq.HuUrPkAWZqu', 'ace cabrera', 'cabreraace524@gmail.com', 'Staff', 1, 0, '2025-11-12 03:50:08', '2025-12-17 07:22:50', NULL, NULL),
(10, 'test123', '$2y$10$GmnZQat0Ovf.MqvKpxX1pu2BxBGzDeYy2KrcYt097U1ouiZ5uyKIG', 'test', 'jlvelasquez09211@gmail.com', 'Staff', 0, 1, '2025-11-13 06:07:54', '2025-11-14 13:58:04', NULL, NULL),
(13, 'dasdasd', '$2y$10$JEABYFENV5Ze0XphQ6gX6OPAqKCjFQy8pYut8oe71HB.xY7kmzK9i', 'dasdasd', 'uselesslanny@comfythings.com', 'Staff', 1, 0, '2025-12-17 07:24:45', '2025-12-17 07:25:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_action_logs`
--

CREATE TABLE `user_action_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `admin_user_name` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_action_logs`
--

INSERT INTO `user_action_logs` (`id`, `user_id`, `admin_user_id`, `admin_user_name`, `action`, `details`, `timestamp`) VALUES
(1, 5, 0, 'System', 'Disable', 'User account was disabled (archived).', '2025-11-14 12:54:16'),
(2, 10, 1, 'System Administrator', 'Disable', 'User account was disabled (archived).', '2025-11-14 12:54:26'),
(4, 5, 1, 'System Administrator', 'Disable', 'User account was disabled (archived).', '2025-11-14 12:56:46'),
(6, 8, 1, 'System Administrator', 'Disable', 'User account \'acab3823543\' was disabled (archived).', '2025-11-14 13:06:43'),
(7, 8, 1, 'System Administrator', 'Edit', 'Edited user \'ace cabrera\': Status changed to Disabled', '2025-11-14 13:10:25'),
(8, 10, 1, 'System Administrator', 'Disable', 'User account \'test123\' was disabled (archived).', '2025-11-14 13:10:36'),
(9, 2, 1, 'System Administrator', 'Edit', 'Edited user \'ace cabrera\': Email changed to \'cabrairh@gmail.com\'', '2025-11-14 13:11:50'),
(10, 10, 0, 'System', 'Restore', 'User account (ID: 10) was restored from archive.', '2025-11-14 13:16:01'),
(13, 10, 1, 'System Administrator', 'Disable', 'User account \'test123\' was disabled (archived).', '2025-11-14 13:30:05'),
(14, 10, 0, 'System', 'Restore', 'User account \'@test123\' was restored from archive.', '2025-11-14 13:30:13'),
(15, 10, 1, 'System Administrator', 'Disable', 'User account \'test123\' was disabled (archived).', '2025-11-14 13:58:04'),
(19, 13, 1, 'System Administrator', 'Create', 'Created user: dasdasd (@dasdasd)', '2025-12-17 07:24:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `citizens`
--
ALTER TABLE `citizens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizen_action_logs`
--
ALTER TABLE `citizen_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- Indexes for table `cons_clearance`
--
ALTER TABLE `cons_clearance`
  ADD PRIMARY KEY (`ref_number`);

--
-- Indexes for table `file_action`
--
ALTER TABLE `file_action`
  ADD PRIMARY KEY (`ref_number`);

--
-- Indexes for table `indi_info`
--
ALTER TABLE `indi_info`
  ADD PRIMARY KEY (`ref_number`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_number` (`ref_number`),
  ADD KEY `citizen_id` (`citizen_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `request_types`
--
ALTER TABLE `request_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `request_type_logs`
--
ALTER TABLE `request_type_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_type_id` (`request_type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `user_action_logs`
--
ALTER TABLE `user_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citizens`
--
ALTER TABLE `citizens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `citizen_action_logs`
--
ALTER TABLE `citizen_action_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `request_types`
--
ALTER TABLE `request_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `request_type_logs`
--
ALTER TABLE `request_type_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_action_logs`
--
ALTER TABLE `user_action_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citizen_action_logs`
--
ALTER TABLE `citizen_action_logs`
  ADD CONSTRAINT `citizen_action_logs_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cons_clearance`
--
ALTER TABLE `cons_clearance`
  ADD CONSTRAINT `cons_clearance_ibfk_1` FOREIGN KEY (`ref_number`) REFERENCES `requests` (`ref_number`) ON DELETE CASCADE;

--
-- Constraints for table `file_action`
--
ALTER TABLE `file_action`
  ADD CONSTRAINT `file_action_ibfk_1` FOREIGN KEY (`ref_number`) REFERENCES `requests` (`ref_number`) ON DELETE CASCADE;

--
-- Constraints for table `indi_info`
--
ALTER TABLE `indi_info`
  ADD CONSTRAINT `indi_info_ibfk_1` FOREIGN KEY (`ref_number`) REFERENCES `requests` (`ref_number`) ON DELETE CASCADE;

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizens` (`id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `request_types` (`id`);

--
-- Constraints for table `request_type_logs`
--
ALTER TABLE `request_type_logs`
  ADD CONSTRAINT `request_type_logs_ibfk_1` FOREIGN KEY (`request_type_id`) REFERENCES `request_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_action_logs`
--
ALTER TABLE `user_action_logs`
  ADD CONSTRAINT `user_action_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
