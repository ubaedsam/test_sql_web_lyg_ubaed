-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 8.0.31 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk lygweb
CREATE DATABASE IF NOT EXISTS `lygweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lygweb`;

-- membuang struktur untuk table lygweb.dbo_lygdestination
CREATE TABLE IF NOT EXISTS `dbo_lygdestination` (
  `destination_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`destination_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel lygweb.dbo_lygdestination: 0 rows
/*!40000 ALTER TABLE `dbo_lygdestination` DISABLE KEYS */;
INSERT INTO `dbo_lygdestination` (`destination_code`, `destination_name`, `created_at`, `updated_at`) VALUES
	('HK', 'Hongkong', NULL, NULL),
	('SG', 'Singapore', NULL, NULL);
/*!40000 ALTER TABLE `dbo_lygdestination` ENABLE KEYS */;

-- membuang struktur untuk table lygweb.dbo_lygsewingoutput
CREATE TABLE IF NOT EXISTS `dbo_lygsewingoutput` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trn_date` date NOT NULL,
  `operator_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty_output` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dbo_lygsewingoutput_style_code_foreign` (`style_code`),
  KEY `dbo_lygsewingoutput_destination_code_foreign` (`destination_code`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel lygweb.dbo_lygsewingoutput: 0 rows
/*!40000 ALTER TABLE `dbo_lygsewingoutput` DISABLE KEYS */;
INSERT INTO `dbo_lygsewingoutput` (`id`, `trn_date`, `operator_name`, `style_code`, `size_name`, `destination_code`, `qty_output`, `created_at`, `updated_at`) VALUES
	(1, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XS', 'HK', '15', NULL, NULL),
	(2, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'S', 'HK', '25', NULL, NULL),
	(3, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'L', 'HK', '30', NULL, NULL),
	(4, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XL', 'HK', '17', NULL, NULL),
	(5, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'HK', '11', NULL, NULL),
	(6, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XS', 'SG', '3', NULL, NULL),
	(7, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'S', 'SG', '5', NULL, NULL),
	(8, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XL', 'SG', '12', NULL, NULL),
	(9, '2024-01-02', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'SG', '1', NULL, NULL),
	(10, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XS', 'HK', '12', NULL, NULL),
	(11, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'S', 'HK', '12', NULL, NULL),
	(12, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'L', 'HK', '9', NULL, NULL),
	(13, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XL', 'HK', '25', NULL, NULL),
	(14, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'HK', '7', NULL, NULL),
	(15, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XS', 'SG', '2', NULL, NULL),
	(16, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'L', 'SG', '1', NULL, NULL),
	(17, '2024-01-02', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XL', 'SG', '3', NULL, NULL),
	(18, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '92', 'HK', '21', NULL, NULL),
	(19, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '98', 'HK', '20', NULL, NULL),
	(20, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '152', 'HK', '10', NULL, NULL),
	(21, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '92', 'SG', '19', NULL, NULL),
	(22, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '98', 'SG', '18', NULL, NULL),
	(23, '2024-01-02', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '152', 'SG', '9', NULL, NULL),
	(24, '2024-01-02', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '92', 'HK', '13', NULL, NULL),
	(25, '2024-01-02', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '98', 'HK', '12', NULL, NULL),
	(26, '2024-01-02', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '152', 'HK', '6', NULL, NULL),
	(27, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'S', 'HK', '32', NULL, NULL),
	(28, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'L', 'HK', '39', NULL, NULL),
	(29, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XL', 'HK', '33', NULL, NULL),
	(30, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'HK', '11', NULL, NULL),
	(31, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'S', 'SG', '9', NULL, NULL),
	(32, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XL', 'SG', '30', NULL, NULL),
	(33, '2024-01-03', 'M. Zaidan', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'SG', '12', NULL, NULL),
	(34, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'S', 'HK', '36', NULL, NULL),
	(35, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'L', 'HK', '31', NULL, NULL),
	(36, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XL', 'HK', '26', NULL, NULL),
	(37, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'HK', '13', NULL, NULL),
	(38, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'L', 'SG', '6', NULL, NULL),
	(39, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XL', 'SG', '11', NULL, NULL),
	(40, '2024-01-03', 'Afizza Shabira', 'BOSSE FANCY OH HOOD S.9', 'XXL', 'SG', '13', NULL, NULL),
	(41, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '92', 'HK', '11', NULL, NULL),
	(42, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '98', 'HK', '12', NULL, NULL),
	(43, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '104', 'HK', '21', NULL, NULL),
	(44, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '110', 'HK', '14', NULL, NULL),
	(45, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '116', 'HK', '17', NULL, NULL),
	(46, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '122', 'HK', '23', NULL, NULL),
	(47, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '128', 'HK', '25', NULL, NULL),
	(48, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '134', 'HK', '27', NULL, NULL),
	(49, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '140', 'HK', '29', NULL, NULL),
	(50, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '146', 'HK', '14', NULL, NULL),
	(51, '2024-01-03', 'M. Zaidan', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '152', 'HK', '12', NULL, NULL),
	(52, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '92', 'SG', '21', NULL, NULL),
	(53, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '98', 'SG', '11', NULL, NULL),
	(54, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '104', 'SG', '19', NULL, NULL),
	(55, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '110', 'SG', '7', NULL, NULL),
	(56, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '116', 'SG', '6', NULL, NULL),
	(57, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '122', 'SG', '5', NULL, NULL),
	(58, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '134', 'SG', '12', NULL, NULL),
	(59, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '140', 'SG', '18', NULL, NULL),
	(60, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '146', 'SG', '19', NULL, NULL),
	(61, '2024-01-03', 'Afizza Shabira', 'FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '152', 'SG', '21', NULL, NULL);
/*!40000 ALTER TABLE `dbo_lygsewingoutput` ENABLE KEYS */;

-- membuang struktur untuk table lygweb.dbo_lygstylesize
CREATE TABLE IF NOT EXISTS `dbo_lygstylesize` (
  `style_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_sort` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel lygweb.dbo_lygstylesize: 0 rows
/*!40000 ALTER TABLE `dbo_lygstylesize` DISABLE KEYS */;
INSERT INTO `dbo_lygstylesize` (`style_code`, `size_sort`, `size_name`, `created_at`, `updated_at`) VALUES
	('BOSSE FANCY OH HOOD S.9', '1', 'XS', NULL, NULL),
	('BOSSE FANCY OH HOOD S.9', '2', 'S', NULL, NULL),
	('BOSSE FANCY OH HOOD S.9', '3', 'M', NULL, NULL),
	('BOSSE FANCY OH HOOD S.9', '4', 'L', NULL, NULL),
	('BOSSE FANCY OH HOOD S.9', '5', 'XL', NULL, NULL),
	('BOSSE FANCY OH HOOD S.9', '6', 'XXL', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '1', '92', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '2', '98', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '3', '104', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '4', '110', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '5', '116', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '6', '122', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '7', '128', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '8', '134', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '9', '140', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '10', '146', NULL, NULL),
	('FOOTBALL SETS EUROCUP CW N (ARGENTINA) S.9', '11', '152', NULL, NULL);
/*!40000 ALTER TABLE `dbo_lygstylesize` ENABLE KEYS */;

-- membuang struktur untuk table lygweb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel lygweb.migrations: 0 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2024_07_17_012350_create_dbo_lygstylesize_table', 1),
	(2, '2024_07_17_012433_create_dbo_lygsewingoutput_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
