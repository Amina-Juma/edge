-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 19, 2019 at 05:55 PM
-- Server version: 10.1.41-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sites`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `menu` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'header_menu', '2019-08-08 17:30:06', '2019-08-08 17:30:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_pages`
--

CREATE TABLE `menu_pages` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `menu_id` tinyint(3) UNSIGNED NOT NULL,
  `page_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_pages`
--

INSERT INTO `menu_pages` (`id`, `menu_id`, `page_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2019-08-08 17:37:19', '2019-08-08 17:37:19', NULL),
(2, 1, 2, '2019-08-08 17:37:19', '2019-08-08 17:37:19', NULL),
(3, 1, 3, '2019-08-08 17:37:19', '2019-08-08 17:37:19', NULL),
(4, 1, 4, '2019-08-08 17:37:19', '2019-08-08 17:37:19', NULL),
(5, 1, 5, '2019-08-08 17:37:19', '2019-08-08 17:37:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `page` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'home', '2019-08-08 17:26:19', '2019-08-08 17:26:19', NULL),
(2, 'products', '2019-08-08 17:26:19', '2019-08-08 17:26:19', NULL),
(3, 'about us', '2019-08-08 17:26:19', '2019-08-08 17:26:19', NULL),
(4, 'services', '2019-08-08 17:26:19', '2019-08-08 17:26:19', NULL),
(5, 'contact us', '2019-08-08 17:26:19', '2019-08-08 17:26:19', NULL),
(6, 'mfps', '2019-08-19 15:36:29', '2019-08-19 15:36:29', NULL),
(7, 'computers', '2019-08-19 15:36:29', '2019-08-19 15:36:29', NULL),
(8, 'software', '2019-08-19 15:36:29', '2019-08-19 15:36:29', NULL),
(9, 'printers', '2019-08-19 15:36:29', '2019-08-19 15:36:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_parents`
--

CREATE TABLE `page_parents` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `page_id` tinyint(3) UNSIGNED NOT NULL,
  `page_parent_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_parents`
--

INSERT INTO `page_parents` (`id`, `page_id`, `page_parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 2, '2019-08-19 15:43:57', '2019-08-19 15:43:57', NULL),
(2, 7, 2, '2019-08-19 15:43:57', '2019-08-19 15:43:57', NULL),
(3, 9, 2, '2019-08-19 15:43:57', '2019-08-19 15:43:57', NULL),
(4, 8, 2, '2019-08-19 15:43:57', '2019-08-19 15:43:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `product_category` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mfps', '2019-08-19 13:51:17', '2019-08-19 13:51:17', NULL),
(2, 'computers', '2019-08-19 13:51:17', '2019-08-19 13:51:17', NULL),
(3, 'printers', '2019-08-19 13:51:17', '2019-08-19 13:51:17', NULL),
(4, 'software', '2019-08-19 13:51:17', '2019-08-19 13:51:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_models`
--

CREATE TABLE `product_category_models` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `product_category_id` tinyint(3) UNSIGNED NOT NULL,
  `product_model_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category_models`
--

INSERT INTO `product_category_models` (`id`, `product_category_id`, `product_model_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(2, 1, 2, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(3, 1, 3, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(4, 1, 4, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(5, 1, 5, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(6, 1, 6, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(7, 1, 7, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(8, 1, 8, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(9, 1, 9, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(10, 1, 10, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(11, 1, 11, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(12, 1, 12, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(13, 1, 13, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(14, 1, 14, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(15, 1, 15, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(16, 1, 16, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(17, 1, 17, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(18, 1, 18, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(19, 1, 19, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(20, 1, 20, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL),
(21, 1, 21, '2019-08-19 14:15:38', '2019-08-19 14:15:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_manufacturers`
--

CREATE TABLE `product_manufacturers` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `product_manufacturer` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_manufacturers`
--

INSERT INTO `product_manufacturers` (`id`, `product_manufacturer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brother', '2019-08-19 10:51:23', '2019-08-19 11:54:18', NULL),
(2, 'canon', '2019-08-19 10:51:23', '2019-08-19 11:54:18', NULL),
(3, 'hp', '2019-08-19 10:51:23', '2019-08-19 11:54:18', NULL),
(4, 'kyocera', '2019-08-19 11:53:25', '2019-08-19 11:54:18', NULL),
(5, 'olivetti', '2019-08-19 11:53:25', '2019-08-19 11:54:18', NULL),
(6, 'toshiba', '2019-08-19 11:51:08', '2019-08-19 11:54:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_manufacturer_models`
--

CREATE TABLE `product_manufacturer_models` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `manufacturer_id` tinyint(3) UNSIGNED NOT NULL,
  `model_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_manufacturer_models`
--

INSERT INTO `product_manufacturer_models` (`id`, `manufacturer_id`, `model_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, '2019-08-19 13:14:25', '2019-08-19 13:32:07', NULL),
(2, 6, 2, '2019-08-19 13:14:25', '2019-08-19 13:32:07', NULL),
(3, 6, 3, '2019-08-19 13:14:25', '2019-08-19 13:32:08', NULL),
(4, 6, 4, '2019-08-19 13:14:25', '2019-08-19 13:32:08', NULL),
(5, 6, 5, '2019-08-19 13:14:25', '2019-08-19 13:32:08', NULL),
(6, 6, 6, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(7, 6, 7, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(8, 6, 8, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(9, 6, 9, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(10, 6, 10, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(11, 6, 11, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(12, 6, 12, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(13, 6, 13, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(14, 6, 14, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(15, 6, 15, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(16, 6, 16, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(17, 6, 17, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(18, 6, 18, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(19, 6, 19, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(20, 6, 20, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL),
(21, 6, 21, '2019-08-19 13:14:25', '2019-08-19 13:32:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_models`
--

CREATE TABLE `product_models` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `product_model` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_models`
--

INSERT INTO `product_models` (`id`, `product_model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '8518a', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(2, '4508lp', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(3, '7516ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(4, '7506ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(5, '6518a', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(6, '6506ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(7, '5516ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(8, '5506ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(9, '4518a', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(10, '3515ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(11, '3015ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(12, '2802am', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(13, '2803am', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(14, '2309am', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(15, '2010ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(16, '2510ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(17, 'fc347cs', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(18, '2802af', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(19, '8508a', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(20, '5518a', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL),
(21, '3518ac', '2019-08-19 12:23:23', '2019-08-19 12:23:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu` (`menu`);

--
-- Indexes for table `menu_pages`
--
ALTER TABLE `menu_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_page` (`menu_id`,`page_id`),
  ADD KEY `FK_page_id` (`page_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page` (`page`);

--
-- Indexes for table `page_parents`
--
ALTER TABLE `page_parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_parent` (`page_id`,`page_parent_id`),
  ADD KEY `FK_page_parent_id` (`page_parent_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_category` (`product_category`);

--
-- Indexes for table `product_category_models`
--
ALTER TABLE `product_category_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_category_model` (`product_category_id`,`product_model_id`),
  ADD KEY `FK_product_model_id` (`product_model_id`);

--
-- Indexes for table `product_manufacturers`
--
ALTER TABLE `product_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_manufacturer` (`product_manufacturer`);

--
-- Indexes for table `product_manufacturer_models`
--
ALTER TABLE `product_manufacturer_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manufacturer_model` (`manufacturer_id`,`model_id`),
  ADD KEY `FK_model_id` (`model_id`);

--
-- Indexes for table `product_models`
--
ALTER TABLE `product_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_model` (`product_model`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_pages`
--
ALTER TABLE `menu_pages`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `page_parents`
--
ALTER TABLE `page_parents`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_category_models`
--
ALTER TABLE `product_category_models`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_manufacturers`
--
ALTER TABLE `product_manufacturers`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product_manufacturer_models`
--
ALTER TABLE `product_manufacturer_models`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `product_models`
--
ALTER TABLE `product_models`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_pages`
--
ALTER TABLE `menu_pages`
  ADD CONSTRAINT `FK_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_parents`
--
ALTER TABLE `page_parents`
  ADD CONSTRAINT `FK_child_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_page_parent_id` FOREIGN KEY (`page_parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_category_models`
--
ALTER TABLE `product_category_models`
  ADD CONSTRAINT `FK_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_product_model_id` FOREIGN KEY (`product_model_id`) REFERENCES `product_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_manufacturer_models`
--
ALTER TABLE `product_manufacturer_models`
  ADD CONSTRAINT `FK_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `product_manufacturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_model_id` FOREIGN KEY (`model_id`) REFERENCES `product_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
