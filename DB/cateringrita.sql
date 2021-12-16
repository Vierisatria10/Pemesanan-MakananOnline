-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jun 2021 pada 07.33
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cateringrita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `harga` varchar(10) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `tanggal`, `kode`, `nama`, `harga`, `qty`, `jumlah`, `session`) VALUES
('20210619171447', '2021-06-19 17:14:47', '1', 'Pepes Ayam', '12000', '1', '12000', '20210616190329');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `kd_cus` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`kd_cus`, `nama`, `alamat`, `no_telp`, `username`, `password`, `gambar`) VALUES
('20210616190329', 'Vieri Satria A', 'Perum Talaga Bestari Blok G1/10 Rt03/03', '0895336769180', 'vierisatria08', 'ef2b7a37a71ba01f42c5ce5d95b7bf9bc3cf6128', '../admin/gambar_customer/foto1.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_kon` int(6) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `bayar_via` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jumlah` int(10) NOT NULL,
  `bukti_transfer` varchar(50) NOT NULL,
  `status` enum('Bayar','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_kon`, `nopo`, `kd_cus`, `bayar_via`, `tanggal`, `jumlah`, `bukti_transfer`, `status`) VALUES
(1, '20210616190329', '20210616190329', 'Cash On Delivery (COD)', '2021-06-16 19:17:23', 12000, '0', 'Bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po`
--

CREATE TABLE `po` (
  `nopo` varchar(20) NOT NULL,
  `tanggalkirim` date NOT NULL,
  `status` enum('Proses','Selesai','Terkirim','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `po`
--

INSERT INTO `po` (`nopo`, `tanggalkirim`, `status`) VALUES
('20210616190329', '2021-06-16', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_terima`
--

CREATE TABLE `po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(20) NOT NULL,
  `kd_cus` varchar(20) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` datetime NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `po_terima`
--

INSERT INTO `po_terima` (`id`, `nopo`, `kd_cus`, `kode`, `tanggal`, `qty`, `total`) VALUES
(1, '20210616190329', '20210616190329', 1, '2021-06-16 19:16:53', 1, 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `kode` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `stok` int(3) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`kode`, `nama`, `jenis`, `harga`, `keterangan`, `stok`, `gambar`) VALUES
(1, 'Pepes Ayam', 'Makanan', 12000, 'Pepes Ayam bumbu kunyit, cabai, bawang', 98, 'gambar_produk/images.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_po_terima`
--

CREATE TABLE `tmp_po_terima` (
  `id` int(10) NOT NULL,
  `nopo` varchar(10) NOT NULL,
  `kd_cus` varchar(10) NOT NULL,
  `kode` int(4) NOT NULL,
  `tanggal` date NOT NULL,
  `qty` int(8) NOT NULL,
  `total` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `gambar` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
(1, 'ocii', '0fe7e980f7dcda804ae92f06cb69cc8263835890', 'Ocii', 'gambar_admin/ocii.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kd_cus`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_kon`);

--
-- Indeks untuk tabel `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`nopo`);

--
-- Indeks untuk tabel `po_terima`
--
ALTER TABLE `po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_kon` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_terima`
--
ALTER TABLE `po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tmp_po_terima`
--
ALTER TABLE `tmp_po_terima`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
