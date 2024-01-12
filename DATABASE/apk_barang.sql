-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2024 pada 14.34
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apk_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_barang`
--

CREATE TABLE `data_barang` (
  `id_barang` int(10) NOT NULL,
  `kategori` varchar(30) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `harga_beli` decimal(10,0) DEFAULT NULL,
  `harga_jual` decimal(10,0) DEFAULT NULL,
  `stok` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_barang`
--

INSERT INTO `data_barang` (`id_barang`, `kategori`, `nama`, `gambar`, `harga_beli`, `harga_jual`, `stok`) VALUES
(1, 'Makeup', 'Blush On', NULL, 55000, 60000, 24),
(2, 'Skincare', 'Facial Wash', NULL, 25000, 30000, 50),
(3, 'Makeup', 'Lip Tint', NULL, 20000, 25000, 11),
(4, 'Skincare', 'Toner', 'Toner.jpg', 35000, 40000, 7),
(5, 'Makeup', 'BB Cream', 'bbcream.jpg', 35000, 45000, 83),
(6, 'skincare', 'Sunscreen', 'sunscreen.png', 30000, 40000, 30),
(7, 'Makeup', 'Lipstik', 'lipstik.jpg', 50000, 60000, 23),
(8, 'skincare', 'face wash', 'facewash.jpg', 30000, 40000, 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_barang`
--

CREATE TABLE `harga_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `diskon` decimal(5,2) DEFAULT 0.00,
  `total` decimal(12,2) GENERATED ALWAYS AS (`harga_satuan` * `jumlah` * (1 - `diskon`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `harga_barang`
--

INSERT INTO `harga_barang` (`id`, `nama_barang`, `harga_satuan`, `jumlah`, `diskon`) VALUES
(1, 'Blush On', 50000.00, 3, 5.00),
(2, 'Loose Powder', 35000.00, 2, 5.00),
(3, 'Lip Balm', 15000.00, 2, 2.00),
(4, 'Sunscreen', 30000.00, 5, 5.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama`) VALUES
(1, 'Makeup'),
(2, 'Skincare');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_customer` varchar(255) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `diskon` decimal(5,2) DEFAULT 0.00,
  `total` decimal(12,2) GENERATED ALWAYS AS (`subtotal` * (1 - `diskon`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `tanggal`, `nama_customer`, `subtotal`, `diskon`) VALUES
(1, '2024-01-02', 'rimachan', 15000.00, 0.00),
(2, '2024-01-04', 'yedamaa', 250000.00, 2.00),
(3, '2024-01-07', 'ponyo', 80000.00, 0.00),
(4, '2024-01-01', 'chihiro', 50000.00, 0.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `harga_barang`
--
ALTER TABLE `harga_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_barang`
--
ALTER TABLE `data_barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `harga_barang`
--
ALTER TABLE `harga_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
