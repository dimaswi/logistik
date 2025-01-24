-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table keuangan-logistik.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.barang: ~2 rows (approximately)
REPLACE INTO `barang` (`id`, `nama_barang`, `jenis_barang`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
	('9e04dc54-76e5-4079-adac-3c9ebb35de89', 'Kapur', '9e04cb6a-723d-4668-9896-caca9f160e83', '20000', '9e04d959-f51f-476e-a6ee-ba08b92e5485', '2025-01-20 22:25:35', '2025-01-20 22:25:35'),
	('9e06fc72-b8cf-412b-89ff-fc8160d8e120', 'Pulpen', '9e04cb6a-723d-4668-9896-caca9f160e83', '20000', '9e04d959-f51f-476e-a6ee-ba08b92e5485', '2025-01-21 23:47:03', '2025-01-21 23:47:03');

-- Dumping structure for table keuangan-logistik.detil_permintaan
CREATE TABLE IF NOT EXISTS `detil_permintaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_permintaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_baru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_lama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.detil_permintaan: ~0 rows (approximately)
REPLACE INTO `detil_permintaan` (`id`, `id_permintaan`, `id_barang`, `harga_baru`, `harga_lama`, `jumlah`, `created_at`, `updated_at`) VALUES
	('9e04f79f-7422-4bc0-a30c-31fafbbd3b23', '9e04f79f-692b-4f26-83b1-9e1179a9dd8f', '9e04dc54-76e5-4079-adac-3c9ebb35de89', '20000', '21000', '1', '2025-01-20 23:41:54', '2025-01-20 23:41:54'),
	('9e06fb54-c1e9-4c71-ae31-90e46f455d66', '9e06fb54-bd74-4712-bd16-746e982d8bf6', '9e04dc54-76e5-4079-adac-3c9ebb35de89', '20000', '21000', '1', '2025-01-21 23:43:56', '2025-01-21 23:43:56');

-- Dumping structure for table keuangan-logistik.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.jenis_barang
CREATE TABLE IF NOT EXISTS `jenis_barang` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.jenis_barang: ~2 rows (approximately)
REPLACE INTO `jenis_barang` (`id`, `jenis_barang`, `deskripsi`, `created_at`, `updated_at`) VALUES
	('9e04cb6a-723d-4668-9896-caca9f160e83', 'Barang Habis Pakai', '-', '2025-01-20 21:38:18', '2025-01-20 21:38:18'),
	('9e04cd2e-024f-4232-ad0b-2068ffd58ec5', 'Rumah Tangga', '-', '2025-01-20 21:43:14', '2025-01-20 21:43:14'),
	('9e04cd5a-a3f0-4d98-b2ea-95b094641456', 'Dapur', '-', '2025-01-20 21:43:43', '2025-01-20 21:43:43');

-- Dumping structure for table keuangan-logistik.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.migrations: ~9 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2025_01_21_032628_create_permintaans_table', 2),
	(6, '2025_01_21_035531_create_barangs_table', 3),
	(7, '2025_01_21_042517_create_satuan_barangs_table', 4),
	(8, '2025_01_21_042523_create_jenis_barangs_table', 4),
	(9, '2025_01_21_050005_create_detil_permintaans_table', 5),
	(10, '2025_01_22_052453_create_organisasis_table', 6);

-- Dumping structure for table keuangan-logistik.organisasi
CREATE TABLE IF NOT EXISTS `organisasi` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pimpinan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.organisasi: ~17 rows (approximately)
REPLACE INTO `organisasi` (`id`, `nama`, `pimpinan`, `kode`, `kop`, `tingkat`, `created_at`, `updated_at`) VALUES
	('9e06eba8-b714-46e1-ab09-0c6dc26eaece', 'Pengelola Data Elektronik', '1', 'PDE', 'kop/01JJ6FNCR2KK0JJF2202MEXWNT.png', 'Unit', '2025-01-21 23:00:07', '2025-01-22 00:47:07'),
	('9e06eda8-939c-4044-894c-dd5ffcc5fde1', 'Keuangan', '6', 'KEUANGAN', '01JJ69VP3KRH74ZNQSWP6ZE786.png', 'Bagian', '2025-01-21 23:05:42', '2025-01-21 23:05:42'),
	('9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', 'Logistik', '2', 'LOGISTIK', '01JJ6A15M15EYZKSPQZP7VS3TJ.png', 'Unit', '2025-01-21 23:08:42', '2025-01-21 23:08:42'),
	('9e06efb5-6986-40c6-854e-6e6b89ef6d9a', 'Pelayanan Medis', '14', 'YANMED', '01JJ6A6607NDH9FXZJH8Z5XFPT.png', 'Bagian', '2025-01-21 23:11:26', '2025-01-21 23:11:26'),
	('9e06efdb-8794-46b0-9204-0bde5d133e8e', 'Rawat Inap', '7', 'IRNA', '01JJ6A6YCY3JQ1M3AKM2YEG9YF.png', 'Unit', '2025-01-21 23:11:51', '2025-01-21 23:11:51'),
	('9e06effe-2bf9-4783-9a83-065ec974e139', 'Rawat Jalan', '5', 'IRJA', 'kop/01JJ6DTTS5J6NXSA2806C3NTJK.png', 'Unit', '2025-01-21 23:12:14', '2025-01-22 00:15:08'),
	('9e06f067-4749-44dd-af1f-2abc98aeb786', 'Gawat Darurat', '4', 'UGD', '01JJ6A9QV0NFY4D126C5KP3273.png', 'Ruangan', '2025-01-21 23:13:22', '2025-01-21 23:13:22'),
	('9e06f0ad-f41a-4f11-9274-f7ad51501683', 'Penunjang Medis', '15', 'JANGMED', '01JJ6AB529N6GJ8F263156FDJ5.png', 'Bagian', '2025-01-21 23:14:09', '2025-01-21 23:14:09'),
	('9e06f0d6-8e41-4774-afce-07c850d84aed', 'Laboratorium', '8', 'LAB', '01JJ6ABZ1VV1F4DJ43YD6NBJE8.png', 'Unit', '2025-01-21 23:14:35', '2025-01-21 23:14:35'),
	('9e06f0fd-bdc3-4939-bcf1-995761b0f20d', 'Radiologi', '10', 'RAD', '01JJ6ACR4C5ZC3R1VANAYZDK0Q.png', 'Unit', '2025-01-21 23:15:01', '2025-01-21 23:15:01'),
	('9e06f126-7bf9-43fa-8127-a4618b4267b4', 'Farmasi', '13', 'FARMASI', '01JJ6ADJ6VHJMWA3Z7Z5T6F073.png', 'Unit', '2025-01-21 23:15:28', '2025-01-21 23:15:28'),
	('9e06f151-0b51-4bb4-a392-31abf080566e', 'Gizi', '12', 'GIZI', '01JJ6AEDE7A4NW4S2ZKY363E32.png', 'Unit', '2025-01-21 23:15:56', '2025-01-21 23:15:56'),
	('9e06f197-7feb-4d0c-9d0b-25d88f5b1bb2', 'Rekam Medis', '11', 'RM', '01JJ6AFTHAND0ZNTFBZATRAP94.png', 'Unit', '2025-01-21 23:16:42', '2025-01-21 23:16:42'),
	('9e06f1c7-3002-4026-a7dc-f72ad94b86d7', 'Administrasi Dan Dakwah Citra', '3', 'ADMIN', '01JJ6AGS21XKAJPYV16PR951KA.png', 'Unit', '2025-01-21 23:17:13', '2025-01-21 23:17:13'),
	('9e06f1f4-78f4-4351-af17-8081d9d081c2', 'Rumah Tangga', '16', 'SARPRAS', '01JJ6AHP1K2WG0DYJPBC63CQ8A.png', 'Unit', '2025-01-21 23:17:43', '2025-01-21 23:17:43'),
	('9e06f268-f825-47de-bb36-5c7998f1cffc', 'Casemix', '9', 'CASEMIX', '01JJ6AM0K9JDV9N9HQ6FEX21RY.png', 'Unit', '2025-01-21 23:18:59', '2025-01-21 23:18:59'),
	('9e06f292-a14c-4319-b0c2-1ee06a9df638', 'Bendahara dan Kasir', '17', 'KASIR', '01JJ6AMV8GQW1E2434F0X38EDH.png', 'Unit', '2025-01-21 23:19:26', '2025-01-21 23:19:26');

-- Dumping structure for table keuangan-logistik.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.permintaan
CREATE TABLE IF NOT EXISTS `permintaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_permintaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oleh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `organisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.permintaan: ~0 rows (approximately)
REPLACE INTO `permintaan` (`id`, `nomor`, `nomor_permintaan`, `oleh`, `status`, `organisasi`, `tanggal`, `created_at`, `updated_at`) VALUES
	('9e06fb54-bd74-4712-bd16-746e982d8bf6', '1', 'SP/1/PDE/01/2025', '1', '0', '9e06eba8-b714-46e1-ab09-0c6dc26eaece', '2025-01-22', '2025-01-21 23:43:56', '2025-01-21 23:43:56');

-- Dumping structure for table keuangan-logistik.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.satuan_barang
CREATE TABLE IF NOT EXISTS `satuan_barang` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.satuan_barang: ~4 rows (approximately)
REPLACE INTO `satuan_barang` (`id`, `satuan_barang`, `deskripsi`, `created_at`, `updated_at`) VALUES
	('9e04cdbf-3f4c-45ad-a0cf-f73da1f4cd9f', 'Pouch', NULL, '2025-01-20 21:44:49', '2025-01-20 21:44:49'),
	('9e04cdc4-9490-418f-bb46-f6d08b015549', 'Kg', NULL, '2025-01-20 21:44:52', '2025-01-20 21:44:52'),
	('9e04cdc9-0bbf-4d2a-981c-6832df554d7d', 'Pcs', NULL, '2025-01-20 21:44:55', '2025-01-20 21:44:55'),
	('9e04cdd0-3b41-4528-a999-93fe8895c733', 'Ons', NULL, '2025-01-20 21:45:00', '2025-01-20 21:45:00'),
	('9e04d959-f51f-476e-a6ee-ba08b92e5485', 'Pack', '-', '2025-01-20 22:17:16', '2025-01-20 22:17:16');

-- Dumping structure for table keuangan-logistik.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`nip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.users: ~17 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `organisasi`, `nip`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Dimas Wisnu Wirawan', '9e06eba8-b714-46e1-ab09-0c6dc26eaece', '2023.01.12.162', '2024-02-03 04:09:49', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'mZuFCfmIieTFaFrQrS9Mv1gVvCVzWwftsyea3y2AaAjsd3yg7NUiMFavgimE', '2024-02-02 19:58:29', '2025-01-21 23:21:49'),
	(2, 'Ahmad David Al-Farizi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', '2020.05.12.124', '2024-02-03 04:34:50', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'mJ5OIrAb4DPbg9wKhYedGbfGgoequdA8S8jF7Zr7l7luMFggkvttIjc578T6', '2024-02-02 21:34:59', '2025-01-21 23:27:46'),
	(3, 'Alif Helmi Afrissa', '9e06f1c7-3002-4026-a7dc-f72ad94b86d7', '2020.12.02.129', '2024-02-03 06:05:56', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'dYOpLSQ5pErd5VVD07phJxYYnNQeDP1lbhBJg7RMPgQLKr0q5QCj3E6D1zBb', '2024-02-02 23:06:08', '2025-01-21 23:27:55'),
	(4, 'Arif Suparman,Amd.Kep', '9e06f067-4749-44dd-af1f-2abc98aeb786', '2014.04.02.059', '2024-02-03 06:07:08', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'Zuthw3FkEoelsojoE85qJEcEIWLmHXBmB7JyivkRClSKB2T9S3FlmU2koZr3', '2024-02-02 23:07:19', '2025-01-21 23:29:49'),
	(5, 'Deni Erliasari,Amd.Keb', '9e06effe-2bf9-4783-9a83-065ec974e139', '2018.01.03.085', '2024-02-03 06:08:18', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ZYojG1C9plzZ1WKmFZ0YYojeJzIriwEXmMRLhIVYt45oWd28fz7iUOMAs690', '2024-02-02 23:08:29', '2025-01-21 23:29:58'),
	(6, 'Ayuk Saputri M,S.E', '9e06eda8-939c-4044-894c-dd5ffcc5fde1', '2014.10.09.062', '2024-02-04 23:38:51', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', NULL, '2024-02-04 16:39:01', '2025-01-21 23:30:21'),
	(7, 'Septy Kartika Sari,S.Kep.Ns', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2017.02.02.082', '2024-02-03 07:29:30', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'c395Dqs57ombh468HjrB5rocdXfQWiapghg7STGt7mc9siNiQ0DsA7aXMMjk', '2024-02-05 00:30:58', '2025-01-21 23:30:34'),
	(8, 'Titin Handrayani.AMAK', '9e06f0d6-8e41-4774-afce-07c850d84aed', '2009.09.05.034', '2024-02-03 07:31:20', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ZerlJJbSPiEhcOO4WHlLYHTMiaysYpCzAxHgTZ4cRtviLeY85jogdssXq9TZ', '2024-02-05 00:32:41', '2025-01-21 23:30:43'),
	(9, 'M. Zaki Zamani, AMd.Kep', '9e06f268-f825-47de-bb36-5c7998f1cffc', '2011.04.02.044', '2024-02-03 07:59:59', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'EtHpsgszzDRJuJrReyY8fEwDLrZmjypc0RCaEd4cQixUizdp1cUisdINVBXC', '2024-02-05 01:01:24', '2025-01-21 23:30:52'),
	(10, 'Suyoto', '9e06f0fd-bdc3-4939-bcf1-995761b0f20d', '2003.09.12.021', '2024-02-03 08:02:39', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'BGqHglWNVdJYEblAduwjxcfsaoJNSs3qXeqslGgtzmjodlVSwfhCV9EJRRbD', '2024-02-05 01:04:00', '2025-01-21 23:31:00'),
	(11, 'Oktavio Firdaus Efendi,AMd.RMIK', '9e06f197-7feb-4d0c-9d0b-25d88f5b1bb2', '2023.01.07.159', '2024-02-03 08:06:01', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ANpy0xL6C1Vovp9aQf4uwpOVeuXLDyv8VyKIp1xOjSbYHxDBnOpelCnMft15', '2024-02-05 08:07:31', '2025-01-21 23:31:28'),
	(12, 'Dina Anita Sari.Amd.Gz', '9e06f151-0b51-4bb4-a392-31abf080566e', '2017.06.08.083', '2024-02-03 08:10:03', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'PTJ3YLfQvxlreWbBWyEDcV1ZVpSoktLf5nPnhVLWTFFUyYEZ78i6VF3JHGhN', '2024-02-05 08:11:26', '2025-01-21 23:31:36'),
	(13, 'Muhammad Syamsuddin', '9e06f126-7bf9-43fa-8127-a4618b4267b4', '2022.02.04.141', '2024-02-03 08:16:32', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', '1iJILBHc818Xgf6xuxXmafdshSoiB3CId784d1c6avqKP4VKXye69qVF0uiT', '2024-02-05 08:17:52', '2025-01-21 23:31:44'),
	(14, 'Eri Kuswaningsih,S.Kep.Ns', '9e06efb5-6986-40c6-854e-6e6b89ef6d9a', '2010.08.02.040', '2024-02-01 01:30:40', '$2y$12$6lk.ffU8AVCpKWGgqLJ6Ku8Tw854bULlGJ.NnGb.4GTKLtx03.nXu', NULL, '2024-02-28 01:32:42', '2025-01-21 23:31:54'),
	(15, 'Heni Suskamdani,Amd.Kep', '9e06f0ad-f41a-4f11-9274-f7ad51501683', '2003.09.03.020', '2024-02-01 01:33:07', '$2y$12$gT6CqglceuHN5KaJLAcHcuG9veZkbjuum8wsydf2HAeT/OhyfFb7G', NULL, '2024-02-28 01:34:59', '2025-01-21 23:32:01'),
	(16, 'Hartono', '9e06f1f4-78f4-4351-af17-8081d9d081c2', '2007.02.12.023', '2024-02-01 02:35:27', '$2y$12$Etbfh6Zu65o3rk20C1JglO/vcIeriGAkLXXUebSMX.t3CsM8JuPH.', 'uuOUA5k692oA37sLIUh2rR3zRP81qS3XScEqLfuACi7DKGrD2heAhZ3QGOGt', '2024-03-04 02:37:28', '2025-01-21 23:32:11'),
	(17, 'Ida Farida, S.E', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2003.09.09.018', '2024-02-01 03:42:12', '$2y$12$2VCjUwHNk02lo2EWwvdFPO41ANfhA/CTS7xzN/XvdzqZsZ1iDNE32', '5NZRPrI7vhQERWbhUnKBmCW3Zbm3J7aiX0c7RYW8XtL6wOmaok49XXSHFGCP', '2024-03-04 03:44:07', '2025-01-21 23:32:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
