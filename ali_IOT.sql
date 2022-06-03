-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Jun 2022 pada 01.40
-- Versi server: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ali_IOT`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `component`
--

CREATE TABLE `component` (
  `id_component` varchar(100) NOT NULL,
  `nama_component` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `role` varchar(30) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `component`
--

INSERT INTO `component` (`id_component`, `nama_component`, `value`, `satuan`, `role`, `updated_at`) VALUES
('OUT-01', 'servo', 0, '-', 'output', '2022-04-19 15:30:34'),
('OUT-02', 'relay', 0, '-', 'output', '2022-04-19 15:30:34'),
('SEN-01', 'ultrasonic', 0, 'cm', 'sensor', '2022-04-19 15:25:05'),
('SEN-02', 'gps', 0, '-', 'sensor', '2022-04-19 15:27:05'),
('SEN-03', 'tegangan', 0, 'volt', 'sensor', '2022-04-19 15:35:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `http_report`
--

CREATE TABLE `http_report` (
  `id` int(11) NOT NULL,
  `ketinggian` int(11) NOT NULL,
  `pintu` varchar(30) NOT NULL,
  `tegangan` float NOT NULL,
  `decrement_volt` float NOT NULL,
  `gps` text DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `http_report`
--

INSERT INTO `http_report` (`id`, `ketinggian`, `pintu`, `tegangan`, `decrement_volt`, `gps`, `status`, `update_at`) VALUES
(1, 19, '0', 4.5, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 17:14:31'),
(2, 19, '0', 4.5, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 17:14:32'),
(3, 19, '0', 4.5, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 17:14:33'),
(4, 19, '0', 4.5, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 17:14:34'),
(5, 19, '0', 4.5, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 17:14:35'),
(6, 10, '0', 4.9, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 18:14:55'),
(7, 10, 'tutup', 4.9, 0.02, '-7.097548,12.873496', 'active', '2022-06-03 18:37:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mqtt_report`
--

CREATE TABLE `mqtt_report` (
  `id` int(11) NOT NULL,
  `ketinggian` int(11) NOT NULL,
  `pintu` int(11) NOT NULL,
  `gps` text NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mqtt_report`
--

INSERT INTO `mqtt_report` (`id`, `ketinggian`, `pintu`, `gps`, `update_at`) VALUES
(1, 50, 1, 'xxxxxxxx', '2022-04-25 14:25:07'),
(2, 50, 1, 'xxxxxxxx', '2022-04-25 14:25:12'),
(3, 50, 1, 'xxxxxxxx', '2022-04-25 14:44:44'),
(4, 50, 1, 'xxxxxxxx', '2022-04-25 14:44:49'),
(5, 50, 1, 'xxxxxxxx', '2022-04-25 14:44:54'),
(6, 50, 1, 'xxxxxxxx', '2022-04-25 14:44:59'),
(7, 50, 1, 'xxxxxxxx', '2022-04-25 14:48:52'),
(8, 50, 1, 'xxxxxxxx', '2022-04-25 14:48:54'),
(9, 50, 1, 'xxxxxxxx', '2022-04-25 14:48:56'),
(10, 50, 1, 'xxxxxxxx', '2022-04-25 14:48:58'),
(11, 50, 1, 'xxxxxxxx', '2022-04-25 14:49:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report`
--

CREATE TABLE `report` (
  `id_report` int(11) NOT NULL,
  `ketinggian` int(11) NOT NULL,
  `pintu` int(11) NOT NULL,
  `gps` varchar(255) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `refresh_token` text NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `refresh_token`, `last_login`) VALUES
('USR-01', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZFVzZXIiOiJVU1ItMDEiLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNjU0MjY5NTExLCJleHAiOjE2NTQzNTU5MTF9.OVsh7QTSHssSwFfILetwgoDMlqpCh02RELJepYS9YtY', '2022-05-14 15:48:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indeks untuk tabel `http_report`
--
ALTER TABLE `http_report`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mqtt_report`
--
ALTER TABLE `mqtt_report`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id_report`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `http_report`
--
ALTER TABLE `http_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `mqtt_report`
--
ALTER TABLE `mqtt_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `report`
--
ALTER TABLE `report`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
