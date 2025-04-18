-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 08:46 AM
-- Server version: 8.0.40
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasirdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_brg` varchar(6) NOT NULL,
  `nm_brg` varchar(16) NOT NULL,
  `jenis` varchar(12) NOT NULL,
  `hargabeli` int NOT NULL,
  `hargajual` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_brg`, `nm_brg`, `jenis`, `hargabeli`, `hargajual`) VALUES
('000001', 'Kue Tar', 'Makanan', 10000, 12000),
('000002', 'Teh Sisri', 'Minuman', 2000, 3000),
('000003', 'Oreo', 'Makanan', 5000, 7000),
('000004', 'Kopi Gula Aren', 'Minuman', 10000, 15000),
('000006', 'Thai Tea', 'Minuman', 9000, 13000);

-- --------------------------------------------------------

--
-- Table structure for table `isi`
--

CREATE TABLE `isi` (
  `id_nota` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kd_brg` varchar(6) NOT NULL,
  `hb` int NOT NULL,
  `hj` int NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `isi`
--

INSERT INTO `isi` (`id_nota`, `kd_brg`, `hb`, `hj`, `qty`) VALUES
('NOTA0001', '000001', 10000, 12000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nm_kasir` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `no_telepon` varchar(12) NOT NULL,
  `agama` varchar(12) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `jenis_kelamin`, `no_telepon`, `agama`, `alamat`, `password`) VALUES
('000001', 'Wildan Ari', 'Laki- laki', '085213279978', 'Islam', 'Jl Muara Dalam 1', '123'),
('000002', 'a', 'Laki- laki', '085213279977', 'Islam', 'Jl Muara Dalam 1', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_plgn` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nmplgn` varchar(16) NOT NULL,
  `jenis_kelamin` varchar(12) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_plgn`, `nmplgn`, `jenis_kelamin`, `telepon`, `alamat`) VALUES
('000001', 'Wildan', 'Laki-Laki', '085213279978', 'Jl Muara Dalam'),
('000002', 'Ari', 'Laki-Laki', '0852123123', 'Jl. Niim 2'),
('000003', 'Leksono', 'Laki-Laki', '085213278867', 'Jl Fatahilha');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_nota` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_nota` date NOT NULL,
  `id_plgn` varchar(6) NOT NULL,
  `id_kasir` varchar(6) NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_nota`, `tgl_nota`, `id_plgn`, `id_kasir`, `total`) VALUES
('NOTA0001', '2025-04-18', '000001', '000002', 24000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `isi`
--
ALTER TABLE `isi`
  ADD KEY `id_nota` (`id_nota`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_plgn`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_pelanggan` (`id_plgn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `id_nota` FOREIGN KEY (`id_nota`) REFERENCES `penjualan` (`id_nota`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `kd_brg` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `id_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_pelanggan` FOREIGN KEY (`id_plgn`) REFERENCES `pelanggan` (`id_plgn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
