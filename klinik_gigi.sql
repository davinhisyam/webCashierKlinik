-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 07:58 AM
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
-- Database: `klinik_gigi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(255) NOT NULL,
  `nama_dokter` varchar(255) NOT NULL,
  `notlp_dokter` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kalkulasi`
--

CREATE TABLE `kalkulasi` (
  `id_kalkulasi` int(255) NOT NULL,
  `id_transaksi` int(255) NOT NULL,
  `gj_dokter` float NOT NULL,
  `gj_perawat` float NOT NULL,
  `gj_karyawan` float NOT NULL,
  `pajak` float NOT NULL,
  `sewa` float NOT NULL,
  `bahan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(255) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `notlp_karyawan` varchar(255) NOT NULL,
  `nik_karyawan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(255) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `no_wa_pasien` varchar(255) NOT NULL,
  `nik_pasien` varchar(255) NOT NULL,
  `alamat_pasien` varchar(255) NOT NULL,
  `riwayat` varchar(255) NOT NULL,
  `jenis_kelamin` tinyint NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penanganan_pasien`
--

CREATE TABLE `penanganan_pasien` (
  `id_penanganan` int(255) NOT NULL,
  `id_pasien` int(255) NOT NULL,
  `keluhan` varchar(255) NOT NULL,
  `id_tindakan` int(255) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` int(255) NOT NULL,
  `nama_perawat` varchar(255) NOT NULL,
  `notlp_perawat` int(255) NOT NULL,
  `nik_perawat` int(255) NOT NULL,
  `alamat_perawat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE `tindakan` (
  `id_tindakan` int(255) NOT NULL,
  `jenis_tindakan` varchar(255) NOT NULL,
  `harga_tindakan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(255) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jam_transaksi` time NOT NULL,
  `id_penanganan` int(255) NOT NULL,
  `id_dokter` int(255) NOT NULL,
  `id_perawat` int(255) NOT NULL,
  `id_karyawan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `nama_dokter` (`nama_dokter`,`notlp_dokter`),
  ADD KEY `nama_dokter_2` (`nama_dokter`,`notlp_dokter`);

--
-- Indexes for table `kalkulasi`
--
ALTER TABLE `kalkulasi`
  ADD PRIMARY KEY (`id_kalkulasi`),
  ADD KEY `id_transaksi` (`id_transaksi`,`gj_dokter`,`gj_perawat`,`gj_karyawan`,`pajak`,`sewa`,`bahan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `nama_karyawan` (`nama_karyawan`,`notlp_karyawan`,`nik_karyawan`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `penanganan_pasien`
--
ALTER TABLE `penanganan_pasien`
  ADD PRIMARY KEY (`id_penanganan`),
  ADD KEY `id_pasien` (`id_pasien`,`keluhan`,`id_tindakan`,`tanggal`,`jam`),
  ADD KEY `id_tindakan` (`id_tindakan`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`),
  ADD KEY `nama_perawat` (`nama_perawat`,`notlp_perawat`,`nik_perawat`,`alamat_perawat`);

--
-- Indexes for table `tindakan`
--
ALTER TABLE `tindakan`
  ADD PRIMARY KEY (`id_tindakan`),
  ADD KEY `jenis_tindakan` (`jenis_tindakan`,`harga_tindakan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `tanggal_transaksi` (`tanggal_transaksi`,`jam_transaksi`,`id_penanganan`,`id_dokter`,`id_perawat`,`id_karyawan`),
  ADD KEY `id_penanganan` (`id_penanganan`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_perawat` (`id_perawat`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kalkulasi`
--
ALTER TABLE `kalkulasi`
  MODIFY `id_kalkulasi` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penanganan_pasien`
--
ALTER TABLE `penanganan_pasien`
  MODIFY `id_penanganan` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perawat`
--
ALTER TABLE `perawat`
  MODIFY `id_perawat` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tindakan`
--
ALTER TABLE `tindakan`
  MODIFY `id_tindakan` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kalkulasi`
--
ALTER TABLE `kalkulasi`
  ADD CONSTRAINT `kalkulasi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `penanganan_pasien`
--
ALTER TABLE `penanganan_pasien`
  ADD CONSTRAINT `penanganan_pasien_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON UPDATE CASCADE,
  ADD CONSTRAINT `penanganan_pasien_ibfk_2` FOREIGN KEY (`id_tindakan`) REFERENCES `tindakan` (`id_tindakan`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_penanganan`) REFERENCES `penanganan_pasien` (`id_penanganan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_perawat`) REFERENCES `perawat` (`id_perawat`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);
COMMIT;

CREATE TABLE login
( 'username' VARCHAR(10) NOT NULL,
  'password' VARCHAR(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
