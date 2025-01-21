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
  `stok` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.barang: ~0 rows (approximately)
REPLACE INTO `barang` (`id`, `nama_barang`, `stok`, `jenis_barang`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
	('9e04dc54-76e5-4079-adac-3c9ebb35de89', 'Kapur', '2', '9e04cb6a-723d-4668-9896-caca9f160e83', '20000', '9e04d959-f51f-476e-a6ee-ba08b92e5485', '2025-01-20 22:25:35', '2025-01-20 22:25:35');

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

-- Dumping data for table keuangan-logistik.detil_permintaan: ~1 rows (approximately)
REPLACE INTO `detil_permintaan` (`id`, `id_permintaan`, `id_barang`, `harga_baru`, `harga_lama`, `jumlah`, `created_at`, `updated_at`) VALUES
	('9e04f79f-7422-4bc0-a30c-31fafbbd3b23', '9e04f79f-692b-4f26-83b1-9e1179a9dd8f', '9e04dc54-76e5-4079-adac-3c9ebb35de89', '20000', '21000', '1', '2025-01-20 23:41:54', '2025-01-20 23:41:54');

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

-- Dumping data for table keuangan-logistik.jenis_barang: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.migrations: ~0 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2025_01_21_032628_create_permintaans_table', 2),
	(6, '2025_01_21_035531_create_barangs_table', 3),
	(7, '2025_01_21_042517_create_satuan_barangs_table', 4),
	(8, '2025_01_21_042523_create_jenis_barangs_table', 4),
	(9, '2025_01_21_050005_create_detil_permintaans_table', 5);

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
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.permintaan: ~1 rows (approximately)
REPLACE INTO `permintaan` (`id`, `nomor`, `nomor_permintaan`, `oleh`, `status`, `unit`, `tanggal`, `created_at`, `updated_at`) VALUES
	('9e04f79f-692b-4f26-83b1-9e1179a9dd8f', '1', 'SP/1/Pengelola Data Elektronik/01/2025', '1', '0', 'Pengelola Data Elektronik', '2025-01-21', '2025-01-20 23:41:54', '2025-01-20 23:41:54');

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

-- Dumping data for table keuangan-logistik.satuan_barang: ~0 rows (approximately)
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
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
REPLACE INTO `users` (`id`, `name`, `unit`, `nip`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Dimas Wisnu Wirawan', 'Pengelola Data Elektronik', '2023.01.12.162', '2024-02-03 04:09:49', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'mZuFCfmIieTFaFrQrS9Mv1gVvCVzWwftsyea3y2AaAjsd3yg7NUiMFavgimE', '2024-02-02 19:58:29', '2024-02-04 22:24:54'),
	(2, 'Ahmad David Al-Farizi', 'Logistik', '2020.05.12.124', '2024-02-03 04:34:50', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'mJ5OIrAb4DPbg9wKhYedGbfGgoequdA8S8jF7Zr7l7luMFggkvttIjc578T6', '2024-02-02 21:34:59', '2024-02-02 21:34:59'),
	(3, 'Alif Helmi Afrissa', 'Administrasi dan Dakwah Citra', '2020.12.02.129', '2024-02-03 06:05:56', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'dYOpLSQ5pErd5VVD07phJxYYnNQeDP1lbhBJg7RMPgQLKr0q5QCj3E6D1zBb', '2024-02-02 23:06:08', '2024-02-02 23:06:08'),
	(4, 'Arif Suparman,Amd.Kep', 'Perawat', '2014.04.02.059', '2024-02-03 06:07:08', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'Zuthw3FkEoelsojoE85qJEcEIWLmHXBmB7JyivkRClSKB2T9S3FlmU2koZr3', '2024-02-02 23:07:19', '2024-02-02 23:07:19'),
	(5, 'Deni Erliasari,Amd.Keb', 'Rawat Jalan', '2018.01.03.085', '2024-02-03 06:08:18', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ZYojG1C9plzZ1WKmFZ0YYojeJzIriwEXmMRLhIVYt45oWd28fz7iUOMAs690', '2024-02-02 23:08:29', '2024-02-02 23:08:29'),
	(6, 'Ayuk Saputri M,S.E', 'Keuangan', '2014.10.09.062', '2024-02-04 23:38:51', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', NULL, '2024-02-04 16:39:01', '2024-02-04 16:39:01'),
	(7, 'Septy Kartika Sari,S.Kep.Ns', 'Rawat Inap', '2017.02.02.082', '2024-02-03 07:29:30', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'c395Dqs57ombh468HjrB5rocdXfQWiapghg7STGt7mc9siNiQ0DsA7aXMMjk', '2024-02-05 00:30:58', '2024-02-05 00:34:06'),
	(8, 'Titin Handrayani.AMAK', 'Laboratorium', '2009.09.05.034', '2024-02-03 07:31:20', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ZerlJJbSPiEhcOO4WHlLYHTMiaysYpCzAxHgTZ4cRtviLeY85jogdssXq9TZ', '2024-02-05 00:32:41', '2024-02-05 00:34:31'),
	(9, 'M. Zaki Zamani, AMd.Kep', 'Casemix', '2011.04.02.044', '2024-02-03 07:59:59', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'EtHpsgszzDRJuJrReyY8fEwDLrZmjypc0RCaEd4cQixUizdp1cUisdINVBXC', '2024-02-05 01:01:24', '2024-02-05 01:01:24'),
	(10, 'Suyoto', 'Radiologi', '2003.09.12.021', '2024-02-03 08:02:39', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'BGqHglWNVdJYEblAduwjxcfsaoJNSs3qXeqslGgtzmjodlVSwfhCV9EJRRbD', '2024-02-05 01:04:00', '2024-02-05 01:04:00'),
	(11, 'Oktavio Firdaus Efendi,AMd.RMIK', 'Rekam Medis', '2023.01.07.159', '2024-02-03 08:06:01', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ANpy0xL6C1Vovp9aQf4uwpOVeuXLDyv8VyKIp1xOjSbYHxDBnOpelCnMft15', '2024-02-05 08:07:31', '2024-02-05 08:07:31'),
	(12, 'Dina Anita Sari.Amd.Gz', 'Gizi', '2017.06.08.083', '2024-02-03 08:10:03', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'PTJ3YLfQvxlreWbBWyEDcV1ZVpSoktLf5nPnhVLWTFFUyYEZ78i6VF3JHGhN', '2024-02-05 08:11:26', '2024-02-05 08:11:26'),
	(13, 'Muhammad Syamsuddin', 'Farmasi', '2022.02.04.141', '2024-02-03 08:16:32', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', '1iJILBHc818Xgf6xuxXmafdshSoiB3CId784d1c6avqKP4VKXye69qVF0uiT', '2024-02-05 08:17:52', '2024-02-05 08:17:52'),
	(14, 'Eri Kuswaningsih,S.Kep.Ns', 'Pelayanan Medis', '2010.08.02.040', '2024-02-01 01:30:40', '$2y$12$6lk.ffU8AVCpKWGgqLJ6Ku8Tw854bULlGJ.NnGb.4GTKLtx03.nXu', NULL, '2024-02-28 01:32:42', '2024-02-28 01:32:42'),
	(15, 'Heni Suskamdani,Amd.Kep', 'Penunjang Medis', '2003.09.03.020', '2024-02-01 01:33:07', '$2y$12$gT6CqglceuHN5KaJLAcHcuG9veZkbjuum8wsydf2HAeT/OhyfFb7G', NULL, '2024-02-28 01:34:59', '2024-02-28 01:34:59'),
	(16, 'Hartono', 'Rumah Tangga', '2007.02.12.023', '2024-02-01 02:35:27', '$2y$12$Etbfh6Zu65o3rk20C1JglO/vcIeriGAkLXXUebSMX.t3CsM8JuPH.', 'uuOUA5k692oA37sLIUh2rR3zRP81qS3XScEqLfuACi7DKGrD2heAhZ3QGOGt', '2024-03-04 02:37:28', '2024-03-04 02:37:28'),
	(17, 'Ida Farida, S.E', 'Bendahara', '2003.09.09.018', '2024-02-01 03:42:12', '$2y$12$2VCjUwHNk02lo2EWwvdFPO41ANfhA/CTS7xzN/XvdzqZsZ1iDNE32', '5NZRPrI7vhQERWbhUnKBmCW3Zbm3J7aiX0c7RYW8XtL6wOmaok49XXSHFGCP', '2024-03-04 03:44:07', '2024-03-04 03:44:07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
