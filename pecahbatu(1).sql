-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 10:59 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pecahbatu`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangmasuk`
--

CREATE TABLE `tbl_barangmasuk` (
  `id_barangmasuk` varchar(11) NOT NULL,
  `plat_nomor` varchar(15) NOT NULL,
  `kubik_batu` double NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `id_admin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_harga`
--

CREATE TABLE `tbl_harga` (
  `id_harga` int(11) NOT NULL,
  `list_harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_harga`
--

INSERT INTO `tbl_harga` (`id_harga`, `list_harga`) VALUES
(1, 1000000),
(2, 2000000),
(3, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenisbatu`
--

CREATE TABLE `tbl_jenisbatu` (
  `id_jenis` int(11) NOT NULL,
  `jenis_batu` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jenisbatu`
--

INSERT INTO `tbl_jenisbatu` (`id_jenis`, `jenis_batu`, `image`) VALUES
(1, '2/5', NULL),
(2, '3/5', ''),
(3, 'Abu Batu', NULL),
(4, '1/1', NULL),
(5, '1/2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kaskeluar`
--

CREATE TABLE `tbl_kaskeluar` (
  `id_kaskeluar` int(11) NOT NULL,
  `nama_kas` text NOT NULL,
  `jumlah_keluar` int(20) NOT NULL,
  `tanggal_kaskeluar` date NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_admin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `id_penjualan` varchar(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `id_koral` int(10) NOT NULL,
  `jumlah_kubik` double NOT NULL,
  `harga` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `jam_penjualan` time NOT NULL,
  `id_admin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perusahaan`
--

CREATE TABLE `tbl_perusahaan` (
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_perusahaan` varchar(255) NOT NULL,
  `Deskripsi_perusahaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_perusahaan`
--

INSERT INTO `tbl_perusahaan` (`nama_perusahaan`, `alamat_perusahaan`, `Deskripsi_perusahaan`) VALUES
('Fussion X Official', 'Blitar Barat', 'Perusahaan ini bergerak pada bidang penjualan batu kerikil');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roleuser`
--

CREATE TABLE `tbl_roleuser` (
  `id_role` int(10) NOT NULL,
  `nama_role` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roleuser`
--

INSERT INTO `tbl_roleuser` (`id_role`, `nama_role`, `user`) VALUES
(1, 'superadmin', ''),
(2, 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setupapp`
--

CREATE TABLE `tbl_setupapp` (
  `id_setup` int(11) NOT NULL,
  `nama_setup` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2022-03-11 21:11:40'),
(3, 'erga', 'ad4b707159746ee2d0669a494439fb56', 1, '2022-03-12 08:13:22'),
(5, 'mustafiye', 'c20ad4d76fe97759aa27a0c99bff6710', 2, '2022-03-12 10:07:51'),
(6, 'ipul', '81dc9bdb52d04dc20036dbd8313ed055', 2, '2022-03-12 13:42:25'),
(9, 'yogi', '81dc9bdb52d04dc20036dbd8313ed055', 2, '2022-03-16 01:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userlog`
--

CREATE TABLE `tbl_userlog` (
  `id_userlog` int(11) NOT NULL,
  `id_user` int(10) NOT NULL,
  `logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  ADD PRIMARY KEY (`id_barangmasuk`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `tbl_harga`
--
ALTER TABLE `tbl_harga`
  ADD PRIMARY KEY (`id_harga`);

--
-- Indexes for table `tbl_jenisbatu`
--
ALTER TABLE `tbl_jenisbatu`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  ADD PRIMARY KEY (`id_kaskeluar`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_koral` (`id_koral`),
  ADD KEY `id_harga` (`harga`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `tbl_roleuser`
--
ALTER TABLE `tbl_roleuser`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `tbl_setupapp`
--
ALTER TABLE `tbl_setupapp`
  ADD PRIMARY KEY (`id_setup`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `tbl_userlog`
--
ALTER TABLE `tbl_userlog`
  ADD PRIMARY KEY (`id_userlog`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_harga`
--
ALTER TABLE `tbl_harga`
  MODIFY `id_harga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_jenisbatu`
--
ALTER TABLE `tbl_jenisbatu`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  MODIFY `id_kaskeluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roleuser`
--
ALTER TABLE `tbl_roleuser`
  MODIFY `id_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_setupapp`
--
ALTER TABLE `tbl_setupapp`
  MODIFY `id_setup` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_userlog`
--
ALTER TABLE `tbl_userlog`
  MODIFY `id_userlog` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  ADD CONSTRAINT `tbl_barangmasuk_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_kaskeluar`
--
ALTER TABLE `tbl_kaskeluar`
  ADD CONSTRAINT `tbl_kaskeluar_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD CONSTRAINT `tbl_penjualan_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_penjualan_ibfk_3` FOREIGN KEY (`id_koral`) REFERENCES `tbl_jenisbatu` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `tbl_roleuser` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_userlog`
--
ALTER TABLE `tbl_userlog`
  ADD CONSTRAINT `tbl_userlog_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
