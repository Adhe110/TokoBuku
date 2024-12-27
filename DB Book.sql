-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 02:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku`
--
CREATE DATABASE IF NOT EXISTS `buku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `buku`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(4) NOT NULL,
  `id_kategori` int(4) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `id_penerbit` int(4) NOT NULL,
  `id_penulis` int(4) NOT NULL,
  `tahun` int(4) NOT NULL,
  `isbn` int(20) NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(4) NOT NULL,
  `berat` tinytext NOT NULL,
  `halaman` int(4) NOT NULL,
  `sinopsis` varchar(100) NOT NULL,
  `tgl_post` date NOT NULL,
  `sampul` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(4) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(4) NOT NULL,
  `id_buku` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `harga` int(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_order` int(4) NOT NULL,
  `alamat` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `ongkir` int(20) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `metode_pembayaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(4) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `alamat_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id_penulis` int(4) NOT NULL,
  `nama_penulis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `provinsi` varchar(32) NOT NULL,
  `kota` varchar(32) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` int(15) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_penerbit` (`id_penerbit`),
  ADD KEY `id_penulis` (`id_penulis`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`),
  ADD CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id_penulis`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`);
--
-- Database: `contoh`
--
CREATE DATABASE IF NOT EXISTS `contoh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `contoh`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `NO_TELP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAMA`, `NO_TELP`) VALUES
(1, 'PAK DEDY', NULL),
(2, 'JANNA', NULL),
(3, 'FITRI', NULL),
(4, 'ANGELINE', NULL),
(5, 'EKA', NULL),
(6, 'PAK RUDY', NULL),
(7, 'CAHAYA', NULL),
(8, 'IKBAL', NULL),
(9, 'AYU', NULL),
(10, 'WIWI', NULL),
(11, 'GEBI', NULL),
(12, 'WANDI', NULL),
(13, 'LASINRANG', NULL),
(14, 'FAIDY', NULL),
(15, 'TRIFA', NULL),
(16, 'HAYANI', NULL),
(17, 'JEHAN', NULL),
(18, 'ASO', NULL),
(19, 'HAIKAL', NULL),
(20, 'SASA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(10) DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID`, `NAMA`, `JENIS_KELAMIN`, `SHIFT`) VALUES
(1, 'Veni', 'P', 'Pagi'),
(2, 'Vina', 'P', 'Malam'),
(3, 'Hera', 'P', 'Pagi');

-- --------------------------------------------------------

--
-- Table structure for table `list_layanan`
--

CREATE TABLE `list_layanan` (
  `ID` int(11) NOT NULL,
  `NAMA_LAYANAN` varchar(100) DEFAULT NULL,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `ESTIMASI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `list_layanan`
--

INSERT INTO `list_layanan` (`ID`, `NAMA_LAYANAN`, `HARGA`, `ESTIMASI`) VALUES
(1, 'Cuci Komplit / kg', 8000.00, 3),
(2, 'Cuci lipat / kg', 5000.00, 3),
(3, 'Express Komplit 1 Hari / kg', 12000.00, 1),
(4, 'Express Komplit 6 Jam / kg', 15000.00, 6),
(5, 'Express Komplit 3 Jam / kg', 18000.00, 3),
(6, 'Express Cuci Lipat 1 Hari / kg', 8000.00, 1),
(7, 'Express Cuci Lipat 6 Jam / kg', 10000.00, 6),
(8, 'Express Cuci Lipat 3 Jam / kg', 12000.00, 3),
(9, 'Seprei/Selimut No 1', 15000.00, 5),
(10, 'Seprei/Selimut No 2', 12000.00, 4),
(11, 'Seprei/Selimut No 3', 10000.00, 3),
(12, 'Bedcover No 1', 35000.00, 5),
(13, 'Bedcover No 2', 30000.00, 4),
(14, 'Bedcover No 3', 25000.00, 3),
(15, 'CUCICCCC', 100000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int(11) NOT NULL,
  `TANGGAL_MASUK` date DEFAULT NULL,
  `KARYAWAN_ID` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `LAYANAN` varchar(100) DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `TOTAL` decimal(10,2) DEFAULT NULL,
  `TANGGAL_KELUAR` date DEFAULT NULL,
  `METODE_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID`, `TANGGAL_MASUK`, `KARYAWAN_ID`, `CUSTOMER_ID`, `LAYANAN`, `JUMLAH`, `HARGA`, `TOTAL`, `TANGGAL_KELUAR`, `METODE_PEMBAYARAN`) VALUES
(1, '2024-04-01', 1, 1, 'Cuci Komplit / kg', 3, 8000.00, 24000.00, '2024-04-04', 'CASH'),
(2, '2024-04-01', 1, 2, 'Express Komplit 1 Hari / kg', 1, 12000.00, 12000.00, '2024-04-02', 'CASH'),
(3, '2024-04-02', 2, 2, 'Cuci lipat / kg', 3, 5000.00, 15000.00, '2024-04-05', 'CASH'),
(4, '2024-04-02', 2, 3, 'Cuci Komplit / kg', 4, 5000.00, 20000.00, '2024-04-05', 'CASH'),
(5, '2024-04-02', 2, 4, 'Sepre/Selimut No 2', 1, 12000.00, 12000.00, '2024-04-06', 'CASH'),
(6, '2024-04-02', 2, 4, 'Express Komplit 1 Hari / kg', 10, 10000.00, 100000.00, '2024-04-03', 'CASH'),
(7, '2024-04-03', 2, 4, 'Express Komplit 1 Hari / kg', 14, 10000.00, 140000.00, '2024-04-04', 'TRANSFER'),
(8, '2024-04-04', 2, 4, 'Express Komplit 1 Hari / kg', 19, 10000.00, 190000.00, '2024-04-05', 'TRANSFER'),
(9, '2024-04-04', 2, 4, 'Bedcover No 1', 1, 35000.00, 35000.00, '2024-04-09', 'CASH'),
(10, '2024-04-04', 1, 5, 'Sepre/Selimut No 1', 1, 15000.00, 15000.00, '2024-04-09', 'CASH'),
(11, '2024-04-08', 1, 6, 'Cuci Komplit / kg', 5, 5000.00, 25000.00, '2024-04-11', 'CASH'),
(12, '2024-04-08', 3, 7, 'Express Komplit 1 Hari / kg', 2, 10000.00, 20000.00, '2024-04-09', 'CASH'),
(13, '2024-04-12', 2, 8, 'Seprei/selimut no 3', 2, 10000.00, 20000.00, '2024-04-15', 'CASH'),
(14, '2024-04-13', 3, 9, 'Seprei/selimut no 2', 3, 12000.00, 36000.00, '2024-04-17', 'CASH'),
(16, '2024-04-14', 2, 11, 'Cuci lipat / kg', 5, 5000.00, 25000.00, '2024-04-17', 'CASH'),
(17, '2024-04-18', 1, 12, 'Cuci lipat / kg', 6, 5000.00, 30000.00, '2024-04-21', 'CASH'),
(18, '2024-04-19', 2, 13, 'Cuci Komplit / kg', 3, 8000.00, 24000.00, '2024-04-22', 'CASH'),
(19, '2024-04-19', 3, 14, 'Cuci Komplit / kg', 5, 8000.00, 40000.00, '2024-04-22', 'CASH'),
(20, '2024-04-19', 2, 15, 'Bedcover No 3', 3, 25000.00, 75000.00, '2024-04-22', 'CASH'),
(21, '2024-04-19', 2, 16, 'Cuci lipat / kg', 5, 5000.00, 25000.00, '2024-04-21', 'CASH'),
(22, '2024-04-19', 1, 17, 'Seprei/selimut no 2', 3, 12000.00, 36000.00, '2024-04-23', 'CASH'),
(23, '2024-04-20', 1, 17, 'Cuci Komplit / kg', 3, 8000.00, 24000.00, '2024-04-23', 'CASH'),
(24, '2024-04-20', 2, 18, 'Express Komplit 1 Hari / kg', 9, 12000.00, 108000.00, '2024-04-21', 'TRANSFER'),
(25, '2024-04-21', 1, 19, 'Cuci lipat / kg', 3, 5000.00, 15000.00, '2024-04-24', 'CASH'),
(26, '2024-04-21', 1, 20, 'Cuci lipat / kg', 4, 5000.00, 20000.00, '2024-04-24', 'CASH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `list_layanan`
--
ALTER TABLE `list_layanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `list_layanan`
--
ALTER TABLE `list_layanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Database: `crud`
--
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` decimal(8,2) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `sampul`, `judul_buku`, `penerbit`, `penulis`, `tahun`, `isbn`, `harga`, `stok`, `berat`, `halaman`, `sinopsis`, `created_at`, `updated_at`) VALUES
(1, 'pHuzMPh3OkN034X3zd4QvregRTLse5HeCsfviLAy.jpg', 'Conan', 'Aoyama', 'Aoyama Gosho', '2024', '2332323', 199000.00, 11111, 500.00, 1111, 'sdbasndbasdabdabdmnadbnmadnmabdabdmbbdmabdadabdabddaddbsadbaddnadbnabdnabddaadadmadjkajdandsndandamda,d', '2024-11-09 06:03:29', '2024-11-09 06:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_06_140529_create_bukus_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('iRBc4NEsITS0i2OHTuQ7N9FRj8X1U0IjKORPbwzc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3RCNjFVV3ZXU0ZGVnZsaFBjaWR6R2NkbXFtZzR1RnJBanZORENoeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9CdWt1LzEvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731161396);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `crud01`
--
CREATE DATABASE IF NOT EXISTS `crud01` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud01`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin123', 'admin123@gmail.com', '$2y$12$O.ZLUpYgq0x3QseAlcKyGOG8Z9DX/kpzQpHPbsIyagaUFncqhnuue', '2024-11-18 23:50:36', '2024-11-18 23:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` int(11) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `sampul`, `id_kategori`, `judul_buku`, `penerbit`, `penulis`, `tahun`, `isbn`, `harga`, `stok`, `berat`, `halaman`, `sinopsis`, `created_at`, `updated_at`) VALUES
(1, '0TRDB9ZF4ty9tEhOYHrYecpu2UL3WlfxUgmKbicl.jpg', 1, 'Koloni Si Unis 01', 'M&C', 'RINFAN / NARUCHACHA', '2020', '9786230300639', 80000.00, 99, 130, 144, 'Manusia itu memang menarik. Unis adalah kucing gembul yang sangat menyukai manusia. Si Unis sangat suka berkeliling komplek dan berinteraksi dengan berbagai macam manusia. Hal menarik apa yang akan Unis temui hari ini?', '2024-11-18 23:57:29', '2024-11-18 23:57:29'),
(2, '56cNcfLze6sUsPifENSdLobanPz1SMOcm8HHuQEl.jpg', 1, 'AKASHA : Oshi no Ko : Anak Idola 01', 'M & C!', 'Aka Akasaka', '2022', '9786230305269', 99000.00, 99, 150, 224, '\"Di dunia hiburan ini, kebohongan adalah senjata.\" Goro bekerja sebagai dokter spesialis kandungan di daerah. Dia menjalani hari-hari yang jauh dari dunia hiburan. Sementara itu idol \"Oshi\"-nya, Ai Hoshino mulai menaiki tangga ketenaran. Setelah keduanya berjumpa dalam situasi yang \"terburuk\", roda takdir pun mulai bergerak. Kakak beradik kembar Aqua dan Ruby masuk ke SMA yang memiliki jurusan seni hiburan. Di dorong rasa panic melihat teman-teman sekelasnya yang sudah berkiprah di dunia hiburan, Ruby pun memulai persiapan untuk berkarir sebagai idol! Sementara itu, Aqua tampil di reality show atas ajakan produser saat dia membintangi serial drama online. Apa sebenarnya “realita” dalam dunia hiburan!? Untuk mendongkrak karir idolnya ia pun tidak serta merta bisa meraihnya dengan mudah. Ai harus bekerja keras setiap saat, di tengah terpaan kritikan dari warganet dan netizen. Awal karirnya meroket di saat anaknya menyaksikan pertunjukan panggung yang ia lakukan, dia memberikan senyum yang tulus, yang membuat orang-orang menyukai hal itu. Komik dengan cerita yang ringan, cocok untuk kalian yang ingin bersantai sambil membaca komik!', '2024-11-19 00:29:02', '2024-11-19 00:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Komik', '2024-11-18 23:53:37', '2024-11-18 23:53:37'),
(2, 'Fiksi', '2024-11-18 23:53:47', '2024-11-18 23:53:47'),
(3, 'Non - Fiksi', '2024-11-18 23:53:58', '2024-11-18 23:53:58'),
(4, 'Horro, Misteri, Thriller', '2024-11-18 23:54:20', '2024-11-18 23:54:20');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_09_145004_create_kategoris_table', 1),
(5, '2024_11_09_145117_create_bukus_table', 1),
(6, '2024_11_14_132544_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('e4cQcgeFidR19hrsGAzy0deDk5y9mDYN2o1J7dGA', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWFc2WlBya2NkSzhVNVlMOGxlaFhZcnZRM3NOZUJRRTdKOGVMU2Y2dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYXltZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1732179802);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user12345@gmail.com', NULL, '$2y$12$3IiCa.aAvjwPxJFNC2yk5OJc/AIeYu/uCVvSa3.0xyazHSNBHs7He', NULL, '2024-11-18 23:52:08', '2024-11-18 23:52:08'),
(2, 'nurul', 'nurul12345@gmail.com', NULL, '$2y$12$JDFdE7fx.BnxrXBtJ6M9U.KtVloN2pkgewKvsUNtG2iRBsACBuFey', NULL, '2024-11-21 00:38:38', '2024-11-21 00:38:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`),
  ADD KEY `bukus_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;
--
-- Database: `crud1`
--
CREATE DATABASE IF NOT EXISTS `crud1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud1`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin12', 'admin12@gmaul.com', '$2y$12$Gpr45Gm0gkmdDGs/5K99f.wBLy.O0Ua0pQJaQL52sgxpOSxDuw8yu', '2024-11-15 07:54:09', '2024-11-15 07:54:09'),
(2, 'admin1122', 'admin1122@gmail.com', '$2y$12$Qm2XSw.LoGakUaCKP5wfa.ge8mbGlZD48SawHFhY7WXFUPCW/cEj6', '2024-11-21 15:25:28', '2024-11-21 15:25:28'),
(3, 'selasa', 'selasa@gmail.com', '$2y$12$IdN9Es4eG0ZgKjKtOdpn3ud7Fqq69B.sSQ1n0OyvJPX6cLow5HBzq', '2024-11-24 18:29:16', '2024-11-24 18:29:16'),
(4, 'cumar', 'kamis1122@gmail.com', '$2y$12$Wf4dk5sLu5WXWn4LMttYxeVbbbHCbtRP4FoBwFUTxdj27IyoUDq/m', '2024-11-24 18:59:41', '2024-11-24 18:59:41'),
(5, 'izza', 'izza12@gmail.com', '$2y$12$sWDX.jSQcxRSS8u7HNgXN.8Cle9FxBfFFefAqLw6enQZGjkKtou1i', '2024-11-25 22:01:49', '2024-11-25 22:01:49'),
(6, 'elsa', 'admin11@gmail.com', '$2y$12$BhneDnllXxJpwoO3tekgvOqhYbBawJVTPPErKU77XOsGnOoLkcgaG', '2024-11-26 18:44:18', '2024-11-26 18:44:18'),
(7, 'JUMAR TAEK', 'jumar11@gmail.com', '$2y$12$ZXBdyjUI4b4m2BLf2vQ44uvLGBrM907V.mLOxjNXbMrZvO.eeIze.', '2024-11-27 19:19:43', '2024-11-27 19:19:43'),
(8, 'nurul', 'nurul12345@gmail.com', '$2y$12$MmBVq2Dcn9FLbRNwT0hM4upo8IfPd0xpLXGrZbOmtJyqfvTL3rPnm', '2024-11-28 02:46:00', '2024-11-28 02:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` int(11) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `sampul`, `id_kategori`, `judul_buku`, `penerbit`, `penulis`, `tahun`, `isbn`, `harga`, `stok`, `berat`, `halaman`, `sinopsis`, `created_at`, `updated_at`) VALUES
(9, 'KRLiWfqVK4qayIegn5oc2uBsXTHkK8fVyr15E32A.jpg', 4, 'Naruto 1', 'MnC', 'Masashi Kishimoto', '2021', '98342746324', 99000.00, 99, 200, 120, 'Naruto adalah zumar', '2024-11-24 18:32:06', '2024-11-24 18:32:06'),
(10, 'aw9O1DuPrHWiX2mLaLCkj9z32TB9eZHymVMJbj4g.jpg', 4, 'jumar', 'jumar', 'jumar', '2020', '72937473287', 200000.00, 99, 24, 123, 'jumar adalah orang bima yang pembhng', '2024-11-25 22:04:38', '2024-11-25 22:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `total_harga` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkouts`
--

INSERT INTO `checkouts` (`id`, `user_id`, `nama_penerima`, `alamat`, `metode_pembayaran`, `status`, `bukti_bayar`, `total_harga`, `created_at`, `updated_at`) VALUES
(6, 8, 'Zumar', 'Jl Muhajirin , Pondok Safari', 'transfer', 'cancelled', 'bukti_bayar/QkpgOPJTRgiyhfg5SYdpYI46Fqd5ZdQtiKlgD2rZ.jpg', 99000.00, '2024-11-28 07:09:37', '2024-11-28 07:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_items`
--

CREATE TABLE `checkout_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkout_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(4, 'Komik', '2024-11-09 19:24:19', '2024-11-09 19:24:19'),
(6, 'Fiksi', '2024-11-10 19:18:10', '2024-11-10 19:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_buku` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keranjangs`
--

INSERT INTO `keranjangs` (`id`, `id_user`, `id_buku`, `jumlah`, `subtotal`, `created_at`, `updated_at`) VALUES
(17, 9, 10, 1, 200000.00, '2024-11-25 22:06:52', '2024-11-25 22:06:52'),
(18, 9, 9, 1, 99000.00, '2024-11-25 22:58:28', '2024-11-25 22:58:28'),
(23, 8, 9, 1, 198000.00, '2024-11-28 06:49:37', '2024-11-28 07:07:03');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_09_145004_create_kategoris_table', 1),
(5, '2024_11_09_145117_create_bukus_table', 1),
(6, '2024_11_14_132544_create_admins_table', 2),
(7, '2024_11_17_141433_create_carts_table', 3),
(8, '2024_11_17_141546_create_orders_table', 3),
(9, '2024_11_17_145420_create_cart_items_table', 3),
(10, '2024_11_25_054857_create_keranjangs_table', 4),
(11, '2024_11_26_113204_create_checkouts_table', 5),
(12, '2024_11_26_113218_create_checkout_items_table', 5),
(13, '2024_11_26_163649_add_bukti_bayar_to_checkouts_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bhsTBAaZ6qjbiTD6mynrJO1EodGmM8U7Pus4mXjY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVdjRFphN2lnaE5ZZncwVnllbmJhZlY4bDg3MEZ6UGNpd0NuSDQ5aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732838463),
('j44KUpHvDUMZXgTFKNt0YPwhEZURNiEklAspcxgQ', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiczdGV1ZDQ0lrTkcxVzdzeVNYRlBDRTR3RHp5RkRCUVJtVVpTQWVDOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi90cmFuc2Frc2kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7fQ==', 1732808086);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user12345@gmail.com', NULL, '$2y$12$MqkpwZogSW//FV6NgFVlceUAm9HHqpr5fg5rYZ9GKD1vAl2FZtWLW', NULL, '2024-11-10 02:45:23', '2024-11-10 02:45:23'),
(2, 'test123', 'test1234@gmail.com', NULL, '$2y$12$ICgzn886BXgUO3JrIXYmyOtalrNB6efdxyrYrEAslDN9J3mfIi4NS', NULL, '2024-11-21 09:49:07', '2024-11-21 09:49:07'),
(3, 'user2', 'user2@gmail.com', NULL, '$2y$12$WPf8kHRaQ7pBKIfnYPg0KOdinEBufvg/b3vNpNio0GCTBna90hBAS', NULL, '2024-11-21 15:23:24', '2024-11-21 15:23:24'),
(4, 'user2', 'user1122@gmail.com', NULL, '$2y$12$.OxZdYPVa3PByq/z9PZ5s.1edqd/lDDzI/xOmbA4Oe9OXeSiSFOs6', NULL, '2024-11-21 15:24:49', '2024-11-21 15:24:49'),
(5, 'senin', 'senin@gmail.com', NULL, '$2y$12$q4L0lmCYxHREOX9L4XRmSebMK7L8JMg5RwiVgKWWq7mhmshGCq4DO', NULL, '2024-11-24 17:48:13', '2024-11-24 17:48:13'),
(6, 'ade', 'rabu@gmail.com', NULL, '$2y$12$n4evUn.Vyy3ZSWYZg3fSkOBoDEbLWxGauj0uxke0yfq7vfrm.OEq6', NULL, '2024-11-24 18:55:28', '2024-11-24 18:55:28'),
(7, 'jumar', 'kamis@gmail.com', NULL, '$2y$12$AFFz/H19PzFSQbwmj7XOQeKGNHGek6r2ZE6xUORtHemK4/bPtt58y', NULL, '2024-11-24 18:57:14', '2024-11-24 18:57:14'),
(8, 'jumat', 'jumat@gmail.com', NULL, '$2y$12$vmklKvPf5T4UsAhUGDBb..N3S79cz.AcAv2/.1rLnnIeEKxlC6Rse', NULL, '2024-11-24 22:13:39', '2024-11-24 22:13:39'),
(9, 'izza', 'izza@gmail.com', NULL, '$2y$12$pRJTHLL0zfRf1MC1syYIj.5OC8Ify8kzQNpEc43TfStiT/dI5W/f2', NULL, '2024-11-25 21:20:34', '2024-11-25 21:20:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`),
  ADD KEY `bukus_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_buku_id_foreign` (`buku_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_order_id_foreign` (`order_id`),
  ADD KEY `cart_items_buku_id_foreign` (`buku_id`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `checkout_items`
--
ALTER TABLE `checkout_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_items_checkout_id_foreign` (`checkout_id`),
  ADD KEY `checkout_items_buku_id_foreign` (`buku_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjangs_id_user_foreign` (`id_user`),
  ADD KEY `keranjangs_id_buku_foreign` (`id_buku`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `checkout_items`
--
ALTER TABLE `checkout_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkout_items`
--
ALTER TABLE `checkout_items`
  ADD CONSTRAINT `checkout_items_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `checkout_items_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `checkouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_id_buku_foreign` FOREIGN KEY (`id_buku`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjangs_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `crud99`
--
CREATE DATABASE IF NOT EXISTS `crud99` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud99`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$12$0.9WDpCuEXkfoc1UiGmr4OjZP2475kiW0mWeloAuQx/5VGkVlq1Yq', '2024-11-28 16:05:51', '2024-11-28 16:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` int(11) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `sampul`, `id_kategori`, `judul_buku`, `penerbit`, `penulis`, `tahun`, `isbn`, `harga`, `stok`, `berat`, `halaman`, `sinopsis`, `created_at`, `updated_at`) VALUES
(1, 'MfjZt01QSV3HBpDriWHrZumHqLZfrIxqeeYksrRs.jpg', 3, 'One Piece Vol. 99', 'Elex Media komputindo', 'Eiichiro Oda', '2022', '9786230032332', 44000.00, 4, 300, 202, 'Luffy Si Topi Jerami. Berkat kawan-kawan yang mencegah pengejaran para petinggi, Luffy yang hendak ke atap, akhirnya tiba di hadapan Kaido! Pertarungan sengit para pemeran yang telah berkumpul di panggung besar, akan segera dimulai Pertempuran penentuan Onigashima semakin memanas!! Simak kisah petualangan di lautan, One Piece!!', '2024-11-28 16:32:06', '2024-11-28 17:42:25'),
(2, 'eSkG7iUrpcSpczsl03qifpeDc4dXaEOxgE4aOaQv.jpg', 3, 'Noblesse Volume One: A WEBTOON Unscrolled Graphic Novel', 'Wattpad WEBTOON Book Group', 'Jeho Son', '2023', '9781998854011', 80000.00, 28, 454, 288, 'Ketika Cadis Etrama Di Raizel atau Rai, begitu ia dikenal, terbangun setelah 820 tahun, ia menemukan dunia modern yang sama sekali tidak ia pahami. Dulunya merupakan anggota Bangsawan yang sangat kuat, ras makhluk yang hampir abadi dan kuat, Rai memutuskan untuk memulai lagi sebagai siswa sekolah menengah di Sekolah Menengah Ye Ran, yang didirikan oleh mantan pelayannya Frankenstein, yang entah bagaimana masih hidup setelah berabad-abad. Tujuan Frankenstein—untuk membantu tuannya yang kuat dan seperti vampir mempelajari kehidupan dan budaya manusia sambil melindunginya dari kekuatan modern yang tidak dapat dipahami Rai.\r\nKehidupan baru Rai yang agak damai akan diganggu oleh The Union, sebuah organisasi rahasia yang tertarik menggunakan kekuatannya untuk memajukan tujuan jahat mereka sendiri.Ketika masa lalu berbenturan dengan masa kini dalam versi inovatif dari kiasan fantasi gelap yang sudah dikenal ini, Rai harus melakukan segala daya untuk memastikan Union tidak mengendalikan takdirnya, dan bahwa ia dapat terus mengintegrasikan dirinya ke dalam dunia modern yang baru dan membingungkan ini.', '2024-11-28 16:35:36', '2024-11-28 17:42:04'),
(3, 'CzZRF3J2r8S5qhiDwzS9QbaO6XUJKHaqmS6Rwjwb.jpg', 3, 'The Remarried Empress, Vol. 3', 'Ize Press', 'Alphatart', '2023', '9798400900341', 95000.00, 7, 300, 288, 'Rahasia dan rencana jahat beredar di sekitar istana...dan ketika orang-orang bermain api, seseorang pasti akan terbakar. Navier berusaha sekuat tenaga untuk mengendalikan api, tetapi ketika ramuan ajaib membuat Adipati Agung Kaufman terpesona, kesalahpahaman Sovieshu tentang kehidupan cintanya menjadi tidak terkendali! Sementara itu, Rashta hanya mengobarkan api--meskipun jika pengagum Duchess Tuania berhasil, wanita simpanan itu akan segera menghadapi konsekuensi dari rencana jahatnya. Dan gairah Heinrey yang membara untuk Navier mungkin harus dikesampingkan ketika berita tentang kesehatan saudaranya yang buruk mencapai Kekaisaran Timur. Akankah permaisuri dan pangeran dipisahkan sebelum mereka dapat disatukan...?', '2024-11-28 16:38:05', '2024-11-28 17:41:45'),
(4, 'rzzrqFZ5As5tCFqPElmXbhd3qMTVxnFD2IGcnakp.jpg', 3, 'Si Juki komik strip', 'Bukune', 'Si Juki komik strip', '2015', '9786022201397', 53000.00, 4, 150, 160, 'Juki, karakter komik yang mengaku antimainstream dan merasa ngetop, memulai karya dari \'bawah\'. Awalnya, dia hanya tampil sebagai cameo di komik-komik online karya Faza Meonk. Namun, karakternya yang lucu, ngeselin, cuek, dan banyak hoki itu membuat Juki semakin dikenal dan disukai pembacanya.\r\nDalam komik ini terangkum perjalanan si juki sang aktor komik. Mulai dari digambar asal-asalan dan tidak bernama, kritik kocak dan kritisnya pada sekitar, memenangkan penghargaan, sampai nekat mencalonkan diri menjadi presiden.', '2024-11-28 16:44:46', '2024-11-28 17:41:27'),
(5, '384Wsy0RtchMhPcEVp1nAilGOYIbJyCEXzeGnNBl.jpg', 3, 'Journal Of Terror: Kembar', 'm&c!', 'Sweta Kartika', '2019', '9786024805869', 99000.00, 9, 150, 336, 'Namaku Prana. Aku bisa melihat penghuni dunia seberang melalui mata saudara kembarku yang sudah mati. Tanpa pernah kuduga, kemampuan ini telah mengantarkanku ke depan gerbang petualangan menuju dunia kegelapan. Ini adalah catatan harianku. Kumpulan kisah-kisah berhantu yang ku rangkum dalam sebuah jurnal. Jurnal penuh misteri. Jurnal penuh teror.', '2024-11-28 16:48:35', '2024-11-28 17:41:09'),
(6, 'jMIrdIx0A6G8ddzvj0ul1Y6vT0rKM6gcHp2mFNiL.jpg', 4, 'Dongeng Lengkap Kancil', 'Laksana', 'Kak Thifa', '2020', '9786024077815', 98000.00, 7, 600, 124, 'Seekor hewan berwarna hijau merayap di atas daun hijau. Bentuknya seperti cecak besar dan berkaki empat. “Hewan apa itu, ya?” tanya Kancil yang sedang menuju sungai untuk minum.\r\nSepulang dari sungai, Kancil bertemu dengan hewan yang bentuknya sama dengan hewan hijau tadi, tapi warnanya berbeda. Kira-kira si Kancil bertemu hewan apa, ya? Kok hewannya bisa berubah warna?', '2024-11-28 16:54:24', '2024-11-28 17:40:44'),
(7, '5w3lzokknBh0VgTAn2VnnlivhsWC8DV4nNnlMnIZ.jpg', 4, '30 Cerita Teladan Islami', 'Noktah', 'Mahmudah Mastur', '2019', '9786025781599', 96000.00, 5, 400, 88, 'Mengenalkan kebaikan dan keteladanan ke anak-anak bisa melalui cerita-cerita. Dengan begitu, anak-anak akan bisa lebih mudah memahami sikap baik yang perlu ditiru dan sikap buruk yang perlu dijauhi.\r\nBuku ini memuat 30 kisah keteladanan yang beragam. Ada cerita tentang nenek yang suka menolong, cerita seorang budak yang sangat mencintai Al-Qur’an, seorang anak yang berbakti kepada orang tuanya, dan banyak cerita lainnya.\r\nBuku ini dilengkapi beberapa surat pendek yang bisa dihafal oleh anak-anak. Sambil membaca cerita, anak-anak bisa menghafal surat-surat pendek.\r\nYuk, ajak teman-temanmu membaca buku kumpulan cerita teladan Islami ini, ya!', '2024-11-28 16:57:24', '2024-11-28 17:40:28'),
(8, 'YsD0HmUnxMVc7JRjdCs3H248qxHBnDHgRBXv0zhD.jpg', 4, 'Dongeng Klasik 4 Musim Negeri Sakura, The Best Collection Of Japanese Folktales', 'Andi Publisher', 'Endah Sulistyowati', '2017', '9789792960136', 94000.00, 3, 650, 280, 'Jepang mengalami empat musim dalam setahun, yaitu musim dingin, musim semi, musim panas dan musim gugur, setiap musim memiliki dan tantangan yang berbeda-beda. Dalam kehidupan masyarakat Jepang. Terdapat cerita rakyat yang menggambarkan peristiwa berkaitan dengan musim-musim tersebut. Semua cerita rakyat atau dongeng terus menerus diturunkan dari generasi ke generasi, naik lisan maupun tulisan, hingga sekarang. Setiap musim memiliki ciri tersendiri dengan adat istiadat masyarakat yang juga berbeda.\r\nCerita rakyat Jepang dalam buku ini merupakan karya-karya unggulan atau masterpiece dari berbagai sastra klasik Jepang yang sudah sangat terkenal dalam kehidupan masyarakatnya. Naskah-naskah klasik yang memuat cerita-cerita rakyat tersebut diantaranya adalah Kojiki, Otogizoushi, Konjaku Monagatarishuu, dan Nihon Shoki.', '2024-11-28 17:00:50', '2024-11-28 17:40:10'),
(9, 'fHA6slHGGfWvczc0F50pYmZ6NQNpRX7N9BGGjwOz.jpg', 4, '20 Kisah Dahsyat dari Negeri Padang Pasir', 'Andi Publisher', 'Redy Kuswanto; Nurwahiddatur Rohman', '2020', '9786237230854', 92000.00, 1, 500, 82, 'Buku ini berisi adalah dongeng untuk anak-anak usia TK hingga SD. Cerita-cerita di dalamnya diangkat dari dongeng timur tengah yang diceritakan kembali dari sudut pandang yang berbeda. Judul cerita di dalamnya antara lain sebagai berikut: Abu Nawas Ingin Terbang; Ahmed Jadi Peramal; Ali Baba dan Penyamun; Basira Bertemu Orang Suci; Gadis dalam Melon; Jera Seorang Pemburu; Keledai Iri Hati; Nasruddin dan Keledai Kesayangannya; Pangeran Ikan; Pengembala dan Serigala; Pengemis Yang Jujur; Petualangan Sinbad; Qarun, si Sombong; Raja Bermurah Hati; Rumah Yang Sempit; Saad, si Semut Hemat; Si Putra Bungsu; Tawa Khalifah Harun Al-Rasyid; Tikus Kecil Membalas Budi; dan Unta dan Lalat. Dengan penuturan bahasa yang sederhana, diharapkan dapat lebih diterima oleh anak-anak. Setiap cerita dilengkapi dengan ilustrasi. Hal ini akan membuat si anak betah membacanya. Namun begitu, pendampingan dari orangtua sangat disarankan. Seperti kita tahu, selain mengajarkan nilai moral dan meningkatkan imajinasi, dongeng juga berfungsi sebagai perekat hubungan antara anak dan orangtua.', '2024-11-28 17:04:02', '2024-11-28 17:39:55'),
(10, 'LL1qAXj6oUslnFT0lDhhcfde4wGg8A0bJDXOjeVW.jpg', 4, 'Akibat Perbuatan Edo dan Teman-teman', 'Pustaka Anak', 'Siti Munfarijah, M.Pd.', '2018', '9786025180606', 90000.00, 1, 300, 38, 'Dalam menjalani kehidupan kita tentu pernah berbuat kesalahan yang kadang kita sengaja maupun tidak disengaja. Dalam buku ini mengisahkan tentang Perbuatan Edo dan teman-temannya baik disengaja maupun tidak sengaja, yang berakibat tidak baik dan membuat Edo dan teman-temannya menyesal dan merasa tidak nyaman akibat perbuatannya sendiri. Dengan mengetahui kesalahannya, Edo dan teman-temannya berjanji untuk tidak mengulangi lagi.\r\nCerita “AKIBAT PERBUATAN EDO DAN TEMAN-TEMAN” menyadarkan kita betapa hal-hal yang kita anggap remeh, akan berakibat besar pada diri kita. Untuk itu belajarlah dari kegagalan. Karena kegagalan adalah kesuksesan yang tertunda.', '2024-11-28 17:06:43', '2024-11-28 17:39:31'),
(11, 'pDQkk8bjTkYBRwTIgHoccmgpGAs5Uigi1U43WbuF.jpg', 2, 'Biografi Sukarno Lengkap Negarawan Sejati', 'C-Klik Media', 'Anom WicaksaWhani na', '2018', '9786025448942', 68000.00, 8, 40, 399, 'Buku ini merangkum perjalanan hidup Sukarno mulai sejak masih kecil hingga wafat dan berupaya menetapkan Sukarno sebagai manusia yang lengkap. Selain itu, buku ini ditulis dengan bahasa yang mudah dipahami dan cara cerita yang menarik. Dramatisasinya membuat pembaca terbawa untuk menyelami kehidupan Sukarno yang berliku-liku. Untuk para warga negara Indonesia, mulai dari generasi muda hingga generasi veteran pasti sudah tidak asing lagi dengan Ir. Soekarno, Pahlawan Nasional Indonesia yang merupakan presiden pertama Republik Indonesia. Perjuangan dan jasanya untuk bangsa Indonesia tidak terhitung jumlah, bahkan kehebatannya tidak hanya terkenal di dalam negeri, namun terkenal sampai kancah internasional. Buku ini berisikan rangkuman perjalanan hidup dari sang presiden pertama Republik Indonesia, yang juga adalah pahlawan yang berperan penting dalam kemerdekaan Indonesia. Buku yang satu ini dapat menjadi salah satu media untuk kamu mengenal lebih jauh mengenai Ir. Soekarno. Buku-buku ini berisi kisah-kisah inspiratif yang menjadi jejak keteladanan dari sang presiden pertama NKRI yang dapat kamu simak, bahkan kamu jadikan teladan dalam kehidupan sehari-hari kamu. Dengan bahasa yang ringan dan mudah dipahami, tentunya tidak akan membuat kamu bosan membaca kisah perjalanan hidup Ir. Soekarno ini. Gaya bercerita yang dibumbui dengan dramatisasi, dapat membuat kamu terbawa suasana dan menyelam kehidupan dari presiden pertama Indonesia yang berliku-liku.', '2024-11-28 17:18:45', '2024-11-28 17:39:11'),
(12, 'LcZy9e74Dp1DqsjYCeE30XpS8pA4rRqk66qFilHA.jpg', 2, 'Tan Malaka : Biografi Singkat 1897 - 1949', 'Garasi', 'Taufik Adi Susilo', '2020', '9786237219552', 60000.00, 3, 165, 184, 'Tan Malaka adalah teladan tokoh revolusi militan, radikal, dan revolusioner. Namun sayang, nama dan perannya dalam kemerdekaan indonesia sengaja dikaburkan dan dihilangkan oleh rezim Orde Baru dari catatan sejarah dan album pahlawan nasional. Sementara itu, segudang ide dan pemikirannya yang bernas telah berperan besar dalam mengantarkan bangsa ini menutup lembaran demi lembaran sejarah penjajahan. Dia telah menjadi korban pemalsuan sejarah. Lewat buku ini, penulis mencoba menyingkap secara gamblang dan komprehensif mengenai kehidupan Tan Malaka tentang posisi pentingnya dalam perjuangan kemerdekaan. Lalu, tentang ide-ide briliannya yang radikal, orisinal, dan revolusioner yang telah mengawal langkah juang para pahlawan kemerdekaan. Selain itu, akan Visingkap pula tentang pahit getir kehidupan yang dilaluinya, berikut kisah cintanya yang tulus dan sepi pamrih kepada bumi pertiwi. Buku ini merupakan catatan singkat jejak pahlawan kemerdekaan, sang revolusioner yang dilupakan,Tan Malaka.', '2024-11-28 17:21:40', '2024-11-28 17:38:55'),
(13, 'kodsELBBIXH8KYy4yBs2LfVzlui5EyXEwaD5iTbP.jpg', 2, 'Soe Hok Gie : Biografi Singkat 1942-1969', 'Garasi', 'MUHAMMAD RIFAI', '2020', '9786237219545', 70000.00, 5, 195, 236, 'Soe Hok Gie datang dari sebuah rumah di Kebon Jeruk untuk menjadi seorang pahlawan. Jiwa \"pemberontak\" diwarisi dari ayahnya, seorang peranakan Cina yang memilih menjadi penulis dan jurnalis. Pada umur 17 tahun, dia sudah pandai menggugat pemerintah yang dianggapnya lalai memenuhi amanat rakyat. Keberanian jiwanya tak terbendung setelah menyandang status mahasiswa. Di sinilah Soe Hok Gie mencetak sejarah menjadi simbol penggerak perjuangan melawan ketidakadilan. bahkan, namanya menjadi simbol pergerakan kaum muda dalam menentang kekuasaan yang korup. Dialah sosok yang selalu gelisah melihat realitas kehidupan yang membuatnya menggugat keberadaan diri sendiri dan lingkungannya. Namun, takdir yang memaksanya mati muda tidak lantas mendiskreditkan peran Soe Hok gie dalam sejarah perjuangan bangsa. Justru, hidup yang singkat membantunya menjaga konsistensi perjuangan. Takdir boleh jadi lebih mengasihaninya dibanding siapapun. Takdir tidak pernah mengizinkan Soe Hok Gie menjilat ludah sendiri dan mengangkangi perjuangan seperti yang kebanyakan dilakukan teman-teman seperjuangannya yang duduk dalam lingkaran kekuasaan. Melalui Soe Hok Gie: Biografi Sang Demonstran 1942-1969 ini, Anda tidak hanya dapat memahami sosok Soe Hok Gie beserta pemikiran dan pandangan hidupnya, tetapi juga bagaimana pandangan tokoh-tokoh lain seputar dirinya.', '2024-11-28 17:24:17', '2024-11-28 17:38:40'),
(14, 'latcxCN7CAQyPCJIdZHm0k6avo8Wj623EIq2T4zf.jpg', 2, 'Biografi A.R. Baswedan, Membangun Bangsa, Merajut', 'Kompas Penerbit Buku', 'Suratmin dan Didi Kwartanada', '2018', '9786024125332', 79000.00, 5, 356, 354, 'Semarang, 1 Agustus 1934. Surat kabar golongan peranakan Tionghoa Mata Hari memuat foto yang menggemparkan, seorang pemuda keturunan Arab yang mengenakan beskap dan belangkon! Si pemuda menyerukan kepada kaum nya agar bersatu membantu perjuangan bangsa Indonesia. ”Di mana seseorang dilahirkan, di situlah tanah airnya,” tegasnya. Siapakah dia? Anak muda itu adalah Abdul Rahman (A.R.) Baswedan, seorang wartawan, politikus, pejuang, dan orang Indonesia sejati (1908-1986). Tak ada alasan untuk tak mengapresiasi Baswedan dan perjuangannya. Ia bahkan layak disebut sebagai salah seorang bapak bangsa (founding father) Republik Indonesia karena keikutsertaannya dalam Badan Penyelidik Usaha-usaha Kemerdekaan Indonesia (BPUPKI), serta pernah menjadi Menteri Muda Penerangan. Di kalangan internal, Baswedan telah berjuang menyatukan komunitas Arab agar mereka menjadi bagian integral dari bangsa Indonesia. Melalui Partai Arab Indonesia (1934-1942), ia tegaskan Indonesia adalah ibu pertiwi keturunan Arab. Baswedan juga ikut berjuang melalui jalur pers bersama rekan-rekan Tionghoa, termasuk Liem Koen Hian (pendiri Partai Tionghoa Indonesia) untuk memperjuangkan kemerdekaan Indonesia atas dasar persatuan dan keberagaman. Di ranah diplomasi, ia pun pernah mempertaruhkan nyawanya dalam proses pengakuan diplomatik yang pertama bagi Republik Indonesia, yakni dari Kerajaan Mesir, 1947. Inilah biografi yang membawa pesan: mencintai Tanah Air dan bangsa dengan sepenuh hati adalah prioritas pertama bagi seorang anak bangsa sejati.', '2024-11-28 17:27:14', '2024-11-28 17:38:24'),
(15, 'fB1T4BdtfIda3St9ZUEpkGNiFcHPNromnWVRtwbd.jpg', 2, 'K.H. Ahmad Dahlan : Biografi Singkat 1868-1923', 'Garasi', 'ADI NUGROHO', '2020', '9786237219644', 50000.00, 7, 13, 152, '“Jangan kamu anggap urusan kecil, Muhammadiyah adalah besar…”, inilah salah satu pernyataan K.H. Ahmad Dahlan, yang tertulis dalam buku Biografi Singkat (1869-1923) K.H. Ahmad Dahlan. Dalam buku ini, Adi Nugraha ingin menceritakan sosok K.H. Ahmad Dahlan sebagai pendiri Muhammadiyah. Yang ketika itu umat Islam dan ajaran Islam sedang dilanda krisis kepercayaan. Seperti ungkap K.H. Ahmad Dahlan dalam buku ini, “tidak mungkin Islam lenyap dari seluruh dunia, tapi tidak mustahil Islam hapus dari bumi Indonesia. Siapakah yang bertanggungjawab?” K.H. Ahmad Dahlan adalah anak keempat dari tujuh bersaudara, putra dari K.H. Abu Bakar bin Kiai Sulaiman dan Siti Aminah binti almarhum K.H. Ibrahim. Ayahnya seorang khatib tetap Masjid Agung Yogyakarta. Sedangkan adalah putri dari Penghulu Besar di Yogyakarta. K.H. Ahmad Dahlan lahir di Kauman, Yogyakarta, tahun 1869. Sebelum ia mendapat gelar dan nama K.H. Ahmad Dahlan, nama yang diberikan orang tuanya adalah Muhammad Darwis. Nama K.H. Ahmad Dahlan, ia peroleh dari para Kiai setelah ia selesai menunaikan ibadah haji. Peran gerakan organisasi sosial-keagamaan Muhammadiyah dalam perjalanan sejarah bangsa Indonesia memang tidak bisa dikatakan tidak penting. Melalui tridimensi gerakannya - keislaman, dakwah, dan pembaruan--yang masyhur itu, Muhammadiyah terbukti mampu menyentuh semua bidang kehidupan. Namun demikian, tak lengkap kiranya jika membicarakan Muhammadiyah tanpa menyebutkan kontribusi yang telah dilakukan pendirinya, KH. Ahmad Dahlan, dalam mengawal keberlangsungan dan keberhasilan Muhammadiyah di pentas sejarah keindonesiaan.', '2024-11-28 17:29:40', '2024-11-28 17:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `total_harga` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_items`
--

CREATE TABLE `checkout_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkout_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Fiksi', '2024-11-28 16:16:14', '2024-11-28 16:16:14'),
(2, 'Non-Fiksi', '2024-11-28 16:16:30', '2024-11-28 16:16:30'),
(3, 'Komik', '2024-11-28 16:16:44', '2024-11-28 16:16:44'),
(4, 'Buku Anak', '2024-11-28 16:16:59', '2024-11-28 16:16:59'),
(5, 'Lifestyle', '2024-11-28 16:17:42', '2024-11-28 16:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `keranjangs`
--

CREATE TABLE `keranjangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_buku` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_09_145004_create_kategoris_table', 1),
(5, '2024_11_09_145117_create_bukus_table', 1),
(6, '2024_11_14_132544_create_admins_table', 1),
(7, '2024_11_25_054857_create_keranjangs_table', 2),
(8, '2024_11_26_113204_create_checkouts_table', 2),
(9, '2024_11_26_113218_create_checkout_items_table', 2),
(10, '2024_11_26_163649_add_bukti_bayar_to_checkouts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jfETVpNp3qSgkHjpqtaNM0R5rWeQeM64YxG410iR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicHlUbUt2UmhWSmVVcHhFR1pybXNQZ2MwalZjVHlTZGgyeHN0Vm1QRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9CdWt1P3BhZ2U9MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1732844557);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user1@gmail.com', NULL, '$2y$12$byNCvbgQvTheTpC/OByHkOzQJrxztDe4MLtwKx91T63As8x0YyyRe', NULL, '2024-11-28 16:03:17', '2024-11-28 16:03:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`),
  ADD KEY `bukus_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `checkout_items`
--
ALTER TABLE `checkout_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_items_checkout_id_foreign` (`checkout_id`),
  ADD KEY `checkout_items_buku_id_foreign` (`buku_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjangs_id_user_foreign` (`id_user`),
  ADD KEY `keranjangs_id_buku_foreign` (`id_buku`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkout_items`
--
ALTER TABLE `checkout_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keranjangs`
--
ALTER TABLE `keranjangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkout_items`
--
ALTER TABLE `checkout_items`
  ADD CONSTRAINT `checkout_items_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `checkout_items_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `checkouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keranjangs`
--
ALTER TABLE `keranjangs`
  ADD CONSTRAINT `keranjangs_id_buku_foreign` FOREIGN KEY (`id_buku`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjangs_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `crud123`
--
CREATE DATABASE IF NOT EXISTS `crud123` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud123`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'admin123@gmail.com', '$2y$12$f.D40mdfitrAgjOw2gSeOOhAMYGVg3m2zMDuPetAlgFfZR3oPeJAG', '2024-11-14 22:03:13', '2024-11-14 22:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` int(11) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_09_145004_create_kategoris_table', 1),
(5, '2024_11_09_145117_create_bukus_table', 1),
(6, '2024_11_14_132544_create_admins_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oc9ZiiksMXvV6KRyYrYAUy7kmN3GFWdugNq0tR15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaE5OMjBBdWx1MFBhUkVYRXo4OHIwNXVkajBTSUtZd3AzcUk5aTdSaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rYXRlZ29yaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9CdWt1Ijt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1731685734);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2024-11-12 23:02:06', '$2y$12$/AvhwQZpa7OdifwMhqefC.B5K5RKyReokOMhGEWCOkZ/6IP57rVGu', '4RT4Dezx6q', '2024-11-12 23:02:07', '2024-11-12 23:02:07'),
(2, 'Dr. Hugh Little II', 'dessie06@example.net', '2024-11-12 23:09:53', '$2y$12$/UWuQ4M50ASlR6l9062vhO4iTMhKebLw.YhhYXWeNmYwKQd3qPMWO', 'ihY1gIjdxJ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(3, 'Lilly Haley Jr.', 'hansen.mafalda@example.com', '2024-11-12 23:09:53', '$2y$12$1pWIdA2l8XzCrehrj3pHnuDJXTtnOgbNt/eas.4DEyvkF9wSLnQBO', '9Bfk4X1Ryk', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(4, 'Dr. Frederik Gutmann PhD', 'adams.rex@example.net', '2024-11-12 23:09:53', '$2y$12$GbpAih2HGdcg3imthtCccut9Bbq7DWbdMgDygTyo8eDWaeReAVCAm', 'tOe55UCZJ0', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(5, 'Mr. Akeem Schmitt Sr.', 'kailee.witting@example.org', '2024-11-12 23:09:54', '$2y$12$kYjoxy/aXOz9x1OuXQPdMOsUfAPSi0ljpG.kajXmQ2WjyJdQGH3Fi', 'rbRBJonHZi', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(6, 'Nestor Koss', 'pkunde@example.net', '2024-11-12 23:09:54', '$2y$12$CUJcdKzwRq39t9uEfhMZTOip.JRX5UHRoCL6BBwutT91Rr0igxvXe', 'G1MuPC44mY', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(7, 'Rashad Koelpin', 'fkertzmann@example.net', '2024-11-12 23:09:54', '$2y$12$Npwt49f6ZgsQj.Xkx8f0vuZaMFLYYEphFrk39p6q5S9VcgW8uzBxW', 'ptF0nEmVzJ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(8, 'Mariah Wunsch DDS', 'dhudson@example.org', '2024-11-12 23:09:55', '$2y$12$dLDZhPtfsuTnfrro4TBBd.O6cJnI1YZQLsWLeKOOX/.T6SSBtCfQu', '45zXfXKrgZ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(9, 'Wendy Johnson DVM', 'qborer@example.com', '2024-11-12 23:09:55', '$2y$12$KgBHmjwj26u1RLpgniZH7uKmySwRb5L41BUxx6ZNISVYb/W4RlMoe', 'iOu2Xx8epG', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(10, 'Mrs. Audra Stracke MD', 'durgan.lonie@example.com', '2024-11-12 23:09:55', '$2y$12$XrWOuIB2xcSllt7lFJJhp.27ZycXtDwHxwEr6Srp7KFRHkB47GHaK', '9KaoRnU8sB', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(11, 'Misty Rippin', 'marta39@example.org', '2024-11-12 23:09:56', '$2y$12$NbIFc7WdZrnhG7eZ5wWMxeQqiwFtsYISaPX4Le5iWup2u/AzmZrzS', 'oRKqxSwvf8', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(12, 'Dillon Balistreri', 'ernesto.howell@example.org', '2024-11-12 23:09:56', '$2y$12$QWxAs2qQZ3bR3Vy8p60db.EjPQoESWYC2qYrB.HAe0wleFa.K.7F.', 'rvXDSOArwf', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(13, 'Dr. Sylvester Paucek V', 'nienow.cheyanne@example.net', '2024-11-12 23:09:56', '$2y$12$XUnDg1Scj2gLlx9TGqgmw.DDCLdZMy8XlhjCB7wQFnuA14VGUmVA6', 'hQ5vXB0Unf', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(14, 'Miss Macy Watsica V', 'pierce.legros@example.com', '2024-11-12 23:09:57', '$2y$12$6IXt40oJl0EZ/5.z8m69Nemr5xG5exSYSN8XcNtVvlLz0I.sb78X2', 'lvBp4tpFCl', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(15, 'Prof. Major Swift', 'raynor.colby@example.com', '2024-11-12 23:09:57', '$2y$12$Gm2hxSu8BYTn4lWPbK.Di.xaU0eD5r3xijufrQqfetDY3weQ0fh7a', 'pQs08Hat6P', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(16, 'Darwin Bernier IV', 'zgibson@example.com', '2024-11-12 23:09:57', '$2y$12$HFJpqTsnvgwaOkQhgThWi.wTMVcPZ.19o.chFlVpb34e2/tukEZRC', '2BLODAYwP4', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(17, 'Candido Orn', 'beatrice80@example.com', '2024-11-12 23:09:58', '$2y$12$7uEMTVUhUwdpaIlIkiLln.Tj4nsmkk8bn1TbQMS7YABG/v1AGrqRK', 'jEl0UQeyFR', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(18, 'Eliane Bosco', 'marie94@example.com', '2024-11-12 23:09:58', '$2y$12$nOLYrlQyBnPj/WMMKKJkaeR.cplu41tQyDlnPb/3puKdYiCHBnD/y', 'WK9b6fK01Y', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(19, 'Dr. Estell Greenholt PhD', 'carole49@example.net', '2024-11-12 23:09:58', '$2y$12$qAEW/kkSnWxJXiQghulc4.a33Vfblk.KkZ.FbpOHaox76UmzSyut2', 'yQR8qrESOQ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(20, 'Ines Tromp', 'klocko.ramiro@example.org', '2024-11-12 23:09:59', '$2y$12$5jbawRrSo0inNBBmcMXJ8.9PEx8Z8XykzVX/lWlZe1X1YNDrbMQeG', 'KtL6EP3kQ9', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(21, 'Rico Gorczany DVM', 'kayla.murphy@example.org', '2024-11-12 23:09:59', '$2y$12$A3FEjuhmrnPYjqeKIM21UOyP3iXhaT/oUIns89suP5rqSPFbyOkim', '6yEGBGgD9P', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(22, 'Golden Crist', 'howell.colleen@example.net', '2024-11-12 23:10:00', '$2y$12$C9ipvZm6KHRIGv62c2tcSuUdbqYHXGRKfyVoVAh1Dntha0WQx80FC', 'xpLd4678bA', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(23, 'Prof. Cora McDermott V', 'corene.west@example.com', '2024-11-12 23:10:00', '$2y$12$td9reOzk1NT.pHYnpoOWIesYEhY.Ab3HtFPOC2XdJv5GFnli8GHtG', 'Icv3XYK7l3', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(24, 'Gage Marquardt', 'rath.zander@example.net', '2024-11-12 23:10:00', '$2y$12$HjWhdHZiMQDmO1c5Tgcba.vvr.49/oE8ciN4acI9xQH1CWFeCNNLm', 'U2atWwIz12', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(25, 'Kevin Wolff PhD', 'jennyfer71@example.org', '2024-11-12 23:10:01', '$2y$12$WLLM3tvHOkfDb3f4TVrkU.Df28QSmX8V4uqwnCxqS84lOVpwIrcM6', 'NEVWTxdy3b', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(26, 'Izaiah Schmitt', 'nswaniawski@example.org', '2024-11-12 23:10:01', '$2y$12$l4vpgHOgwfBNupEcf4M14OFXtApgjKPT4VXvtiNsQnDOBCdYMnjEq', 'wVYsYlnZgr', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(27, 'Markus Hane PhD', 'oconner.modesta@example.net', '2024-11-12 23:10:03', '$2y$12$zyG2o7gQTV4.vJRv3QCoTOj5fA2R7UmpfchyBN/E4i822fdna91rG', 'I1iE9DONuv', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(28, 'Kasey Deckow', 'zhermiston@example.net', '2024-11-12 23:10:04', '$2y$12$JGSnNU9X2JECXQSmPGfuLO.bglTeG22ajBZZFpbC/1She4g93BZay', '8b5fups49y', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(29, 'Dashawn Walter', 'oreilly.clifford@example.net', '2024-11-12 23:10:05', '$2y$12$DrtSdK2Ptc1WmOjsHEVHmu5MU9ryw/31FTouvdMd5KL0a/XoiE9iO', 'Geq2x3M2AN', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(30, 'Donato Parker', 'armstrong.jayce@example.org', '2024-11-12 23:10:05', '$2y$12$guBWlFKBBplTCsRHvdFaj.tvOzBjU7hPY/r/m6Qo1qVjf2Jn80RUC', 'UKjNbfayWP', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(31, 'Tess Zieme', 'nikolaus.uriah@example.org', '2024-11-12 23:10:06', '$2y$12$uwkeVpShEIwToi3o.DGYhu/P07JUPC5FgY18ZnXz8uJXNpSNz0Y0K', 'vVOyBxsxuI', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(32, 'Werner Satterfield', 'thompson.nelda@example.org', '2024-11-12 23:10:08', '$2y$12$7UelrD25EGNI8wN0a6ysSeI4pBhFFtoChQZHsN.Y1mWg1XMaIM42S', 'XTwKrJLgT7', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(33, 'Merl Kassulke IV', 'leta50@example.org', '2024-11-12 23:10:09', '$2y$12$kTqlGLF.LQSZ3QGwc5P4iOd4yEd0yDdeYupql7RMAjsMfMEIXFPA2', 'LplsdJmWo4', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(34, 'Prof. Shyanne Gleason MD', 'daphney.collins@example.org', '2024-11-12 23:10:09', '$2y$12$lT04Kt/5ScdcEmTBMq1llOk0Z/Y7KNeSpMt8n1BmQm4ZLD7sZn4WW', 'wTVOS9R1nQ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(35, 'Jeramy Schoen III', 'antonina.parker@example.com', '2024-11-12 23:10:11', '$2y$12$g7EK/wsqaYTfRZQa73saI.St3LIn.Xr7djW/4dWSNoqdjTbIFMe6e', 'mP1v0RoLPC', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(36, 'Hester Thompson', 'mccullough.rita@example.com', '2024-11-12 23:10:11', '$2y$12$4y4dE2yoVtHD1QpIhM7fpu8fxWTXR8ZT8/EtR3IAg.REgPIxnQlsG', '8g136JZXZH', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(37, 'Malvina Parisian', 'cierra.eichmann@example.com', '2024-11-12 23:10:12', '$2y$12$mIg5egPO4I6kw.m9yy2JeOC//7ct5F1AKxs3lSMwjXK2XvhnhoGgi', 'g2MKnd9OxG', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(38, 'Brain Kautzer', 'pernser@example.org', '2024-11-12 23:10:13', '$2y$12$2il2gB7jIoK0xPY/mwfGMujg7Jt7tqBG8nz6YhbVER0wuK8FYpzjO', 'XqsdpQgu4s', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(39, 'Jana Shields', 'lcorwin@example.net', '2024-11-12 23:10:14', '$2y$12$TaoEC4QZ2Zn9EwEsU8R2pOmgFUM0c51dbz5AqkcQ6SRWxhZjhJ1Nu', 'QIqvDiG4eF', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(40, 'Efrain Gulgowski', 'joseph.brakus@example.net', '2024-11-12 23:10:14', '$2y$12$vQgPPxx/zuXMSHUu7bPieuy6fPdKBRK8/aEV7OuJSFpMfygEdXzpq', 'MlXYmvRquw', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(41, 'Micah Schmidt', 'schulist.cleveland@example.org', '2024-11-12 23:10:15', '$2y$12$l5jH9K1mO7fjFFRxS4XrSejmlyYJq2fwHzItVaGyqEprH2bSfCFDa', 'xxCHsNRx5W', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(42, 'Mattie Prosacco', 'amparo12@example.com', '2024-11-12 23:10:15', '$2y$12$8UBW99S8QZVsh.fpHDUs2..vCDTeMOoLsZE4boqOx5hIe6RCNgM0S', 'DCHrC6iK8s', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(43, 'Kavon Pacocha', 'pbotsford@example.net', '2024-11-12 23:10:16', '$2y$12$lN7.Eu80x0wJbJkufJf7L.ef8E.QRXcxtCmBHnB6mkX0KfYoSYb5.', '0bBe6nMQKk', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(44, 'Adeline Dickens', 'bbecker@example.com', '2024-11-12 23:10:16', '$2y$12$Ghj1B5Yyz8IPveMVGSVdCeCf08NoBN7cv2XKiKC6NfhEnSC1amqdO', 'pidwszFaQT', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(45, 'Zola Senger', 'dicki.asa@example.com', '2024-11-12 23:10:16', '$2y$12$Ym.t7hB5ws426rTcVRpgM.CGz3TFGx3wFGD8kVqCZZP0u/JZDITKK', 'DXw4sNV6Ht', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(46, 'Brenda Larkin', 'gerald05@example.org', '2024-11-12 23:10:17', '$2y$12$l5/ASMNnehQR6Uf8T1y5xug2EuSaxOP4GTwsoumJfBFDX2dTSPTwy', 'z6CKvshpLJ', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(47, 'Dr. Marcel Hauck II', 'cmills@example.com', '2024-11-12 23:10:18', '$2y$12$P5Cj44zl8uRKiUZQ1ydUKePwG0mpGGvEhe9WfgZRQCZEJ2GlqaVx6', 'YUnG0OGvUT', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(48, 'Grover Hodkiewicz', 'linnie97@example.com', '2024-11-12 23:10:19', '$2y$12$MOC3JuBSaBHmwEf.5wNSOuOOkwh2LKJydJ0VGNXkI6segqHWQ773G', 'qVXU7jb4p3', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(49, 'Otis Keebler', 'hintz.edgardo@example.com', '2024-11-12 23:10:19', '$2y$12$n0q9fImvqkFY12QauV9PUu.ZKGwn9OU97reQcsJh9OyTWJeRPH4dK', 'DGCM1VS5ip', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(50, 'Dedric Walter', 'eveline.ratke@example.org', '2024-11-12 23:10:20', '$2y$12$6QkRqTrk6SHMf2kPAWWW2OTgpWkNv3oajK5efNZsQMZYokQ8MpJyy', 'smS7sxc9DS', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(51, 'Violet Corwin I', 'jorge40@example.org', '2024-11-12 23:10:21', '$2y$12$Aak18Mks3/YiQ0SaIgDq.OOSy.JriAsOfmZDJCI1wW0BkWMWt362.', 'p4AfEW09fd', '2024-11-12 23:10:22', '2024-11-12 23:10:22'),
(53, 'user1', 'admin123@gmail.com', NULL, '$2y$12$xA99jqsQYm7m9wlfxWGCU.asUhpHpshpuquedlnSkm8eMT8307YFK', NULL, '2024-11-15 02:10:17', '2024-11-15 02:10:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`),
  ADD KEY `bukus_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;
--
-- Database: `db_data_mhs`
--
CREATE DATABASE IF NOT EXISTS `db_data_mhs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_data_mhs`;

-- --------------------------------------------------------

--
-- Table structure for table `a_student`
--

CREATE TABLE `a_student` (
  `Nim` int(8) NOT NULL,
  `Nama_mhs` char(50) DEFAULT NULL,
  `Sex` enum('L','P') DEFAULT 'L',
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT 'Parepare',
  `Asal_sma` char(30) DEFAULT NULL,
  `NoHp` varchar(12) DEFAULT NULL,
  `Login` char(20) DEFAULT NULL,
  `Pass` char(20) DEFAULT NULL,
  `Umur` int(11) DEFAULT NULL,
  `Kode_prodi` char(6) DEFAULT NULL,
  `Agama` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `b_jurusan`
--

CREATE TABLE `b_jurusan` (
  `Kode_prodi` char(6) NOT NULL,
  `Nama_prodi` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `b_jurusan`
--

INSERT INTO `b_jurusan` (`Kode_prodi`, `Nama_prodi`) VALUES
('001', 'Teknik Komputer'),
('002', 'PTIK');

-- --------------------------------------------------------

--
-- Table structure for table `c_mata_kuliah`
--

CREATE TABLE `c_mata_kuliah` (
  `Mk_id` char(10) NOT NULL,
  `Nama_mk` char(10) DEFAULT NULL,
  `Jumlah_jam` int(11) DEFAULT NULL,
  `Sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_ruang`
--

CREATE TABLE `d_ruang` (
  `rid` char(10) DEFAULT NULL,
  `Ruang_id` char(3) NOT NULL,
  `Nama_ruangg` char(20) DEFAULT NULL,
  `Kapasitas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_dosen`
--

CREATE TABLE `e_dosen` (
  `NIP` int(16) NOT NULL,
  `Inisial` char(3) DEFAULT NULL,
  `Nama_dosen` char(50) DEFAULT NULL,
  `Status` enum('T','LB') DEFAULT 'T',
  `Sex` enum('L','P') DEFAULT 'L',
  `Agama` char(20) DEFAULT NULL,
  `Login` char(20) DEFAULT NULL,
  `Pass` char(20) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT 'Parepare',
  `Email` varchar(50) DEFAULT NULL,
  `NoHp` varchar(12) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_mengajar`
--

CREATE TABLE `f_mengajar` (
  `Id_mengajar` int(11) NOT NULL,
  `Jam_ke` int(11) DEFAULT NULL,
  `Hari` varchar(10) DEFAULT NULL,
  `Mk_id` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `g_nilai`
--

CREATE TABLE `g_nilai` (
  `Nim` int(11) DEFAULT NULL,
  `Mk_id` char(10) DEFAULT NULL,
  `Kode_prodi` char(6) DEFAULT NULL,
  `Inisial` char(3) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `Nilai_uts` int(11) DEFAULT NULL,
  `Nilai_uas` int(11) DEFAULT NULL,
  `Nilai_akhir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_student`
--
ALTER TABLE `a_student`
  ADD PRIMARY KEY (`Nim`),
  ADD KEY `fk0` (`Kode_prodi`);

--
-- Indexes for table `b_jurusan`
--
ALTER TABLE `b_jurusan`
  ADD PRIMARY KEY (`Kode_prodi`);

--
-- Indexes for table `c_mata_kuliah`
--
ALTER TABLE `c_mata_kuliah`
  ADD PRIMARY KEY (`Mk_id`);

--
-- Indexes for table `d_ruang`
--
ALTER TABLE `d_ruang`
  ADD PRIMARY KEY (`Ruang_id`);

--
-- Indexes for table `e_dosen`
--
ALTER TABLE `e_dosen`
  ADD PRIMARY KEY (`NIP`),
  ADD UNIQUE KEY `Inisial` (`Inisial`);

--
-- Indexes for table `f_mengajar`
--
ALTER TABLE `f_mengajar`
  ADD PRIMARY KEY (`Id_mengajar`),
  ADD KEY `fk1` (`Mk_id`);

--
-- Indexes for table `g_nilai`
--
ALTER TABLE `g_nilai`
  ADD KEY `fk5` (`Nim`),
  ADD KEY `fk6` (`Mk_id`),
  ADD KEY `fk7` (`Kode_prodi`),
  ADD KEY `fk8` (`Inisial`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `f_mengajar`
--
ALTER TABLE `f_mengajar`
  MODIFY `Id_mengajar` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_student`
--
ALTER TABLE `a_student`
  ADD CONSTRAINT `fk0` FOREIGN KEY (`Kode_prodi`) REFERENCES `b_jurusan` (`Kode_prodi`);

--
-- Constraints for table `f_mengajar`
--
ALTER TABLE `f_mengajar`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`Mk_id`) REFERENCES `c_mata_kuliah` (`Mk_id`);

--
-- Constraints for table `g_nilai`
--
ALTER TABLE `g_nilai`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`Nim`) REFERENCES `a_student` (`Nim`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`Mk_id`) REFERENCES `c_mata_kuliah` (`Mk_id`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`Kode_prodi`) REFERENCES `b_jurusan` (`Kode_prodi`),
  ADD CONSTRAINT `fk8` FOREIGN KEY (`Inisial`) REFERENCES `e_dosen` (`Inisial`);
--
-- Database: `db_laravel_filament`
--
CREATE DATABASE IF NOT EXISTS `db_laravel_filament` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_laravel_filament`;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `category_id`, `image`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, '01JAN9YVQD7XYH6T7B1878V4E6.jpeg', 'Narito', '<p>Jadi</p>', '2024-10-20 07:50:28', '2024-10-20 07:53:52'),
(2, 1, '01JAPSN0Z5GERKGEP7VY2CWZV2.jpeg', 'Naru', '<p>dasjdaskdjadasdaskjdhas</p>', '2024-10-20 21:43:57', '2024-10-20 21:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1729489488),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1729489488;', 1729489488),
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1730086636),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1730086636;', 1730086636);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_20_114927_create_categories_table', 1),
(5, '2024_10_20_143708_create_bukus_table', 1),
(6, '2024_10_20_153556_create_bukus_table', 2),
(7, '2024_10_20_154345_create_bukus_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('o7KRhgH8Lz0mkpoxKOaAzi6CPak0NmptH2zmtsyF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1FKcU1xQmpxZVZ5TlFUaFZDM05sdjcyb3BZRzJIZEI1bXlHOWtvZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1730086318),
('UmStDA6OOTFKUttJLLOc2qmlsL6Yw6UfKokRVvcG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmhBVmtjaWxHaWU2N05rVjY3aUNMaXRyRGFTZ1B3ZzZZOHdWSGFvYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730086301),
('z1DoZxMKPjvTqudeEbsEc5TcfKQWaQoQ31vyh9Va', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiR3JxYk1rd0tyNkFUVDBua3BKRHlZQXE4bjVpazVKT29SU1hTNWw1bCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiR5YlJ2TnpQeW95enYuc3pObzE5WmtlRTQzdFFUcTVVcFFRZ2ZiT2xPQy9MT01pWVY2V2gwZSI7fQ==', 1730086687);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$ssIkRK0oezJ8fzTeerPLzeGOk0CQnkkrVUmEg.wHfAt5mV8OOPcnW', NULL, '2024-10-20 07:02:53', '2024-10-20 07:02:53'),
(2, 'admin', 'admin123@gmail.com', NULL, '$2y$12$ybRvNzPyoyzv.szNo19ZkeE43tQTq5UpQQgfbOlOC/LOMiYV6Wh0e', NULL, '2024-10-27 19:35:59', '2024-10-27 19:35:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `db_praktikum3`
--
CREATE DATABASE IF NOT EXISTS `db_praktikum3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_praktikum3`;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `NAME` varchar(30) NOT NULL,
  `TITLE` varchar(25) NOT NULL,
  `CLASS` varchar(5) NOT NULL,
  `SECTION` varchar(1) NOT NULL,
  `ROLLID` decimal(3,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`NAME`, `TITLE`, `CLASS`, `SECTION`, `ROLLID`) VALUES
('Deepak                        ', 'Saxana                   ', 'V    ', 'A', 15),
('Robert                        ', 'Paul                     ', 'VI   ', 'A', 2),
('Danny                         ', 'Moris                    ', 'V    ', 'B', 15);

-- --------------------------------------------------------

--
-- Table structure for table `studentreport`
--

CREATE TABLE `studentreport` (
  `CLASS` varchar(5) NOT NULL,
  `SECTION` varchar(1) NOT NULL,
  `ROLLID` decimal(3,0) NOT NULL,
  `GRADE` varchar(5) NOT NULL,
  `SEMISTER` varchar(5) DEFAULT NULL,
  `CLASS_ATTENDED` decimal(25,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `studentreport`
--

INSERT INTO `studentreport` (`CLASS`, `SECTION`, `ROLLID`, `GRADE`, `SEMISTER`, `CLASS_ATTENDED`) VALUES
('V    ', 'A', 15, 'A++  ', '1St  ', 75),
('VI   ', 'A', 2, 'A+   ', '2Nd  ', 70),
('V    ', 'B', 15, 'AA   ', '1St  ', 85),
('VI   ', 'A', 2, 'A+   ', '1St  ', 70),
('V    ', 'A', 15, 'AA   ', '2Nd  ', 85);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`CLASS`,`SECTION`,`ROLLID`);

--
-- Indexes for table `studentreport`
--
ALTER TABLE `studentreport`
  ADD KEY `FK_CSR` (`CLASS`,`SECTION`,`ROLLID`);
--
-- Database: `db_tkbk`
--
CREATE DATABASE IF NOT EXISTS `db_tkbk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_tkbk`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `example`
--
CREATE DATABASE IF NOT EXISTS `example` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `example`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` text NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Umur` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13, '0001_01_01_000000_create_users_table', 1),
(14, '0001_01_01_000001_create_cache_table', 1),
(15, '0001_01_01_000002_create_jobs_table', 1),
(16, '2024_10_21_063324_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `film`
--
CREATE DATABASE IF NOT EXISTS `film` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `film`;

-- --------------------------------------------------------

--
-- Table structure for table `aktor`
--

CREATE TABLE `aktor` (
  `ID_Aktor` int(4) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL,
  `Negara` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aktor_film`
--

CREATE TABLE `aktor_film` (
  `ID_Film` int(4) DEFAULT NULL,
  `ID_Aktor` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `ID_Film` int(4) NOT NULL,
  `Judul` varchar(50) DEFAULT NULL,
  `Tahun_rilis` int(4) DEFAULT NULL,
  `Rating` decimal(3,1) DEFAULT NULL,
  `Durasi` varchar(50) DEFAULT NULL,
  `ID_Sutradara` int(4) DEFAULT NULL,
  `ID_Genre` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`ID_Film`, `Judul`, `Tahun_rilis`, `Rating`, `Durasi`, `ID_Sutradara`, `ID_Genre`) VALUES
(1, 'Avatar', 2009, 7.0, '2 Jam 42 Menit', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `ID_Genre` int(4) NOT NULL,
  `Nama_Genre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`ID_Genre`, `Nama_Genre`) VALUES
(1, 'Fantasi');

-- --------------------------------------------------------

--
-- Table structure for table `produser`
--

CREATE TABLE `produser` (
  `ID_Produser` int(4) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produser_film`
--

CREATE TABLE `produser_film` (
  `ID_Film` int(4) DEFAULT NULL,
  `ID_Produser` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `ID_Studio` int(4) NOT NULL,
  `Nama_Studio` varchar(50) DEFAULT NULL,
  `Tahun_Berdiri` int(4) DEFAULT NULL,
  `Negara` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studio_film`
--

CREATE TABLE `studio_film` (
  `ID_Film` int(4) DEFAULT NULL,
  `ID_Studio` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sutradara`
--

CREATE TABLE `sutradara` (
  `ID_Sutradara` int(4) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sutradara`
--

INSERT INTO `sutradara` (`ID_Sutradara`, `Nama`, `Tanggal_lahir`) VALUES
(1, 'James Cameron', '1954-08-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktor`
--
ALTER TABLE `aktor`
  ADD PRIMARY KEY (`ID_Aktor`);

--
-- Indexes for table `aktor_film`
--
ALTER TABLE `aktor_film`
  ADD KEY `ID_Film` (`ID_Film`),
  ADD KEY `ID_Aktor` (`ID_Aktor`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_Film`),
  ADD KEY `ID_Sutradara` (`ID_Sutradara`),
  ADD KEY `ID_Genre` (`ID_Genre`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- Indexes for table `produser`
--
ALTER TABLE `produser`
  ADD PRIMARY KEY (`ID_Produser`);

--
-- Indexes for table `produser_film`
--
ALTER TABLE `produser_film`
  ADD KEY `ID_Film` (`ID_Film`),
  ADD KEY `ID_Produser` (`ID_Produser`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`ID_Studio`);

--
-- Indexes for table `studio_film`
--
ALTER TABLE `studio_film`
  ADD KEY `ID_Film` (`ID_Film`),
  ADD KEY `ID_Studio` (`ID_Studio`);

--
-- Indexes for table `sutradara`
--
ALTER TABLE `sutradara`
  ADD PRIMARY KEY (`ID_Sutradara`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktor_film`
--
ALTER TABLE `aktor_film`
  ADD CONSTRAINT `aktor_film_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`),
  ADD CONSTRAINT `aktor_film_ibfk_2` FOREIGN KEY (`ID_Aktor`) REFERENCES `aktor` (`ID_Aktor`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`ID_Sutradara`) REFERENCES `sutradara` (`ID_Sutradara`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`ID_Genre`) REFERENCES `genre` (`ID_Genre`);

--
-- Constraints for table `produser_film`
--
ALTER TABLE `produser_film`
  ADD CONSTRAINT `produser_film_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`),
  ADD CONSTRAINT `produser_film_ibfk_2` FOREIGN KEY (`ID_Produser`) REFERENCES `produser` (`ID_Produser`);

--
-- Constraints for table `studio_film`
--
ALTER TABLE `studio_film`
  ADD CONSTRAINT `studio_film_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`),
  ADD CONSTRAINT `studio_film_ibfk_2` FOREIGN KEY (`ID_Studio`) REFERENCES `studio` (`ID_Studio`);
--
-- Database: `larashop`
--
CREATE DATABASE IF NOT EXISTS `larashop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `larashop`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'How to become great man', 'how-to-become-great-man', 'The book description', 'Noone', 'Nopublisher', 'book-covers/riSvIG5fsoNOCE0OhwIdNh3EewgYuCLAqEPSaV9w.png', 390000.00, 0, 330, 'PUBLISH', 1, 24, NULL, '2018-07-26 07:20:14', '2021-01-07 06:51:48', '2021-01-07 06:51:48'),
(4, 'How to become ninja Developer', 'how-to-become-ninja-developer', 'Descriptions goes here', 'Muhammad Azamuddin', 'Indie Publisher', 'book-covers/2x9OEHtj57kVp9UZe9Av39TBMNphRw8FrEh4Nium.png', 239000.00, 0, 9, 'PUBLISH', 1, NULL, NULL, '2018-10-02 07:06:39', '2018-10-02 08:42:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 2, 5, NULL, NULL),
(4, 4, 5, NULL, NULL),
(6, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_order`
--

CREATE TABLE `book_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_order`
--

INSERT INTO `book_order` (`id`, `order_id`, `book_id`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 1, '2018-07-26 00:00:00', '2018-07-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Wekeke ek ew kew ew', 'wekeke-ek-ew-kew-ew', 'category_images/n8gfQFT4PD5OzKt7KFJLANMZMPXbvHMpLFCySP3i.png', 1, 24, NULL, NULL, '2018-07-16 04:04:48', '2021-01-05 20:27:26'),
(3, 'Hardware', 'hardware', 'category_images/sCYd3L9ZHPUa7bnTWIjaTDO3RWzCwfBPq5qbQL3h.jpeg', 1, 1, NULL, NULL, '2018-07-23 03:21:00', '2021-01-06 07:37:07'),
(4, 'Ilmiiah', 'ilmiiah', 'category_images/ej14L2H7HLHcvCFGZoT9GwTb2rX9nmEUNyKkEXKZ.jpeg', 1, NULL, NULL, NULL, '2018-07-23 03:21:15', '2021-01-05 20:27:38'),
(5, 'Self Development', 'self-development', 'category_images/nE9xMN84MaKeHyVG1jcwPF1ChOUvaYzGXjSI19Mu.png', 1, NULL, NULL, NULL, '2018-07-26 07:18:50', '2018-07-26 07:18:50'),
(6, 'Business', 'business', 'category_images/vLhVcc7mSOm5WzdxEifRqbj41KAwrxvB4qfEEkRh.png', 1, NULL, NULL, NULL, '2018-07-26 07:21:27', '2018-07-26 07:21:27'),
(7, 'Joseph Mueller', 'incidunt-ut-sint-necessitatibus-aut', '/tmp/f22bc6dd11e9659a530ecdf0b594a542.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:13'),
(8, 'Alize Jacobs', 'voluptatem-aut-explicabo-voluptatum-est', '/tmp/7eeba2afaad844803b7029f670058def.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:18'),
(9, 'Shaniya Collins', 'consequatur-nihil-saepe-facilis-hic', '/tmp/75f3166283222da447dc60d790ba8fec.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:22'),
(10, 'Mrs. Magdalena Graham I', 'necessitatibus-ut-assumenda-et-eligendi-aut', '/tmp/96ec46942ad5c6873f7c3e3bedc031bf.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:26'),
(12, 'Ronny Emmerich', 'quidem-placeat-cum-et-ducimus-culpa', '/tmp/30d7c88ce5ec62b924e5baed6056ff73.jpg', 1, NULL, NULL, '2021-01-06 07:39:51', '2018-08-06 08:29:40', '2021-01-06 07:39:51'),
(13, 'Maximus Cole', 'et-eum-eum-cupiditate', '/tmp/01c1d77b125096c1231390022fe64f42.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:35'),
(14, 'Rosella Mayert', 'omnis-quis-ut-esse-sapiente-ea', '/tmp/7115ee98fbad181ee81a02e7b5273fa1.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(15, 'Trinity Sawayn', 'dignissimos-facilis-quam-non-fugiat-voluptatibus-inventore-reiciendis', '/tmp/d2d88e81c0661535fd3727813e348507.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(16, 'Delpha Cruickshank', 'soluta-aperiam-sint-vel-voluptatem-hic-ut', '/tmp/9e46dad5b71f00b2013ea311d77ba0a4.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(17, 'Dr. Harvey Walsh Sr.', 'qui-dolor-fuga-tenetur', '/tmp/ede39441f7366073b79cf11aab7f5df0.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(18, 'Andres Douglas Sr.', 'nobis-repellat-vel-voluptate-impedit', '/tmp/0367a691a496b71e08889e98b60b41d6.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(19, 'Dallin Daugherty', 'pariatur-qui-dolorem-corporis-autem', '/tmp/16cc9d8af2d9ca2bddb5fa6fee6a954b.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(20, 'Gerald Bosco', 'tenetur-amet-ducimus-sunt-reiciendis-soluta-eaque-quia-voluptatem', '/tmp/9b05f35d08513a902d34a30187b0aad3.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(21, 'Tiffany Lebsack', 'nesciunt-dignissimos-quam-voluptatem-quaerat-rerum', '/tmp/6b4353696d6a2d3ba7e9342ee4c50c9f.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(22, 'Myra Durgan', 'voluptas-labore-perspiciatis-facilis-tenetur-laudantium-perferendis', '/tmp/1549161129e9392219930177817cfc0e.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(23, 'Laila Brekke', 'possimus-sunt-consequuntur-recusandae-similique-nam', '/tmp/332b4ab741b09504c4d19058ec65aef3.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(24, 'Landen Olson', 'commodi-aut-et-ut-blanditiis', '/tmp/c01fad5a4e7e1281b9d49810692a3a0b.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(25, 'Prof. Coby Lehner Jr.', 'totam-inventore-placeat-accusamus-adipisci-sunt-minima-sed', '/tmp/f01c4d9b11d50a21adf0a6326b8454cd.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(26, 'Guillermo Cummerata', 'doloribus-et-reprehenderit-dignissimos-praesentium-nesciunt-iste-repudiandae', '/tmp/70e45be7923b272e15f4caf767a089ac.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(27, 'Gay Wilkinson', 'repudiandae-maiores-consequatur-consequatur-repudiandae-dolor-facere', 'storage/app/public/category_images/9b69be059332ecdfb0a7f9563c6bb44d.jpg', 1, NULL, NULL, NULL, '2018-08-06 09:14:41', '2018-08-06 09:14:41'),
(28, 'Miss Carmella Bergstrom Jr.', 'autem-laboriosam-et-adipisci-ducimus-rerum-impedit-et-nisi', 'storage/app/public/category_images/018b48cf42f4763f3c1032619b03056e.jpg', 1, NULL, NULL, NULL, '2018-08-06 09:16:05', '2018-08-06 09:16:05');

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
(6, '2018_07_10_115805_penyesuaian_table_users', 2),
(10, '2018_07_16_020754_create_table_categories', 3),
(25, '2018_07_21_203443_create_books_table', 4),
(26, '2018_07_21_204915_create_book_category_table', 5),
(28, '2018_07_25_075101_create_orders_table', 6),
(29, '2018_07_25_082000_create_book_order_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `invoice_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 390000.00, '201807060001', 'CANCEL', '2018-07-06 00:00:00', '2021-01-04 18:52:36'),
(2, 14, 780000.00, '201807250002', 'PROCESS', '2018-07-26 00:00:00', '2018-10-02 08:50:04');

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Muhammad Azamuddin', 'administrator@larashop.test', '$2y$10$CaHcu3RjHs2Yr1c.hgFOVeM77aJ2soN7JUBLyLyL1NZGMY2UqY3Vq', 'JVPtH8RguhTsoHhlnTi9Iv4sHuQL3vV3pWcz0sOSUqc9DAyXlstgmYaG1NPV', '2018-07-11 02:44:43', '2021-01-06 06:34:10', 'administrator', '[\"ADMIN\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/ISzYK4DDkrU78vhi1PWBMoKHXheCF2dIipNWXbM7.png', 'ACTIVE'),
(7, 'Nadia Nurul Mila', 'nadia@gmail.com', 'bismillah', NULL, '2018-07-13 07:59:30', '2021-01-06 06:36:03', 'nadia', '[\"STAFF\",\"CUSTOMER\"]', 'Jalan Alamat ini jika alamat ini kosong', '083948324323', NULL, 'INACTIVE'),
(11, 'User Enam', 'user6@gmail.com', 'bismillah', NULL, '2018-07-14 02:55:38', '2021-01-06 07:36:08', 'user6', '[\"CUSTOMER\"]', 'asasasasssssssssssaasdasdddddddd', '111111111111', NULL, 'ACTIVE'),
(12, 'Ridwan Mutaffaq', 'ridwan@gmail.com', 'bismillah', NULL, '2018-07-14 05:38:30', '2018-07-14 05:38:30', 'ridwan', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', NULL, 'ACTIVE'),
(14, 'Habib Asagaf', 'habib@gmail.com', 'bismillah', NULL, '2018-07-15 04:09:37', '2021-01-06 06:34:30', 'habib', '[\"ADMIN\",\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/2aVe8GlnhQXoZA6iFYmS4RIOgjbGoz6TbdRO4FQL.png', 'ACTIVE'),
(15, 'Iqbal Kholis', 'iqbal@gmail.com', 'bismillah', NULL, '2018-07-15 04:10:15', '2018-07-15 04:10:15', 'iqbal', '[\"ADMIN\"]', 'Jl Dr Wahidin No 1. Kompleks Kementerian Keuangan. Gedung Djuand\r\nKel Harapan Mulya, Kec Kemayoran', '85781150352', NULL, 'ACTIVE'),
(17, 'User ABC', 'userabc@gmail.com', 'bismillah', NULL, '2018-07-15 10:03:19', '2021-01-05 20:23:38', 'userabc', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', NULL, 'INACTIVE'),
(24, 'Fathul Miun', 'fmuiin14@gmail.com', '$2y$10$F.HweXxRA/wva/EBmwR75eLFOg9.iyDUqvBIxPmPodyvmYbw.msk6', NULL, '2020-11-15 01:10:11', '2020-11-18 07:11:25', 'fmuiin14', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Depok, Jawa Barat, Indonesia', '089679590971', 'avatars/O8CxkfGykWh9BGjpHFch5JpGo8Olt9wH1eOyPsIh.jpeg', 'ACTIVE'),
(25, 'costumer', 'costumer@gmail.com', '$2y$10$WDX0rbQ8dMkSse8daXt38O3yHQ4oToWCo6icjyz/QjSSapUOvj3DK', NULL, '2021-01-05 07:43:28', '2021-01-05 07:43:28', 'costumer', '[\"CUSTOMER\"]', 'Ini nama alamat jalan', '08977788712', 'avatars/UYs1dJiYfae98CJwvJ7krsMUz5pQ8ZmAJeuwa53c.jpeg', 'ACTIVE'),
(26, 'Testing Paling baru', 'testingaru@gmail.com', '$2y$10$zkAz.bdrxUuLD5WCVG/fquCXJW//lHlzF/P.6OZYkRzzI0fP5giSu', NULL, '2021-01-05 20:14:21', '2021-01-05 20:14:21', 'fmuiin14@gmail.com', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Testiung Alamat baru', '08977766713', 'avatars/yMF8WYMkz7xX4EuBskRm8tp2PSrnQN8QRvvQM1e9.png', 'ACTIVE'),
(28, 'Administrator', 'admin@gmail.com', '$2y$10$fLY8qGhPGTftKweywiADfeuX6Ew7NYHHHHlpMnWKnFJAR0qAfkFMG', 'g2snRyFSZeIjWX43YTifux0YhUxxMI0smQ7kEAZbZjnZwVnqn6cmPAGrX8Bn', '2021-01-06 08:32:35', '2021-01-06 08:32:35', 'admin', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'admin untuk mengatur segala hal bisa pokoknya kalau admin mah', '081111111111', 'avatars/nX6GDvopSJLNHEZame0a714Lv870KjLJjO9PLWyn.png', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_order_order_id_foreign` (`order_id`),
  ADD KEY `book_order_book_id_foreign` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `larave123`
--
CREATE DATABASE IF NOT EXISTS `larave123` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `larave123`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_13_015410_create_products_table', 1),
(5, '2024_10_02_050651_create_posts_table', 1),
(6, '2024_10_02_071842_create_events_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'u2EwUdlZd5BQ7ElTCtkdr3eRUdT2fXsH0yj1fjZi.png', 'TEST1234', '<p>IINI BUKU</p>', 15, 5, '2024-11-01 23:22:19', '2024-11-01 23:22:19'),
(2, 'SYC1JFMzgUUv54dl2jzfXkn2HMUEsb7ZjsTRvUbu.jpg', 'ADHE123', '<p>TESTSTST</p>', 150000, 2, '2024-11-02 08:05:03', '2024-11-02 08:05:03'),
(3, 'PRAzetvzK7kygrKJlqi4sOOf4Bq6uisds7Nz4g3X.jpg', 'dsdsadasdas', '<p>dasdasdadasdasdasdas</p>', 123333, 3, '2024-11-02 08:19:27', '2024-11-02 08:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KC9x6opxxCGkQVl4ayH8DRghSVNTImBRvgNmoQsp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoienlURkJGZFdOd2pEQ2V3U0ROR29tNjBNdHBHd3hwV1VCM29qMTBiYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO319', 1730616311),
('LKG5gvp1gvLAjTYtIrjcDXNgtI910FwXZ4jfJ8VY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR05jUGE5VVM5MEFtZ0lZeUxiMG1Ud3dpRFFtQW8xVnFEUlluSnp2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1730626036);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_19_075301_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(5, 'hNUALyyCBHz9KY3co6ulvrZrgMgQuJF0SYgrpHVr.jpg', 'Honda Beat', '<p>etetetqdsagdysgdygsjgasd</p>', 20000, 111, '2024-10-19 00:39:55', '2024-10-19 00:39:55'),
(6, 'HxBXBP1Ot990zjTxwUnz7UcciZ8ptdQEJwedPsxV.jpg', 'msdmfnsdnfs', '<p>fsdfsadfas</p>', 34434234, 242423424, '2024-10-19 00:44:28', '2024-10-19 00:44:28'),
(7, '7TQL4HmL1EYm2gnPPmBbM593BDl6yQ4WZdGWRDn2.jpg', 'INI BAPAK BUDI', '<p>NAMA SAYA BAPAK BUDI</p>', 500000, 12, '2024-10-19 01:55:42', '2024-10-19 01:55:42'),
(8, 'jJlNkvrBtGErz0y2s2UhQCR2sER7RDglIBSTXl4B.jpg', 'fsdfsdfdfsdfdffdfsd', '<p>dfsfdsfsdfsd</p>', 33333, 5, '2024-10-19 01:59:15', '2024-10-19 01:59:15'),
(9, 'xoleSJY5IJkPhYDlkkvW8EMZbtFOUbL5N9lFRIop.jpg', 'testqwer', '<p>djakjdasdklajsd</p>', 123456, 123456, '2024-10-19 02:09:58', '2024-10-19 02:09:58'),
(10, 'wriT0NoE0FiRIWyja7hCGXtCzeqjCebkDvibcc2j.jpg', 'papappappap', '<p>aapapapapapapapa</p>', 10000, 2, '2024-10-19 02:11:13', '2024-10-19 02:11:13'),
(11, 'Gvt6woztyqCdiQtcySY903z5fkuDZEgq8gF5EQKn.jpg', 'Kopi12345', '<p>Kopi Budi</p>', 10000, 1111, '2024-10-21 00:19:34', '2024-10-21 00:19:34'),
(12, 'sF0T1vguo6AbWXuBJ6kcdRLYXXgjeXLg55JnuX5G.jpg', 'Kopi Arabika', '<p>KOPi budi</p>', 10000, 999, '2024-10-21 00:21:22', '2024-10-21 00:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8I2sKH2j59EjCEIxrpbqgPV6mwKY2cALUN3XttZ2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzdjNjZrQnJjWjhoRmJCdWJ6TzliZDF5Y3UxTklFbXVnelg1OXJJOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729332673),
('zco8trfUv1ZyKEAXNXsrnvS9CJtYvbq1A7mU76Yc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnk2S3o1WVVOUTlHY2ZpTzE2RmhWZVpKYWs5UzFRblE2bldoZkNrQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729499967);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `laravel1`
--
CREATE DATABASE IF NOT EXISTS `laravel1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel1`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_13_015410_create_products_table', 1),
(5, '2024_10_02_050651_create_posts_table', 1),
(6, '2024_10_02_071842_create_events_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `latihan`
--
CREATE DATABASE IF NOT EXISTS `latihan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `latihan`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(4) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `harga_jual` int(20) DEFAULT NULL,
  `harga_dasar` int(20) DEFAULT NULL,
  `stok` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_jual`, `harga_dasar`, `stok`) VALUES
(1, 'Beras', 275000, 250000, 10),
(2, 'Minyak 2L', 22000, 20000, 5),
(3, 'Minyak 1L', 10000, 20000, 5),
(4, 'Gula', 17000, 15000, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id_cabang` int(4) NOT NULL,
  `nama_cabang` varchar(50) DEFAULT NULL,
  `alamat_cabang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id_cabang`, `nama_cabang`, `alamat_cabang`) VALUES
(1, 'Pettarani', 'Jl.Pettarani'),
(2, 'Parang Tambung', 'jl.mallengkeri'),
(3, 'Veteran', 'jl.Veteran Utra'),
(4, 'Parang Tambung', 'jl.dg.tata'),
(5, 'Parang Tambung', 'jl.abd.kadir'),
(6, 'Cendrawasih', 'jl.Cendrawasih'),
(7, 'Veteran', 'jl.Veteran Selatan'),
(8, 'Rappocini', 'jl.Monumen emmy saelan'),
(9, 'Rappocini', 'jl.Raya Pendidikan'),
(10, 'Panakukang', 'jl.Boulevard');

-- --------------------------------------------------------

--
-- Table structure for table `customer_service`
--

CREATE TABLE `customer_service` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_service`
--

INSERT INTO `customer_service` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Uda', 'Customer Service', 1),
(2, 'Dian', 'Customer Service', 1),
(3, 'Gangsar', 'Customer Service', 1),
(4, 'Kayla', 'Customer Service', 1),
(5, 'Belinda', 'Customer Service', 1),
(6, 'Luthfi', 'Customer Service', 2),
(7, 'Rosman', 'Customer Service', 2),
(8, 'Hamzah', 'Customer Service', 2),
(9, 'Yani', 'Customer Service', 2),
(10, 'Tiara', 'Customer Service', 2),
(11, 'Gada', 'Customer Service', 3),
(12, 'Latika', 'Customer Service', 3),
(13, 'Warda', 'Customer Service', 3),
(14, 'Iriana', 'Customer Service', 3),
(15, 'Cinthia', 'Customer Service', 3),
(16, 'Kemba', 'Customer Service', 4),
(17, 'Emin', 'Customer Service', 4),
(18, 'Humaira', 'Customer Service', 4),
(19, 'Ilsa', 'Customer Service', 4),
(20, 'Violet', 'Customer Service', 4),
(21, 'Erik', 'Customer Service', 5),
(22, 'Septi', 'Customer Service', 5),
(23, 'Hasan', 'Customer Service', 5),
(24, 'Nadine', 'Customer Service', 5),
(25, 'Lamar', 'Customer Service', 5),
(26, 'Gara', 'Customer Service', 6),
(27, 'Rafid', 'Customer Service', 6),
(28, 'Gabriel', 'Customer Service', 6),
(29, 'Fatma', 'Customer Service', 6),
(30, 'Hastuti', 'Customer Service', 6),
(31, 'Opan', 'Customer Service', 7),
(32, 'Kusuma', 'Customer Service', 7),
(33, 'Dono', 'Customer Service', 7),
(34, 'Talia', 'Customer Service', 7),
(35, 'Dinda', 'Customer Service', 7),
(36, 'Jarwa', 'Customer Service', 8),
(37, 'Dimas', 'Customer Service', 8),
(38, 'Cinta', 'Customer Service', 8),
(39, 'Aisya', 'Customer Service', 8),
(40, 'Darma', 'Customer Service', 8),
(41, 'Zalinda', 'Customer Service', 9),
(42, 'Olga', 'Customer Service', 9),
(43, 'Gandi', 'Customer Service', 9),
(44, 'Pia', 'Customer Service', 9),
(45, 'Rahayu', 'Customer Service', 9),
(46, 'Capa', 'Customer Service', 10),
(47, 'Puti', 'Customer Service', 10),
(48, 'Virman', 'Customer Service', 10),
(49, 'Cahyo', 'Customer Service', 10),
(50, 'Fahmi', 'Customer Service', 10);

-- --------------------------------------------------------

--
-- Table structure for table `front_office`
--

CREATE TABLE `front_office` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `front_office`
--

INSERT INTO `front_office` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Martin', 'front_office', 1),
(2, 'Sadil', 'front_office', 1),
(3, 'Desi', 'front_office', 2),
(4, 'Deka', 'front_office', 2),
(5, 'Andi', 'front_office', 3),
(6, 'Aqsa', 'front_office', 3),
(7, 'Absar', 'front_office', 4),
(8, 'Indah', 'front_office', 4),
(9, 'Putri', 'front_office', 5),
(10, 'Eka', 'front_office', 5),
(11, 'Fandi', 'front_office', 6),
(12, 'Dwi', 'front_office', 6),
(13, 'Intan', 'front_office', 7),
(14, 'Alif', 'front_office', 7),
(15, 'Sari', 'front_office', 8),
(16, 'Gus', 'front_office', 8),
(17, 'Marta', 'front_office', 9),
(18, 'Nur', 'front_office', 9),
(19, 'Sari Eka', 'front_office', 10),
(20, 'Pany', 'front_office', 10);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Andi', 'Kasir', 1),
(2, 'Asep', 'Kasir', 1),
(3, 'Dendi', 'Kasir', 1),
(4, 'Deka', 'Kasir', 1),
(5, 'Dimas', 'Kasir', 1),
(6, 'Tika', 'kasir', 2),
(7, 'Desi', 'Kasir', 2),
(8, 'Mika', 'Kasir', 2),
(9, 'Endi', 'kasir', 2),
(10, 'Dase', 'Kasir', 2),
(11, 'Mega', 'Kasir', 3),
(12, 'Dandi', 'Kasir', 3),
(13, 'Edo', 'Kasir', 3),
(14, 'Erik', 'Kasir', 3),
(15, 'Ensi', 'Kasir', 3),
(16, 'Fandi', 'Kasir', 4),
(17, 'Fani', 'Kasir', 4),
(18, 'ani', 'Kasir', 4),
(19, 'ina', 'Kasir', 4),
(20, 'inda', 'Kasir', 4),
(21, 'Dinda', 'Kasir', 5),
(22, 'Dian', 'Kasir', 5),
(23, 'Dani', 'Kasir', 5),
(24, 'Eka', 'Kasir', 5),
(25, 'Fani', 'Kasir', 5),
(26, 'Adi', 'Kasir', 6),
(27, 'Ai', 'Kasir', 6),
(28, 'Ian', 'Kasir', 6),
(29, 'Ani', 'Kasir', 6),
(30, 'Andin', 'Kasir', 6),
(31, 'Adit', 'Kasir', 7),
(32, 'Nira', 'Kasir', 7),
(33, 'Nisa', 'Kasir', 7),
(34, 'Mawar', 'Kasir', 7),
(35, 'Eska', 'Kasir', 7),
(36, 'Dipa', 'Kasir', 8),
(37, 'Disa', 'Kasir', 8),
(38, 'Andini', 'Kasir', 8),
(39, 'dini', 'Kasir', 8),
(40, 'Alika', 'Kasir', 8),
(41, 'ika', 'Kasir', 9),
(42, 'Qais', 'Kasir', 9),
(43, 'Khasim', 'Kasir', 9),
(44, 'Mega', 'Kasir', 9),
(45, 'Neni', 'Kasir', 9),
(46, 'Anton', 'Kasir', 10),
(47, 'Mawar', 'Kasir', 10),
(48, 'Anggi', 'Kasir', 10),
(49, 'Aqil', 'Kasir', 10),
(50, 'Sisil', 'Kasir', 10);

-- --------------------------------------------------------

--
-- Table structure for table `kepala_cabang`
--

CREATE TABLE `kepala_cabang` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kepala_cabang`
--

INSERT INTO `kepala_cabang` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Alex', 'Kepala_Cabang', 1),
(2, 'Sam', 'Kepala_Cabang', 2),
(3, 'Erika', 'Kepala_Cabang', 3),
(4, 'Andin', 'Kepala_Cabang', 4),
(5, 'Budi', 'Kepala_Cabang', 5),
(6, 'Dani', 'Kepala_Cabang', 6),
(7, 'Intan', 'Kepala_Cabang', 7),
(8, 'Eka', 'Kepala_Cabang', 8),
(9, 'Puri', 'Kepala_Cabang', 9),
(10, 'Anton', 'Kepala_Cabang', 10);

-- --------------------------------------------------------

--
-- Table structure for table `manajer_keuangan`
--

CREATE TABLE `manajer_keuangan` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manajer_keuangan`
--

INSERT INTO `manajer_keuangan` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Martim', 'Manajer Keuangan', 1),
(2, 'Pras', 'Manajer Keuangan', 2),
(3, 'Odegard', 'Manajer Keuangan', 3),
(4, 'Ozil', 'Manajer Keuangan', 4),
(5, 'Kaka', 'Manajer Keuangan', 5),
(6, 'Bambang', 'Manajer Keuangan', 6),
(7, 'Nur', 'Manajer Keuangan', 7),
(8, 'Putri', 'Manajer Keuangan', 8),
(9, 'Mawar', 'Manajer Keuangan', 9),
(10, 'Melati', 'Manajer Keuangan', 10);

-- --------------------------------------------------------

--
-- Table structure for table `manajer_pemasaran`
--

CREATE TABLE `manajer_pemasaran` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manajer_pemasaran`
--

INSERT INTO `manajer_pemasaran` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Eriq', 'Manajer Pemasaran', 1),
(2, 'Akram', 'Manajer Pemasaran', 2),
(3, 'Dimas', 'Manajer Pemasaran', 3),
(4, 'Fauzi', 'Manajer Pemasaran', 4),
(5, 'Eka', 'Manajer Pemasaran', 5),
(6, 'Dilla', 'Manajer Pemasaran', 6),
(7, 'Nisa', 'Manajer Pemasaran', 7),
(8, 'Rasi', 'Manajer Pemasaran', 8),
(9, 'Nabila', 'Manajer Pemasaran', 9),
(10, 'Sara', 'Manajer Pemasaran', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pencatat_barang_keluar`
--

CREATE TABLE `pencatat_barang_keluar` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pencatat_barang_keluar`
--

INSERT INTO `pencatat_barang_keluar` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Endi', 'Pencatat Barang Keluar', 1),
(2, 'Khalil', 'Pencatat Barang Keluar', 1),
(3, 'Kahr', 'Pencatat Barang Keluar', 2),
(4, 'Muhammad alif', 'Pencatat Barang Keluar', 2),
(5, 'Afwa', 'Pencatat Barang Keluar', 3),
(6, 'Akha', 'Pencatat Barang Keluar', 3),
(7, 'Misa', 'Pencatat Barang Keluar', 4),
(8, 'Eka', 'Pencatat Barang Keluar', 4),
(9, 'Awal', 'Pencatat Barang Keluar', 5),
(10, 'Aulia', 'Pencatat Barang Keluar', 5),
(11, 'Arkam', 'Pencatat Barang Keluar', 6),
(12, 'Mark', 'Pencatat Barang Keluar', 6),
(13, 'Jon', 'Pencatat Barang Keluar', 7),
(14, 'Aqs', 'Pencatat Barang Keluar', 7),
(15, 'Dafa', 'Pencatat Barang Keluar', 8),
(16, 'Misa', 'Pencatat Barang Keluar', 8),
(17, 'Kabiq', 'Pencatat Barang Keluar', 9),
(18, 'Fauji', 'Pencatat Barang Keluar', 9),
(19, 'Mawar', 'Pencatat Barang Keluar', 10),
(20, 'Melati', 'Pencatat Barang Keluar', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pencatat_barang_masuk`
--

CREATE TABLE `pencatat_barang_masuk` (
  `id_karyawan` int(4) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pencatat_barang_masuk`
--

INSERT INTO `pencatat_barang_masuk` (`id_karyawan`, `nama_karyawan`, `bidang_kerja`, `id_cabang`) VALUES
(1, 'Sinta', 'Pencatat Barang Masuk', 1),
(2, 'Sera', 'Pencatat Barang Masuk', 1),
(3, 'Kepa', 'Pencatat Barang Masuk', 2),
(4, 'Deka', 'Pencatat Barang Masuk', 2),
(5, 'Andini', 'Pencatat Barang Masuk', 3),
(6, 'Afif', 'Pencatat Barang Masuk', 3),
(7, 'Ali', 'Pencatat Barang Masuk', 4),
(8, 'Alika', 'Pencatat Barang Masuk', 4),
(9, 'Hendra', 'Pencatat Barang Masuk', 5),
(10, 'Farhan', 'Pencatat Barang Masuk', 5),
(11, 'Faiz', 'Pencatat Barang Masuk', 6),
(12, 'Arya', 'Pencatat Barang Masuk', 6),
(13, 'Apip', 'Pencatat Barang Masuk', 7),
(14, 'Reza', 'Pencatat Barang Masuk', 7),
(15, 'Arif', 'Pencatat Barang Masuk', 8),
(16, 'Axl', 'Pencatat Barang Masuk', 8),
(17, 'Rahma', 'Pencatat Barang Masuk', 9),
(18, 'Aliy', 'Pencatat Barang Masuk', 9),
(19, 'Alif', 'Pencatat Barang Masuk', 10),
(20, 'Mia', 'Pencatat Barang Masuk', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id_cabang`);

--
-- Indexes for table `customer_service`
--
ALTER TABLE `customer_service`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `front_office`
--
ALTER TABLE `front_office`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `kepala_cabang`
--
ALTER TABLE `kepala_cabang`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `manajer_keuangan`
--
ALTER TABLE `manajer_keuangan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `manajer_pemasaran`
--
ALTER TABLE `manajer_pemasaran`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `pencatat_barang_keluar`
--
ALTER TABLE `pencatat_barang_keluar`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Indexes for table `pencatat_barang_masuk`
--
ALTER TABLE `pencatat_barang_masuk`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_service`
--
ALTER TABLE `customer_service`
  ADD CONSTRAINT `customer_service_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `front_office`
--
ALTER TABLE `front_office`
  ADD CONSTRAINT `front_office_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `kepala_cabang`
--
ALTER TABLE `kepala_cabang`
  ADD CONSTRAINT `kepala_cabang_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `manajer_keuangan`
--
ALTER TABLE `manajer_keuangan`
  ADD CONSTRAINT `manajer_keuangan_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `manajer_pemasaran`
--
ALTER TABLE `manajer_pemasaran`
  ADD CONSTRAINT `manajer_pemasaran_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `pencatat_barang_keluar`
--
ALTER TABLE `pencatat_barang_keluar`
  ADD CONSTRAINT `pencatat_barang_keluar_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);

--
-- Constraints for table `pencatat_barang_masuk`
--
ALTER TABLE `pencatat_barang_masuk`
  ADD CONSTRAINT `pencatat_barang_masuk_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);
--
-- Database: `laundry`
--
CREATE DATABASE IF NOT EXISTS `laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundry`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAMA`, `NO_TELP`) VALUES
(1, 'PAK DEDY', '081212345678'),
(2, 'JANNA', '085234567890'),
(3, 'FITRI', '082123456789'),
(4, 'ANGELINE', '081345678901'),
(5, 'EKA', '085123456789'),
(6, 'PAK RUDY', '082234567890'),
(7, 'CAHAYA', '081456789012'),
(8, 'IKBAL', '085345678901'),
(9, 'AYU', '082323456789'),
(10, 'WIWI', '081567890123'),
(11, 'GEBI', '085456789012'),
(12, 'WANDI', '082434567890'),
(13, 'LASINRANG', '081678901234'),
(14, 'FAIDY', '085545678901'),
(15, 'TRIFA', '082523456789'),
(16, 'HAYANI', '081789012345'),
(17, 'JEHAN', '085656789012'),
(18, 'ASO', '082634567890'),
(19, 'HAIKAL', '081812345678'),
(20, 'SASA', '085745678901');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID` int(4) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `JENIS_KELAMIN` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID`, `NAMA`, `JENIS_KELAMIN`, `SHIFT`) VALUES
(1, 'Veni', '', 'PAGI'),
(2, 'Vina', '', 'PAGI'),
(3, 'Hera', '', 'PAGI');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `ID` int(11) NOT NULL,
  `NAMA_LAYANAN` varchar(50) DEFAULT NULL,
  `HARGA` int(10) DEFAULT NULL,
  `ESTIMASI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`ID`, `NAMA_LAYANAN`, `HARGA`, `ESTIMASI`) VALUES
(1, 'Cuci Komplit / kg', 8000, '3 Hari'),
(2, 'Cuci lipat / kg', 5000, '3 Hari'),
(3, 'Express Komplit 1 Hari / kg', 12000, '1 Hari'),
(4, 'Express Komplit 6 Jam / kg', 15000, '6 Jam'),
(5, 'Express Komplit 3 Jam / kg', 18000, '3 Jam'),
(6, 'Express Cuci Lipat 1 Hari / kg', 8000, '1 Hari'),
(7, 'Express Cuci Lipat 6 Jam / kg', 10000, '6 Jam'),
(8, 'Express Cuci Lipat 3 Jam / kg', 12000, '3 Jam'),
(9, 'Seprei/Selimut No 1', 15000, '5 Hari'),
(10, 'Seprei/Selimut No 2', 12000, '4 Hari'),
(11, 'Seprei/Selimut No 3', 10000, '3 Hari'),
(12, 'Bedcover No 1', 35000, '5 Hari'),
(13, 'Bedcover No 2', 30000, '4 Hari'),
(14, 'Bedcover No 3', 25000, '3 Hari');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int(11) NOT NULL,
  `TANGGAL_MASUK` date DEFAULT NULL,
  `ID_KARYAWAN` int(11) DEFAULT NULL,
  `ID_CUSTOMER` int(11) DEFAULT NULL,
  `LAYANAN` varchar(50) DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `TANGGAL_KELUAR` date DEFAULT NULL,
  `METODE_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID`, `TANGGAL_MASUK`, `ID_KARYAWAN`, `ID_CUSTOMER`, `LAYANAN`, `JUMLAH`, `HARGA`, `TOTAL`, `TANGGAL_KELUAR`, `METODE_PEMBAYARAN`) VALUES
(1, '0000-00-00', 1, 1, 'Cuci Komplit / kg', 3, 8000, 24000, '0000-00-00', 'CASH'),
(2, '0000-00-00', 1, 2, 'Express Komplit 1 Hari / kg', 1, 12000, 12000, '0000-00-00', 'CASH'),
(3, '0000-00-00', 2, 2, 'Cuci lipat / kg', 3, 5000, 15000, '0000-00-00', 'CASH'),
(5, '0000-00-00', 2, 4, 'Seprei/Selimut No 2', 1, 12000, 12000, '0000-00-00', 'CASH'),
(6, '0000-00-00', 2, 4, 'Express Komplit 1 Hari / kg', 10, 10000, 100000, '0000-00-00', 'CASH'),
(7, '0000-00-00', 2, 4, 'Express Komplit 1 Hari / kg', 14, 10000, 140000, '0000-00-00', 'TRANSFER'),
(8, '0000-00-00', 2, 4, 'Express Komplit 1 Hari / kg', 19, 10000, 190000, '0000-00-00', 'TRANSFER'),
(9, '0000-00-00', 2, 4, 'Bedcover No 1', 1, 35000, 35000, '0000-00-00', 'CASH'),
(10, '0000-00-00', 1, 5, 'Seprei/Selimut No 1', 1, 15000, 15000, '0000-00-00', 'CASH'),
(11, '0000-00-00', 1, 6, 'Cuci Komplit / kg', 5, 5000, 25000, '0000-00-00', 'CASH'),
(12, '0000-00-00', 3, 7, 'Express Komplit 1 Hari / kg', 2, 10000, 20000, '0000-00-00', 'CASH'),
(13, '0000-00-00', 2, 8, 'Seprei/selimut no 3', 2, 10000, 20000, '0000-00-00', 'CASH'),
(14, '0000-00-00', 3, 9, 'Seprei/selimut no 2', 3, 12000, 36000, '0000-00-00', 'CASH'),
(15, '0000-00-00', 3, 10, 'Cuci lipat / kg', 4, 5000, 20000, '0000-00-00', 'CASH'),
(16, '0000-00-00', 2, 11, 'Cuci lipat / kg', 5, 5000, 25000, '0000-00-00', 'CASH'),
(17, '0000-00-00', 1, 12, 'Cuci lipat / kg', 6, 5000, 30000, '0000-00-00', 'CASH'),
(18, '0000-00-00', 2, 13, 'Cuci Komplit / kg', 3, 8000, 24000, '0000-00-00', 'CASH'),
(19, '0000-00-00', 3, 14, 'Cuci Komplit / kg', 5, 8000, 40000, '0000-00-00', 'CASH'),
(20, '0000-00-00', 2, 15, 'Bedcover No 3', 3, 25000, 75000, '0000-00-00', 'CASH'),
(21, '0000-00-00', 2, 16, 'Cuci lipat / kg', 5, 5000, 25000, '0000-00-00', 'CASH'),
(22, '0000-00-00', 1, 17, 'Seprei/selimut no 2', 3, 12000, 36000, '0000-00-00', 'CASH'),
(23, '0000-00-00', 1, 17, 'Cuci Komplit / kg', 3, 8000, 24000, '0000-00-00', 'CASH'),
(24, '0000-00-00', 2, 18, 'Express Komplit 1 Hari / kg', 9, 12000, 108000, '0000-00-00', 'TRANSFER'),
(35, '2024-05-21', 2, 12, 'Cuci lipat / kg', 4, 666666, 2666664, '2024-05-16', 'CASH');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'adhe', 'adhe12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `ID_CUSTOMER` (`ID_CUSTOMER`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID`);
--
-- Database: `laundrys`
--
CREATE DATABASE IF NOT EXISTS `laundrys` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundrys`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `NO_TELP` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `JENIS_KELAMIN` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `ID` int(11) NOT NULL,
  `NAMA_LAYANAN` varchar(50) DEFAULT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `ESTIMASI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`ID`, `NAMA_LAYANAN`, `HARGA`, `ESTIMASI`) VALUES
(1, 'Cuci Mobil', 50000, '1 Jam'),
(2, 'Cuci Motor', 20000, '30 Menit');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int(11) NOT NULL,
  `TANGGAL_MASUK` varchar(10) DEFAULT NULL,
  `ID_KARYAWAN` int(4) DEFAULT NULL,
  `ID_CUSTOMER` int(4) DEFAULT NULL,
  `LAYANAN` varchar(50) DEFAULT NULL,
  `JUMLAH` int(10) DEFAULT NULL,
  `HARGA` int(10) DEFAULT NULL,
  `TOTAL` int(10) DEFAULT NULL,
  `TANGGAL_KELUAR` varchar(10) DEFAULT NULL,
  `METODE_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `ID_CUSTOMER` (`ID_CUSTOMER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID`);
--
-- Database: `laundrys+`
--
CREATE DATABASE IF NOT EXISTS `laundrys+` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundrys+`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `NO_TELP` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAMA`, `NO_TELP`) VALUES
(1, 'PAK DEDY', 2147483647),
(2, 'JANNA', 2147483647),
(3, 'FITRI', 2147483647),
(4, 'ANGELINE', 2147483647),
(5, 'EKA', 2147483647),
(6, 'PAK RUDY', 2147483647),
(7, 'CAHAYA', 2147483647),
(8, 'IKBAL', 2147483647),
(9, 'AYU', 2147483647),
(10, 'WIWI', 2147483647),
(11, 'GEBI', 2147483647),
(12, 'WANDI', 2147483647),
(13, 'LASINRANG', 2147483647),
(14, 'FAIDY', 2147483647),
(15, 'TRIFA', 2147483647),
(16, 'HAYANI', 2147483647),
(17, 'JEHAN', 2147483647),
(18, 'ASO', 2147483647),
(19, 'HAIKAL', 2147483647),
(20, 'SASA', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID` int(4) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `JENIS_KELAMIN` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID`, `NAMA`, `JENIS_KELAMIN`, `SHIFT`) VALUES
(1, 'Veni', '', 'PAGI'),
(2, 'Vina', 'Perempuan', 'Malam'),
(3, 'Hera', 'Perempuan', 'Pagi');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `ID` int(11) NOT NULL,
  `NAMA_LAYANAN` varchar(50) DEFAULT NULL,
  `HARGA` int(10) DEFAULT NULL,
  `ESTIMASI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`ID`, `NAMA_LAYANAN`, `HARGA`, `ESTIMASI`) VALUES
(1, 'Cuci Komplit / kg', 8000, '3 Hari'),
(2, 'Cuci lipat / kg', 5000, '3 Hari'),
(3, 'Express Komplit 1 Hari / kg', 12000, '1 Hari'),
(4, 'Express Komplit 6 Jam / kg', 15000, '6 Jam'),
(5, 'Express Komplit 3 Jam / kg', 18000, '3 Jam'),
(6, 'Express Cuci Lipat 1 Hari / kg', 8000, '1 Hari'),
(7, 'Express Cuci Lipat 6 Jam / kg', 10000, '6 Jam'),
(8, 'Express Cuci Lipat 3 Jam / kg', 12000, '3 Jam'),
(9, 'Seprei/Selimut No 1', 15000, '5 Hari'),
(10, 'Seprei/Selimut No 2', 12000, '4 Hari'),
(11, 'Seprei/Selimut No 3', 10000, '3 Hari'),
(12, 'Bedcover No 1', 35000, '5 Hari'),
(13, 'Bedcover No 2', 30000, '4 Hari'),
(14, 'Bedcover No 3', 25000, '3 Hari');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int(4) NOT NULL,
  `TANGGAL_MASUK` varchar(10) DEFAULT NULL,
  `ID_KARYAWAN` int(4) DEFAULT NULL,
  `ID_CUSTOMER` int(4) DEFAULT NULL,
  `LAYANAN` varchar(50) DEFAULT NULL,
  `JUMLAH` int(10) DEFAULT NULL,
  `HARGA` int(10) DEFAULT NULL,
  `TOTAL` int(10) DEFAULT NULL,
  `TANGGAL_KELUAR` varchar(10) DEFAULT NULL,
  `METODE_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID`, `TANGGAL_MASUK`, `ID_KARYAWAN`, `ID_CUSTOMER`, `LAYANAN`, `JUMLAH`, `HARGA`, `TOTAL`, `TANGGAL_KELUAR`, `METODE_PEMBAYARAN`) VALUES
(1, '4/1/2024', 1, 1, 'Cuci Komplit / kg', 3, 8000, 24000, '4/4/2024', 'CASH'),
(2, '4/1/2024', 1, 2, 'Express Komplit 1 Hari / kg', 1, 12000, 12000, '4/2/2024', 'CASH'),
(3, '4/2/2024', 2, 2, 'Cuci lipat / kg', 3, 5000, 15000, '4/5/2024', 'CASH'),
(5, '4/2/2024', 2, 4, 'Seprei/Selimut No 2', 1, 12000, 12000, '4/6/2024', 'CASH'),
(6, '4/2/2024', 2, 4, 'Express Komplit 1 Hari / kg', 10, 10000, 100000, '4/3/2024', 'CASH'),
(7, '4/3/2024', 2, 4, 'Express Komplit 1 Hari / kg', 14, 10000, 140000, '4/4/2024', 'TRANSFER'),
(8, '4/4/2024', 2, 4, 'Express Komplit 1 Hari / kg', 19, 10000, 190000, '4/5/2024', 'TRANSFER'),
(9, '4/4/2024', 2, 4, 'Bedcover No 1', 1, 35000, 35000, '4/9/2024', 'CASH'),
(10, '4/4/2024', 1, 5, 'Seprei/Selimut No 1', 1, 15000, 15000, '4/9/2024', 'CASH'),
(11, '4/8/2024', 1, 6, 'Cuci Komplit / kg', 5, 5000, 25000, '4/11/2024', 'CASH'),
(12, '4/8/2024', 3, 7, 'Express Komplit 1 Hari / kg', 2, 10000, 20000, '4/9/2024', 'CASH'),
(13, '4/12/2024', 2, 8, 'Seprei/selimut no 3', 2, 10000, 20000, '4/15/2024', 'CASH'),
(14, '4/13/2024', 3, 9, 'Seprei/selimut no 2', 3, 12000, 36000, '4/17/2024', 'CASH'),
(15, '4/14/2024', 3, 10, 'Cuci lipat / kg', 4, 5000, 20000, '4/17/2024', 'CASH'),
(16, '4/14/2024', 2, 11, 'Cuci lipat / kg', 5, 5000, 25000, '4/17/2024', 'CASH'),
(17, '4/18/2024', 1, 12, 'Cuci lipat / kg', 6, 5000, 30000, '4/21/2024', 'CASH'),
(18, '4/19/2024', 2, 13, 'Cuci Komplit / kg', 3, 8000, 24000, '4/22/2024', 'CASH'),
(19, '4/19/2024', 3, 14, 'Cuci Komplit / kg', 5, 8000, 40000, '4/22/2024', 'CASH'),
(20, '4/19/2024', 2, 15, 'Bedcover No 3', 3, 25000, 75000, '4/22/2024', 'CASH'),
(21, '4/19/2024', 2, 16, 'Cuci lipat / kg', 5, 5000, 25000, '4/21/2024', 'CASH'),
(22, '4/19/2024', 1, 17, 'Seprei/selimut no 2', 3, 12000, 36000, '4/23/2024', 'CASH'),
(23, '4/20/2024', 1, 17, 'Cuci Komplit / kg', 3, 8000, 24000, '4/23/2024', 'CASH'),
(24, '4/20/2024', 2, 18, 'Express Komplit 1 Hari / kg', 9, 12000, 108000, '4/21/2024', 'TRANSFER'),
(25, '4/21/2024', 1, 19, 'Cuci lipat / kg', 3, 5000, 15000, '4/24/2024', 'CASH'),
(26, '4/21/2024', 1, 20, 'Cuci lipat / kg', 4, 5000, 20000, '4/24/2024', 'CASH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `ID_CUSTOMER` (`ID_CUSTOMER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID`);
--
-- Database: `laundrys++`
--
CREATE DATABASE IF NOT EXISTS `laundrys++` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundrys++`;
--
-- Database: `laundry_uas`
--
CREATE DATABASE IF NOT EXISTS `laundry_uas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundry_uas`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `NO_TELP` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAMA`, `NO_TELP`) VALUES
(1, 'PAK DEDY', '081212345678'),
(2, 'JANNA', '085234567890'),
(3, 'FITRI', '082123456789'),
(4, 'ANGELINE', '081345678901'),
(5, 'EKA', '085123456789'),
(6, 'PAK RUDY', '082234567890'),
(7, 'CAHAYA', '081456789012'),
(8, 'IKBAL', '085345678901'),
(9, 'AYU', '082323456789'),
(10, 'WIWI', '081567890123'),
(11, 'GEBI', '085456789012'),
(12, 'WANDI', '082434567890'),
(13, 'LASINRANG', '081678901234'),
(14, 'FAIDY', '085545678901'),
(15, 'TRIFA', '082523456789'),
(16, 'HAYANI', '081789012345'),
(17, 'JEHAN', '085656789012'),
(18, 'ASO', '082634567890'),
(19, 'HAIKAL', '081812345678'),
(20, 'SASA', '085745678901');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID` int(11) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `JENIS_KELAMIN` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID`, `NAMA`, `JENIS_KELAMIN`, `SHIFT`) VALUES
(1, 'Veni', 'Perempuan', 'PAGI'),
(2, 'Vina', 'Perempuan', 'MALAM'),
(3, 'Hera', 'Perempuan', 'PAGI');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `ID` int(11) NOT NULL,
  `NAMA_LAYANAN` varchar(50) DEFAULT NULL,
  `HARGA` int(10) DEFAULT NULL,
  `ESTIMASI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`ID`, `NAMA_LAYANAN`, `HARGA`, `ESTIMASI`) VALUES
(1, 'Cuci Komplit / kg', 8000, '3 Hari'),
(2, 'Cuci lipat / kg', 5000, '3 Hari'),
(3, 'Express Komplit 1 Hari / kg', 12000, '1 Hari'),
(4, 'Express Komplit 6 Jam / kg', 15000, '6 Jam'),
(5, 'Express Komplit 3 Jam / kg', 18000, '3 Jam'),
(6, 'Express Cuci Lipat 1 Hari / kg', 8000, '1 Hari'),
(7, 'Express Cuci Lipat 6 Jam / kg', 10000, '6 Jam'),
(8, 'Express Cuci Lipat 3 Jam / kg', 12000, '3 Jam'),
(9, 'Seprei/Selimut No 1', 15000, '5 Hari'),
(10, 'Seprei/Selimut No 2', 12000, '4 Hari'),
(11, 'Seprei/Selimut No 3', 10000, '3 Hari'),
(12, 'Bedcover No 1', 35000, '5 Hari'),
(13, 'Bedcover No 2', 30000, '4 Hari'),
(14, 'Bedcover No 3', 25000, '3 Hari');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int(11) NOT NULL,
  `TANGGAL_MASUK` date DEFAULT NULL,
  `ID_KARYAWAN` int(4) DEFAULT NULL,
  `ID_CUSTOMER` int(4) DEFAULT NULL,
  `LAYANAN` varchar(50) DEFAULT NULL,
  `JUMLAH` int(10) DEFAULT NULL,
  `HARGA` varchar(10) DEFAULT NULL,
  `TOTAL` varchar(10) DEFAULT NULL,
  `TANGGAL_KELUAR` date DEFAULT NULL,
  `METODE_PEMBAYARAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID`, `TANGGAL_MASUK`, `ID_KARYAWAN`, `ID_CUSTOMER`, `LAYANAN`, `JUMLAH`, `HARGA`, `TOTAL`, `TANGGAL_KELUAR`, `METODE_PEMBAYARAN`) VALUES
(1, '2024-04-01', 1, 1, 'Cuci Komplit / kg', 3, '8000', '24000', '2024-04-04', 'CASH'),
(2, '2024-04-01', 1, 2, 'Express Komplit 1 Hari / kg', 1, '12000', '12000', '2024-04-02', 'CASH'),
(3, '2024-04-02', 2, 2, 'Cuci lipat / kg', 3, '5000', '15000', '2024-04-05', 'CASH'),
(4, '2024-04-02', 2, 3, 'Cuci Komplit / kg', 4, '5000', '20000', '2024-04-05', 'CASH'),
(5, '2024-04-02', 2, 4, 'Sepre/Selimut No 2', 1, '12000', '12000', '2024-04-06', 'CASH'),
(6, '2024-04-02', 2, 4, 'Express Komplit 1 Hari / kg', 10, '10000', '100000', '2024-04-03', 'CASH'),
(7, '2024-04-03', 2, 4, 'Express Komplit 1 Hari / kg', 14, '10000', '140000', '2024-04-04', 'TRANSFER'),
(8, '2024-04-04', 2, 4, 'Express Komplit 1 Hari / kg', 19, '10000', '190000', '2024-04-05', 'TRANSFER'),
(9, '2024-04-04', 2, 4, 'Bedcover No 1', 1, '35000', '35000', '2024-04-09', 'CASH'),
(10, '2024-04-04', 1, 5, 'Sepre/Selimut No 1', 1, '15000', '15000', '2024-04-09', 'CASH'),
(11, '2024-04-08', 1, 6, 'Cuci Komplit / kg', 5, '5000', '25000', '2024-04-11', 'CASH'),
(12, '2024-04-08', 3, 7, 'Express Komplit 1 Hari / kg', 2, '10000', '20000', '2024-04-09', 'CASH'),
(13, '2024-04-12', 2, 8, 'Seprei/selimut no 3', 2, '10000', '20000', '2024-04-15', 'CASH'),
(14, '2024-04-13', 3, 9, 'Seprei/selimut no 2', 3, '12000', '36000', '2024-04-17', 'CASH'),
(15, '2024-04-14', 3, 10, 'Cuci lipat / kg', 4, '5000', '20000', '2024-04-17', 'CASH'),
(16, '2024-04-14', 2, 11, 'Cuci lipat / kg', 5, '5000', '25000', '2024-04-17', 'CASH'),
(17, '2024-04-18', 1, 12, 'Cuci lipat / kg', 6, '5000', '30000', '2024-04-21', 'CASH'),
(18, '2024-04-19', 2, 13, 'Cuci Komplit / kg', 3, '8000', '24000', '2024-04-22', 'CASH'),
(19, '2024-04-19', 3, 14, 'Cuci Komplit / kg', 5, '8000', '40000', '2024-04-22', 'CASH'),
(20, '2024-04-19', 2, 15, 'Bedcover No 3', 3, '25000', '75000', '2024-04-22', 'CASH'),
(21, '2024-04-19', 2, 16, 'Cuci lipat / kg', 5, '5000', '25000', '2024-04-21', 'CASH'),
(22, '2024-04-19', 1, 17, 'Seprei/selimut no 2', 3, '12000', '36000', '2024-04-23', 'CASH'),
(23, '2024-04-20', 1, 17, 'Cuci Komplit / kg', 3, '8000', '24000', '2024-04-23', 'CASH'),
(24, '2024-04-20', 2, 18, 'Express Komplit 1 Hari / kg', 9, '12000', '108000', '2024-04-21', 'TRANSFER'),
(25, '2024-04-21', 1, 19, 'Cuci lipat / kg', 3, '5000', '15000', '2024-04-24', 'CASH'),
(26, '2024-04-21', 1, 20, 'Cuci lipat / kg', 4, '5000', '20000', '2024-04-24', 'CASH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `ID_CUSTOMER` (`ID_CUSTOMER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID`);
--
-- Database: `loginregister`
--
CREATE DATABASE IF NOT EXISTS `loginregister` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loginregister`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `mahasiswa`
--
CREATE DATABASE IF NOT EXISTS `mahasiswa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mahasiswa`;

-- --------------------------------------------------------

--
-- Table structure for table `data_diri`
--

CREATE TABLE `data_diri` (
  `no_ktp` int(16) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `domisili` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_diri`
--

INSERT INTO `data_diri` (`no_ktp`, `nama`, `alamat`, `domisili`) VALUES
(123456789, 'fhatiah', 'jalan andi tonro iv', 'Makassar'),
(234567891, 'Baskar', 'Btn pao-pao', 'makassar'),
(345678912, 'Andi Akram', 'Muhajirin', 'Makassar'),
(456789123, 'Satria', 'Cendrawasih', 'Makassar'),
(567891234, 'Marwan', 'Andi tonro', 'Makassar');

-- --------------------------------------------------------

--
-- Table structure for table `data_mahasiswa`
--

CREATE TABLE `data_mahasiswa` (
  `Nomor` int(2) DEFAULT NULL,
  `Stambuk` int(12) NOT NULL,
  `Nama_mahasiswa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_mahasiswa`
--

INSERT INTO `data_mahasiswa` (`Nomor`, `Stambuk`, `Nama_mahasiswa`) VALUES
(1, 1829140003, 'Ardia'),
(2, 1829140006, 'Wahyu Priawansyah'),
(3, 1829140010, 'Bayu Buana Philma'),
(4, 1829141009, 'Muhammad Naufal Ramadhan'),
(5, 1829141012, 'ANDI PUANQI ABUHAQ'),
(6, 1829141014, 'ABDULLAH ASMARA'),
(7, 1829141015, 'Muhammad Arhamul Ihza M.'),
(8, 1829141017, 'PUTRA BAGASWARA RAMADHAN'),
(9, 1829141019, 'ANDI SARIRA TANDIRERUNG'),
(10, 1829141025, 'MUHAMMAD ADHAN TRI PUTRA');

-- --------------------------------------------------------

--
-- Table structure for table `tekom_a`
--

CREATE TABLE `tekom_a` (
  `nama` varchar(50) DEFAULT NULL,
  `panggilan` char(50) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tekom_a`
--

INSERT INTO `tekom_a` (`nama`, `panggilan`, `email`, `jenis_kelamin`) VALUES
('Abd. Rahman', 'Rahman', 'rahman@gmail.com', 'L'),
('Wahyu Priawansyah', 'Wahyu', 'wahyu@gmail.com', 'L'),
('Wahyu Andika', 'Andika', 'andika@gmail.com', 'L'),
('Desta Windasari', 'Desta', 'winda@gmail.com', 'P');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_diri`
--
ALTER TABLE `data_diri`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `data_mahasiswa`
--
ALTER TABLE `data_mahasiswa`
  ADD PRIMARY KEY (`Stambuk`),
  ADD UNIQUE KEY `Nomor` (`Nomor`);

--
-- Indexes for table `tekom_a`
--
ALTER TABLE `tekom_a`
  ADD UNIQUE KEY `panggilan` (`panggilan`,`email`);
--
-- Database: `penjualan`
--
CREATE DATABASE IF NOT EXISTS `penjualan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `penjualan`;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `AGENT_CODE` varchar(6) NOT NULL DEFAULT '',
  `AGENT_NAME` varchar(40) DEFAULT NULL,
  `WORKING_AREA` varchar(35) DEFAULT NULL,
  `COMMISSION` decimal(10,2) DEFAULT NULL,
  `PHONE_NO` varchar(15) DEFAULT NULL,
  `COUNTRY` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`AGENT_CODE`, `AGENT_NAME`, `WORKING_AREA`, `COMMISSION`, `PHONE_NO`, `COUNTRY`) VALUES
('A007  ', 'Ramasundar                              ', 'Bangalore                          ', 0.15, '077-25814763   ', '\r'),
('A003  ', 'Alex                                    ', 'London                             ', 0.13, '075-12458969   ', '\r'),
('A008  ', 'Alford                                  ', 'New York                           ', 0.12, '044-25874365   ', '\r'),
('A011  ', 'Ravi Kumar                              ', 'Bangalore                          ', 0.15, '077-45625874   ', '\r'),
('A010  ', 'Santakumar                              ', 'Chennai                            ', 0.14, '007-22388644   ', '\r'),
('A012  ', 'Lucida                                  ', 'San Jose                           ', 0.12, '044-52981425   ', '\r'),
('A005  ', 'Anderson                                ', 'Brisban                            ', 0.13, '045-21447739   ', '\r'),
('A002  ', 'Mukesh                                  ', 'Mumbai                             ', 0.11, '029-12358964   ', '\r'),
('A006  ', 'McDen                                   ', 'London                             ', 0.15, '078-22255588   ', '\r'),
('A004  ', 'Ivan                                    ', 'Torento                            ', 0.15, '008-22544166   ', '\r'),
('A009  ', 'Benjamin                                ', 'Hampshair                          ', 0.11, '008-22536178   ', '\r');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` varchar(6) NOT NULL DEFAULT '',
  `COMPANY_NAME` varchar(25) DEFAULT NULL,
  `COMPANY_CITY` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `COMPANY_NAME`, `COMPANY_CITY`) VALUES
('18', 'Order All', 'Boston\r'),
('15', 'Jack Hill Ltd', 'London\r'),
('16', 'Akas Foods', 'Delhi\r'),
('17', 'Foodies.', 'London\r'),
('19', 'sip-n-Bite.', 'New York\r');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUST_CODE` varchar(6) NOT NULL,
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` varchar(35) DEFAULT NULL,
  `WORKING_AREA` varchar(35) NOT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` decimal(10,0) DEFAULT NULL,
  `OPENING_AMT` decimal(12,2) NOT NULL,
  `RECEIVE_AMT` decimal(12,2) NOT NULL,
  `PAYMENT_AMT` decimal(12,2) NOT NULL,
  `OUTSTANDING_AMT` decimal(12,2) NOT NULL,
  `PHONE_NO` varchar(17) NOT NULL,
  `AGENT_CODE` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`) VALUES
('C00013', 'Holmes', 'London                             ', 'London', 'UK', 2, 6000.00, 5000.00, 7000.00, 4000.00, 'BBBBBBB', 'A003  '),
('C00001', 'Micheal', 'New York                           ', 'New York', 'USA', 2, 3000.00, 5000.00, 2000.00, 6000.00, 'CCCCCCC', 'A008  '),
('C00020', 'Albert', 'New York                           ', 'New York', 'USA', 3, 5000.00, 7000.00, 6000.00, 6000.00, 'BBBBSBB', 'A008  '),
('C00025', 'Ravindran', 'Bangalore                          ', 'Bangalore', 'India', 2, 5000.00, 7000.00, 4000.00, 8000.00, 'AVAVAVA', 'A011  '),
('C00024', 'Cook', 'London                             ', 'London', 'UK', 2, 4000.00, 9000.00, 7000.00, 6000.00, 'FSDDSDF', 'A006  '),
('C00015', 'Stuart', 'London                             ', 'London', 'UK', 1, 6000.00, 8000.00, 3000.00, 11000.00, 'GFSGERS', 'A003  '),
('C00002', 'Bolt', 'New York                           ', 'New York', 'USA', 3, 5000.00, 7000.00, 9000.00, 3000.00, 'DDNRDRH', 'A008  '),
('C00018', 'Fleming', 'Brisban                            ', 'Brisban', 'Australia', 2, 7000.00, 7000.00, 9000.00, 5000.00, 'NHBGVFC', 'A005  '),
('C00021', 'Jacks', 'Brisban                            ', 'Brisban', 'Australia', 1, 7000.00, 7000.00, 7000.00, 7000.00, 'WERTGDF', 'A005  '),
('C00019', 'Yearannaidu', 'Chennai                            ', 'Chennai', 'India', 1, 8000.00, 7000.00, 7000.00, 8000.00, 'ZZZZBFV', 'A010  '),
('C00005', 'Sasikant', 'Mumbai                             ', 'Mumbai', 'India', 1, 7000.00, 11000.00, 7000.00, 11000.00, '147-25896312', 'A002  '),
('C00007', 'Ramanathan', 'Chennai                            ', 'Chennai', 'India', 1, 7000.00, 11000.00, 9000.00, 9000.00, 'GHRDWSD', 'A010  '),
('C00022', 'Avinash', 'Mumbai                             ', 'Mumbai', 'India', 2, 7000.00, 11000.00, 9000.00, 9000.00, '113-12345678', 'A002  '),
('C00004', 'Winston', 'Brisban                            ', 'Brisban', 'Australia', 1, 5000.00, 8000.00, 7000.00, 6000.00, 'AAAAAAA', 'A005  '),
('C00023', 'Karl', 'London                             ', 'London', 'UK', 0, 4000.00, 6000.00, 7000.00, 3000.00, 'AAAABAA', 'A006  '),
('C00006', 'Shilton', 'Torento                            ', 'Torento', 'Canada', 1, 10000.00, 7000.00, 6000.00, 11000.00, 'DDDDDDD', 'A004  '),
('C00010', 'Charles', 'Hampshair                          ', 'Hampshair', 'UK', 3, 6000.00, 4000.00, 5000.00, 5000.00, 'MMMMMMM', 'A009  '),
('C00017', 'Srinivas', 'Bangalore                          ', 'Bangalore', 'India', 2, 8000.00, 4000.00, 3000.00, 9000.00, 'AAAAAAB', 'A007  '),
('C00012', 'Steven', 'San Jose                           ', 'San Jose', 'USA', 1, 5000.00, 7000.00, 9000.00, 3000.00, 'KRFYGJK', 'A012  '),
('C00008', 'Karolina', 'Torento                            ', 'Torento', 'Canada', 1, 7000.00, 7000.00, 9000.00, 5000.00, 'HJKORED', 'A004  '),
('C00003', 'Martin', 'Torento                            ', 'Torento', 'Canada', 2, 8000.00, 7000.00, 7000.00, 8000.00, 'MJYURFD', 'A004  '),
('C00009', 'Ramesh', 'Mumbai                             ', 'Mumbai', 'India', 3, 8000.00, 7000.00, 3000.00, 12000.00, 'Phone No', 'A002  '),
('C00014', 'Rangarappa', 'Bangalore                          ', 'Bangalore', 'India', 2, 8000.00, 11000.00, 7000.00, 12000.00, 'AAAATGF', 'A001  '),
('C00016', 'Venkatpati', 'Bangalore                          ', 'Bangalore', 'India', 2, 8000.00, 11000.00, 7000.00, 12000.00, 'JRTVFDD', 'A007  '),
('C00011', 'Sundariya', 'Chennai                            ', 'Chennai', 'India', 3, 7000.00, 11000.00, 7000.00, 11000.00, 'PPHGRTS', 'A010  ');

-- --------------------------------------------------------

--
-- Table structure for table `daysorder`
--

CREATE TABLE `daysorder` (
  `ORD_NUM` decimal(6,0) NOT NULL,
  `ORD_AMOUNT` decimal(12,2) NOT NULL,
  `ADVANCE_AMOUNT` decimal(12,2) NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `AGENT_CODE` varchar(6) NOT NULL,
  `ORD_DESCRIPTION` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `daysorder`
--

INSERT INTO `daysorder` (`ORD_NUM`, `ORD_AMOUNT`, `ADVANCE_AMOUNT`, `ORD_DATE`, `CUST_CODE`, `AGENT_CODE`, `ORD_DESCRIPTION`) VALUES
(200107, 4500.00, 900.00, '2008-08-30', 'C00007', 'A010', 'SOD\r'),
(200114, 3500.00, 1500.00, '2008-08-15', 'C00002', 'A008', 'SOD\r'),
(200134, 4200.00, 1800.00, '2008-09-25', 'C00004', 'A005', 'SOD\r'),
(200115, 2000.00, 1200.00, '2008-02-08', 'C00013', 'A013', 'SOD\r'),
(200101, 3000.00, 1000.00, '2008-07-15', 'C00001', 'A008', 'SOD\r'),
(200128, 3500.00, 1500.00, '2008-07-20', 'C00009', 'A002', 'SOD\r'),
(200132, 4000.00, 1500.00, '2008-08-15', 'C00013', 'A013', 'SOD\r');

-- --------------------------------------------------------

--
-- Table structure for table `despatch`
--

CREATE TABLE `despatch` (
  `DES_NUM` varchar(6) NOT NULL DEFAULT '',
  `DES_DATE` date DEFAULT NULL,
  `DES_AMOUNT` decimal(12,2) DEFAULT NULL,
  `ORD_NUM` decimal(6,0) DEFAULT NULL,
  `ORD_DATE` date DEFAULT NULL,
  `ORD_AMOUNT` decimal(12,2) DEFAULT NULL,
  `AGENT_CODE` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `ITEM_ID` varchar(6) NOT NULL DEFAULT '',
  `ITEM_NAME` varchar(25) DEFAULT NULL,
  `ITEM_UNIT` varchar(5) DEFAULT NULL,
  `COMPANY_ID` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`ITEM_ID`, `ITEM_NAME`, `ITEM_UNIT`, `COMPANY_ID`) VALUES
('1', 'Chex Mix', 'Pcs', '16\r'),
('6', 'Cheez-It', 'Pcs', '15\r'),
('2', 'BN Biscuit', 'Pcs', '15\r'),
('3', 'Mighty Munch', 'Pcs', '17\r'),
('4', 'Pot Rice', 'Pcs', '15\r'),
('5', 'Jaffa Cakes', 'Pcs', '18\r'),
('7', 'Salt n Shake', 'Pcs', '\r');

-- --------------------------------------------------------

--
-- Table structure for table `listofitem`
--

CREATE TABLE `listofitem` (
  `ITEMCODE` varchar(6) NOT NULL,
  `ITEMNAME` varchar(25) NOT NULL,
  `BATCHCODE` varchar(35) NOT NULL,
  `CONAME` varchar(35) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `listofitem`
--

INSERT INTO `listofitem` (`ITEMCODE`, `ITEMNAME`, `BATCHCODE`, `CONAME`) VALUES
('I001  ', 'CHOCOLATE                ', 'DM/2007-08/WBM%1                   ', '\r'),
('I003  ', 'HOT DOG                  ', 'DM/2007-08/WB1                     ', 'ABJ ENTERPRISE                     '),
('I002  ', 'CONDENSED MILK           ', 'DM/2007-08/WBM%2                   ', 'ABJ CONCERN                        ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORD_NUM` decimal(6,0) NOT NULL,
  `ORD_AMOUNT` decimal(12,2) NOT NULL,
  `ADVANCE_AMOUNT` decimal(12,2) NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `AGENT_CODE` varchar(6) NOT NULL,
  `ORD_DESCRIPTION` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORD_NUM`, `ORD_AMOUNT`, `ADVANCE_AMOUNT`, `ORD_DATE`, `CUST_CODE`, `AGENT_CODE`, `ORD_DESCRIPTION`) VALUES
(200100, 1000.00, 600.00, '2008-01-08', 'C00015', 'A003  ', 'SOD\r'),
(200110, 3000.00, 500.00, '2008-04-15', 'C00019', 'A010  ', 'SOD\r'),
(200107, 4500.00, 900.00, '2008-08-30', 'C00007', 'A010  ', 'SOD\r'),
(200112, 2000.00, 400.00, '2008-05-30', 'C00016', 'A007  ', 'SOD\r'),
(200113, 4000.00, 600.00, '2008-06-10', 'C00022', 'A002  ', 'SOD\r'),
(200102, 2000.00, 300.00, '2008-05-25', 'C00012', 'A012  ', 'SOD\r'),
(200114, 3500.00, 2000.00, '2008-08-15', 'C00002', 'A008  ', 'SOD\r'),
(200122, 2500.00, 400.00, '2008-09-16', 'C00003', 'A004  ', 'SOD\r'),
(200118, 500.00, 100.00, '2008-07-20', 'C00023', 'A006  ', 'SOD\r'),
(200119, 4000.00, 700.00, '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
(200121, 1500.00, 600.00, '2008-09-23', 'C00008', 'A004  ', 'SOD\r'),
(200130, 2500.00, 400.00, '2008-07-30', 'C00025', 'A011  ', 'SOD\r'),
(200134, 4200.00, 1800.00, '2008-09-25', 'C00004', 'A005  ', 'SOD\r'),
(200115, 2000.00, 1200.00, '2008-02-08', 'C00013', 'A013  ', 'SOD\r'),
(200108, 4000.00, 600.00, '2008-02-15', 'C00008', 'A004  ', 'SOD\r'),
(200103, 1500.00, 700.00, '2008-05-15', 'C00021', 'A005  ', 'SOD\r'),
(200105, 2500.00, 500.00, '2008-07-18', 'C00025', 'A011  ', 'SOD\r'),
(200109, 3500.00, 800.00, '2008-07-30', 'C00011', 'A010  ', 'SOD\r'),
(200101, 3000.00, 1000.00, '2008-07-15', 'C00001', 'A008  ', 'SOD\r'),
(200111, 1000.00, 300.00, '2008-07-10', 'C00020', 'A008  ', 'SOD\r'),
(200104, 1500.00, 500.00, '2008-03-13', 'C00006', 'A004  ', 'SOD\r'),
(200106, 2500.00, 700.00, '2008-04-20', 'C00005', 'A002  ', 'SOD\r'),
(200125, 2000.00, 600.00, '2008-10-10', 'C00018', 'A005  ', 'SOD\r'),
(200117, 800.00, 200.00, '2008-10-20', 'C00014', 'A001  ', 'SOD\r'),
(200123, 500.00, 100.00, '2008-09-16', 'C00022', 'A002  ', 'SOD\r'),
(200120, 500.00, 100.00, '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
(200116, 500.00, 100.00, '2008-07-13', 'C00010', 'A009  ', 'SOD\r'),
(200124, 500.00, 100.00, '2008-06-20', 'C00017', 'A007  ', 'SOD\r'),
(200126, 500.00, 100.00, '2008-06-24', 'C00022', 'A002  ', 'SOD\r'),
(200129, 2500.00, 500.00, '2008-07-20', 'C00024', 'A006  ', 'SOD\r'),
(200127, 2500.00, 400.00, '2008-07-20', 'C00015', 'A003  ', 'SOD\r'),
(200128, 3500.00, 1500.00, '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
(200135, 2000.00, 800.00, '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
(200131, 900.00, 150.00, '2008-08-26', 'C00012', 'A012  ', 'SOD\r'),
(200133, 1200.00, 400.00, '2008-06-29', 'C00009', 'A002  ', 'SOD\r'),
(200132, 4000.00, 2000.00, '2008-08-15', 'C00013', 'A013  ', 'SOD\r');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`AGENT_CODE`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`COMPANY_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD KEY `CUSTCITY` (`CUST_CITY`),
  ADD KEY `CUSTCITY_COUNTRY` (`CUST_CITY`,`CUST_COUNTRY`);

--
-- Indexes for table `despatch`
--
ALTER TABLE `despatch`
  ADD PRIMARY KEY (`DES_NUM`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`ITEM_ID`);

--
-- Indexes for table `listofitem`
--
ALTER TABLE `listofitem`
  ADD UNIQUE KEY `ITEMCODE` (`ITEMCODE`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"crud1\",\"table\":\"checkouts\"},{\"db\":\"crud1\",\"table\":\"keranjangs\"},{\"db\":\"crud1\",\"table\":\"users\"},{\"db\":\"crud1\",\"table\":\"admins\"},{\"db\":\"crud123\",\"table\":\"admins\"},{\"db\":\"crud123\",\"table\":\"users\"},{\"db\":\"test12345\",\"table\":\"users\"},{\"db\":\"webbuku1\",\"table\":\"users\"},{\"db\":\"webbuku1\",\"table\":\"kategoris\"},{\"db\":\"webbuku\",\"table\":\"kategoris\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'uts_basis', 'tb_dokter', '{\"CREATE_TIME\":\"2024-03-26 13:34:34\",\"col_order\":[4,2,0,3,1],\"col_visib\":[1,1,1,1,1]}', '2024-03-26 06:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-29 01:44:46', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pt_makmur`
--
CREATE DATABASE IF NOT EXISTS `pt_makmur` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pt_makmur`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(4) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `harga_jual` int(20) DEFAULT NULL,
  `harga_awal` int(20) DEFAULT NULL,
  `stok` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang` int(4) DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `jumlah_barang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` int(4) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `jumlah_barang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id_cabang` int(4) NOT NULL,
  `nama_cabang` varchar(50) DEFAULT NULL,
  `alamat_cabang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(50) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bidang_kerja` varchar(50) DEFAULT NULL,
  `id_cabang` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id_cabang`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_cabang` (`id_cabang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_cabang`) REFERENCES `cabang` (`id_cabang`);
--
-- Database: `studikasus3`
--
CREATE DATABASE IF NOT EXISTS `studikasus3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `studikasus3`;

-- --------------------------------------------------------

--
-- Table structure for table `biodata`
--

CREATE TABLE `biodata` (
  `no_peserta` int(4) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biodata`
--

INSERT INTO `biodata` (`no_peserta`, `kota`, `tanggal_lahir`) VALUES
(1, 'Makassar', '2004-10-15'),
(2, 'Pare Pare', '2004-05-12'),
(3, 'Pare Pare', '2005-12-11'),
(4, 'Barru', '2002-06-30'),
(5, 'Makassar', '2003-05-26'),
(6, 'Pare Pare', '2001-06-20'),
(7, 'Pare Pare', '2000-10-20'),
(8, 'Pangkep', '2000-10-20'),
(9, 'Pare Pare', '2001-11-02'),
(10, 'Makassar', '2005-10-02'),
(11, 'Barru', '1998-11-02'),
(12, 'Pangkep', '1995-09-03'),
(13, 'Pangkep', '2003-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` int(2) NOT NULL,
  `nama_kursus` varchar(50) DEFAULT NULL,
  `gaji` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`id_gaji`, `nama_kursus`, `gaji`) VALUES
(1, 'Multimedia', 3500000),
(2, 'Menjahit', 3000000),
(3, 'Pemrograman Komputer', 3750000),
(4, 'Desain Digital', 3500000);

-- --------------------------------------------------------

--
-- Table structure for table `kursus`
--

CREATE TABLE `kursus` (
  `id_kursus` int(3) NOT NULL,
  `nama_kursus` varchar(50) DEFAULT NULL,
  `harga_kursus` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kursus`
--

INSERT INTO `kursus` (`id_kursus`, `nama_kursus`, `harga_kursus`) VALUES
(1, 'Multimedia', 2000000),
(2, 'Menjahit', 1500000),
(3, 'Pemrograman Komputer', 3500000),
(4, 'Desain Digital', 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `no_peserta` int(4) NOT NULL,
  `nama_peserta` varchar(50) DEFAULT NULL,
  `id_kursus` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`no_peserta`, `nama_peserta`, `id_kursus`) VALUES
(1, 'Syahrur Adhe Pratama Putra', 3),
(2, 'Ali', 3),
(3, 'Ani', 2),
(4, 'Afni', 2),
(5, 'Muhammad Azzumardi', 3),
(6, 'Cahya Surya', 4),
(7, 'Muhammad Fauzan Dzaki', 4),
(8, 'Laswi Rajata', 2),
(9, 'Almira Wahyuni', 4),
(10, 'Kayla Purnawati', 3),
(11, 'Ahmad Fauzan', 1),
(12, 'Sakinah', 1),
(13, 'Arhan Kaka', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tentor`
--

CREATE TABLE `tentor` (
  `id_tentor` int(2) NOT NULL,
  `nama_tentor` varchar(50) DEFAULT NULL,
  `id_gaji` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tentor`
--

INSERT INTO `tentor` (`id_tentor`, `nama_tentor`, `id_gaji`) VALUES
(1, 'Ferawati', 2),
(2, 'Asmawati', 2),
(3, 'Awalludin', 4),
(4, 'Lahamudin', 1),
(5, 'Ahmad', 3),
(6, 'Yanti', 2),
(7, 'Baso Kaswar', 3),
(8, 'Muh Fauzin', 3),
(9, 'Muh Fauzin', 3),
(10, 'Muh Kasim', 1),
(11, 'Putri', 2),
(12, 'Fatah', 1),
(13, 'Arman', 1),
(14, 'Maulana', 4),
(15, 'Kasim', 4),
(16, 'Ganjar', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodata`
--
ALTER TABLE `biodata`
  ADD KEY `no_peserta` (`no_peserta`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`id_kursus`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`no_peserta`),
  ADD KEY `id_kursus` (`id_kursus`);

--
-- Indexes for table `tentor`
--
ALTER TABLE `tentor`
  ADD PRIMARY KEY (`id_tentor`),
  ADD KEY `id_gaji` (`id_gaji`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biodata`
--
ALTER TABLE `biodata`
  ADD CONSTRAINT `biodata_ibfk_1` FOREIGN KEY (`no_peserta`) REFERENCES `peserta` (`no_peserta`);

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`);

--
-- Constraints for table `tentor`
--
ALTER TABLE `tentor`
  ADD CONSTRAINT `tentor_ibfk_1` FOREIGN KEY (`id_gaji`) REFERENCES `gaji` (`id_gaji`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `Kursi` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `Kasur` char(10) DEFAULT NULL,
  `Lemari` char(10) DEFAULT NULL,
  `Kursi` char(10) NOT NULL,
  `Orang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD KEY `fk0` (`Kursi`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`Kursi`),
  ADD UNIQUE KEY `Kasur` (`Kasur`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `fk0` FOREIGN KEY (`Kursi`) REFERENCES `rumah` (`Kursi`);
--
-- Database: `test12345`
--
CREATE DATABASE IF NOT EXISTS `test12345` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test12345`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kFmSjWzWhigc2xitrG0Or5oMiZMtT9GsEPsyGuEL', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieFU0ZElFT1BIeHBLS3daem1tOGk2TU1KRHdnVlZ6SU9qUmdsRHRDYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Njt9', 1730883929),
('ZVycdk9LJqaZbiY2kKgI6eeBHiy2GQ7uniTsdeuc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWFnRDhvU2N2VGYwSk51RUpMbnVad3lJTzJwOUtlTHFrTzBKdzJBNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731030750);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ade', 'ade123@gmail.com', NULL, '$2y$12$r65zCWYetgVwD9t7vxagZe.X6K3Whmrk34Ia2KPtvIdAL9Nklhu.e', NULL, '2024-11-03 02:35:16', '2024-11-03 02:35:16'),
(2, 'jumar', 'jumar123@gmail.com', NULL, '$2y$12$t731WgAzu3Ez7bM55H/hquBhTwqJ5WLWtAv.VJ8HWqo0p37i6R3gO', NULL, '2024-11-03 02:36:04', '2024-11-03 02:36:04'),
(3, 'admin', 'admin123@gmail.com', NULL, '$2y$12$9NDTGQqciKclpghBm/GyguAEOnFZlakOXtZaVc.Do.v8ldaOYa37O', NULL, '2024-11-03 18:44:10', '2024-11-03 18:44:10'),
(4, 'admin', 'admin121345@gmail.com', NULL, '$2y$12$2vC3/T8gyFh/4NhczbulNu1kNUkQgrqrupgjWb5XR9fDnn/JFc4F.', NULL, '2024-11-03 18:54:56', '2024-11-03 18:54:56'),
(5, 'ade', 'jumar1@gmail.com', NULL, '$2y$12$OwOGLU0ty5KAzw4qS3eIKehPNhMcYT.QYrRJQAy4FXLGv2kyR6Ite', NULL, '2024-11-05 23:07:24', '2024-11-05 23:07:24'),
(7, 'user1', 'user12345@gmail.com', NULL, '$2y$12$YJBvnQQvNmfozPbe5Lq88O3o5q4pw3ljNtQOaPpItoRPRbRc7D6eK', NULL, '2024-11-07 17:51:41', '2024-11-07 17:51:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `testt123`
--
CREATE DATABASE IF NOT EXISTS `testt123` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `testt123`;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `berat` decimal(8,2) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `sampul`, `judul_buku`, `penerbit`, `penulis`, `tahun`, `isbn`, `harga`, `stok`, `berat`, `halaman`, `sinopsis`, `created_at`, `updated_at`) VALUES
(4, 'OjVCRyAe8rwVMpSttApmvnIMkNxsqUgIu0toqG9R.jpg', 'NARUTO', 'sahida', 'sahida', '2012', '3213242349', 40000.00, 99, 233.00, 100, 'dand,and,am,da,ndm,amdna,ndanda,da,mdnadmadnabdnabdmnabdandanmdbmnabdnmbanmdbmanbdmnadnadadnadbbdmandmnadmabdmnnbdbamdbmnabdmnabdmnbdbamnbdmbdmnbadmbadddjjfbnbmanbbnabda', '2024-11-09 05:45:09', '2024-11-09 05:45:09'),
(5, 'axgpYesTG1C21Dlxq4WEuKD92F33FYoBGRxlnCKx.jpg', 'NARUTO', 'sahida', 'ELSA', '2012', '232399183', 20000.00, 99, 200.00, 300, 'sdhsjadhjadadsdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2024-11-09 05:46:22', '2024-11-09 05:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_06_140529_create_bukus_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('iRBc4NEsITS0i2OHTuQ7N9FRj8X1U0IjKORPbwzc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGh3U1hRUG13ZDE2b0RIVno1c1hWRndJdHpkUjBBVk5OZ1ZBR2ZDSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9CdWt1LzQvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731160195);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_isbn_unique` (`isbn`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `tokobuku`
--
CREATE DATABASE IF NOT EXISTS `tokobuku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tokobuku`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alamats`
--

CREATE TABLE `alamats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` bigint(20) UNSIGNED NOT NULL,
  `nama_penerima` varchar(255) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sampul`)),
  `judul` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tahun_terbit` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `sinopsis` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_21_144553_create_kategoris_table', 1),
(5, '2024_10_21_144606_create_bukus_table', 1),
(6, '2024_10_21_144626_create_pesanans_table', 2),
(7, '2024_10_21_144724_create_pesanan_bukus_table', 2),
(8, '2024_10_21_144735_create_alamats_table', 2),
(9, '2024_10_21_145345_create_admins_table', 2),
(10, '2024_10_21_163108_add_deleted_at_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_harga` decimal(15,2) DEFAULT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `status_pembayaran` varchar(255) DEFAULT NULL,
  `status_pengiriman` enum('TERTUNDA','SUKSES','PENGIRIMAN','DIANTAR','BATAL') DEFAULT NULL,
  `mata_uang` varchar(255) NOT NULL DEFAULT 'IDR',
  `ongkir` decimal(10,2) DEFAULT NULL,
  `metode_pengiriman` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_bukus`
--

CREATE TABLE `pesanan_bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `harga` decimal(10,2) DEFAULT NULL,
  `berat` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('u0rbqxGpYo9lTujwB9rMwlgQOwEq0A06Bx6iY9fU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo3OntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3VzZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo2OiJfdG9rZW4iO3M6NDA6IkdQVUdYMU5oNVEwbVo0bE02TENwejNXd04zbG9Kd1NjWno3VlNTYWEiO3M6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkRGMxTVNSVnJabTlOTlk5TmtJWURZLmg5bjRCaG4uUzliUXAuR2RtWDZuZEN2ZC52ZjI4bmUiO3M6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1729531698);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin1', 'admin123@gmail.com', NULL, '$2y$12$Dc1MSRVrZm9NNY9NkIYDY.h9n4Bhn.S9bQp.GdmX6ndCvd.vf28ne', 'Knq0zWGFrg1FKU0JZGMkGHzQ0UrwhpcfXJXAjd0COHDDMKXkPdfz0aulphE0', '2024-10-21 08:02:29', '2024-10-21 08:32:48', NULL),
(2, 'Budi', 'budi123@gmail.com', NULL, '$2y$12$hAYxO3bubJWYyB2Ew/W7FeAVhxTu.kxGrdqDU0.IgTPnuOskTEEKq', NULL, '2024-10-21 08:53:07', '2024-10-21 08:59:58', '2024-10-21 08:59:58'),
(3, 'Budi', 'bdi123@gmail.com', NULL, '$2y$12$o/SPkiCqUdE18Kq0MhX8A.igS65YJeaGk0PhzIaLDI.uhBeGS0HR6', NULL, '2024-10-21 09:03:13', '2024-10-21 09:03:13', NULL),
(5, 'Non - Fiksi', 'ade@gmail.com', NULL, '$2y$12$h2t3bMrZYOW7Q0Bto69k0uqmKnK630HcqKjcH9xFHCMuOSk6YQaiy', NULL, '2024-10-21 09:08:33', '2024-10-21 09:08:33', NULL),
(6, 'addeed', 'ade12345@gmail.com', NULL, '$2y$12$MjFEX6AVoNnRBy.nfC.3MeiB5NxUAU/4.QG7udwAcHJPkKLZQPPv6', NULL, '2024-10-21 09:09:27', '2024-10-21 09:09:27', NULL),
(7, 'yyyyy', 'ad2222222e@gmail.com', NULL, '$2y$12$zuFbdEq2C/hUj3eNLcWB3OJ9B2ahXnksmO1DaYZtZF5eiv3juJeKm', NULL, '2024-10-21 09:11:00', '2024-10-21 09:11:00', NULL),
(8, 'sdsdjsd', 'dhsdhs@gmail.com', NULL, '$2y$12$Dgf9FOorxQsolAFt2AemxOuSaN210HrIEYaezYBH3jhrxydrGqhTS', NULL, '2024-10-21 09:15:44', '2024-10-21 09:15:44', NULL),
(9, 'dsdsdsfsdf', 'fsadfsdfsadfsd@gmail.com', NULL, '$2y$12$RmWmoa2SWAqiTiERL9Af/uRDMvLtSi8YHhanoiy8ElDNh4Rka.Edq', NULL, '2024-10-21 09:17:40', '2024-10-21 09:17:40', NULL),
(10, 'dsdsdsfsdffxdf', 'fsadfsadfsd@gmail.com', NULL, '$2y$12$5IkVfM2Xbclm0kr1y1PPNOqNbaiEEN5N5omIrvwMMCaxQQYw8HIeq', NULL, '2024-10-21 09:19:34', '2024-10-21 09:19:34', NULL),
(11, 'sdasda', 'busdasdi123@gmail.com', NULL, '$2y$12$6OI4LWFfYxNr.6wB5Fc3pO5io4skwW7IM05h2gnZX6pkDKl44Zs26', NULL, '2024-10-21 09:21:44', '2024-10-21 09:21:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `alamats`
--
ALTER TABLE `alamats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alamats_pesanan_id_foreign` (`pesanan_id`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bukus_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanans_user_id_foreign` (`user_id`);

--
-- Indexes for table `pesanan_bukus`
--
ALTER TABLE `pesanan_bukus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_bukus_pesanan_id_foreign` (`pesanan_id`),
  ADD KEY `pesanan_bukus_buku_id_foreign` (`buku_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alamats`
--
ALTER TABLE `alamats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan_bukus`
--
ALTER TABLE `pesanan_bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamats`
--
ALTER TABLE `alamats`
  ADD CONSTRAINT `alamats_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD CONSTRAINT `pesanans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pesanan_bukus`
--
ALTER TABLE `pesanan_bukus`
  ADD CONSTRAINT `pesanan_bukus_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesanan_bukus_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`) ON DELETE CASCADE;
--
-- Database: `uts`
--
CREATE DATABASE IF NOT EXISTS `uts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uts`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `Kd_dokter` varchar(5) NOT NULL,
  `Nama_dokter` varchar(50) DEFAULT NULL,
  `Kd_spesialis` varchar(5) DEFAULT NULL,
  `Telepon` int(12) DEFAULT NULL,
  `Jenis_kelamin` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_dokter`
--

INSERT INTO `tb_dokter` (`Kd_dokter`, `Nama_dokter`, `Kd_spesialis`, `Telepon`, `Jenis_kelamin`) VALUES
('D01', 'Dr.Sari', 'UMM', 2147483647, 'W'),
('D02', 'Dr.Sukma', 'DLM', 2147483647, 'W'),
('D03', 'Dr.Shinta', 'BDH', 2147483647, 'W'),
('D04', 'Dr.Dadang', 'JTG', 2147483647, 'P'),
('D05', 'Dr.Henni', 'KDG', 2147483647, 'w'),
('D06', 'Dr.Haruna', 'SRF', 2147483647, 'P'),
('D07', 'Dr.Herwin', 'MAT', 2147483647, 'P'),
('D08', 'Dr.Salmiah', 'ANK', 888888888, 'W'),
('D09', 'Dr.Darmiani', 'UMM', 2147483647, 'W'),
('D10', 'Dr.Darmiani', 'UMM', 2147483647, 'W'),
('D11', 'Dr.Andriyani', 'UMM', 2147483647, 'W'),
('D12', 'Dr.Firman', 'BDH', 2147483647, 'P'),
('D13', 'Dr.Balqis', 'ANK', 2147483647, 'W'),
('D14', 'Dr.Agus', 'UMM', 2147483647, 'P'),
('D15', 'Dr.Andin', 'KDG', 2147483647, 'W'),
('D16', 'Dr.Labala', 'BDH', 2147483647, 'P'),
('D17', 'Dr.Fauzi', 'BDH', 2147483647, 'P'),
('D18', 'Dr.Neneng', 'KDG', 2147483647, 'W');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jaga`
--

CREATE TABLE `tb_jaga` (
  `Kd_dokter` varchar(5) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `Jam_mulai` varchar(4) DEFAULT NULL,
  `Jam_selesai` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_jaga`
--

INSERT INTO `tb_jaga` (`Kd_dokter`, `hari`, `Jam_mulai`, `Jam_selesai`) VALUES
('D01', 'senin', '08:1', '12:1'),
('D09', 'senin', '12:1', '16:3'),
('D11', 'senin', '17:3', '20:0'),
('D03', 'Selasa', '08:1', '16:0'),
('D08', 'Selasa', '16:0', '21:0'),
('D04', 'Selasa', '08:1', '20:0'),
('D05', 'Selasa', '08:1', '14:0'),
('D15', 'Selasa', '14:0', '20:0'),
('D13', 'Rabu', '08:1', '12:0'),
('D12', 'Rabu', '08:1', '14:0'),
('D16', 'Rabu', '14:0', '21:0'),
('D14', 'Rabu', '08:1', '14:0'),
('D06', 'Kamis', '08:1', '14:0'),
('D07', 'jumat', '08:1', '11:3'),
('D10', 'Sabtu', '08:1', '14:0'),
('D02', 'Minggu', '09:0', '14:0');

-- --------------------------------------------------------

--
-- Table structure for table `tb_spesialis`
--

CREATE TABLE `tb_spesialis` (
  `Kd_spesialis` varchar(5) NOT NULL,
  `Spesialis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_spesialis`
--

INSERT INTO `tb_spesialis` (`Kd_spesialis`, `Spesialis`) VALUES
('ANK', 'Anak'),
('BDH', 'Bedah'),
('DLM', 'Penyakit dalam'),
('GIG', 'Gigi'),
('JTG', 'Jantung'),
('KDG', 'Kandungan'),
('KLT', 'Kulit'),
('MAT', 'Mata'),
('SRF', 'Saraf'),
('THT', 'Telinga hidung dan tenggorakan'),
('UMM', 'Dokter Umum');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`Kd_dokter`),
  ADD KEY `Kd_spesialis` (`Kd_spesialis`);

--
-- Indexes for table `tb_jaga`
--
ALTER TABLE `tb_jaga`
  ADD KEY `Kd_dokter` (`Kd_dokter`);

--
-- Indexes for table `tb_spesialis`
--
ALTER TABLE `tb_spesialis`
  ADD PRIMARY KEY (`Kd_spesialis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD CONSTRAINT `tb_dokter_ibfk_1` FOREIGN KEY (`Kd_spesialis`) REFERENCES `tb_spesialis` (`Kd_spesialis`);

--
-- Constraints for table `tb_jaga`
--
ALTER TABLE `tb_jaga`
  ADD CONSTRAINT `tb_jaga_ibfk_1` FOREIGN KEY (`Kd_dokter`) REFERENCES `tb_dokter` (`Kd_dokter`);
--
-- Database: `uts_basis`
--
CREATE DATABASE IF NOT EXISTS `uts_basis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uts_basis`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `Kd_spesialis` varchar(5) DEFAULT NULL,
  `Jenis_kelamin` char(1) DEFAULT NULL,
  `Nama_dokter` varchar(50) DEFAULT NULL,
  `Telepon` int(12) DEFAULT NULL,
  `Kd_dokter` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_dokter`
--

INSERT INTO `tb_dokter` (`Kd_spesialis`, `Jenis_kelamin`, `Nama_dokter`, `Telepon`, `Kd_dokter`) VALUES
('UMM', 'W', 'Dr.Sari', 2147483647, 'D01'),
('DLM', 'W', 'Dr.Sukma', 2147483647, 'D02'),
('BDH', 'W', 'Dr.Shinta', 2147483647, 'D03'),
('JTG', 'P', 'Dr.Dadang', 2147483647, 'D04'),
('KDG', 'w', 'Dr.Henni', 2147483647, 'D05'),
('SRF', 'P', 'Dr.Haruna', 2147483647, 'D06'),
('MAT', 'P', 'Dr.Herwin', 2147483647, 'D07'),
('ANK', 'W', 'Dr.Salmiah', 888888888, 'D08'),
('UMM', 'W', 'Dr.Darmiani', 2147483647, 'D09'),
('BDH', 'P', 'Dr.Hendra', 2147483647, 'D10'),
('UMM', 'W', 'Dr.Andriyani', 2147483647, 'D11'),
('BDH', 'P', 'Dr.Firman', 2147483647, 'D12'),
('ANK', 'W', 'Dr.Balqis', 2147483647, 'D13'),
('UMM', 'P', 'Dr.Agus', 2147483647, 'D14'),
('KDG', 'W', 'Dr.Andin', 2147483647, 'D15'),
('BDH', 'P', 'Dr.Labala', 2147483647, 'D16'),
('BDH', 'P', 'Dr.Fauzi', 2147483647, 'D17'),
('KDG', 'W', 'Dr.Neneng', 2147483647, 'D18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jaga`
--

CREATE TABLE `tb_jaga` (
  `Kd_dokter` varchar(5) DEFAULT NULL,
  `hari` varchar(50) DEFAULT NULL,
  `Jam_mulai` varchar(4) DEFAULT NULL,
  `Jam_selesai` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_spesialis`
--

CREATE TABLE `tb_spesialis` (
  `Kd_spesialis` varchar(5) NOT NULL,
  `Spesialis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_spesialis`
--

INSERT INTO `tb_spesialis` (`Kd_spesialis`, `Spesialis`) VALUES
('ANK', 'Anak'),
('BDH', 'Bedah'),
('DLM', 'Penyakit dalam'),
('GIG', 'Gigi'),
('JTG', 'Jantung'),
('KDG', 'Kandungan'),
('KLT', 'Kulit'),
('MAT', 'Mata'),
('SRF', 'Saraf'),
('THT', 'Telinga hidung dan tenggorakan'),
('UMM', 'Dokter Umum');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`Kd_dokter`),
  ADD KEY `Kd_spesialis` (`Kd_spesialis`);

--
-- Indexes for table `tb_jaga`
--
ALTER TABLE `tb_jaga`
  ADD KEY `Kd_dokter` (`Kd_dokter`);

--
-- Indexes for table `tb_spesialis`
--
ALTER TABLE `tb_spesialis`
  ADD PRIMARY KEY (`Kd_spesialis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD CONSTRAINT `tb_dokter_ibfk_1` FOREIGN KEY (`Kd_spesialis`) REFERENCES `tb_spesialis` (`Kd_spesialis`);

--
-- Constraints for table `tb_jaga`
--
ALTER TABLE `tb_jaga`
  ADD CONSTRAINT `tb_jaga_ibfk_1` FOREIGN KEY (`Kd_dokter`) REFERENCES `tb_dokter` (`Kd_dokter`);
--
-- Database: `webbuku`
--
CREATE DATABASE IF NOT EXISTS `webbuku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webbuku`;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `berat` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1730396568),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1730396568;', 1730396568);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_31_150923_create_kategoris_table', 1),
(5, '2024_10_31_150940_create_bukus_table', 1),
(6, '2024_10_31_151350_create_penulis_table', 1),
(7, '2024_10_31_151356_create_penerbits_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerbits`
--

CREATE TABLE `penerbits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama penerbit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Nama penulis` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3A8zhwQjbw35aob6ZV0kFwHILYPJO3cxeVhuVlxa', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicDM3T29ROGEyTEg5ZVBGUzVrcm1hMFZDcmlLM25WaFM2bkVNVWNPRiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4va2F0ZWdvcmkvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJE5LUFZVNkN4cWtMSGFTLjZvNEE0YnV4SEZEMmdLLzdsN09tRjRoNFFJb3pybjVqU3pWbjBDIjt9', 1730396524);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin123@gmail.com', NULL, '$2y$12$NKPVU6CxqkLHaS.6o4A4buxHFD2gK/7l7OmF4h4QIozrn5jSzVn0C', NULL, '2024-10-31 09:41:30', '2024-10-31 09:41:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bukus_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penerbits`
--
ALTER TABLE `penerbits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penerbits`
--
ALTER TABLE `penerbits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`);
--
-- Database: `webbuku1`
--
CREATE DATABASE IF NOT EXISTS `webbuku1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `webbuku1`;

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampul` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `berat` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_31_174655_create_kategoris_table', 1),
(5, '2024_10_31_180509_create_bukus_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1y4Yfd1LaD1ZPKDZ7sTwXy4aKwZhEWR51HrYl1vL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFpCY3VqMXhtQmxPNEw3RjJLY3IzRkV3dm9LZXFpd2Iyc2dmc204RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731383519),
('Fk1zjar4R9mjWGoR9QAEuOGeyq8LpNZg9tHy87yx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXdMaEE1cWJGWWRhUHB1S2lPNkg0eDhlYW9BaWZ0bWJUVjZEeGZiYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731392266),
('J7WU5ECY3sPHemxfvKjvRSRqpWuj6mVH7q5p3vYh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWlkMTMyOEViT3ltZVh4Zk5nU1BmR1VPT3VYMUt3eW1jTHRYNDRnYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1731324342);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'jumar', 'jumar@gmail.com', NULL, '$2y$12$oY90MAcrVdcut4z926LLfOzX5fV.SHppc4LQz1oJSBelnB4n2/DzG', NULL, '2024-11-11 03:13:28', '2024-11-11 03:13:28'),
(2, 'JUMAR TAEK', 'admin12345@gmail.com', NULL, '$2y$12$ySYLyTLIYSeBa5N4LJFZnu422j7VSVlZ5K4p7qXK.wU/zNQpz97He', NULL, '2024-11-11 03:19:15', '2024-11-11 03:19:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bukus_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
