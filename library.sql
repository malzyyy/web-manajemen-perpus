-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Des 2022 pada 09.10
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Akhil', 'akhil@gmail.com', 'admin', 'admin', '2022-12-05 13:28:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'J. K. Rowling', '2022-12-05 12:15:23', NULL),
(2, 'Masashi Kishimoto', '2022-12-05 12:15:55', NULL),
(3, 'Stan Lee', '2022-12-05 12:16:26', NULL),
(4, 'Akhil', '2022-12-05 12:17:09', NULL),
(5, 'Test', '2022-12-05 13:25:26', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `numberCopy` int(11) NOT NULL,
  `rackId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `RegDate`, `UpdationDate`, `numberCopy`, `rackId`) VALUES
(1, 'Harry Potter and the Order of Phoenix', 1, 1, 12345, '2022-12-05 12:18:21', '2022-12-16 02:35:50', 5, 8),
(2, 'Biografi Akhil', 8, 4, 1111, '2022-12-05 12:19:43', '2022-12-15 14:32:01', 19, 1),
(3, 'The Amazing Spiderman', 4, 3, 1112, '2022-12-05 12:20:27', '2022-12-15 14:32:13', 10, 1),
(4, 'Naruto Shippuden', 4, 2, 1113, '2022-12-05 12:21:00', '2022-12-15 14:32:09', 15, 1),
(5, 'Test', 9, 5, 123, '2022-12-05 13:26:53', '2022-12-16 02:38:03', 1, 1),
(6, 'Test Rak', 9, 5, 212, '2022-12-15 14:40:20', NULL, 15, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Novel', 1, '2022-12-05 12:12:14', '2022-12-05 13:12:08'),
(2, 'Pelajaran', 1, '2022-12-05 12:12:40', '0000-00-00 00:00:00'),
(3, 'Majalah', 1, '2022-12-05 12:12:53', '0000-00-00 00:00:00'),
(4, 'Komik', 1, '2022-12-05 12:12:58', '0000-00-00 00:00:00'),
(5, 'Biografi', 1, '2022-12-05 12:13:18', '0000-00-00 00:00:00'),
(6, 'Kamus', 1, '2022-12-05 12:13:56', '0000-00-00 00:00:00'),
(7, 'Jurnal', 1, '2022-12-05 12:14:16', '0000-00-00 00:00:00'),
(8, 'Autobiografi', 1, '2022-12-05 12:19:11', '0000-00-00 00:00:00'),
(9, 'Test', 1, '2022-12-05 13:24:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblrack`
--

CREATE TABLE `tblrack` (
  `rackId` int(11) NOT NULL,
  `rackNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tblrack`
--

INSERT INTO `tblrack` (`rackId`, `rackNum`) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004),
(5, 1005),
(6, 1006),
(7, 1007),
(8, 1008),
(9, 1009);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(13) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'UID001', 'Arif Jamaludin', 'arif@gmail.com', '08123456', 'jamal', 1, '2022-12-05 12:22:01', '2022-12-05 13:27:50'),
(2, 'UID002', 'Muhammad Alfiawan S', 'awan@gmail.com', '08123456789', 'awan', 1, '2022-12-05 12:23:54', NULL),
(3, 'UID003', 'Haekal Setiawan', 'haekal@gmail.com', '089012345', 'haekal', 1, '2022-12-05 12:24:39', NULL),
(4, 'UID004', 'Muhammad Akhil S', 'akhil@gmail.com', '082318307961', 'akhil', 1, '2022-12-05 12:25:27', NULL),
(5, 'UID005', 'Test123', 'test@gmail.com', '12345', 'test123', 1, '2022-12-05 13:29:36', '2022-12-05 13:30:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rackId` (`rackId`);

--
-- Indeks untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblrack`
--
ALTER TABLE `tblrack`
  ADD PRIMARY KEY (`rackId`);

--
-- Indeks untuk tabel `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tblrack`
--
ALTER TABLE `tblrack`
  MODIFY `rackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD CONSTRAINT `tblbooks_ibfk_1` FOREIGN KEY (`rackId`) REFERENCES `tblrack` (`rackId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
