-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2024 pada 04.07
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sibakar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` int(100) NOT NULL,
  `selected_seat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `selected_seat`) VALUES
(46, '1'),
(47, '2'),
(48, '3'),
(49, '4'),
(50, '5'),
(51, '6'),
(52, '7'),
(53, '8'),
(54, '9'),
(55, '10'),
(56, '11'),
(57, '12'),
(58, '13'),
(59, '14'),
(60, '15'),
(61, '16'),
(62, '17'),
(63, '18'),
(64, '19'),
(65, '20'),
(66, '21'),
(67, '22'),
(68, '23'),
(69, '24'),
(70, '25'),
(71, '26'),
(72, '27'),
(73, '28'),
(74, '29'),
(75, '30'),
(76, '31'),
(77, '32'),
(78, '33'),
(79, '34'),
(80, '35'),
(81, '36'),
(82, '37'),
(83, '38'),
(84, '39'),
(85, '40'),
(86, '41'),
(87, '42'),
(88, '43'),
(89, '44'),
(90, '45'),
(91, '46'),
(92, '47'),
(93, '48'),
(94, '49'),
(95, '50'),
(96, '51'),
(97, '52'),
(98, '53'),
(99, '54'),
(100, '55'),
(101, '56'),
(102, '57'),
(103, '58'),
(104, '59'),
(105, '60'),
(106, '61'),
(107, '62'),
(108, '63'),
(109, '64'),
(110, '65'),
(111, '66'),
(112, '67'),
(113, '68'),
(114, '69'),
(115, '70'),
(116, '71'),
(117, '72'),
(118, '73'),
(119, '74'),
(120, '75'),
(121, '76'),
(122, '77'),
(123, '78'),
(124, '79'),
(125, '80'),
(126, '81'),
(127, '82'),
(128, '83'),
(129, '84'),
(130, '85'),
(131, '86'),
(132, '87'),
(133, '88'),
(134, '89'),
(135, '90'),
(136, '91'),
(137, '92'),
(138, '93'),
(139, '94'),
(140, '95'),
(141, '96'),
(142, '97'),
(143, '98'),
(144, '99'),
(145, '100'),
(146, '101'),
(147, '102'),
(148, '103'),
(149, '104'),
(150, '105'),
(151, '106'),
(152, '107'),
(153, '108'),
(154, '109'),
(155, '110'),
(156, '111'),
(157, '112'),
(158, '113'),
(159, '114'),
(160, '115'),
(161, '116'),
(162, '117'),
(163, '118'),
(164, '119'),
(165, '120'),
(166, '121'),
(167, '122'),
(168, '123'),
(169, '124'),
(170, '125'),
(171, '126'),
(172, '127'),
(173, '128'),
(174, '129'),
(175, '130'),
(176, '131'),
(177, '132'),
(178, '133'),
(179, '134'),
(180, '135'),
(181, '136'),
(182, '137'),
(183, '138'),
(184, '139'),
(185, '140'),
(186, '141'),
(187, '142'),
(188, '143'),
(189, '144'),
(190, '145'),
(191, '146'),
(192, '147'),
(193, '148'),
(194, '149'),
(195, '150'),
(196, '1'),
(197, '4'),
(198, '8'),
(199, '8'),
(200, '4'),
(201, ''),
(202, ''),
(203, ''),
(204, ''),
(205, 'Bangku 2'),
(206, '2'),
(207, ''),
(208, ''),
(209, ''),
(210, ''),
(211, ''),
(212, ''),
(213, ''),
(214, ''),
(215, ''),
(216, ''),
(217, ''),
(218, ''),
(219, ''),
(220, '10'),
(221, ''),
(222, ''),
(223, ''),
(224, '16'),
(225, ''),
(226, ''),
(227, ''),
(228, '4'),
(229, '2'),
(230, '6'),
(231, '5'),
(232, '7'),
(233, '3'),
(234, '1'),
(235, '11'),
(236, '15'),
(237, '12'),
(238, '13'),
(239, '14'),
(240, ''),
(241, '8'),
(242, '17'),
(243, '9');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logactivity`
--

CREATE TABLE `logactivity` (
  `id` int(11) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `nama_divisi` varchar(255) NOT NULL,
  `selected_seat` varchar(225) NOT NULL,
  `status` enum('tersedia','occupied','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `logactivity`
--

INSERT INTO `logactivity` (`id`, `namalengkap`, `nama_divisi`, `selected_seat`, `status`) VALUES
(220, 'John Doe', 'IT', '10', 'occupied'),
(224, 'huns', 'IT', '16', 'occupied'),
(228, 'fulana', 'IT', '4', 'occupied'),
(229, 'bre', 'qa', '2', 'occupied'),
(230, 'fulan', 'ba', '6', 'occupied'),
(231, 'amat', 'ui', '5', 'occupied'),
(232, 'jay', 'ux', '7', 'occupied'),
(233, 'inu', 'tim dev', '3', 'occupied'),
(234, 'denis', 'be', '1', 'occupied'),
(235, 'moch', 'ui', '11', 'occupied'),
(236, 'bbb', 'bb', '15', 'occupied'),
(237, 'test', 'test', '12', 'occupied'),
(238, 'huns', 'tes1', '13', 'occupied'),
(239, 'fulana', 'tes ke 2', '14', 'occupied'),
(240, 'fulana', '', '', ''),
(241, 'denis', 'IT', '8', 'occupied'),
(242, 'denis tes 4', 'tes 4', '17', 'occupied'),
(243, 'azay', 'tes 5', '9', 'occupied');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`) VALUES
(1, 'Juki', 'Juki Alexander', 'juki12345'),
(2, 'fulan', 'fulan', 'fulan1234'),
(4, 'zainudin', 'zainudin z', 'zainudin123'),
(7, 'fulana', 'fulana', 'fulana123'),
(8, 'siti', 'siti', 'siti123'),
(12, 'biru', 'biruin', '$2a$10$6KjJ0mZoVyf76EvpzoVGSuUuToLuOnAfGt.n38Ko3QHdAX1rMnz/i'),
(13, 'albiruni', 'albiruni', '$2a$10$J6VBHnhZQpqGbjqp2qf5qefh405JCO4E5aR9mswVnfrp9z7Ofw2yi'),
(25, 'huns', 'huns', '$2a$10$6loSmZ96hPwmq3bQy.B2EeYg.c3a854YCrsm7hOskmR0oLzW4fPIq'),
(27, 'bro', 'bro', '$2a$10$20s2rjf3nxidAITuvgwBJOlgluHDtY8lSoV/uAI..vIgCwG4r63zK'),
(29, 'denis', 'denis', '$2a$10$3K/ztGLF7oW3bKqazL3l0eBPEoq7OSz/uaCVV3yrB0k4HaIs7y35q'),
(30, 'azay', 'azay', '$2a$10$l9vVg5CUyXt4snHNLA8fYeXiVsiD8ePPowiZnMiLXTk6TZXET2YpK');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `logactivity`
--
ALTER TABLE `logactivity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT untuk tabel `logactivity`
--
ALTER TABLE `logactivity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
