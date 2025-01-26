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

-- Dumping structure for table keuangan-logistik.aset
CREATE TABLE IF NOT EXISTS `aset` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pengadaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_aset` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.aset: ~4 rows (approximately)
INSERT INTO `aset` (`id`, `id_pengadaan`, `nama_aset`, `merk`, `lokasi`, `tanggal_pembelian`, `tanggal_serah_terima`, `harga_pembelian`, `created_at`, `updated_at`) VALUES
	('9e0ef40a-b1cb-4bca-b0d2-7e81d14212ac', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'Lenovo ThinkCentre', 'Lenovo', '9e0dd110-833b-4c04-9ce4-6beb82d3b59d', '2025-01-26', '2025-01-26', '1300000', '2025-01-26 05:50:10', '2025-01-26 05:50:10'),
	('9e0ef40a-b468-42b4-9f18-91d337fb4e4a', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'Lenovo ThinkCentre', 'Lenovo', '9e0dd110-833b-4c04-9ce4-6beb82d3b59d', '2025-01-26', '2025-01-26', '1300000', '2025-01-26 05:50:10', '2025-01-26 05:50:10'),
	('9e0ef40a-b60a-4d6f-a950-3231034fe577', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'Lenovo ThinkCentre', 'Lenovo', '9e0dd110-833b-4c04-9ce4-6beb82d3b59d', '2025-01-26', '2025-01-26', '1300000', '2025-01-26 05:50:10', '2025-01-26 05:50:10'),
	('9e0ef4d2-105e-4c0e-b788-88eaf1d76095', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'MSI G22HZ', 'MSI', '9e0dd110-833b-4c04-9ce4-6beb82d3b59d', '2025-01-26', '2025-01-26', '900000', '2025-01-26 05:52:21', '2025-01-26 05:52:21');

-- Dumping structure for table keuangan-logistik.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.barang: ~2 rows (approximately)
INSERT INTO `barang` (`id`, `nama_barang`, `jenis_barang`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
	('9e0d0d23-d869-44a3-8085-0d4dd308240c', 'Pulpen', '9e04cb6a-723d-4668-9896-caca9f160e83', '40000', '9e04d959-f51f-476e-a6ee-ba08b92e5485', '2025-01-25 07:08:42', '2025-01-25 15:08:31'),
	('9e0d0d68-85b1-442c-bfaa-a90fa5329d89', 'Kertas HVS A4', '9e04cb6a-723d-4668-9896-caca9f160e83', '100000', '9e0d0d4c-908d-41b8-a854-d73ad9699a4a', '2025-01-25 07:09:27', '2025-01-25 15:07:10'),
	('9e0d0d88-8282-45cb-84f8-b680d58a24b8', 'Kertas HVS F4', '9e04cb6a-723d-4668-9896-caca9f160e83', '143000', '9e0d0d4c-908d-41b8-a854-d73ad9699a4a', '2025-01-25 07:09:48', '2025-01-25 07:09:55');

-- Dumping structure for table keuangan-logistik.detil_permintaan
CREATE TABLE IF NOT EXISTS `detil_permintaan` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `id_permintaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.detil_permintaan: ~4 rows (approximately)
INSERT INTO `detil_permintaan` (`id`, `id_permintaan`, `id_barang`, `jumlah`, `created_at`, `updated_at`) VALUES
	('9e0d1009-bacb-4c95-8655-2233c0832fb7', '9e0d1009-b8a4-4f45-b296-c9cb6c679d91', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '1', '2025-01-25 07:16:48', '2025-01-25 07:16:48'),
	('9e0d1014-807f-4c56-a116-c485a0543ec0', '9e0d1014-7e8b-483e-9982-51da8d18cd07', '9e0d0d88-8282-45cb-84f8-b680d58a24b8', '2', '2025-01-25 07:16:55', '2025-01-25 07:16:55'),
	('9e0d107b-09ee-4655-a37d-c8166bbc162c', '9e0d1009-b8a4-4f45-b296-c9cb6c679d91', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '1', '2025-01-25 07:18:02', '2025-01-25 07:18:02'),
	('9e0d136a-e234-4939-8ea6-f9aba98103ce', '9e0d136a-e000-43e2-b7d9-8f31ac5259f2', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '4', '2025-01-25 07:26:15', '2025-01-25 07:26:15'),
	('9e0d2bd2-8d71-41b8-8906-ba9e5e1a2006', '9e0d2bd2-8b20-49af-abc0-4327896422fe', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '1', '2025-01-25 08:34:29', '2025-01-25 08:34:29');

-- Dumping structure for table keuangan-logistik.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.jenis_barang
CREATE TABLE IF NOT EXISTS `jenis_barang` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.jenis_barang: ~3 rows (approximately)
INSERT INTO `jenis_barang` (`id`, `jenis_barang`, `deskripsi`, `created_at`, `updated_at`) VALUES
	('9e04cb6a-723d-4668-9896-caca9f160e83', 'Barang Habis Pakai', '-', '2025-01-20 21:38:18', '2025-01-20 21:38:18'),
	('9e04cd2e-024f-4232-ad0b-2068ffd58ec5', 'Rumah Tangga', '-', '2025-01-20 21:43:14', '2025-01-20 21:43:14'),
	('9e04cd5a-a3f0-4d98-b2ea-95b094641456', 'Dapur', '-', '2025-01-20 21:43:43', '2025-01-20 21:43:43');

-- Dumping structure for table keuangan-logistik.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.migrations: ~10 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2025_01_21_032628_create_permintaans_table', 2),
	(6, '2025_01_21_035531_create_barangs_table', 3),
	(7, '2025_01_21_042517_create_satuan_barangs_table', 4),
	(8, '2025_01_21_042523_create_jenis_barangs_table', 4),
	(9, '2025_01_21_050005_create_detil_permintaans_table', 5),
	(10, '2025_01_22_052453_create_organisasis_table', 6),
	(11, '2025_01_25_100801_create_permission_tables', 7),
	(12, '2025_01_25_105519_create_peneriman_permintaans_table', 8),
	(13, '2025_01_25_110202_create_penolakan_permintaans_table', 9),
	(14, '2025_01_25_110748_create_stoks_table', 10),
	(15, '2025_01_25_172320_create_stok_opnamnes_table', 11),
	(16, '2025_01_25_172703_create_stok_opnamne_detils_table', 11),
	(17, '2025_01_25_203348_create_pembelians_table', 12),
	(18, '2025_01_25_203354_create_pembelian_detils_table', 12),
	(19, '2025_01_25_203958_create_supliers_table', 12),
	(20, '2025_01_25_224710_create_pengadaans_table', 13),
	(21, '2025_01_25_224713_create_pengadaan_detils_table', 13),
	(22, '2025_01_25_224730_create_asets_table', 13),
	(23, '2025_01_25_231049_create_ruangans_table', 14),
	(24, '2025_01_26_123935_create_serah_terima_asets_table', 15);

-- Dumping structure for table keuangan-logistik.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.model_has_roles: ~18 rows (approximately)
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(3, 'App\\Models\\User', 2),
	(4, 'App\\Models\\User', 3),
	(4, 'App\\Models\\User', 4),
	(4, 'App\\Models\\User', 5),
	(4, 'App\\Models\\User', 6),
	(4, 'App\\Models\\User', 7),
	(4, 'App\\Models\\User', 8),
	(4, 'App\\Models\\User', 9),
	(4, 'App\\Models\\User', 10),
	(4, 'App\\Models\\User', 11),
	(4, 'App\\Models\\User', 12),
	(4, 'App\\Models\\User', 13),
	(4, 'App\\Models\\User', 14),
	(4, 'App\\Models\\User', 15),
	(4, 'App\\Models\\User', 16),
	(4, 'App\\Models\\User', 17);

-- Dumping structure for table keuangan-logistik.organisasi
CREATE TABLE IF NOT EXISTS `organisasi` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pimpinan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.organisasi: ~17 rows (approximately)
INSERT INTO `organisasi` (`id`, `nama`, `pimpinan`, `kode`, `kop`, `tingkat`, `created_at`, `updated_at`) VALUES
	('9e06eba8-b714-46e1-ab09-0c6dc26eaece', 'Pengelola Data Elektronik', '1', 'PDE', 'kop/01JJAX4KFQRSVM20VSDHVYXTVH.png', 'Unit', '2025-01-21 23:00:07', '2025-01-23 17:59:35'),
	('9e06eda8-939c-4044-894c-dd5ffcc5fde1', 'Keuangan', '6', 'KEUANGAN', 'kop/01JJAY70KDCY206BZG1JH5GTT4.png', 'Bagian', '2025-01-21 23:05:42', '2025-01-23 18:18:22'),
	('9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', 'Logistik', '2', 'LOGISTIK', 'kop/01JJAY7AGP7EDZR9XZNKM5E2JM.png', 'Unit', '2025-01-21 23:08:42', '2025-01-23 18:18:32'),
	('9e06efb5-6986-40c6-854e-6e6b89ef6d9a', 'Pelayanan Medis', '14', 'YANMED', 'kop/01JJAY7Y708VGRTSXYRS5EAFGZ.png', 'Bagian', '2025-01-21 23:11:26', '2025-01-23 18:18:53'),
	('9e06efdb-8794-46b0-9204-0bde5d133e8e', 'Rawat Inap', '7', 'IRNA', 'kop/01JJAY8GD3YD6ZNCGDG5E8K90A.png', 'Unit', '2025-01-21 23:11:51', '2025-01-23 18:19:11'),
	('9e06effe-2bf9-4783-9a83-065ec974e139', 'Rawat Jalan', '5', 'IRJA', 'kop/01JJAY979D2TPJ0Z6GECT383GH.png', 'Unit', '2025-01-21 23:12:14', '2025-01-23 18:19:35'),
	('9e06f067-4749-44dd-af1f-2abc98aeb786', 'Gawat Darurat', '4', 'UGD', 'kop/01JJAY9KQXV8EJMM76PCBA4CE7.png', 'Ruangan', '2025-01-21 23:13:22', '2025-01-23 18:19:47'),
	('9e06f0ad-f41a-4f11-9274-f7ad51501683', 'Penunjang Medis', '15', 'JANGMED', 'kop/01JJAYA1ZCG41ZBWJR60HWFRGQ.png', 'Bagian', '2025-01-21 23:14:09', '2025-01-23 18:20:02'),
	('9e06f0d6-8e41-4774-afce-07c850d84aed', 'Kepala Unit Laboratorium', '8', 'LAB', 'kop/01JJAYB38PBKJ66038TJMYCCQT.png', 'Unit', '2025-01-21 23:14:35', '2025-01-23 18:20:36'),
	('9e06f0fd-bdc3-4939-bcf1-995761b0f20d', 'Radiologi', '10', 'RAD', 'kop/01JJAYBK5NFFHAR6RFSH5TZTAS.png', 'Unit', '2025-01-21 23:15:01', '2025-01-23 18:20:52'),
	('9e06f126-7bf9-43fa-8127-a4618b4267b4', 'Farmasi', '13', 'FARMASI', 'kop/01JJAYC3HW0HHF5JEGS548AG93.png', 'Unit', '2025-01-21 23:15:28', '2025-01-23 18:21:09'),
	('9e06f151-0b51-4bb4-a392-31abf080566e', 'Gizi', '12', 'GIZI', 'kop/01JJAYE0R07S39GFK782K0QEQW.png', 'Unit', '2025-01-21 23:15:56', '2025-01-23 18:22:12'),
	('9e06f197-7feb-4d0c-9d0b-25d88f5b1bb2', 'Rekam Medis', '11', 'RM', 'kop/01JJAYEF5W21FGTY4DQTKPZQHE.png', 'Unit', '2025-01-21 23:16:42', '2025-01-23 18:22:27'),
	('9e06f1c7-3002-4026-a7dc-f72ad94b86d7', 'Administrasi Dan Dakwah Citra', '3', 'ADMIN', 'kop/01JJAYF34EMN119283PQ03T7XJ.png', 'Unit', '2025-01-21 23:17:13', '2025-01-23 18:22:47'),
	('9e06f1f4-78f4-4351-af17-8081d9d081c2', 'Rumah Tangga', '16', 'SARPRAS', 'kop/01JJAYFFK0N60MP3YG459MG7TR.png', 'Unit', '2025-01-21 23:17:43', '2025-01-23 18:23:00'),
	('9e06f268-f825-47de-bb36-5c7998f1cffc', 'Casemix', '9', 'CASEMIX', 'kop/01JJAYFXJAVTT9AR8GA5HBM8DB.png', 'Unit', '2025-01-21 23:18:59', '2025-01-23 18:23:14'),
	('9e06f292-a14c-4319-b0c2-1ee06a9df638', 'Bendahara dan Kasir', '17', 'KASIR', 'kop/01JJAYGBXJQ0WY9AZ2V2ZXG8WP.png', 'Unit', '2025-01-21 23:19:26', '2025-01-23 18:23:29');

-- Dumping structure for table keuangan-logistik.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_faktur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ppn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FAKTUR` (`nomor_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.pembelian: ~0 rows (approximately)
INSERT INTO `pembelian` (`id`, `nomor_faktur`, `tanggal_pembelian`, `supplier`, `total`, `diskon`, `ppn`, `created_at`, `updated_at`) VALUES
	('9e0db7dd-b016-4751-b10c-fbd36e2b6ddb', 'IDM/10/01/2024', '2025-01-25', '9e0d9bfa-c8b8-4593-8015-cd870b04a046', '240000', '0', '0', '2025-01-25 15:06:05', '2025-01-25 15:06:05'),
	('9e0db841-e4ea-46be-a793-f53401db3cc3', 'IDM/2/01/2025', '2025-01-25', '9e0d9bfa-c8b8-4593-8015-cd870b04a046', '300000', '0', '0', '2025-01-25 15:07:10', '2025-01-25 15:07:10'),
	('9e0db8bc-9469-46e9-88ff-02a8c5413bbc', 'IDM/3/01/2025', '2025-01-25', '9e0d9bfa-c8b8-4593-8015-cd870b04a046', '40000', '0', '0', '2025-01-25 15:08:31', '2025-01-25 15:08:31');

-- Dumping structure for table keuangan-logistik.pembelian_detil
CREATE TABLE IF NOT EXISTS `pembelian_detil` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.pembelian_detil: ~0 rows (approximately)
INSERT INTO `pembelian_detil` (`id`, `id_pembelian`, `id_barang`, `jumlah`, `harga`, `created_at`, `updated_at`) VALUES
	('9e0db7dd-b166-46d6-ac4c-c7a93c50bdee', '9e0db7dd-b016-4751-b10c-fbd36e2b6ddb', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '1', '40000', '2025-01-25 15:06:05', '2025-01-25 15:06:05'),
	('9e0db7dd-b216-4f54-9104-44b460dbb57a', '9e0db7dd-b016-4751-b10c-fbd36e2b6ddb', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '2', '100000', '2025-01-25 15:06:05', '2025-01-25 15:06:05'),
	('9e0db841-e650-49e8-9b85-5f79bde595b8', '9e0db841-e4ea-46be-a793-f53401db3cc3', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '3', '100000', '2025-01-25 15:07:10', '2025-01-25 15:07:10'),
	('9e0db8bc-95bb-4763-a45c-b4b28037e452', '9e0db8bc-9469-46e9-88ff-02a8c5413bbc', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '1', '40000', '2025-01-25 15:08:31', '2025-01-25 15:08:31');

-- Dumping structure for table keuangan-logistik.penerimaan_permintaan
CREATE TABLE IF NOT EXISTS `penerimaan_permintaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_permintaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerima` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.penerimaan_permintaan: ~2 rows (approximately)
INSERT INTO `penerimaan_permintaan` (`id`, `id_permintaan`, `penerima`, `keterangan`, `created_at`, `updated_at`) VALUES
	('9e0d1287-a617-4e1d-9707-4b3132708957', '9e0d1009-b8a4-4f45-b296-c9cb6c679d91', '17', 'Sudah Diterima', '2025-01-25 07:23:46', '2025-01-25 07:23:46'),
	('9e0d1611-d11b-4240-a096-7f248110bea0', '9e0d136a-e000-43e2-b7d9-8f31ac5259f2', '17', NULL, '2025-01-25 07:33:40', '2025-01-25 07:33:40'),
	('9e0d7a0f-d466-4da6-b428-4c874925da80', '9e0d2bd2-8b20-49af-abc0-4327896422fe', '17', NULL, '2025-01-25 12:13:16', '2025-01-25 12:13:16');

-- Dumping structure for table keuangan-logistik.pengadaan
CREATE TABLE IF NOT EXISTS `pengadaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_pengadaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oleh` smallint NOT NULL DEFAULT '0',
  `organisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepala` smallint NOT NULL DEFAULT '0',
  `perihal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `persetujuan` smallint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.pengadaan: ~1 rows (approximately)
INSERT INTO `pengadaan` (`id`, `nomor`, `nomor_pengadaan`, `tanggal`, `oleh`, `organisasi`, `kepala`, `perihal`, `nominal`, `status`, `persetujuan`, `created_at`, `updated_at`) VALUES
	('9e0dde5d-7713-4eb7-b174-ebc91db2590c', '1', 'SP/1/PDE/01/2025', '2025-01-25', 1, '9e06eba8-b714-46e1-ab09-0c6dc26eaece', 14, 'Pengadaan Unit Komputer', '2500000', 1, 1, '2025-01-25 16:53:44', '2025-01-26 04:13:30');

-- Dumping structure for table keuangan-logistik.pengadaan_detil
CREATE TABLE IF NOT EXISTS `pengadaan_detil` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pengadaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` smallint NOT NULL,
  `serah_terima` smallint NOT NULL DEFAULT '0',
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.pengadaan_detil: ~3 rows (approximately)
INSERT INTO `pengadaan_detil` (`id`, `id_pengadaan`, `nama_barang`, `merk`, `jumlah`, `serah_terima`, `harga`, `created_at`, `updated_at`) VALUES
	('9e0dde5d-7957-4c49-a78f-9b6ae7dbd044', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'Lenovo ThinkCentre', 'Lenovo', 3, 1, '1300000', '2025-01-25 16:53:44', '2025-01-25 16:53:44'),
	('9e0dde5d-7a26-4ad9-bb9b-2bc9be2e4ed8', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'MSI G22HZ', 'MSI', 1, 1, '900000', '2025-01-25 16:53:44', '2025-01-26 05:52:21'),
	('9e0dde5d-7ad6-4cd6-810f-ae23fdbc97a2', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', 'Fantech Go', 'Fantech', 1, 0, '300000', '2025-01-25 16:53:44', '2025-01-25 16:53:44');

-- Dumping structure for table keuangan-logistik.penolakan_permintaan
CREATE TABLE IF NOT EXISTS `penolakan_permintaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_permintaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oleh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.penolakan_permintaan: ~1 rows (approximately)
INSERT INTO `penolakan_permintaan` (`id`, `id_permintaan`, `oleh`, `keterangan`, `created_at`, `updated_at`) VALUES
	('9e0d12d4-c809-4d5e-8746-8064daa389b2', '9e0d1014-7e8b-483e-9982-51da8d18cd07', '2', 'Sudah ada stok', '2025-01-25 07:24:36', '2025-01-25 07:24:36');

-- Dumping structure for table keuangan-logistik.permintaan
CREATE TABLE IF NOT EXISTS `permintaan` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_permintaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `oleh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `organisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.permintaan: ~4 rows (approximately)
INSERT INTO `permintaan` (`id`, `nomor`, `nomor_permintaan`, `oleh`, `status`, `organisasi`, `tanggal`, `created_at`, `updated_at`) VALUES
	('9e0d1009-b8a4-4f45-b296-c9cb6c679d91', '1', 'SP/1/KASIR/01/2025', '17', '1', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2025-01-25', '2025-01-25 07:16:48', '2025-01-25 07:23:46'),
	('9e0d1014-7e8b-483e-9982-51da8d18cd07', '2', 'SP/2/KASIR/01/2025', '17', '99', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2025-01-25', '2025-01-25 07:16:55', '2025-01-25 07:24:36'),
	('9e0d136a-e000-43e2-b7d9-8f31ac5259f2', '3', 'SP/3/KASIR/01/2025', '17', '1', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2025-01-25', '2025-01-25 07:26:15', '2025-01-25 07:33:40'),
	('9e0d2bd2-8b20-49af-abc0-4327896422fe', '4', 'SP/4/KASIR/01/2025', '17', '1', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2025-01-25', '2025-01-25 08:34:29', '2025-01-25 12:13:16');

-- Dumping structure for table keuangan-logistik.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.permissions: ~136 rows (approximately)
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'view_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(2, 'view_any_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(3, 'create_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(4, 'update_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(5, 'restore_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(6, 'restore_any_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(7, 'replicate_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(8, 'reorder_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(9, 'delete_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(10, 'delete_any_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(11, 'force_delete_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(12, 'force_delete_any_barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(13, 'view_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(14, 'view_any_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(15, 'create_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(16, 'update_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(17, 'restore_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(18, 'restore_any_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(19, 'replicate_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(20, 'reorder_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(21, 'delete_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(22, 'delete_any_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(23, 'force_delete_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(24, 'force_delete_any_jenis::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(25, 'view_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(26, 'view_any_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(27, 'create_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(28, 'update_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(29, 'restore_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(30, 'restore_any_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(31, 'replicate_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(32, 'reorder_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(33, 'delete_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(34, 'delete_any_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(35, 'force_delete_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(36, 'force_delete_any_organisasi', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(37, 'view_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(38, 'view_any_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(39, 'create_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(40, 'update_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(41, 'restore_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(42, 'restore_any_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(43, 'replicate_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(44, 'reorder_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(45, 'delete_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(46, 'delete_any_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(47, 'force_delete_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(48, 'force_delete_any_permintaan', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(49, 'view_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(50, 'view_any_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(51, 'create_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(52, 'update_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(53, 'delete_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(54, 'delete_any_role', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(55, 'view_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(56, 'view_any_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(57, 'create_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(58, 'update_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(59, 'restore_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(60, 'restore_any_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(61, 'replicate_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(62, 'reorder_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(63, 'delete_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(64, 'delete_any_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(65, 'force_delete_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(66, 'force_delete_any_satuan::barang', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(67, 'view_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(68, 'view_any_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(69, 'create_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(70, 'update_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(71, 'restore_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(72, 'restore_any_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(73, 'replicate_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(74, 'reorder_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(75, 'delete_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(76, 'delete_any_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(77, 'force_delete_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(78, 'force_delete_any_user', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(79, 'view_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(80, 'view_any_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(81, 'create_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(82, 'update_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(83, 'restore_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(84, 'restore_any_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(85, 'replicate_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(86, 'reorder_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(87, 'delete_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(88, 'delete_any_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(89, 'force_delete_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(90, 'force_delete_any_stok', 'web', '2025-01-25 07:13:06', '2025-01-25 07:13:06'),
	(91, 'view_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(92, 'view_any_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(93, 'create_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(94, 'update_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(95, 'restore_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(96, 'restore_any_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(97, 'replicate_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(98, 'reorder_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(99, 'delete_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(100, 'delete_any_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(101, 'force_delete_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(102, 'force_delete_any_pembelian', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(103, 'view_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(104, 'view_any_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(105, 'create_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(106, 'update_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(107, 'restore_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(108, 'restore_any_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(109, 'replicate_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(110, 'reorder_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(111, 'delete_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(112, 'delete_any_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(113, 'force_delete_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(114, 'force_delete_any_suplier', 'web', '2025-01-25 13:44:22', '2025-01-25 13:44:22'),
	(115, 'view_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(116, 'view_any_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(117, 'create_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(118, 'update_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(119, 'restore_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(120, 'restore_any_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(121, 'replicate_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(122, 'reorder_pengadaan', 'web', '2025-01-25 17:05:19', '2025-01-25 17:05:19'),
	(123, 'delete_pengadaan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(124, 'delete_any_pengadaan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(125, 'force_delete_pengadaan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(126, 'force_delete_any_pengadaan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(127, 'view_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(128, 'view_any_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(129, 'create_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(130, 'update_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(131, 'restore_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(132, 'restore_any_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(133, 'replicate_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(134, 'reorder_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(135, 'delete_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(136, 'delete_any_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(137, 'force_delete_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32'),
	(138, 'force_delete_any_ruangan', 'web', '2025-01-26 00:43:32', '2025-01-26 00:43:32');

-- Dumping structure for table keuangan-logistik.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.roles: ~4 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'super_admin', 'web', '2025-01-25 03:12:35', '2025-01-25 03:12:35'),
	(2, 'Admin', 'web', '2025-01-25 03:19:07', '2025-01-25 03:19:07'),
	(3, 'Logistik', 'web', '2025-01-25 03:19:33', '2025-01-25 03:19:33'),
	(4, 'User', 'web', '2025-01-25 03:21:38', '2025-01-25 03:21:38'),
	(5, 'Manager', 'web', '2025-01-25 03:21:50', '2025-01-25 03:21:50');

-- Dumping structure for table keuangan-logistik.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.role_has_permissions: ~228 rows (approximately)
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1),
	(97, 1),
	(98, 1),
	(99, 1),
	(100, 1),
	(101, 1),
	(102, 1),
	(103, 1),
	(104, 1),
	(105, 1),
	(106, 1),
	(107, 1),
	(108, 1),
	(109, 1),
	(110, 1),
	(111, 1),
	(112, 1),
	(113, 1),
	(114, 1),
	(115, 1),
	(116, 1),
	(117, 1),
	(118, 1),
	(119, 1),
	(120, 1),
	(121, 1),
	(122, 1),
	(123, 1),
	(124, 1),
	(125, 1),
	(126, 1),
	(127, 1),
	(128, 1),
	(129, 1),
	(130, 1),
	(131, 1),
	(132, 1),
	(133, 1),
	(134, 1),
	(135, 1),
	(136, 1),
	(137, 1),
	(138, 1),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 2),
	(20, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(28, 2),
	(29, 2),
	(30, 2),
	(31, 2),
	(32, 2),
	(55, 2),
	(56, 2),
	(57, 2),
	(58, 2),
	(59, 2),
	(60, 2),
	(61, 2),
	(62, 2),
	(67, 2),
	(68, 2),
	(69, 2),
	(70, 2),
	(71, 2),
	(72, 2),
	(73, 2),
	(74, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(4, 3),
	(5, 3),
	(6, 3),
	(7, 3),
	(8, 3),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(17, 3),
	(18, 3),
	(19, 3),
	(20, 3),
	(37, 3),
	(38, 3),
	(39, 3),
	(40, 3),
	(41, 3),
	(42, 3),
	(43, 3),
	(44, 3),
	(55, 3),
	(56, 3),
	(57, 3),
	(58, 3),
	(59, 3),
	(60, 3),
	(61, 3),
	(62, 3),
	(79, 3),
	(80, 3),
	(81, 3),
	(82, 3),
	(83, 3),
	(84, 3),
	(85, 3),
	(86, 3),
	(91, 3),
	(92, 3),
	(93, 3),
	(94, 3),
	(95, 3),
	(96, 3),
	(97, 3),
	(98, 3),
	(103, 3),
	(104, 3),
	(105, 3),
	(106, 3),
	(107, 3),
	(108, 3),
	(109, 3),
	(110, 3),
	(115, 3),
	(116, 3),
	(117, 3),
	(118, 3),
	(119, 3),
	(120, 3),
	(121, 3),
	(122, 3),
	(37, 4),
	(38, 4),
	(39, 4),
	(40, 4),
	(41, 4),
	(42, 4),
	(43, 4),
	(44, 4),
	(79, 4),
	(80, 4),
	(115, 4),
	(116, 4),
	(117, 4),
	(118, 4),
	(119, 4),
	(120, 4),
	(121, 4),
	(122, 4);

-- Dumping structure for table keuangan-logistik.ruangan
CREATE TABLE IF NOT EXISTS `ruangan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepala_ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.ruangan: ~21 rows (approximately)
INSERT INTO `ruangan` (`id`, `nama_ruangan`, `kepala_ruangan`, `organisasi`, `created_at`, `updated_at`) VALUES
	('9e0dd110-833b-4c04-9ce4-6beb82d3b59d', 'Poli Umum', '5', '9e06effe-2bf9-4783-9a83-065ec974e139', '2025-01-25 16:16:32', '2025-01-25 16:18:52'),
	('9e0dd211-b5ad-4ba2-a4da-bab27f3a046f', 'Poli Spesialis Penyakit Dalam', '5', '9e06effe-2bf9-4783-9a83-065ec974e139', '2025-01-25 16:19:21', '2025-01-25 16:19:21'),
	('9e0dd22b-20dc-48a5-9d3c-2594c954e7ed', 'Poli Spesialis Bedah', '5', '9e06effe-2bf9-4783-9a83-065ec974e139', '2025-01-25 16:19:38', '2025-01-25 16:19:38'),
	('9e0dd257-6b88-4d47-9aec-2371f05db96d', 'Poli Spesialis Anak', '5', '9e06effe-2bf9-4783-9a83-065ec974e139', '2025-01-25 16:20:07', '2025-01-25 16:20:07'),
	('9e0dd269-f69a-44fc-80b3-9c4ed1dff9af', 'Poli Spesialis Kandungan', '5', '9e06effe-2bf9-4783-9a83-065ec974e139', '2025-01-25 16:20:19', '2025-01-25 16:20:19'),
	('9e0dd298-7bcc-4f0c-ab9b-49c4d00bf740', 'BIR ALI 1', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:20:49', '2025-01-25 16:20:49'),
	('9e0dd2ac-2a3f-4704-b28a-449dd2622a29', 'BIR ALI 2', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:21:02', '2025-01-25 16:21:02'),
	('9e0dd332-bad3-4d7d-aa91-2ee00a595b22', 'BIR ALI 3', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:22:30', '2025-01-25 16:22:30'),
	('9e0dd34a-5417-4731-bd03-60e8f36c66dc', 'BIR ALI 4', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:22:46', '2025-01-25 16:22:46'),
	('9e0dd355-8b3f-410f-9d15-8688d2d5bb18', 'BIR ALI 5', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:22:53', '2025-01-25 16:22:53'),
	('9e0dd362-df66-4499-b3eb-aefa1cf160ac', 'BIR ALI 6', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:02', '2025-01-25 16:23:02'),
	('9e0dd36d-654e-4a99-a39a-13431ee2513e', 'BIR ALI 7', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:09', '2025-01-25 16:23:09'),
	('9e0dd378-d81e-480b-a723-9db89dfbe389', 'BIR ALI 8', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:16', '2025-01-25 16:23:16'),
	('9e0dd396-cb07-4bc5-b69f-ab96462e08cf', 'BIR ALI 9', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:36', '2025-01-25 16:23:36'),
	('9e0dd3a0-d5c6-4371-aa03-334e60d910c9', 'SHOFA 1', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:42', '2025-01-25 16:23:42'),
	('9e0dd3a9-440d-4d60-a187-797a8d96c9ad', 'SHOFA 2', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:48', '2025-01-25 16:23:48'),
	('9e0dd3b6-dcd9-4b2a-9ae5-6e7ada159806', 'SHOFA 3', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:23:57', '2025-01-25 16:23:57'),
	('9e0dd3c0-66d2-455c-ae04-488885fa25e2', 'SHOFA 4', '7', '9e06efdb-8794-46b0-9204-0bde5d133e8e', '2025-01-25 16:24:03', '2025-01-25 16:24:03'),
	('9e0dd3d2-7292-4466-9205-c35a99b727a5', 'Laboratorium', '8', '9e06f0d6-8e41-4774-afce-07c850d84aed', '2025-01-25 16:24:15', '2025-01-25 16:24:15'),
	('9e0dd3e1-fda4-48cd-8a14-bef44503aba8', 'Radiologi', '10', '9e06f0fd-bdc3-4939-bcf1-995761b0f20d', '2025-01-25 16:24:25', '2025-01-25 16:24:25'),
	('9e0dd404-e0a6-4a39-a3dc-d67bc4bebb91', 'UGD', '4', '9e06f067-4749-44dd-af1f-2abc98aeb786', '2025-01-25 16:24:48', '2025-01-25 16:24:48');

-- Dumping structure for table keuangan-logistik.satuan_barang
CREATE TABLE IF NOT EXISTS `satuan_barang` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.satuan_barang: ~5 rows (approximately)
INSERT INTO `satuan_barang` (`id`, `satuan_barang`, `deskripsi`, `created_at`, `updated_at`) VALUES
	('9e04cdbf-3f4c-45ad-a0cf-f73da1f4cd9f', 'Pouch', NULL, '2025-01-20 21:44:49', '2025-01-20 21:44:49'),
	('9e04cdc4-9490-418f-bb46-f6d08b015549', 'Kg', NULL, '2025-01-20 21:44:52', '2025-01-20 21:44:52'),
	('9e04cdc9-0bbf-4d2a-981c-6832df554d7d', 'Pcs', NULL, '2025-01-20 21:44:55', '2025-01-20 21:44:55'),
	('9e04cdd0-3b41-4528-a999-93fe8895c733', 'Ons', NULL, '2025-01-20 21:45:00', '2025-01-20 21:45:00'),
	('9e04d959-f51f-476e-a6ee-ba08b92e5485', 'Pack', '-', '2025-01-20 22:17:16', '2025-01-20 22:17:16'),
	('9e0d0d4c-908d-41b8-a854-d73ad9699a4a', 'Rim', NULL, '2025-01-25 07:09:08', '2025-01-25 07:09:08');

-- Dumping structure for table keuangan-logistik.serah_terima_aset
CREATE TABLE IF NOT EXISTS `serah_terima_aset` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pengadaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_penerima` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.serah_terima_aset: ~2 rows (approximately)
INSERT INTO `serah_terima_aset` (`id`, `id_pengadaan`, `nama_penerima`, `tanggal_serah_terima`, `created_at`, `updated_at`) VALUES
	('9e0ef40a-b7ce-493d-b81d-7ff46e43776a', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', '1', '2025-01-26', '2025-01-26 05:50:10', '2025-01-26 05:50:10'),
	('9e0ef4d2-132f-4a86-96ec-790dcb002b2c', '9e0dde5d-7713-4eb7-b174-ebc91db2590c', '1', '2025-01-26', '2025-01-26 05:52:21', '2025-01-26 05:52:21');

-- Dumping structure for table keuangan-logistik.stok
CREATE TABLE IF NOT EXISTS `stok` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.stok: ~0 rows (approximately)
INSERT INTO `stok` (`id`, `barang`, `organisasi`, `stok`, `created_at`, `updated_at`) VALUES
	('9e0d0d23-da63-4fdd-b367-0abd981b2b32', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', 1, '2025-01-25 07:08:42', '2025-01-25 15:08:31'),
	('9e0d0d68-877e-4db4-94b9-999afe1d2bde', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', 3, '2025-01-25 07:09:27', '2025-01-25 15:07:10'),
	('9e0d0d88-8449-4901-8176-a49ff2a3b2f3', '9e0d0d88-8282-45cb-84f8-b680d58a24b8', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', 0, '2025-01-25 07:09:48', '2025-01-25 12:23:08'),
	('9e0d1287-a8ac-47a6-8741-d5e8128d30ce', '9e0d0d23-d869-44a3-8085-0d4dd308240c', '9e06f292-a14c-4319-b0c2-1ee06a9df638', 1, '2025-01-25 07:23:46', '2025-01-25 07:33:40'),
	('9e0d1287-a944-46b5-9ae2-4ec8a195b11f', '9e0d0d68-85b1-442c-bfaa-a90fa5329d89', '9e06f292-a14c-4319-b0c2-1ee06a9df638', 2, '2025-01-25 07:23:46', '2025-01-25 12:13:16');

-- Dumping structure for table keuangan-logistik.stok_opname
CREATE TABLE IF NOT EXISTS `stok_opname` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.stok_opname: ~2 rows (approximately)

-- Dumping structure for table keuangan-logistik.stok_opname_detil
CREATE TABLE IF NOT EXISTS `stok_opname_detil` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_stok_opname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_sebelumnya` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_sekarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.stok_opname_detil: ~0 rows (approximately)

-- Dumping structure for table keuangan-logistik.suplier
CREATE TABLE IF NOT EXISTS `suplier` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table keuangan-logistik.suplier: ~0 rows (approximately)
INSERT INTO `suplier` (`id`, `nama`, `alamat`, `nomor_telepon`, `created_at`, `updated_at`) VALUES
	('9e0d9bfa-c8b8-4593-8015-cd870b04a046', 'Indomaret', 'Jalan Gajah Mada No 11', '089765341234', '2025-01-25 13:48:06', '2025-01-25 13:48:06'),
	('9e0d9c6d-b83f-4b27-987b-4c28b9a50576', 'Toko Mak Bah', 'Jalan MH Thamrin No 11', '087467924823', '2025-01-25 13:49:22', '2025-01-25 13:49:22');

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
INSERT INTO `users` (`id`, `name`, `organisasi`, `nip`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Dimas Wisnu Wirawan', '9e06eba8-b714-46e1-ab09-0c6dc26eaece', '2023.01.12.162', '2024-02-03 04:09:49', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'SqrPyubRXuws14usog36Ufpy7dyjrSKkyE4XA9gWqQEJmaYTo2fDuibRVH6i', '2024-02-02 19:58:29', '2025-01-21 23:21:49'),
	(2, 'Ahmad David Al-Farizi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023', '2020.05.12.124', '2024-02-03 04:34:50', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'XVWT7ji1pbkXk258Un1e0ebQt6aMuDJXWxUvxNd9bQNe7mFirhmmZ54LIy06', '2024-02-02 21:34:59', '2025-01-21 23:27:46'),
	(3, 'Alif Helmi Afrissa', '9e06f1c7-3002-4026-a7dc-f72ad94b86d7', '2020.12.02.129', '2024-02-03 06:05:56', '$2y$12$2oolQorpzM15c6Tci1sT1.i4hZZw4PfXUtxVYmHe.uZvapMKh618G', 'ttOr2JpQ0eBN7lKMpHzsYfgsZ8DvzMgdsYmJJ5bdhulkYXAO6j2Ffra7PrtH', '2024-02-02 23:06:08', '2025-01-21 23:27:55'),
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
	(17, 'Ida Farida, S.E', '9e06f292-a14c-4319-b0c2-1ee06a9df638', '2003.09.09.018', '2024-02-01 03:42:12', '$2y$12$2VCjUwHNk02lo2EWwvdFPO41ANfhA/CTS7xzN/XvdzqZsZ1iDNE32', 'zG0iTYdBYKXYuJ7fUFGvXsRr94key7Fopz6dPaYKWDTeGrP3709gjFfG5d55', '2024-03-04 03:44:07', '2025-01-21 23:32:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
