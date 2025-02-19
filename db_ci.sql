-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2025 at 11:47 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int NOT NULL,
  `id_user` int NOT NULL,
  `id_kategori` int NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `ringkasan` varchar(500) NOT NULL,
  `isi` text NOT NULL,
  `status_berita` varchar(20) NOT NULL,
  `jenis_berita` varchar(20) NOT NULL,
  `keywords` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_publish` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `jenis_client` enum('Perorangan','Perusahaan','Organisasi') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pimpinan` varchar(255) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isi_testimoni` text,
  `gambar` varchar(200) DEFAULT NULL,
  `status_client` varchar(20) NOT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `id_download` int NOT NULL,
  `id_kategori_download` int NOT NULL,
  `id_user` int NOT NULL,
  `judul_download` varchar(200) DEFAULT NULL,
  `jenis_download` varchar(20) NOT NULL,
  `isi` text,
  `gambar` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int NOT NULL,
  `id_kategori_galeri` int NOT NULL,
  `id_user` int NOT NULL,
  `judul_galeri` varchar(200) DEFAULT NULL,
  `jenis_galeri` varchar(20) NOT NULL,
  `isi` text,
  `gambar` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `hits` int DEFAULT NULL,
  `status_text` enum('Ya','Tidak','','') NOT NULL,
  `tanggal_post` datetime DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `id_user`, `slug_kategori`, `nama_kategori`, `urutan`, `hits`, `tanggal`) VALUES
(7, 1, 'kategori-1', 'kategori 1', 1, 1, '2024-12-29 01:35:28'),
(8, 1, 'kategori-2', 'kategori 2', 2, 0, '2024-12-29 01:26:52'),
(9, 1, 'kategori-3', 'kategori 3', 3, 0, '2024-12-29 01:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_download`
--

CREATE TABLE `kategori_download` (
  `id_kategori_download` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_download` varchar(255) NOT NULL,
  `nama_kategori_download` varchar(255) NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_download`
--

INSERT INTO `kategori_download` (`id_kategori_download`, `id_user`, `slug_kategori_download`, `nama_kategori_download`, `urutan`, `hits`, `tanggal`) VALUES
(1, 0, 'formulir-pendaftaran', 'Formulir Pendaftaran', 1, 0, '2021-04-21 00:37:58'),
(2, 1, 'promosi-java-web-media-2021', 'Promosi Java Web Media 2021', 2, 0, '2021-04-21 01:08:19');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_galeri`
--

CREATE TABLE `kategori_galeri` (
  `id_kategori_galeri` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_galeri` varchar(255) NOT NULL,
  `nama_kategori_galeri` varchar(255) NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_galeri`
--

INSERT INTO `kategori_galeri` (`id_kategori_galeri`, `id_user`, `slug_kategori_galeri`, `nama_kategori_galeri`, `urutan`, `hits`, `tanggal`) VALUES
(4, 0, 'kegiatan', 'Kegiatan', 4, 0, '2021-04-21 00:38:46'),
(5, 0, 'banner-website', 'Banner Website', 4, 0, '2021-04-21 00:38:46'),
(6, 1, 'family-gathering', 'Family gathering', 2, 0, '2021-04-21 00:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_staff`
--

CREATE TABLE `kategori_staff` (
  `id_kategori_staff` int NOT NULL,
  `id_user` int NOT NULL,
  `slug_kategori_staff` varchar(255) NOT NULL,
  `nama_kategori_staff` varchar(255) NOT NULL,
  `urutan` int DEFAULT NULL,
  `hits` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_staff`
--

INSERT INTO `kategori_staff` (`id_kategori_staff`, `id_user`, `slug_kategori_staff`, `nama_kategori_staff`, `urutan`, `hits`, `tanggal`) VALUES
(1, 1, 'pejabat-eselon-1', 'Pejabat Eselon 1', 1, 0, '2025-02-11 04:05:06'),
(2, 0, 'pejabat-struktural', 'Pejabat Struktural', 2, 0, '2021-04-21 00:44:24'),
(3, 1, 'team-inti', 'Team Inti', 2, 0, '2021-04-21 01:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int NOT NULL,
  `id_user` int NOT NULL,
  `namaweb` varchar(200) NOT NULL,
  `singkatan` varchar(255) DEFAULT NULL,
  `tagline` varchar(200) DEFAULT NULL,
  `tentang` text,
  `deskripsi` text,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_cadangan` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(50) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `metatext` text,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `nama_facebook` varchar(255) DEFAULT NULL,
  `nama_twitter` varchar(255) DEFAULT NULL,
  `nama_instagram` varchar(255) DEFAULT NULL,
  `nama_youtube` varchar(255) DEFAULT NULL,
  `google_map` text,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_timeout` int NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_konfigurasi`, `id_user`, `namaweb`, `singkatan`, `tagline`, `tentang`, `deskripsi`, `website`, `email`, `email_cadangan`, `alamat`, `telepon`, `hp`, `logo`, `icon`, `keywords`, `metatext`, `facebook`, `twitter`, `instagram`, `youtube`, `nama_facebook`, `nama_twitter`, `nama_instagram`, `nama_youtube`, `google_map`, `protocol`, `smtp_host`, `smtp_port`, `smtp_timeout`, `smtp_user`, `smtp_pass`, `tanggal`) VALUES
(1, 1, 'Java Web Media', 'JWM', 'Pusat Kursus Private Web Programming, Mobile Programming, Graphic Design dan Statistik', '<p><em><strong>PT Javawebmedia Edukasi Indonesia</strong></em>&nbsp;atau Java Web Media berdiri pada tanggal 26 April 2010, berawal dari garasi rumah ukuran 3x4 meter. Java Web Media awalnya hanya bergerak di bidang pembuatan dan pengembangan website serta agensi desain grafis. Awal tahun 2011, perusahaan ini kemudian mulai bergerak di bidang pengembangan sumber daya manusia, khususnya di bidang keahlian computer&nbsp;<em>Graphic Design</em>,&nbsp;<em>Web Design</em>&nbsp;dan&nbsp;<em>Web Development.</em></p>\r\n<p>Lalu pada tahun 2014 Java Web Media resmi menjadi sebuah perusahaan yang terdaftar. Pada tahun 2014 itu pula kami membuka layanan kursus statistik.</p>\r\n<p>Java Web Media adalah lembaga kursus yang bergerak di bidang pendidikan khususnya kursus website, digital marketing, desain grafis dan statistik. Sampai saat ini Java Web Media sudah memiliki lulusan lebih dari 1200 orang dari berbagai status dan profesi mulai dari pelajar sekolah, mahasiswa, guru, dosen, staff profesional, freelancer, dll. Lulusan tidak hanya dari Indonesia tapi juga dari beberapa negara tetangga seperti New Zealand, Timor Leste dan Malaysia.</p>\r\n<p>Java Web Media membuka cabang pertamanya pada tahun 2014. Hingga tahun 2020 ini, Java Web Media telah memiliki 2 cabang yang berlokasi di kota Depok.</p>\r\n<p>Selain bergerak di bidang pendidikan Java Web Media juga memiliki layanan di bidang perencanaan strategis sistem informasi, pengembangan aplikasi berbasis web dan berbasis mobile (Android dan IOS/Apple).</p>', 'Pusat Kursus Private dan Reguler bidang Desain Grafis, Web Programming, Mobile Application dan Statistik', 'Depok Town Square Lantai 2 Unit SS 5-7', 'javawebmedia@gmail.com', 'javawebmedia@gmail.com', '<p><strong>Java Web Media</strong><br />MALL DEPOK TOWN SQUARE<br />Lantai 2 Unit SS No. 5-7<br />(Samping Gerai Samsung)<br />Jl. Margonda Raya No 1<br />Kemiri Muka, Kecamatan Beji, Kota Depok, Jawa Barat 16424<br />Telepon: 085715100485<br />Whatsapp: +6281210697841<br />Email: contact@javawebmedia.co.id</p>', '+6285715100485', '+6281210697841', '1735212575_457867815f9dae7e2604.jpg', '1735212402_622f0b45b09e3fdb0d83.jpg', 'Java Web Media adalah Pusat Kursus Private dan Reguler bidang Desain Grafis, Web Programming, Mobile Application dan Statistik\r\n', 'adada', 'https://www.facebook.com/javawebmedia', 'http://twitter.com/javawebmedia', 'https://instagram.com/javawebmedia', 'https://www.youtube.com/channel/UCmm6mFZXYQ3ZylUMa0Tmc2Q', 'Java Web Media', 'Java Web Media', 'Java Web Media', 'Java Web Media', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.1145209004862!2d106.82752101476999!3d-6.379215695384046!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ec0869e31b4f%3A0xaa40278d69385917!2sHotel+Bumi+Wiyata!5e0!3m2!1sid!2sid!4v1532643481549\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'smtp', 'ssl://mail.websitemu.com', 465, 7, 'contact@websitemu.com', 'muhammad', '2024-12-26 11:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id_staff` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_kategori_staff` int DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jabatan` varchar(200) DEFAULT NULL,
  `keahlian` text,
  `gambar` varchar(200) DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  `status_staff` varchar(20) NOT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id_staff`, `id_user`, `id_kategori_staff`, `nama`, `alamat`, `telepon`, `website`, `email`, `jabatan`, `keahlian`, `gambar`, `urutan`, `status_staff`, `tempat_lahir`, `tanggal_lahir`, `tanggal`) VALUES
(10, 1, 3, 'Andoyo Cakep', 'Depok Town Square Lantai 2 Unit SS 5-7\r\nJl. Margonda Raya Kota Depok', '+6285715100485', 'https://javawebmedia.com', 'javawebmedia@gmail.com', 'Graphic Designer', '', 'staff_andoyo-cakep.jpg', 1, 'Publish', 'Depok', '1983-02-22', '2024-12-27 23:50:13'),
(11, 1, 2, 'Placeat adipisicing', 'Ut velit dolores est', 'Quia est et perspic', 'https://www.dif.mobi', 'kedude@mailinator.com', 'Aperiam quos quidem ', 'In asperiores possim', 'staff_placeat-adipisicing_1.png', 3, 'Publish', 'Ratione dolor et dui', '1970-01-01', '2024-12-27 23:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `akses_level` varchar(20) NOT NULL,
  `kode_rahasia` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `username`, `password`, `akses_level`, `kode_rahasia`, `gambar`, `keterangan`, `tanggal_post`, `tanggal`) VALUES
(1, 'Andoyo Cakep', 'andoyoandoyo@gmail.com', 'javawebmedia', 'dc28d4424ece38803650f440d7eb1cb2b3fb6651', 'Admin', NULL, 'icon-educamedia.png', '', '2019-10-12 15:50:21', '2021-04-21 21:24:48'),
(2, 'Rayyan', 'andoyoandoyo@gmail.com', 'rayyan', 'acc5d43e0936dbf3f27b906891aaafdf9ede4508', 'User', NULL, NULL, '', '2019-04-24 17:21:18', '2019-04-24 10:21:18'),
(3, 'Kheira Alexandrina', 'andoyoandoyo@gmail.com', 'diana', '6a90af129eeefc2f6e6a38746a2b33cb04c2c632', 'User', NULL, NULL, '<p>adada</p>', '2019-10-12 14:10:05', '2021-04-21 01:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id_user_log` int NOT NULL,
  `id_user` int NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `tanggal_updates` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `tanggal_updates`) VALUES
(1, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-24 08:06:38'),
(2, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-24 08:08:17'),
(3, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-24 08:09:25'),
(4, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-24 08:09:30'),
(5, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-24 08:09:37'),
(6, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/user', '2024-12-24 08:09:48'),
(7, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-24 08:09:51'),
(8, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-24 08:10:01'),
(9, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-24 08:10:33'),
(10, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:10:41'),
(11, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi', '2024-12-24 08:12:28'),
(12, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi', '2024-12-24 08:13:55'),
(13, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi', '2024-12-24 08:17:09'),
(14, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi', '2024-12-24 08:17:44'),
(15, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:19:48'),
(16, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:20:02'),
(17, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:20:23'),
(18, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:20:23'),
(19, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:21:03'),
(20, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:21:05'),
(21, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:21:15'),
(22, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:21:15'),
(23, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/delete/4', '2024-12-24 08:21:21'),
(24, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:21:21'),
(25, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/2', '2024-12-24 08:22:02'),
(26, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/2', '2024-12-24 08:22:39'),
(27, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:22:40'),
(28, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/2', '2024-12-24 08:24:10'),
(29, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/2', '2024-12-24 08:24:14'),
(30, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:24:14'),
(31, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/1', '2024-12-24 08:25:32'),
(32, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/1', '2024-12-24 08:25:35'),
(33, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:25:36'),
(34, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/1', '2024-12-24 08:25:48'),
(35, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/1', '2024-12-24 08:26:13'),
(36, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:26:13'),
(37, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:26:43'),
(38, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:26:46'),
(39, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:26:46'),
(40, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:27:28'),
(41, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video/edit/3', '2024-12-24 08:27:31'),
(42, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-24 08:27:31'),
(43, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-24 08:27:41'),
(44, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:27:46'),
(45, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:27:53'),
(46, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:28:46'),
(47, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:16'),
(48, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:26'),
(49, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:39'),
(50, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:41'),
(51, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:48'),
(52, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:30:50'),
(53, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-24 08:30:50'),
(54, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-24 08:30:52'),
(55, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:30:56'),
(56, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:31:00'),
(57, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:31:15'),
(58, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:31:16'),
(59, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:31:34'),
(60, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:34:06'),
(61, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:34:07'),
(62, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:34:12'),
(63, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:20'),
(64, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:23'),
(65, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:27'),
(66, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:42'),
(67, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:42'),
(68, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:35:46'),
(69, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:37:17'),
(70, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:37:18'),
(71, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:37:23'),
(72, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:39:51'),
(73, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:39:56'),
(74, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:40:00'),
(75, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:40:20'),
(76, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-24 08:40:24'),
(77, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:40:29'),
(78, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:40:33'),
(79, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:40:43'),
(80, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:40:45'),
(81, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:41:11'),
(82, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:48:57'),
(83, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:49:03'),
(84, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:49:47'),
(85, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:50:26'),
(86, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:52:34'),
(87, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:52:36'),
(88, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:52:38'),
(89, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:52:38'),
(90, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:52:42'),
(91, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:58:04'),
(92, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:58:05'),
(93, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:58:09'),
(94, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-24 08:58:09'),
(95, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:59:16'),
(96, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:59:20'),
(97, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-24 08:59:20'),
(98, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/user', '2024-12-24 09:00:08'),
(99, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-26 10:29:08'),
(100, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-26 10:29:49'),
(101, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/user', '2024-12-26 10:30:23'),
(102, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/user/edit/3', '2024-12-26 10:30:26'),
(103, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-26 10:30:31'),
(104, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-26 10:30:32'),
(105, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-26 10:31:50'),
(106, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 10:31:52'),
(107, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/24', '2024-12-26 10:31:55'),
(108, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 10:32:04'),
(109, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:32:08'),
(110, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:32:18'),
(111, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:32:21'),
(112, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-26 10:32:24'),
(113, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 10:32:26'),
(114, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:32:28'),
(115, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:36:31'),
(116, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:36:44'),
(117, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:36:53'),
(118, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:37:02'),
(119, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:39:59'),
(120, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:40:00'),
(121, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:40:08'),
(122, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 10:41:09'),
(123, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:41:13'),
(124, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:43:45'),
(125, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:43:45'),
(126, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:46:37'),
(127, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:46:37'),
(128, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:49:04'),
(129, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:49:14'),
(130, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 10:49:14'),
(131, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 11:22:35'),
(132, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 11:25:18'),
(133, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 11:25:18'),
(134, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 11:26:42'),
(135, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/icon', '2024-12-26 11:26:42'),
(136, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-26 11:29:27'),
(137, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-26 11:29:35'),
(138, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/konfigurasi/logo', '2024-12-26 11:29:35'),
(139, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:30:33'),
(140, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/24', '2024-12-26 11:30:37'),
(141, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/24', '2024-12-26 11:30:46'),
(142, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:30:46'),
(143, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:30:52'),
(144, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:32:34'),
(145, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-26 11:32:44'),
(146, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:35:53'),
(147, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/24', '2024-12-26 11:35:55'),
(148, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/24', '2024-12-26 11:36:05'),
(149, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:36:05'),
(150, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/24', '2024-12-26 11:38:23'),
(151, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:38:23'),
(152, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/23', '2024-12-26 11:38:31'),
(153, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/23', '2024-12-26 11:38:46'),
(154, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:38:47'),
(155, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/23', '2024-12-26 11:39:02'),
(156, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:39:02'),
(157, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:40:22'),
(158, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/tambah', '2024-12-26 11:40:43'),
(159, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:43:13'),
(160, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/13', '2024-12-26 11:43:16'),
(161, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:43:19'),
(162, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:43:51'),
(163, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-26 11:43:56'),
(164, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-26 11:44:03'),
(165, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:44:04'),
(166, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:44:28'),
(167, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/13', '2024-12-26 11:44:31'),
(168, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/13', '2024-12-26 11:44:38'),
(169, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:44:38'),
(170, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:44:53'),
(171, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:49:04'),
(172, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-26 11:49:06'),
(173, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-26 11:49:16'),
(174, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-26 11:49:16'),
(175, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-26 11:51:24'),
(176, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2024-12-26 11:52:16'),
(177, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-26 11:52:22'),
(178, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-26 11:52:30'),
(179, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2024-12-26 11:52:30'),
(180, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-26 11:59:13'),
(181, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-26 11:59:30'),
(182, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2024-12-26 11:59:30'),
(183, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/unduh/8', '2024-12-26 11:59:35'),
(184, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-27 11:14:55'),
(185, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-27 22:53:45'),
(186, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 22:53:49'),
(187, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-27 22:53:53'),
(188, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-27 22:54:03'),
(189, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 22:54:03'),
(190, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 22:59:45'),
(191, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-27 22:59:48'),
(192, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-27 22:59:54'),
(193, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 22:59:55'),
(194, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-27 23:00:25'),
(195, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-27 23:00:32'),
(196, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/edit/22', '2024-12-27 23:00:40'),
(197, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-27 23:00:40'),
(198, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2024-12-27 23:01:23'),
(199, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-27 23:01:25'),
(200, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/edit/8', '2024-12-27 23:01:33'),
(201, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2024-12-27 23:01:34'),
(202, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori_galeri', '2024-12-27 23:02:28'),
(203, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:04:13'),
(204, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:04:19'),
(205, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:06:28'),
(206, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:34:37'),
(207, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:35:46'),
(208, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:38:05'),
(209, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:38:37'),
(210, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:38:41'),
(211, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:38:50'),
(212, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:39:01'),
(213, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:42:37'),
(214, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:42:47'),
(215, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:47:41'),
(216, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:47:47'),
(217, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:47:48'),
(218, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/9', '2024-12-27 23:47:53'),
(219, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/9', '2024-12-27 23:47:57'),
(220, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:47:57'),
(221, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/9', '2024-12-27 23:48:04'),
(222, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/9', '2024-12-27 23:48:21'),
(223, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:48:21'),
(224, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:48:55'),
(225, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:50:04'),
(226, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2024-12-27 23:50:13'),
(227, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:50:13'),
(228, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:51:07'),
(229, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:52:02'),
(230, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:52:08'),
(231, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:52:09'),
(232, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/11', '2024-12-27 23:52:26'),
(233, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/11', '2024-12-27 23:52:37'),
(234, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2024-12-27 23:52:37'),
(235, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/11', '2024-12-27 23:52:44'),
(236, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 23:53:37'),
(237, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-27 23:54:07'),
(238, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-28 01:23:11'),
(239, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-29 00:57:21'),
(240, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 00:57:30'),
(241, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/video', '2024-12-29 00:58:49'),
(242, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 00:58:58'),
(243, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/21', '2024-12-29 00:59:04'),
(244, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 00:59:04'),
(245, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/7', '2024-12-29 00:59:07'),
(246, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 00:59:08'),
(247, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:13'),
(248, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/1', '2024-12-29 00:59:28'),
(249, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:29'),
(250, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/2', '2024-12-29 00:59:32'),
(251, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:32'),
(252, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/3', '2024-12-29 00:59:36'),
(253, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:36'),
(254, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/4', '2024-12-29 00:59:40'),
(255, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:40'),
(256, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/5', '2024-12-29 00:59:44'),
(257, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 00:59:44'),
(258, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 00:59:50'),
(259, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/1', '2024-12-29 00:59:58'),
(260, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 00:59:59'),
(261, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/2', '2024-12-29 01:00:04'),
(262, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:00:04'),
(263, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/3', '2024-12-29 01:00:08'),
(264, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:00:08'),
(265, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/4', '2024-12-29 01:00:13'),
(266, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:00:13'),
(267, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/6', '2024-12-29 01:00:17'),
(268, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:00:17'),
(269, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/22', '2024-12-29 01:01:15'),
(270, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:01:16'),
(271, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2024-12-29 01:19:45'),
(272, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-29 01:20:22'),
(273, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/delete/2', '2024-12-29 01:20:27'),
(274, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-29 01:20:27'),
(275, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/delete/3', '2024-12-29 01:20:30'),
(276, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-29 01:20:31'),
(277, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-29 01:20:34'),
(278, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-29 01:20:45'),
(279, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-29 01:20:45'),
(280, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-29 01:25:43'),
(281, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/edit/5', '2024-12-29 01:25:50'),
(282, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2024-12-29 01:25:50'),
(283, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:26:07'),
(284, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 01:26:09'),
(285, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:26:23'),
(286, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 01:26:27'),
(287, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:30'),
(288, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori/delete/6', '2024-12-29 01:26:33'),
(289, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:34'),
(290, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:43'),
(291, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:43'),
(292, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:51'),
(293, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:26:52'),
(294, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:27:07'),
(295, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori', '2024-12-29 01:27:07'),
(296, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2024-12-29 01:27:19'),
(297, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 01:28:36'),
(298, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 01:29:17'),
(299, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/jenis_berita/Berita', '2024-12-29 01:29:18'),
(300, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/jenis_berita/Berita', '2024-12-29 01:39:53'),
(301, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/tambah', '2024-12-29 01:43:22'),
(302, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:45:43'),
(303, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/13', '2024-12-29 01:45:46'),
(304, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/13', '2024-12-29 01:45:55'),
(305, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:45:55'),
(306, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/12', '2024-12-29 01:46:32'),
(307, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/edit/12', '2024-12-29 01:46:40'),
(308, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:46:40'),
(309, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/4', '2024-12-29 01:47:03'),
(310, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:03'),
(311, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/5', '2024-12-29 01:47:09'),
(312, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:09'),
(313, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/10', '2024-12-29 01:47:15'),
(314, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:15'),
(315, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/9', '2024-12-29 01:47:20'),
(316, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:21'),
(317, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/8', '2024-12-29 01:47:26'),
(318, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:27'),
(319, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/7', '2024-12-29 01:47:34'),
(320, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2024-12-29 01:47:34'),
(321, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2025-02-11 00:54:40'),
(322, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2025-02-11 00:54:56'),
(323, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/12', '2025-02-11 01:44:32'),
(324, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2025-02-11 01:44:32'),
(325, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/delete/13', '2025-02-11 01:52:30'),
(326, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri', '2025-02-11 01:52:30'),
(327, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/galeri/tambah', '2025-02-11 01:52:35'),
(328, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2025-02-11 01:52:38'),
(329, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client/delete/5', '2025-02-11 01:52:44'),
(330, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2025-02-11 01:52:44'),
(331, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/client', '2025-02-11 01:52:47'),
(332, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:52:51'),
(333, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/8', '2025-02-11 01:52:55'),
(334, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:52:55'),
(335, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/7', '2025-02-11 01:53:00'),
(336, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:53:00'),
(337, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/6', '2025-02-11 01:53:04'),
(338, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:53:04'),
(339, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/5', '2025-02-11 01:53:08'),
(340, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:53:09'),
(341, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/4', '2025-02-11 01:53:14'),
(342, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:53:14'),
(343, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download/delete/3', '2025-02-11 01:53:18'),
(344, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/download', '2025-02-11 01:53:19'),
(345, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/dasbor', '2025-02-11 04:00:33'),
(346, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2025-02-11 04:00:38'),
(347, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita/delete/25', '2025-02-11 04:00:57'),
(348, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/berita', '2025-02-11 04:00:58'),
(349, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:03:42'),
(350, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/delete/9', '2025-02-11 04:03:47'),
(351, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:03:48'),
(352, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2025-02-11 04:03:50'),
(353, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2025-02-11 04:03:52'),
(354, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:03:52'),
(355, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2025-02-11 04:03:57'),
(356, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/10', '2025-02-11 04:04:05'),
(357, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:04:05'),
(358, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:04:26'),
(359, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:04:26'),
(360, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/12', '2025-02-11 04:04:36'),
(361, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/12', '2025-02-11 04:04:39'),
(362, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:04:39'),
(363, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori_staff', '2025-02-11 04:04:59'),
(364, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori_staff/edit/1', '2025-02-11 04:05:05'),
(365, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori_staff/edit/1', '2025-02-11 04:05:06'),
(366, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/kategori_staff', '2025-02-11 04:05:07'),
(367, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:05:16'),
(368, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:05:22'),
(369, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:05:22'),
(370, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/13', '2025-02-11 04:05:29'),
(371, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/edit/13', '2025-02-11 04:05:38'),
(372, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:05:39'),
(373, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff/delete/13', '2025-02-11 04:05:49'),
(374, 1, '::1', 'javawebmedia', 'http://localhost:8080/admin/staff', '2025-02-11 04:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id_video` int NOT NULL,
  `id_user` int NOT NULL,
  `judul` varchar(200) NOT NULL,
  `keterangan` text,
  `video` text NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id_video`, `id_user`, `judul`, `keterangan`, `video`, `tanggal_post`, `tanggal`) VALUES
(1, 1, 'INSTALASI XAMPP DAN SUBLIME TEXT', 'INSTALASI XAMPP DAN SUBLIME TEXT', 'NSHzt3efNTs', '0000-00-00 00:00:00', '2024-12-24 08:26:13'),
(2, 1, 'Sesi 2 Konfigurasi, Halaman Login, Belajar Controller dan View', 'Sesi 2 Konfigurasi, Halaman Login, Belajar Controller dan View', 'tgbNymZ7vqY', '0000-00-00 00:00:00', '2024-12-24 08:24:14'),
(3, 1, 'Aku Cinta Padamu', 'Lagu', 'Pj4zgZLzRlM', '0000-00-00 00:00:00', '2024-12-24 08:27:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id_download`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kategori_download`
--
ALTER TABLE `kategori_download`
  ADD PRIMARY KEY (`id_kategori_download`);

--
-- Indexes for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  ADD PRIMARY KEY (`id_kategori_galeri`);

--
-- Indexes for table `kategori_staff`
--
ALTER TABLE `kategori_staff`
  ADD PRIMARY KEY (`id_kategori_staff`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_konfigurasi`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id_user_log`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `id_download` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori_download`
--
ALTER TABLE `kategori_download`
  MODIFY `id_kategori_download` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori_galeri`
--
ALTER TABLE `kategori_galeri`
  MODIFY `id_kategori_galeri` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori_staff`
--
ALTER TABLE `kategori_staff`
  MODIFY `id_kategori_staff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_konfigurasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id_staff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id_user_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
