-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Nov 2019 pada 01.01
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `berita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akses`
--

CREATE TABLE `akses` (
  `id_akses` int(11) NOT NULL,
  `akses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akses`
--

INSERT INTO `akses` (`id_akses`, `akses`) VALUES
(1, 'super_admin'),
(2, 'narator'),
(3, 'buzzer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `media`
--

CREATE TABLE `media` (
  `id_media` int(11) NOT NULL,
  `media` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `media`
--

INSERT INTO `media` (`id_media`, `media`) VALUES
(1, 'instagram'),
(2, 'whatsup'),
(3, 'sms');

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `id_news` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `file` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `news`
--

INSERT INTO `news` (`id_news`, `title`, `content`, `file`, `id_user`) VALUES
(1, 'New Title', 'New Content', 'tes.jpg', 1),
(2, 'New Title', 'New Content', 'tes.jpg', 1),
(3, 'New Title', 'New Content', 'tes.jpg', 2),
(4, 'New Title', 'New Content', 'tes.jpg', 1),
(5, 'New Title', 'New Content', 'tes.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sharing`
--

CREATE TABLE `sharing` (
  `id_sharing` int(11) NOT NULL,
  `id_news` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_media` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sharing`
--

INSERT INTO `sharing` (`id_sharing`, `id_news`, `id_user`, `id_media`) VALUES
(2, 1, 3, 1),
(3, 1, 3, 1),
(4, 2, 3, 1),
(5, 1, 3, 1),
(6, 1, 3, 1),
(7, 1, 3, 1),
(8, 1, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `id_akses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_akses`) VALUES
(1, 'panjigumilar', '12345', 1),
(2, 'budiman', '12345', 2),
(3, 'buzzerman', '12345', 3),
(4, 'jodi', '12345', 1),
(5, 'toni', '12345', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indeks untuk tabel `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id_media`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `FK_news` (`id_user`);

--
-- Indeks untuk tabel `sharing`
--
ALTER TABLE `sharing`
  ADD PRIMARY KEY (`id_sharing`),
  ADD KEY `FK_sharingnews` (`id_news`),
  ADD KEY `FK_sharinguser` (`id_user`),
  ADD KEY `FK_sharingmedia` (`id_media`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `FK_user` (`id_akses`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akses`
--
ALTER TABLE `akses`
  MODIFY `id_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `media`
--
ALTER TABLE `media`
  MODIFY `id_media` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sharing`
--
ALTER TABLE `sharing`
  MODIFY `id_sharing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_news` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `sharing`
--
ALTER TABLE `sharing`
  ADD CONSTRAINT `FK_sharingmedia` FOREIGN KEY (`id_media`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `FK_sharingnews` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`),
  ADD CONSTRAINT `FK_sharinguser` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`id_akses`) REFERENCES `akses` (`id_akses`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
