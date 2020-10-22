-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Okt 2020 pada 15.19
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanja_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address_tb`
--

CREATE TABLE `address_tb` (
  `id_address` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `save_address` varchar(255) NOT NULL,
  `receipt_name` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `city_or_subdistric` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `address_tb`
--

INSERT INTO `address_tb` (`id_address`, `user_id`, `save_address`, `receipt_name`, `telephone_number`, `address`, `postal_code`, `city_or_subdistric`) VALUES
(2, 12, 'Home', 'Yusup Junaedi', '0888811287', 'Jl.Arkademy', '412536', 'Karawang'),
(3, 13, 'guci', 'nawi', '0987878', 'tegal guci', '42566', 'tegal'),
(9, 13, 'california', 'nawi', '0987878', 'nawi', '0987878', 'nawi'),
(10, 13, 'california', 'nawi', '0987878', 'USA', '24566', 'tegal'),
(11, 14, 'guci', 'nawi', '0987878', 'USA', '24566', 'TEGAL'),
(12, 14, 'brazil', 'nawi', '0987878', 'breazil', '66768', 'rio de jono'),
(13, 14, 'california', 'jeniper', 'barbara', 'kampung melayu', '24566', 'sukaearth');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `genders`
--

INSERT INTO `genders` (`id`, `gender`) VALUES
(1, 'Man'),
(2, 'Woman'),
(3, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id`, `level_name`) VALUES
(1, 'seller'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `name_product` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `product_condition` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `upload_at` timestamp NULL DEFAULT current_timestamp(),
  `brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `seller_id`, `name_product`, `price`, `description`, `stock`, `image`, `color`, `rating`, `product_condition`, `size`, `category`, `upload_at`, `brand`) VALUES
(9, 12, 'Jordan Zoom Shoes', 2000000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 10, 'http://localhost:8000/images/1602585189118-image.jpg,http://localhost:8000/images/1602585189118-image.jpg,http://localhost:8000/images/1602585189118-image.jpg,http://localhost:8000/images/1602585189118-image.jpg', NULL, NULL, 'baru', NULL, 'Shoes', '2020-10-13 10:33:09', 'Nike'),
(10, 12, 'Jordan Delta', 1900000, 'The Jordan Delta has a design that\'s expressive and comfortable from the inside out. Made from a mix of materials, this shoe has plush, lightweight foam underfoot. It\'s meticulously crafted for a look and feel only Jordan Brand can deliver.', 115, 'http://localhost:8000/images/1602585301753-image.jpg,http://localhost:8000/images/1602585301754-image.jpg,http://localhost:8000/images/1602585301756-image.jpg,http://localhost:8000/images/1602585301757-image.jpg', NULL, NULL, 'baru', NULL, 'Shoes', '2020-10-13 10:35:01', 'Nike'),
(11, 12, 'Air Jordan 5 Retro', 2800000, 'Celebrating the 30th anniversary of the Air Jordan 5, this retro release features classic Air cushioning, premium materials, and the iconic design details that made the AJ5 an instant classic.', 20, 'http://localhost:8000/images/1602585460052-image.jpg,http://localhost:8000/images/1602585460056-image.jpg,http://localhost:8000/images/1602585460065-image.jpg,http://localhost:8000/images/1602585460069-image.jpg', NULL, NULL, 'baru', NULL, 'Shoes', '2020-10-13 10:37:40', 'Nike'),
(12, 12, 'Logo Sportwear Hoodie', 789900, 'Gaya pakaian olahraga dan kenyamanan kasual, bersama dalam gaya abadi. Fitur logo serif insipirasi 90an. Manset kerut. \n\nBahan:\n60% Katun, 40% Polyester', 16, 'http://localhost:8000/images/1602606734874-image.png,http://localhost:8000/images/1602606734889-image.png,http://localhost:8000/images/1602606734899-image.png,http://localhost:8000/images/1602606734903-image.png', NULL, NULL, 'baru', NULL, 'Jacket', '2020-10-13 11:34:29', 'Levi\'s'),
(13, 12, 'Levi\'s x Peanuts 2020 Hoodie', 500000, 'Hoodie playful dengan gaya playful dibuat dengan French Terry yang nyaman. Potongan fit longgar & trendy. Fitur print snoopy diseluruh bagian. PRODUCT\n\nBahan:\n100% Katun', 10, 'http://localhost:8000/images/1602606819495-image.png,http://localhost:8000/images/1602606819519-image.png,http://localhost:8000/images/1602606819531-image.png,http://localhost:8000/images/1602606819556-image.png', NULL, NULL, 'baru', NULL, 'Jacket', '2020-10-13 11:36:39', 'Levi\'s'),
(14, 12, 'Stay Loose Jeans', 300000, 'Siluet baggy yang terinspirasi dari gaya 90an. Jeans keren untuk dipakai setiap hari.', 107, 'http://localhost:8000/images/1602606912202-image.png,http://localhost:8000/images/1602606912217-image.png,http://localhost:8000/images/1602606912239-image.png,http://localhost:8000/images/1602606912249-image.png', NULL, NULL, 'baru', NULL, 'Pants', '2020-10-13 11:38:54', 'Levi\'s'),
(15, 12, 'Stay Loose Jeans V2', 498000, 'Siluet baggy yang terinspirasi dari gaya 90an. Jeans keren untuk dipakai setiap hari. ', 129, 'http://localhost:8000/images/1602606977958-image.png,http://localhost:8000/images/1602606977998-image.png,http://localhost:8000/images/1602606978009-image.png,http://localhost:8000/images/1602606978014-image.png', NULL, NULL, 'baru', NULL, 'Pants', '2020-10-13 11:40:28', 'Levi\'s'),
(16, 12, '501 Original Fit Jeans', 700000, 'Ikon budaya yang dipakai dari generasi ke generasi , untuk menentukan gaya selama dekade. Straight fit ikonik dengan khas button fly. Sejak Levi\'s® ditemukan pada 1873, oran-orang terlah membuat jeansnya sendiri dengan merobek, mewarnai, memperbaikin dan memberikan sentuhan untuk mengekspresikan diri mereka secara total.', 40, 'http://localhost:8000/images/1602607078642-image.png,http://localhost:8000/images/1602607078655-image.png,http://localhost:8000/images/1602607078663-image.png,http://localhost:8000/images/1602607078671-image.png', NULL, NULL, 'baru', NULL, 'Pants', '2020-10-13 11:42:00', 'Levi\'s'),
(17, 12, 'Save Supply Stuff ur passion', 130000, 'Deskripsi Save Supply Stuff ur passion black hitam kaos kaus tshirt\nSave Supply\nUr Passion black', 40, 'http://localhost:8000/images/1602607161589-image.png,http://localhost:8000/images/1602607161595-image.png,http://localhost:8000/images/1602607161603-image.png,http://localhost:8000/images/1602607161607-image.png', NULL, NULL, 'baru', NULL, 'T-Shirt', '0000-00-00 00:00:00', 'Save Supply'),
(19, 12, 'Lwm 1998 Black', 100000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 10, 'http://localhost:8000/images/1602606549966-image.jpg,http://localhost:8000/images/1602606550022-image.jpg,http://localhost:8000/images/1602606550026-image.jpg,http://localhost:8000/images/1602606550033-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 04:43:54', 'Save Supply'),
(20, 12, 'Clutch Handbag', 200000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 29, 'http://localhost:8000/images/1602715973578-image.jpg,http://localhost:8000/images/1602715973580-image.jpg,http://localhost:8000/images/1602715973584-image.jpg,http://localhost:8000/images/1602715973585-image.jpg', NULL, NULL, 'bekas', NULL, 'Handbag', '2020-10-14 22:52:53', ''),
(21, 12, 'tas tangan pria hitam', 65000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 70, 'http://localhost:8000/images/1602716254716-image.jpg,http://localhost:8000/images/1602716254717-image.jpg,http://localhost:8000/images/1602716254718-image.jpg,http://localhost:8000/images/1602716254720-image.jpg', NULL, NULL, 'baru', NULL, 'Handbag', '2020-10-14 22:57:34', 'Nawi Cloth'),
(22, 12, 'HUGO THORCH 88356', 1800000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 70, 'http://localhost:8000/images/1602716459255-image.png,http://localhost:8000/images/1602716459259-image.png,http://localhost:8000/images/1602716459266-image.png,http://localhost:8000/images/1602716459272-image.jpg', NULL, NULL, 'baru', NULL, 'Handbag', '2020-10-14 23:00:59', 'Hugo Thorch'),
(23, 12, 'Shopping Bag Hawman', 89000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 60, 'http://localhost:8000/images/1602716667673-image.jpg,http://localhost:8000/images/1602716667674-image.jpg,http://localhost:8000/images/1602716667676-image.jpg,http://localhost:8000/images/1602716667679-image.jpg', NULL, NULL, 'baru', NULL, 'Handbag', '2020-10-14 23:04:27', 'Hawman'),
(24, 12, 'Bellezza Handbag YZ830155 - Black', 2000000, 'A nod to \'90s basketball shoes, the Jordan Zoom \'92 focuses on comfort, while tapping into the irreverent spirit of that era\'s designs. A stretchy-fit sleeve and underfoot cushioning offer a comfortable fit. \'90s-inspired details give the shoe its retro flavour.', 80, 'http://localhost:8000/images/1602716813350-image.jpg,http://localhost:8000/images/1602716813351-image.jpg,http://localhost:8000/images/1602716813352-image.jpg,http://localhost:8000/images/1602716813353-image.jpg', NULL, NULL, 'baru', NULL, 'Handbag', '2020-10-14 23:06:53', 'Bellezza'),
(25, 12, 'kaos baju tshirt tees deus', 90000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 90, 'http://localhost:8000/images/1602717251211-image.jpg,http://localhost:8000/images/1602717251212-image.jpg,http://localhost:8000/images/1602717251213-image.jpg,http://localhost:8000/images/1602717251215-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 23:14:11', 'Deus'),
(26, 12, 'SKATERS', 80000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 90, 'http://localhost:8000/images/1602717387921-image.jpg,http://localhost:8000/images/1602717387922-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 23:16:27', 'Halu'),
(27, 12, 'ADLV ACME DE LA VIE Short', 80000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 90, 'http://localhost:8000/images/1602717568080-image.jpg,http://localhost:8000/images/1602717568083-image.jpg,http://localhost:8000/images/1602717568087-image.jpg,http://localhost:8000/images/1602717568087-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 23:19:28', 'Lala'),
(28, 12, 'kaos baju polos 30s cotton', 60000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 90, 'http://localhost:8000/images/1602717706322-image.jpg,http://localhost:8000/images/1602717706361-image.jpg,http://localhost:8000/images/1602717706364-image.jpg,http://localhost:8000/images/1602717706365-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 23:21:46', 'Handung'),
(29, 12, '17SEVEN TSHIRT 004 BASIC GRN - XL', 99000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 1000, 'http://localhost:8000/images/1602717849068-image.jpg,http://localhost:8000/images/1602717849069-image.jpg,http://localhost:8000/images/1602717849070-image.jpg,http://localhost:8000/images/1602717849071-image.jpg', NULL, NULL, 'baru', NULL, 'T-Shirt', '2020-10-14 23:24:09', 'Jack Cloth'),
(30, 12, 'SURVIVE CELANA SHORT PANTS MEN', 99000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 1000, 'http://localhost:8000/images/1602717979958-image.jpg,http://localhost:8000/images/1602717980003-image.jpg,http://localhost:8000/images/1602717980004-image.jpg,http://localhost:8000/images/1602717980005-image.jpg', NULL, NULL, 'baru', NULL, 'Shorts', '2020-10-14 23:26:20', 'Jack Cloth'),
(31, 12, 'BLACK CRYPTO SHORT PANTS', 180000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 1087, 'http://localhost:8000/images/1602718111848-image.jpg,http://localhost:8000/images/1602718111850-image.jpg,http://localhost:8000/images/1602718111850-image.jpg,http://localhost:8000/images/1602718111853-image.jpg', NULL, NULL, 'baru', NULL, 'Shorts', '2020-10-14 23:28:31', ''),
(32, 12, 'SHORT PANTS HATE - M', 200000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 1087, 'http://localhost:8000/images/1602718280203-image.jpg, http://localhost:8000/images/1602718280204-image.jpg,http://localhost:8000/images/1602718280206-image.jpg', NULL, NULL, 'baru', NULL, 'Shorts', '2020-10-14 23:31:20', 'Hate'),
(33, 12, 'Baselayer Legging Olahraga Tiento ', 117000, 'Kemiripan dengan foto 100%\n\nBahan : Real 100% Cotton High Quality\nKain yang terbuat dari 100% cotton teksturnya pasti lembut,adem,tidak berbulu,tidak lengket di kulit karena mudah menyerap keringat.\n100% cotton bahan yang paling recomended dipakai oleh perusahaan pakaian di dunia. gramasinya tidak terlalu tebal dan tidak terlalu tipis.\n\nSablon : Menggunakan Plastisol Kualitas Terbaik. Sangat kuat tidak akan mengelupas,retak,pudar, dan lain sebagainya. Diproses secara digital hasil lebih rapi dan presisi dari sablon pada umumnya.\n\nJahitan : jahitan bahu menggunakan mesin MH (Jahitan Rantai)\nJahitan obras sangat kuat karena pertusuk jarumnya tidak renggang.\nSecara keseluruhan jahitan rapi standar distro.\nBagian label/merk nyaman saat dipakai.\n\nSize internasional :\n\nMedium :\nPanjang 70cm Lebar 48cm\n\nLarge :\nPanjang 76cm Lebar 54cm\n\nTersedia Handtag & Label\n\nNote : tanyakan stok sebelum memesan dan sertakan ukuran dan warna di catatan pemesanan.', 5, 'http://localhost:8000/images/1602718438309-image.jpg,http://localhost:8000/images/1602718438311-image.jpg,http://localhost:8000/images/1602718438312-image.jpg,http://localhost:8000/images/1602718438314-image.jpg', NULL, NULL, 'baru', NULL, 'Shorts', '2020-10-14 23:33:58', 'Tiento'),
(34, NULL, NULL, NULL, NULL, 1, 'http://localhost:8000/images/1603246651352-image.jpg,1603246651370-image.jpg,1603246652165-image.jpg', NULL, NULL, NULL, NULL, NULL, '2020-10-21 02:17:32', NULL),
(35, NULL, 'Memeber BTS', NULL, NULL, 1, 'http://localhost:8000/images/1603246967779-image.jpg,1603246967779-image.jpg,1603246967812-image.jpg', NULL, NULL, NULL, NULL, NULL, '2020-10-21 02:22:48', NULL),
(36, NULL, 'Baju', 1000, 'baju baru dengan model tampan', 5, 'http://localhost:8000/images/1603261742253-image.jpg,1603261743024-image.jpg,1603261743450-image.jpg', NULL, NULL, 'baru', NULL, NULL, '2020-10-21 06:29:03', NULL),
(37, 32, 'Model Baju', 100000, 'test', 3, 'http://localhost:8000/images/1603291327946-image.jpg,http://localhost:8000/images/1603291328070-image.jpg,http://localhost:8000/images/1603291328071-image.jpg', NULL, NULL, 'baru', NULL, NULL, '2020-10-21 14:42:08', NULL),
(38, NULL, 'test', NULL, NULL, 1, 'http://localhost:8000/images/1603292204901-image.jpg,http://localhost:8000/images/1603292204943-image.jpg,http://localhost:8000/images/1603292205577-image.jpg', NULL, NULL, NULL, NULL, NULL, '2020-10-21 14:56:45', NULL),
(39, 33, 'baju baju', 12000, 'test', 12, 'http://localhost:8000/images/1603294994342-image.jpg,http://localhost:8000/images/1603294994379-image.jpg,http://localhost:8000/images/1603294994380-image.jpg', NULL, NULL, 'bekas', NULL, NULL, '2020-10-21 15:43:14', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `payment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `invoice`, `seller_id`, `customer_id`, `address`, `amount`, `date`, `payment`) VALUES
(22, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 01:47:39', 'gopay'),
(23, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 02:01:25', 'gopay'),
(24, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 02:01:45', 'gopay'),
(25, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 02:03:21', 'gopay'),
(26, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 02:03:26', 'gopay'),
(27, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:11:30', 'gopay'),
(28, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:17:17', 'gopay'),
(29, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:18:32', 'gopay'),
(30, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:18:53', 'gopay'),
(31, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:20:29', 'gopay'),
(32, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 03:21:17', 'gopay'),
(33, '', 1, 2, 'Jalan - jalan ke cikini', 200000, '2020-10-14 06:29:01', 'gopay'),
(34, '', 12, 13, 'alamat saya', 789950, '2020-10-15 00:05:07', 'Gopay'),
(35, '', 12, 13, 'alamat saya', 789950, '2020-10-15 00:11:40', ''),
(36, '', 12, 13, 'alamat saya', 60050, '2020-10-15 00:18:18', 'Pos Indonesia'),
(37, '', 12, 13, 'alamat saya', 99050, '2020-10-15 00:32:12', ''),
(38, '', 12, 13, 'alamat saya', 700050, '2020-10-15 00:33:28', 'MasterCard'),
(39, '', 12, 13, 'alamat saya', 99050, '2020-10-15 00:38:20', 'Pos Indonesia'),
(40, '', 12, 13, 'alamat saya', 99050, '2020-10-15 00:40:02', 'Pos Indonesia'),
(41, '', 0, 13, 'alamat saya', 50, '2020-10-15 00:41:12', 'MasterCard'),
(42, '', 12, 13, 'alamat saya', 200050, '2020-10-15 00:42:41', 'MasterCard'),
(43, '', 12, 13, 'alamat saya', 99050, '2020-10-15 00:52:20', 'Pos Indonesia'),
(44, '', 12, 14, 'alamat saya', 80050, '2020-10-15 01:48:14', 'MasterCard'),
(45, '', 12, 14, 'alamat saya', 80050, '2020-10-15 01:50:30', 'MasterCard'),
(46, '', 12, 14, 'alamat saya', 650050, '2020-10-15 02:12:13', 'Gopay'),
(47, '158879', 12, 13, 'alamat saya', 180050, '2020-10-15 06:18:26', 'MasterCard'),
(48, '351334', 12, 13, 'alamat saya', 89050, '2020-10-15 06:19:23', 'Pos Indonesia'),
(49, '627750', 12, 13, 'alamat saya', 200050, '2020-10-15 06:20:13', 'Pos Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_item`
--

CREATE TABLE `trans_item` (
  `transaction_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `invoice_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `trans_item`
--

INSERT INTO `trans_item` (`transaction_id`, `product_id`, `qty`, `color`, `size`, `invoice_id`) VALUES
(NULL, 9, 1, 'red', 34, ''),
(NULL, 10, 2, 'White', 34, ''),
(NULL, 11, 1, 'red', 34, ''),
(NULL, 12, 1, 'red', 34, ''),
(NULL, NULL, 1, 'red', 34, ''),
(NULL, 17, 1, 'red', 34, ''),
(25, NULL, 1, 'red', 34, ''),
(25, 17, 1, 'red', 34, ''),
(33, NULL, 1, 'red', 34, ''),
(33, 17, 1, 'red', 34, ''),
(124674, 27, 1, 'Black', 25, ''),
(210852, 21, 10, 'Black', 25, ''),
(NULL, 31, 1, 'Black', 25, '158879'),
(NULL, 23, 1, 'Black', 25, '351334'),
(NULL, 20, 1, 'Black', 25, '627750');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `desc_store` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `level_id`, `username`, `email`, `password`, `phone_number`, `image`, `store_name`, `gender_id`, `date_of_birth`, `desc_store`) VALUES
(11, 2, 'Nendy Yusup', 'nendyyusup79@gmail.com', '$2b$10$xUxVUd5.Uuayd51YWmKtgO8aYgPUjKVVkot8PGPaMWVuISoXxSp/u', '087820500512', '1602345754446-image.jpg', NULL, 1, '10 januari 2001', ''),
(12, 1, 'Yusup Junaedi', 'yusup.junaedi97@@gmail.com', '$2b$10$dAnE0lae1FyePHXn6UiQJOsd3bJpJlernrXIdMlPnttmQ3e/1tT5S', '085795070707', 'user.png', 'Baruak Store', 1, '', ''),
(14, 2, 'anjay', 'anjay@mail.com', '$2b$10$ywVoMRtalf89H4xAJPa8M.7q1i2dHikJzODXpSDpWySNLyA6.UPxm', NULL, 'user.png', NULL, 3, '', ''),
(18, 2, 'yani', 'yani@mail.com', '$2b$10$cvSsUMix1rYYSB3vvL6k6O.XwRZm2oQ3oHwNgr0xs0PuS3CwPyETa', NULL, 'user.png', NULL, 3, '', ''),
(19, 2, 'nana', 'nana@gmail.com', '$2b$10$.ggTfxgI60Y0y3DgB5zDjOB7YczsLvpqC5rR.AuaOSI8vNPzfb/z6', '0786986980', 'user.png', NULL, 0, '2 Mei 2010', ''),
(20, 1, 'Joen Jungkook', 'jungkook@gmail.com', '$2b$10$9YNnbakRWASbyknBVfmEVuD2Y5nxX6MHPJ7Pt79qHzT7bwAUtTdve', '029019297', '1603114121866-image.jpeg', 'Big Hit', 3, '', 'jual Army Bomb'),
(21, 2, 'Park Jimin', 'jimin@gmail.com', '$2b$10$8gB8ujYlLawrgD8ZE8kuH.OuFICeXZcIGuTM.kRyotVhFmpAoRVUG', 'null', 'user.png', NULL, 0, 'null null null', ''),
(22, 2, 'Suho Lee', 'suho@gmail.com', '$2b$10$WqYQa4NQgm/xhBW3PquzSuyfulTnyW3H2cOvPskJHXgj/nlUPYl4.', 'null', 'user.png', NULL, 0, '8 Juni 2006', ''),
(23, 2, 'yusup junaedi', 'yusup@gmail.com', '$2b$10$VwZZ4zThH4nImnJSgbBVz.g8ngXuALaMq3shunocFnNiMEi5pIxyG', 'null', 'user.png', NULL, 0, '8 Juli 2012', ''),
(24, 2, 'wildan', 'wildan@gmail.com', '$2b$10$Mj7pvtVYuSHj9IZF536tuugv5QW4XpV0kIainfENatIbKwrA9pvNa', '758798909', '1603118027559-image.jpg', NULL, 0, '9 Juni 2004', ''),
(25, 2, 'nawirufin', 'nawi@gmail.com', '$2b$10$dtjEfH5rHg/TAMcoEOsfde45mt5zv5we9/Zpv6GhmpcNkg.uEMh3.', '376923852023925', '1603118706978-image.jpg', NULL, 1, '  ', ''),
(26, 2, 'Shawn Mendes', 'shawn@gmail.com', '$2b$10$PMnAmwoEvKC9oL5Grgb3VeMKSGMtwnjzUx1Hxee8bdIB91hav/7jW', '859578433094', '1603119572646-image.jpeg', NULL, 3, '1 Januari 2020', ''),
(27, 2, 'Justin Bieber', 'justin@gmail.com', '$2b$10$t0fa7/bcA5ElV4j4N4CXB.cVyrFEYbfH7aGlHXY5zJu0zQJUNfWze', 'null', 'user.png', NULL, 3, '1 Januari 2020', ''),
(28, 1, 'Selena Gomez', 'selena@gmail.com', '$2b$10$8hkanAq1mnvkN8O1WqcgIe1uCHPQ/YKoeomkBu9UHZU9yqQJl80sG', '459340359', '1603245223303-image.jpg', 'toko kaset', 3, '', ''),
(29, 1, 'KIm Taehyung', 'v@gmail.com', '$2b$10$bqIVVbrn7fQnruW2U4ZnrO3yV0OzS3Laj3LYy90bj.OWd2g9Q0m4O', '4723670239', 'user.png', 'Big Hit', 3, '', ''),
(30, 2, 'khairana', 'khaira@gmail.com', '$2b$10$FJPgncPAyf2/1Gg1gtFAoe55BidwHexTGjzGvgLyqpKKAm9dXALea', NULL, 'user.png', NULL, 3, '', ''),
(31, 2, 'austin mahone', 'austine@gmail.com', '$2b$10$9o2GojluMl3cP3eASI3GBuAZfekftMhk1liX8qLTJazDXZopVwz92', 'null', 'user.png', NULL, 3, '1 Januari 2020', ''),
(32, 1, 'jhipe', 'jhope@gmail.com', '$2b$10$o7IH5.RGfeD5w0E0A9wOEezEoBd5cwa.8n56HghCBgXe1vJqsPTAm', '3547658769', 'user.png', 'big hit', 3, '', ''),
(33, 1, 'Joen Jungkook', 'jk@gmail.com', '$2b$10$7lx0FSVd8y4QG6YUsJbFM.UOZ.aVBXf1GHal08NvIoivnAH3DVq5y', '3927520395', 'user.png', 'Jin Hit', 3, '', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address_tb`
--
ALTER TABLE `address_tb`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_item`
--
ALTER TABLE `trans_item`
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `address_tb`
--
ALTER TABLE `address_tb`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
