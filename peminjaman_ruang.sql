-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 07:32 AM
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
-- Database: `peminjaman_ruang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `NIP` varchar(20) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Jabatan` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIDN` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` int(13) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `kode_jurusan` char(5) DEFAULT NULL,
  `kode_kajur` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`NIDN`, `nama`, `password`, `no_hp`, `email`, `jabatan`, `kode_jurusan`, `kode_kajur`) VALUES
('0003118602', 'Putra Prima Arhandi ST.,M.Kom', '65aa0e2039b41872d111eda155a2249a70a26d7ebd87e85ded6b069146a01403', 23461253, 'putraprima@polinema.ac.id', 'Tenaga Pengajar', 'JTI', '0010108003'),
('0005078102', 'Ahmadi Yuli Ananta, ST', '8620edc3989c95d0c8a7b4964c972e5411dc121a69d1df03e852b9c4e4b407ea', 1232313, 'ahmadi@polinema.ac.id', 'Tenaga Pengajar', 'JTI', '0010108003'),
('0010057308', 'Indra Dharma Wijaya, ST, MT', 'b2c20bf551e2d9ce4be962fa7a6821e062e9f2b90fcd32db6b0a00dd159a89a0', 5612575, 'indra.dharma@gmail.com', 'Tenaga Pengajar', 'JTI', '0010108003'),
('0021058301', 'Hendra Pradibta, SE', '8c1daa3253b4b8b701568836277f502841b9f06873271bb16d48e70916e5e88f', 56457850, 'hendra_pradibta@polinema.ac.id', 'Tenaga Pengajar', 'JTI', '0010108003'),
('0023017206', 'Erfan Rohadi, ST., M.Eng', '1601656a2ec9416962fb143c6f3fcc04c8391f5bb6be6659c2f60fe39e1505dd', 4563454, 'erfan@polinema.ac.id', 'Tenaga Pengajar', 'JTI', '0010108003');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `kode_fasilitas` varchar(10) NOT NULL,
  `nama_fasilitas` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kondisi_fasilitas` enum('baik','rusak','sedang diperbaiki') DEFAULT 'baik'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`kode_fasilitas`, `nama_fasilitas`, `jumlah`, `kondisi_fasilitas`) VALUES
('0120212', 'Kursi lipat alumunium', 125, 'baik'),
('0129121', 'Proyektor Epson', 23, 'baik'),
('0348238', 'Speaker Polytron', 5, 'sedang diperbaiki'),
('3487430', 'Proyektor Samsung', 3, 'rusak'),
('9838948', 'AC Samsung', 34, 'baik');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_ruang`
--

CREATE TABLE `fasilitas_ruang` (
  `kode_ruang` varchar(5) NOT NULL,
  `kode_fasilitas` varchar(10) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fasilitas_ruang`
--

INSERT INTO `fasilitas_ruang` (`kode_ruang`, `kode_fasilitas`, `jumlah`) VALUES
('LAI1', '0120212', 30),
('LIG2', '0120212', 30),
('RT1', '0120212', 30),
('RT1', '9838948', 4),
('RT2', '0120212', 32);

-- --------------------------------------------------------

--
-- Table structure for table `favorit_list`
--

CREATE TABLE `favorit_list` (
  `kode_list` varchar(10) NOT NULL,
  `nama_list` varchar(100) DEFAULT NULL,
  `kode_peminjam` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorit_list`
--

INSERT INTO `favorit_list` (`kode_list`, `nama_list`, `kode_peminjam`) VALUES
('26235623', 'Ruang OKE!', '2341720210'),
('28734713', 'Ruang rapat impian', '2341720018'),
('83729823', 'Ruang seminar favorit', '2341720080'),
('847326375', 'Ruang rapat harian HMTI Polinema', '2341720250'),
('8732237623', 'Ruang lomba JTI Intercomp 2024', '2341720132');

-- --------------------------------------------------------

--
-- Table structure for table `formulir_peminjaman`
--

CREATE TABLE `formulir_peminjaman` (
  `kode_formulir` varchar(10) NOT NULL,
  `waktu_awal_peminjaman` datetime NOT NULL,
  `waktu_akhir_peminjaman` datetime NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `surat_pendukung` blob DEFAULT NULL,
  `kode_peminjam` char(10) NOT NULL,
  `status_peminjaman` varchar(50) DEFAULT NULL,
  `NIDN` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formulir_peminjaman`
--

INSERT INTO `formulir_peminjaman` (`kode_formulir`, `waktu_awal_peminjaman`, `waktu_akhir_peminjaman`, `tujuan`, `surat_pendukung`, `kode_peminjam`, `status_peminjaman`, `NIDN`) VALUES
('01291212', '2024-06-10 14:00:00', '2024-06-11 15:00:00', 'Rapat', NULL, '2341720018', 'Menunggu konfirmasi', '0010108003'),
('01291237', '2024-05-16 10:00:00', '2024-05-16 15:00:00', 'Rapat', NULL, '2341720107', 'Disetujui', '0010108003'),
('01291256', '2024-05-20 14:00:00', '2024-05-23 15:00:00', 'Rapat', NULL, '2341720080', 'Disetujui', '0010108003'),
('01295456', '2024-04-10 10:00:00', '2024-04-16 15:00:00', 'Lomba internal JTI', NULL, '2341720132', 'Ditolak', '0010108003'),
('012956712', '2024-04-25 10:00:00', '2024-04-29 15:00:00', 'Rapat', NULL, '2341720107', 'Disetujui', '0010108003');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ruangan`
--

CREATE TABLE `jadwal_ruangan` (
  `kode_jadwal` varchar(10) NOT NULL,
  `hari` char(20) NOT NULL,
  `waktu_awal` varchar(10) NOT NULL,
  `waktu_akhir` varchar(10) NOT NULL,
  `kode_ruang` varchar(5) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `dosen` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`) VALUES
('AN', 'Administrasi Niaga'),
('JTE', 'Teknik Elektro'),
('JTI', 'Teknologi Informasi'),
('JTM', 'Teknik Mesin'),
('JTS', 'Teknik Sipil');

-- --------------------------------------------------------

--
-- Table structure for table `kajur`
--

CREATE TABLE `kajur` (
  `NIDN` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `no_hp` int(13) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `kode_jurusan` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kajur`
--

INSERT INTO `kajur` (`NIDN`, `nama`, `password`, `no_hp`, `email`, `jabatan`, `kode_jurusan`) VALUES
('0010108003', 'DR. Eng. Rosa Andrie Asmara, ST, MT', 'c38052fce37fc59b6356', 1212341, 'rosa_andrie@polinema.ac.id', 'Kepala Jur', 'JTI');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_ruang`
--

CREATE TABLE `kategori_ruang` (
  `kode_kategori` varchar(10) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_ruang`
--

INSERT INTO `kategori_ruang` (`kode_kategori`, `nama_kategori`) VALUES
('LAI', 'Lab Kecerdasan Buatan'),
('LIG', 'Lab Visi Komputer'),
('LPY', 'Lab Proyek'),
('LSI', 'Lab Sistem Informasi'),
('RT', 'Ruang Teori');

-- --------------------------------------------------------

--
-- Table structure for table `kumpulan_gambar`
--

CREATE TABLE `kumpulan_gambar` (
  `kode_gambar` varchar(255) NOT NULL,
  `file_gambar` blob NOT NULL,
  `kode_entitas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` int(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kode_prodi` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `password`, `no_hp`, `email`, `kode_prodi`) VALUES
('2341720018', 'Abdillah Noer Said', 'c9fc7c2d8c954a3b0db876565e3498f7dcb5809b4808ddba7b11439aa3753d60', 535157841, 'abdil@gmail.com', 'D4TI'),
('2341720080', 'Ahmad Naufal Waskito Aji', 'e14e4ed2df201d24144d67cb0d78a07e0658f579d1e47a343003e7d5fbbad70d', 562379681, 'naufal@gmail.com', 'D4TI'),
('2341720107', 'Adnan Arju Maulana Pasha', '9c88083a043e455498fabbdb2400b3fda4b3e340184d9a886a40b81e0610bc1f', 562346710, 'arju@gmail.com', 'D4TI'),
('2341720132', 'Ananda Satria Putra Nugraha', 'e974dbf13acbe20e4cab42d1ddd0ca1e2bae00e617e30e2793bac3ad17d2a0f6', 129857390, 'nanda@gmail.com', 'D4TI'),
('2341720250', 'Afifah Khoirunnisa', 'f27a7fc6b53a3422bcab17c4a01d2c8796c174048ff221d18752044527792455', 563467819, 'afifah@gmail.com', 'D4TI');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_matakuliah`, `nama_matakuliah`) VALUES
('2372736', 'Aljabar Linier'),
('2763634', 'Bahasa Indonesia'),
('3476364', 'Praktikum Dasar Pemrograman'),
('3746464', 'Agama'),
('723672', 'Jaringan Komputer'),
('9812834', 'Basis Data Dasar');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `kode_notifikasi` varchar(10) NOT NULL,
  `pesan_notifikasi` text DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `kode_peminjam` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`kode_notifikasi`, `pesan_notifikasi`, `tanggal`, `jam`, `kode_peminjam`) VALUES
('0852226', 'Pengajuan peminjaman ruangan yang anda lakukan pada tanggal 14 Juni 2024 dibatalkan. Formulir yang anda kirim tidka valid!', '2024-06-10', '10:25:32', '2341720080'),
('0852227', 'Pengajuan peminjaman ruangan yang anda lakukan pada tanggal 10 Juni 2024 disetujui. Anda bisa mengeceknya pada halaman profil', '2024-06-02', '13:15:22', '2341720018'),
('0852228', 'Anda mendapatkan sanksi sebesar Rp 300.000. Anda telah merusak fasilitas yang diberikan saat melakukan peminjaman', '2024-05-22', '16:25:19', '2341720018'),
('0852229', 'Pengajuan peminjaman ruangan yang anda lakukan pada tanggal 5 Mei 2024 dibatalkan. Formulir yang anda kirim tidak valid!', '2024-05-10', '13:14:06', '2341720018'),
('0852230', 'Pengajuan peminjaman ruangan yang anda lakukan pada tanggal 2 Maret 2024 disetujui. Anda bisa mengeceknya pada halaman profil', '2024-02-20', '10:15:27', '2341720080');

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `kode_pemberitahuan` varchar(10) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_dibuat` date DEFAULT NULL,
  `tanggal_awal_berlaku` date DEFAULT NULL,
  `tanggal_akhir_berlaku` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `kode_peminjam` char(10) NOT NULL,
  `status_pengguna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`kode_peminjam`, `status_pengguna`) VALUES
('2341720018', 'Sanksi'),
('2341720080', 'Baik'),
('2341720107', 'Baik'),
('2341720132', 'Sanksi'),
('2341720250', 'Baik');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_fasilitas`
--

CREATE TABLE `permintaan_fasilitas` (
  `kode_formulir` varchar(10) NOT NULL,
  `kode_fasilitas` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan_fasilitas`
--

INSERT INTO `permintaan_fasilitas` (`kode_formulir`, `kode_fasilitas`, `jumlah`) VALUES
('01291212', '0120212', 10),
('01291237', '0129121', 2),
('01291256', '0120212', 5),
('01291256', '3487430', 3),
('012956712', '0348238', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `kode_prodi` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kode_jurusan` varchar(10) DEFAULT NULL,
  `jenjang` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kode_prodi`, `nama`, `kode_jurusan`, `jenjang`) VALUES
('D2PPLS', 'Pengembangan Piranti Lunak Situs', 'JTI', 'D2'),
('D3TS', 'Teknik Sipil', 'JTS', 'D3'),
('D4MRK', 'Manajemen Rekayasa Konstruksi', 'JTS', 'D4'),
('D4SIB', 'Sistem Informasi Bisnis', 'JTI', 'D4'),
('D4TI', 'Teknik Informatika', 'JTI', 'D4');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kode_ruang` varchar(5) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL,
  `lokasi` varchar(20) NOT NULL,
  `kode_kategori` varchar(10) DEFAULT NULL,
  `arah` varchar(10) DEFAULT NULL,
  `kapasitas` int(10) DEFAULT NULL,
  `status_peminjaman` enum('tersedia','tidak tersedia') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kode_ruang`, `nama_ruang`, `lokasi`, `kode_kategori`, `arah`, `kapasitas`, `status_peminjaman`) VALUES
('LAI1', 'Lab Kecerdasan Buatan 1', 'Lantai 6', 'LAI', 'Barat', 30, 'tidak tersedia'),
('LIG1', 'Lab Visi Komputer 1', 'Lantai 6', 'LIG', 'Barat', 30, 'tersedia'),
('LIG2', 'Lab Visi Komputer 2', 'Lantai 6', 'LIG', 'Barat', 30, 'tersedia'),
('RT1', 'Ruang Teori 1', 'Lantai 5', 'RT', 'Timur', 30, 'tidak tersedia'),
('RT2', 'Ruang Teori 2', 'Lantai 5', 'RT', 'Timur', 30, 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan_yang_dipinjam`
--

CREATE TABLE `ruangan_yang_dipinjam` (
  `kode_formulir` varchar(10) NOT NULL,
  `kode_ruang` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan_yang_dipinjam`
--

INSERT INTO `ruangan_yang_dipinjam` (`kode_formulir`, `kode_ruang`) VALUES
('01291212', 'RT1'),
('01291212', 'RT2'),
('01291256', 'LIG1'),
('01291256', 'LIG2'),
('012956712', 'LAI1');

-- --------------------------------------------------------

--
-- Table structure for table `ruang_disimpan`
--

CREATE TABLE `ruang_disimpan` (
  `kode_ruang` varchar(5) NOT NULL,
  `kode_list` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruang_disimpan`
--

INSERT INTO `ruang_disimpan` (`kode_ruang`, `kode_list`) VALUES
('LAI1', '26235623'),
('LIG1', '26235623'),
('LIG2', '26235623'),
('RT1', '26235623'),
('RT2', '847326375');

-- --------------------------------------------------------

--
-- Table structure for table `sanksi`
--

CREATE TABLE `sanksi` (
  `kode_sanksi` varchar(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal_dikirim` date NOT NULL,
  `nominal_denda` int(11) DEFAULT NULL,
  `kode_formulir` varchar(10) NOT NULL,
  `kode_notifikasi` varchar(10) NOT NULL,
  `status_sanksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanksi`
--

INSERT INTO `sanksi` (`kode_sanksi`, `deskripsi`, `tanggal_dikirim`, `nominal_denda`, `kode_formulir`, `kode_notifikasi`, `status_sanksi`) VALUES
('3475', 'Anda terkena sanksi akibat kerusakan meja pada bagian kaki. Anda cukup membayar denda Rp 150.000 agar status sanksi anda pulih', '2024-06-20', 150000, '01291237', '0852229', 'Belum'),
('7364', 'Anda terkena sanksi akibat kerusakan komputer pada peminjaman di ruang lab proyek. Anda dikenakan denda sebesar Rp 200.000', '2024-06-12', 500000, '01295456', '0852230', 'Lunas'),
('8457', 'Anda terkena sanksi dikarenakan merusak fasilitas layar proyektor di ruang teori 1. Anda dikenakan sanksi sebesar Rp 370.000', '2024-05-20', 370000, '01291256', '0852230', 'Lunas'),
('8745', 'Anda terkena sanksi akibat kerusakan pada fasilitas kursi lipat di ruang teori 2. Anda dikenakan denda dengan nominal 100000. Silakan temui admin untuk info lebih lanjut', '2024-06-10', 100000, '012956712', '0852226', 'Belum'),
('92375', 'Anda terkena sanksi akibat perusakan proyektor dengan kondisi cukup berat. Anda dikenakan denda dengan nominal Rp 300.000', '2024-06-27', 300000, '01291212', '0852227', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `kode_ulasan` varchar(10) NOT NULL,
  `detail_ulasan` text DEFAULT NULL,
  `kode_formulir` varchar(10) NOT NULL,
  `kode_ruang` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`kode_ulasan`, `detail_ulasan`, `kode_formulir`, `kode_ruang`, `tanggal`, `rating`) VALUES
('012956172', 'AC cukup sering bermasalah!', '01291237', 'LIG1', '2024-03-10', 1),
('125581', 'Keren banget ruangannya!', '01291212', 'LAI1', '2024-03-20', 5),
('347618', 'Suasana di ruangan ini indah dan nyaman', '01295456', 'RT2', '2024-04-12', 4),
('348120', 'Ruangannya bagus, AC nya dingin! Top dah', '01291256', 'RT1', '2024-06-20', 5),
('764812', 'Proyektor sering bermasalah. Lain kali siapkan fasilitas dengan lebih baik!', '01291256', 'RT2', '2024-05-20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `kode_sesi` varchar(10) NOT NULL,
  `waktu_awal` time NOT NULL,
  `waktu_akhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waktu`
--

INSERT INTO `waktu` (`kode_sesi`, `waktu_awal`, `waktu_akhir`) VALUES
('sesi 1', '07:10:00', '07:50:00'),
('sesi 10', '15:30:00', '16:20:00'),
('sesi 11', '16:20:00', '17:10:00'),
('sesi 12', '17:10:00', '18:00:00'),
('sesi 2', '07:50:00', '08:40:00'),
('sesi 3', '08:40:00', '09:30:00'),
('sesi 4', '09:30:00', '10:30:00'),
('sesi 5', '10:30:00', '11:20:00'),
('sesi 6', '11:20:00', '12:50:00'),
('sesi 7', '12:50:00', '13:40:00'),
('sesi 8', '13:40:00', '14:30:00'),
('sesi 9', '14:30:00', '15:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIDN`),
  ADD KEY `kode_jurusan` (`kode_jurusan`),
  ADD KEY `kode_kajur` (`kode_kajur`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`kode_fasilitas`);

--
-- Indexes for table `fasilitas_ruang`
--
ALTER TABLE `fasilitas_ruang`
  ADD PRIMARY KEY (`kode_ruang`,`kode_fasilitas`),
  ADD KEY `kode_fasilitas` (`kode_fasilitas`);

--
-- Indexes for table `favorit_list`
--
ALTER TABLE `favorit_list`
  ADD PRIMARY KEY (`kode_list`);

--
-- Indexes for table `formulir_peminjaman`
--
ALTER TABLE `formulir_peminjaman`
  ADD PRIMARY KEY (`kode_formulir`),
  ADD KEY `kode_peminjam` (`kode_peminjam`),
  ADD KEY `NIDN` (`NIDN`);

--
-- Indexes for table `jadwal_ruangan`
--
ALTER TABLE `jadwal_ruangan`
  ADD PRIMARY KEY (`kode_jadwal`),
  ADD KEY `kode_ruang` (`kode_ruang`),
  ADD KEY `kode_matkul` (`kode_matkul`),
  ADD KEY `dosen` (`dosen`),
  ADD KEY `waktu_awal` (`waktu_awal`),
  ADD KEY `waktu_akhir` (`waktu_akhir`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `kajur`
--
ALTER TABLE `kajur`
  ADD PRIMARY KEY (`NIDN`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `kategori_ruang`
--
ALTER TABLE `kategori_ruang`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `kumpulan_gambar`
--
ALTER TABLE `kumpulan_gambar`
  ADD PRIMARY KEY (`kode_gambar`),
  ADD KEY `kode_entitas` (`kode_entitas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`kode_notifikasi`),
  ADD KEY `kode_peminjam` (`kode_peminjam`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`kode_pemberitahuan`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`kode_peminjam`);

--
-- Indexes for table `permintaan_fasilitas`
--
ALTER TABLE `permintaan_fasilitas`
  ADD PRIMARY KEY (`kode_formulir`,`kode_fasilitas`),
  ADD KEY `kode_fasilitas` (`kode_fasilitas`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kode_prodi`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode_ruang`),
  ADD KEY `kode_kategori` (`kode_kategori`);

--
-- Indexes for table `ruangan_yang_dipinjam`
--
ALTER TABLE `ruangan_yang_dipinjam`
  ADD PRIMARY KEY (`kode_formulir`,`kode_ruang`),
  ADD KEY `kode_ruang` (`kode_ruang`);

--
-- Indexes for table `ruang_disimpan`
--
ALTER TABLE `ruang_disimpan`
  ADD PRIMARY KEY (`kode_ruang`,`kode_list`),
  ADD KEY `kode_list` (`kode_list`);

--
-- Indexes for table `sanksi`
--
ALTER TABLE `sanksi`
  ADD PRIMARY KEY (`kode_sanksi`),
  ADD KEY `kode_formulir` (`kode_formulir`),
  ADD KEY `kode_notifikasi` (`kode_notifikasi`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`kode_ulasan`),
  ADD KEY `kode_formulir` (`kode_formulir`),
  ADD KEY `kode_ruang` (`kode_ruang`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`kode_sesi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`kode_kajur`) REFERENCES `kajur` (`NIDN`);

--
-- Constraints for table `fasilitas_ruang`
--
ALTER TABLE `fasilitas_ruang`
  ADD CONSTRAINT `fasilitas_ruang_ibfk_1` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`),
  ADD CONSTRAINT `fasilitas_ruang_ibfk_2` FOREIGN KEY (`kode_fasilitas`) REFERENCES `fasilitas` (`kode_fasilitas`);

--
-- Constraints for table `formulir_peminjaman`
--
ALTER TABLE `formulir_peminjaman`
  ADD CONSTRAINT `formulir_peminjaman_ibfk_1` FOREIGN KEY (`kode_peminjam`) REFERENCES `peminjam` (`kode_peminjam`),
  ADD CONSTRAINT `formulir_peminjaman_ibfk_2` FOREIGN KEY (`NIDN`) REFERENCES `kajur` (`NIDN`);

--
-- Constraints for table `jadwal_ruangan`
--
ALTER TABLE `jadwal_ruangan`
  ADD CONSTRAINT `jadwal_ruangan_ibfk_1` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`),
  ADD CONSTRAINT `jadwal_ruangan_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `matakuliah` (`kode_matakuliah`),
  ADD CONSTRAINT `jadwal_ruangan_ibfk_3` FOREIGN KEY (`dosen`) REFERENCES `dosen` (`NIDN`),
  ADD CONSTRAINT `jadwal_ruangan_ibfk_4` FOREIGN KEY (`waktu_awal`) REFERENCES `waktu` (`kode_sesi`),
  ADD CONSTRAINT `jadwal_ruangan_ibfk_5` FOREIGN KEY (`waktu_akhir`) REFERENCES `waktu` (`kode_sesi`);

--
-- Constraints for table `kajur`
--
ALTER TABLE `kajur`
  ADD CONSTRAINT `kajur_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `kumpulan_gambar`
--
ALTER TABLE `kumpulan_gambar`
  ADD CONSTRAINT `kumpulan_gambar_ibfk_1` FOREIGN KEY (`kode_entitas`) REFERENCES `ruang` (`kode_ruang`),
  ADD CONSTRAINT `kumpulan_gambar_ibfk_2` FOREIGN KEY (`kode_entitas`) REFERENCES `kajur` (`NIDN`),
  ADD CONSTRAINT `kumpulan_gambar_ibfk_3` FOREIGN KEY (`kode_entitas`) REFERENCES `ulasan` (`kode_ulasan`),
  ADD CONSTRAINT `kumpulan_gambar_ibfk_4` FOREIGN KEY (`kode_entitas`) REFERENCES `sanksi` (`kode_sanksi`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`);

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`kode_peminjam`) REFERENCES `peminjam` (`kode_peminjam`);

--
-- Constraints for table `permintaan_fasilitas`
--
ALTER TABLE `permintaan_fasilitas`
  ADD CONSTRAINT `permintaan_fasilitas_ibfk_1` FOREIGN KEY (`kode_formulir`) REFERENCES `formulir_peminjaman` (`kode_formulir`),
  ADD CONSTRAINT `permintaan_fasilitas_ibfk_2` FOREIGN KEY (`kode_fasilitas`) REFERENCES `fasilitas` (`kode_fasilitas`);

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_ruang` (`kode_kategori`);

--
-- Constraints for table `ruangan_yang_dipinjam`
--
ALTER TABLE `ruangan_yang_dipinjam`
  ADD CONSTRAINT `ruangan_yang_dipinjam_ibfk_1` FOREIGN KEY (`kode_formulir`) REFERENCES `formulir_peminjaman` (`kode_formulir`),
  ADD CONSTRAINT `ruangan_yang_dipinjam_ibfk_2` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`);

--
-- Constraints for table `ruang_disimpan`
--
ALTER TABLE `ruang_disimpan`
  ADD CONSTRAINT `ruang_disimpan_ibfk_1` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`),
  ADD CONSTRAINT `ruang_disimpan_ibfk_2` FOREIGN KEY (`kode_list`) REFERENCES `favorit_list` (`kode_list`);

--
-- Constraints for table `sanksi`
--
ALTER TABLE `sanksi`
  ADD CONSTRAINT `sanksi_ibfk_1` FOREIGN KEY (`kode_formulir`) REFERENCES `formulir_peminjaman` (`kode_formulir`),
  ADD CONSTRAINT `sanksi_ibfk_2` FOREIGN KEY (`kode_notifikasi`) REFERENCES `notifikasi` (`kode_notifikasi`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`kode_formulir`) REFERENCES `formulir_peminjaman` (`kode_formulir`),
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`kode_ruang`) REFERENCES `ruang` (`kode_ruang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
