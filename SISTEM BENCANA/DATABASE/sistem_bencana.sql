-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 21 Jul 2026 pada 04.41
-- Versi server: 8.0.30
-- Versi PHP: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_bencana`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak_terpisah`
--

CREATE TABLE `anak_terpisah` (
  `id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `foto_anak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anak` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bapak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_ibu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur` int DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat_asal` text COLLATE utf8mb4_unicode_ci,
  `lokasi_ditemukan` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_ditemukan` date NOT NULL,
  `kontak_keluarga` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_anak` enum('belum_dijemput','sudah_dijemput','dalam_proses') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum_dijemput',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_jenis_barang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int NOT NULL DEFAULT '0',
  `satuan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_jenis_barang`, `stok`, `satuan`, `keterangan`, `created_at`, `updated_at`) VALUES
('BRG001', 'Beras', 'JB01', 100, 'Karung', 'Beras premium 5kg', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('BRG002', 'Masker', 'JB02', 500, 'Box', 'Masker medis 3 ply', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('BRG003', 'Selimut', 'JB03', 200, 'Pcs', 'Selimut wol tebal', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` bigint UNSIGNED NOT NULL,
  `gudang_id` bigint UNSIGNED NOT NULL,
  `pengajuan_barang_id` bigint UNSIGNED NOT NULL,
  `petugas_gudang_id` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `tgl_keluar` date NOT NULL,
  `status_proses` enum('diproses','dikirim','selesai','dibatalkan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_masuk` date NOT NULL,
  `id_sumber` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pegawai` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_gudang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_bencana` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_dokumen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'diproses',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bencana`
--

CREATE TABLE `bencana` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_bencana` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `pengaduan_id` bigint UNSIGNED DEFAULT NULL,
  `desa_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tingkat_kerusakan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_bencana` enum('berlangsung','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'berlangsung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bencana`
--

INSERT INTO `bencana` (`id`, `nama_bencana`, `kategori_id`, `pengaduan_id`, `desa_id`, `tanggal`, `tingkat_kerusakan`, `created_at`, `updated_at`, `status_bencana`) VALUES
(1, 'Banjir Bandang Cikampek', 1, NULL, 1, '2026-01-15', 'Berat', '2026-07-20 21:40:27', '2026-07-20 21:40:27', 'berlangsung'),
(2, 'Gempa Bumi Cianjur', 2, NULL, 2, '2025-11-21', 'Berat', '2026-07-20 21:40:27', '2026-07-20 21:40:27', 'selesai'),
(3, 'Longsor Kertaraharja', 3, NULL, 3, '2026-03-10', 'Sedang', '2026-07-20 21:40:27', '2026-07-20 21:40:27', 'berlangsung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dapur_umum`
--

CREATE TABLE `dapur_umum` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_dapur_umum` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas_warga` int NOT NULL,
  `jumlah_warga` int NOT NULL,
  `penanggung_jawab` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `posko_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa`
--

CREATE TABLE `desa` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_desa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kades` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontak_kades` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `desa`
--

INSERT INTO `desa` (`id`, `nama_desa`, `kecamatan`, `nama_kades`, `kontak_kades`, `created_at`, `updated_at`) VALUES
(1, 'Desa Sukamaju', 'Cikampek', 'Asep Saepuloh', '081234567891', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(2, 'Desa Mekarsari', 'Telukjambe', 'Siti Nurhaliza', '081234567892', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(3, 'Desa Kertaraharja', 'Pedes', 'Dadang Kurniawan', '081234567893', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_barang_keluar`
--

CREATE TABLE `detail_barang_keluar` (
  `id` bigint UNSIGNED NOT NULL,
  `barang_keluar_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `jumlah_keluar` int DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_barang_masuk`
--

CREATE TABLE `detail_barang_masuk` (
  `id_detail_barang_masuk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang_masuk` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_barang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `satuan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kondisi_barang` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_distribusi`
--

CREATE TABLE `detail_distribusi` (
  `id` bigint UNSIGNED NOT NULL,
  `distribusi_id` bigint UNSIGNED NOT NULL,
  `detail_barang_keluar_id` bigint UNSIGNED NOT NULL,
  `jumlah_kirim` int NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_paket`
--

CREATE TABLE `detail_paket` (
  `id` bigint UNSIGNED NOT NULL,
  `paket_bantuan_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pengajuan_barang`
--

CREATE TABLE `detail_pengajuan_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `pengajuan_barang_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_penerima` enum('warga','pengungsi','relawan','anak-anak','lansia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pengambilan`
--

CREATE TABLE `detail_pengambilan` (
  `id` bigint UNSIGNED NOT NULL,
  `pengambilan_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `jumlah_diambil` int NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pengembalian`
--

CREATE TABLE `detail_pengembalian` (
  `id` bigint UNSIGNED NOT NULL,
  `pengembalian_barang_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang_dikembalikan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kondisi` enum('Baik','Rusak Ringan','Rusak Berat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `distribusi`
--

CREATE TABLE `distribusi` (
  `id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `tanggal_distribusi` date NOT NULL,
  `lokasi_distribusi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kendaraan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_supir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_kendaraan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_distribusi` enum('bencana','pasca_bencana') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','dikirim','selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `distribusi_paket`
--

CREATE TABLE `distribusi_paket` (
  `id` bigint UNSIGNED NOT NULL,
  `warga_terdampak_id` bigint UNSIGNED NOT NULL,
  `paket_bantuan_id` bigint UNSIGNED NOT NULL,
  `jumlah_paket` int NOT NULL,
  `tanggal_distribusi` date NOT NULL,
  `petugas_id` bigint UNSIGNED NOT NULL,
  `status_distribusi` enum('Proses Penyaluran','Sudah disalurkan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Proses Penyaluran',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto_pengaduan`
--

CREATE TABLE `foto_pengaduan` (
  `id` bigint UNSIGNED NOT NULL,
  `pengaduan_bencana_id` bigint UNSIGNED NOT NULL,
  `file_foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_gudang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas` int NOT NULL,
  `keterangan` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gudang`
--

INSERT INTO `gudang` (`id`, `nama_gudang`, `alamat`, `kapasitas`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Gudang Pusat', 'Jl. Raya Nasional No.1', 1000, 'Gudang utama penyimpanan logistik', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(2, 'Gudang Cabang', 'Jl. Kecamatan No.10', 500, 'Gudang cabang untuk distribusi lokal', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(3, 'Gudang Lapangan', 'Jl. Desa No.25', 200, 'Gudang lapangan dekat lokasi bencana', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `pegawai_id` bigint UNSIGNED NOT NULL,
  `tanggal_layanan` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `jenis_layanan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sarana` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `petugas_lapangan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_layanan` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('dijadwalkan','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dijadwalkan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis_barang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_jenis_barang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis_barang`, `nama_jenis_barang`, `keterangan`, `created_at`, `updated_at`) VALUES
('JB01', 'Bahan Pokok', 'Kebutuhan pangan pokok masyarakat', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('JB02', 'Alat Kesehatan', 'Perlengkapan medis dan kesehatan', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('JB03', 'Perlengkapan', 'Perlengkapan umum dan sandang', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_bantuan`
--

CREATE TABLE `kategori_bantuan` (
  `id` bigint UNSIGNED NOT NULL,
  `id_sumber` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori_bantuan`
--

INSERT INTO `kategori_bantuan` (`id`, `id_sumber`, `nama_kategori`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'S01', 'Bantuan Sembako', 'Paket sembako untuk warga terdampak', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(2, 'S02', 'Bantuan Medis', 'Bantuan obat-obatan dan alat kesehatan', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(3, 'S03', 'Bantuan Logistik', 'Bantuan logistik dan perlengkapan lapangan', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_bencana`
--

CREATE TABLE `kategori_bencana` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori_bencana`
--

INSERT INTO `kategori_bencana` (`id`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Banjir', 'Banjir bandang dan genangan air akibat curah hujan tinggi', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(2, 'Gempa Bumi', 'Gempa bumi tektonik dan vulkanik', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(3, 'Tanah Longsor', 'Longsor akibat hujan deras dan kerusakan lingkungan', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kebutuhan_harian`
--

CREATE TABLE `kebutuhan_harian` (
  `id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_warga` int NOT NULL,
  `porsi_per_orang` int NOT NULL,
  `total_porsi` int NOT NULL,
  `realisasi_porsi` int DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dapur_umum_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kebutuhan_pengaduan`
--

CREATE TABLE `kebutuhan_pengaduan` (
  `id` bigint UNSIGNED NOT NULL,
  `pengaduan_bencana_id` bigint UNSIGNED NOT NULL,
  `dapur_umum` enum('Butuh','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak',
  `psikososial` enum('Butuh','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak',
  `logistik_rentan` enum('Butuh','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak',
  `logistik_makanan` enum('Butuh','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak',
  `logistik_penampungan` enum('Butuh','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak',
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `korban`
--

CREATE TABLE `korban` (
  `id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur` int NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi_kejadian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_kejadian` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_user_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2000_00_00_000000_create_kategori_bencana_table', 1),
(5, '2001_00_00_000000_create_pengaduan_bencana_table', 1),
(6, '2001_01_01_000001_foto_pengaduan', 1),
(7, '2001_02_02_000002_kebutuhan_pengaduan', 1),
(8, '2002_00_00_000000_create_desa_table', 1),
(9, '2002_01_01_000001_create_bencana_table', 1),
(10, '2002_02_02_000002_create_gudang_table', 1),
(11, '2002_03_03_000003_create_jenis_barang_table', 1),
(12, '2002_04_04_000004_create_barang_table', 1),
(13, '2002_05_05_000005_create_stok_gudang_table', 1),
(14, '2002_06_06_000006_create_sumber_barang_masuk_table', 1),
(15, '2002_07_07_000007_create_kategori_bantuan_table', 1),
(16, '2003_00_00_000000_create_pegawai_table', 1),
(17, '2003_01_01_000001_relawan', 1),
(18, '2005_00_00_000000_create_posko_table', 1),
(19, '2005_01_01_000001_create_dapur_umum_table', 1),
(20, '2005_02_02_000002_create_kebutuhan_harian_table', 1),
(21, '2006_00_00_000000_create_warga_terdampak_table', 1),
(22, '2007_00_00_000000_pengajuan_barang_table', 1),
(23, '2007_01_01_000001_detail_pengajuan_barang_table', 1),
(24, '2007_02_02_000002_barang_keluar_table', 1),
(25, '2007_03_03_000003_detail_barang_keluar_table', 1),
(26, '2008_00_00_000000_create_distribusi_table', 1),
(27, '2008_01_01_000001_create_detail_distribusi_table', 1),
(28, '2008_02_02_000002_penerimaan_distribusi', 1),
(29, '2009_00_00_000000_petugas_table', 1),
(30, '2009_01_01_000001_pengambilan_table', 1),
(31, '2009_02_02_000002_pengembalian_table', 1),
(32, '2009_03_03_000003_create_detail_pengambilan_table', 1),
(33, '2009_04_04_000004_detail_pengembalian_table', 1),
(34, '2010_00_00_000000_create_barang_masuk_table', 1),
(35, '2010_01_01_000001_create_detail_barang_masuk_table', 1),
(36, '2011_00_00_000000_create_stok_posko_table', 1),
(37, '2011_01_01_000001_create_paket_bantuan_table', 1),
(38, '2011_02_02_000002_create_detail_paket_table', 1),
(39, '2011_03_03_000003_create_distribusi_paket_table', 1),
(40, '2012_00_00_000000_create_jadwal_table', 1),
(41, '2013_00_00_000000_create_anak_terpisah_table', 1),
(42, '2013_01_01_000001_create_penjemput_table', 1),
(43, '2013_02_02_000002_create_penjemputan_anak_table', 1),
(44, '2026_04_08_045301_create_permission_tables', 1),
(45, '2026_04_22_070612_update_bencana_table', 1),
(46, '2026_05_21_120834_create_korban_table', 1),
(47, '2026_06_19_040814_update_nama_ortu_wali_on_anak_terpisah_table', 1),
(48, '2026_07_01_121316_add_foto_to_relawan_table', 1),
(49, '2026_07_01_190210_add_bencana_id_to_anak_terpisah_table', 1),
(50, '2026_07_02_031131_drop_nama_penerima_from_barang_masuk_table', 1),
(51, '2026_07_02_042704_change_id_barang_masuk_length_in_detail_barang_masuk_table', 1),
(52, '2026_07_02_062105_add_foto_to_posko_table', 1),
(53, '2026_07_03_024933_add_realisasi_porsi_and_catatan_to_kebutuhan_harian_table', 1),
(54, '2026_07_19_150745_add_gambar_to_detail_pengambilan_table', 1),
(55, '2026_07_20_062736_add_gambar_to_pengambilan_table', 1),
(56, '2026_07_20_062926_drop_gambar_from_detail_pengambilan_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(6, 'App\\Models\\User', 6),
(7, 'App\\Models\\User', 7),
(8, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_bantuan`
--

CREATE TABLE `paket_bantuan` (
  `id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `nama_paket` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `status` enum('aktif','non aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` bigint UNSIGNED NOT NULL,
  `nama_pegawai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerima_distribusi`
--

CREATE TABLE `penerima_distribusi` (
  `penerima_id` bigint UNSIGNED NOT NULL,
  `detail_distribusi_id` bigint UNSIGNED NOT NULL,
  `nama_penerima` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_posko` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan_bencana`
--

CREATE TABLE `pengaduan_bencana` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `desa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pengaduan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BELUM_DITANGANI',
  `keterangan_verifikasi` text COLLATE utf8mb4_unicode_ci,
  `tanggal_selesai` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_barang`
--

CREATE TABLE `pengajuan_barang` (
  `id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `pegawai_id` bigint UNSIGNED NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status_pengajuan` enum('pending','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `acc_ketua_id` bigint UNSIGNED DEFAULT NULL,
  `tgl_persetujuan` date DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengambilan`
--

CREATE TABLE `pengambilan` (
  `id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `petugas_id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `tanggal_pengambilan` date NOT NULL,
  `jumlah_ambil` int NOT NULL,
  `tujuan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Ditangani','Selesai','Dibatalkan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ditangani',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` bigint UNSIGNED NOT NULL,
  `pengambilan_id` bigint UNSIGNED NOT NULL,
  `petugas_id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `jumlah_kembali` int NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Ditangani','Selesai','Dibatalkan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ditangani',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjemput`
--

CREATE TABLE `penjemput` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_penjemput` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubungan_dengan_anak` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `no_hp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjemputan_anak`
--

CREATE TABLE `penjemputan_anak` (
  `id` bigint UNSIGNED NOT NULL,
  `anak_id` bigint UNSIGNED NOT NULL,
  `penjemput_id` bigint UNSIGNED NOT NULL,
  `petugas_id` bigint UNSIGNED NOT NULL,
  `tanggal_penjemputan` date NOT NULL,
  `status_verifikasi` enum('menunggu','valid','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `bukti_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berita_acara` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manajemen user', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(2, 'manajemen posko', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(3, 'manajemen role', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(4, 'manajemen laporan', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(5, 'manajemen barang', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(6, 'manajemen distribusi', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(7, 'manajemen pengaduan', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(8, 'lihat pengaduan', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(9, 'buat pengaduan', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_petugas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` enum('Admin','Relawan','Koordinator') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` year NOT NULL,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `posko_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posko`
--

CREATE TABLE `posko` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_posko` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_dibuat` date NOT NULL,
  `status` enum('aktif','tidak aktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengaduan_bencana_id` bigint UNSIGNED NOT NULL,
  `desa_id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relawan`
--

CREATE TABLE `relawan` (
  `id_relawan` bigint UNSIGNED NOT NULL,
  `nama_relawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_psks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-07-20 21:40:26', '2026-07-20 21:40:26'),
(2, 'relawan', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(3, 'kadus', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(4, 'kabid', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(5, 'desa', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(6, 'ketua_tim', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(7, 'pegawai', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(8, 'petugas', 'web', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(8, 2),
(9, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_gudang`
--

CREATE TABLE `stok_gudang` (
  `id` bigint UNSIGNED NOT NULL,
  `gudang_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_stok` int NOT NULL,
  `kondisi_barang` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_posko`
--

CREATE TABLE `stok_posko` (
  `id` bigint UNSIGNED NOT NULL,
  `posko_id` bigint UNSIGNED NOT NULL,
  `barang_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_distribusi` enum('bencana','pasca_bencana') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sumber_barang_masuk`
--

CREATE TABLE `sumber_barang_masuk` (
  `id_sumber` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_sumber` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sumber_barang_masuk`
--

INSERT INTO `sumber_barang_masuk` (`id_sumber`, `nama_sumber`, `keterangan`, `created_at`, `updated_at`) VALUES
('S01', 'Pemerintah Pusat', 'Bantuan dari pemerintah pusat melalui BNPB', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('S02', 'Donasi Masyarakat', 'Donasi dari masyarakat umum', '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
('S03', 'Lembaga Swadaya', 'Bantuan dari organisasi non-pemerintah', '2026-07-20 21:40:27', '2026-07-20 21:40:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_wa` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `foto`, `email`, `email_verified_at`, `password`, `nik`, `no_wa`, `alamat`, `deskripsi`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'users/foto-admin.jpg', 'admin@admin.com', NULL, '$2y$12$84ZGEybWYde7FGnEkqwrEOaSm88IDxFRMmjQyljeBBj8bjQOK05W6', '1234567890123456', '081234567890', 'Jl. Contoh Alamat No. 123, Kota Contoh', 'Administrator Sistem', 'aktif', NULL, '2026-07-20 21:40:27', '2026-07-20 21:40:27'),
(2, 'Relawan Test', NULL, 'relawan@test.com', NULL, '$2y$12$TNDpD0sk94XB4S.dhO95POhcPvmhawpai4MCqS68ncqu6isfwTXwG', '3582030422060352', '084520360383', '418 Lynch Forge\nHazelfort, NC 98166', NULL, 'aktif', NULL, '2026-07-20 21:40:28', '2026-07-20 21:40:28'),
(3, 'Kadus Test', NULL, 'kadus@test.com', NULL, '$2y$12$0/EbqQap2IBgvhSGmPHOHOFb6FQdww4UKaV6VZ9u.Xxlyz05YYtUi', '3805823806765718', '087670969653', '5066 Carlotta Lock\nSouth Alexzanderside, WA 78707', NULL, 'aktif', NULL, '2026-07-20 21:40:28', '2026-07-20 21:40:28'),
(4, 'Kabid Test', NULL, 'kabid@test.com', NULL, '$2y$12$3RCngy75BJq6iNmgHJFTD./9RRBGmWHIxvfBiu48iZLC4MrgVTwm2', '5017721940478293', '088747694805', '35220 Bahringer Cove\nCruickshanktown, MT 52557-0548', NULL, 'aktif', NULL, '2026-07-20 21:40:28', '2026-07-20 21:40:28'),
(5, 'Desa Test', NULL, 'desa@test.com', NULL, '$2y$12$WIxDlbwCkWStQ3BtUg7LpepUZPriSSFcHUEPJ0ck3fMjviVpqhyGW', '4592745468409064', '087700422134', '71198 Ullrich Inlet Apt. 645\nRemingtonshire, GA 59590-8361', NULL, 'aktif', NULL, '2026-07-20 21:40:28', '2026-07-20 21:40:28'),
(6, 'Ketua Tim Test', NULL, 'ketuatim@test.com', NULL, '$2y$12$nTZh95UqHxAgWncebl4SfO3dmDN.Gl45JNUObJkZdwURF9ojuOa/K', '7042128080664345', '084719230285', '350 Corwin Curve\nPort Destin, SC 25149', NULL, 'aktif', NULL, '2026-07-20 21:40:29', '2026-07-20 21:40:29'),
(7, 'Pegawai Test', NULL, 'pegawai@test.com', NULL, '$2y$12$9fo58wJ25YOBFKRsxc7uTOsKBqcrCiwck5vwB4iqilcEK8cdhWIBy', '0288153452487203', '086541949171', '60719 Ratke Corners Suite 139\nWest Mavis, GA 40451', NULL, 'aktif', NULL, '2026-07-20 21:40:29', '2026-07-20 21:40:29'),
(8, 'Petugas Test', NULL, 'petugas@test.com', NULL, '$2y$12$vuHTHHNfn2dug2VG8FTkZOzsWgPE1unoZc6ytYxIk8Ow/3vXjKmt6', '0465981659270928', '080259323760', '8028 Zboncak Points Suite 662\nAlisonburgh, OK 82504-4165', NULL, 'aktif', NULL, '2026-07-20 21:40:29', '2026-07-20 21:40:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga_terdampak`
--

CREATE TABLE `warga_terdampak` (
  `id` bigint UNSIGNED NOT NULL,
  `no_kk` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik_kepala_keluarga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kepala_keluarga` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desa_id` bigint UNSIGNED NOT NULL,
  `bencana_id` bigint UNSIGNED NOT NULL,
  `jumlah_anggota` int UNSIGNED NOT NULL,
  `tanggal_pendataan` date NOT NULL,
  `jenis_bantuan` enum('Bantuan Saat Bencana','Bantuan Pasca Bencana') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_penyaluran` enum('Belum diproses','Proses Penyaluran','Sudah disalurkan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_penyaluran` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak_terpisah`
--
ALTER TABLE `anak_terpisah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anak_terpisah_bencana_id_foreign` (`bencana_id`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `barang_id_jenis_barang_foreign` (`id_jenis_barang`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_keluar_gudang_id_foreign` (`gudang_id`),
  ADD KEY `barang_keluar_pengajuan_barang_id_foreign` (`pengajuan_barang_id`),
  ADD KEY `barang_keluar_petugas_gudang_id_foreign` (`petugas_gudang_id`),
  ADD KEY `barang_keluar_updated_by_foreign` (`updated_by`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `barang_masuk_id_sumber_foreign` (`id_sumber`);

--
-- Indeks untuk tabel `bencana`
--
ALTER TABLE `bencana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bencana_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `dapur_umum`
--
ALTER TABLE `dapur_umum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dapur_umum_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_barang_keluar_barang_keluar_id_foreign` (`barang_keluar_id`),
  ADD KEY `detail_barang_keluar_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  ADD PRIMARY KEY (`id_detail_barang_masuk`),
  ADD KEY `detail_barang_masuk_id_barang_foreign` (`id_barang`),
  ADD KEY `detail_barang_masuk_id_barang_masuk_foreign` (`id_barang_masuk`);

--
-- Indeks untuk tabel `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_distribusi_distribusi_id_foreign` (`distribusi_id`),
  ADD KEY `detail_distribusi_detail_barang_keluar_id_foreign` (`detail_barang_keluar_id`);

--
-- Indeks untuk tabel `detail_paket`
--
ALTER TABLE `detail_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_paket_paket_bantuan_id_foreign` (`paket_bantuan_id`),
  ADD KEY `detail_paket_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `detail_pengajuan_barang`
--
ALTER TABLE `detail_pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pengajuan_barang_pengajuan_barang_id_foreign` (`pengajuan_barang_id`),
  ADD KEY `detail_pengajuan_barang_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `detail_pengambilan`
--
ALTER TABLE `detail_pengambilan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pengembalian_pengembalian_barang_id_foreign` (`pengembalian_barang_id`),
  ADD KEY `detail_pengembalian_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distribusi_bencana_id_foreign` (`bencana_id`),
  ADD KEY `distribusi_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `distribusi_paket`
--
ALTER TABLE `distribusi_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distribusi_paket_warga_terdampak_id_foreign` (`warga_terdampak_id`),
  ADD KEY `distribusi_paket_paket_bantuan_id_foreign` (`paket_bantuan_id`),
  ADD KEY `distribusi_paket_petugas_id_foreign` (`petugas_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_pengaduan_pengaduan_bencana_id_foreign` (`pengaduan_bencana_id`);

--
-- Indeks untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_bencana_id_foreign` (`bencana_id`),
  ADD KEY `jadwal_pegawai_id_foreign` (`pegawai_id`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis_barang`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_bantuan`
--
ALTER TABLE `kategori_bantuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_bantuan_id_sumber_foreign` (`id_sumber`);

--
-- Indeks untuk tabel `kategori_bencana`
--
ALTER TABLE `kategori_bencana`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kebutuhan_harian`
--
ALTER TABLE `kebutuhan_harian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kebutuhan_harian_dapur_umum_id_foreign` (`dapur_umum_id`);

--
-- Indeks untuk tabel `kebutuhan_pengaduan`
--
ALTER TABLE `kebutuhan_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kebutuhan_pengaduan_pengaduan_bencana_id_foreign` (`pengaduan_bencana_id`);

--
-- Indeks untuk tabel `korban`
--
ALTER TABLE `korban`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korban_nik_unique` (`nik`),
  ADD KEY `korban_bencana_id_foreign` (`bencana_id`),
  ADD KEY `korban_posko_id_foreign` (`posko_id`),
  ADD KEY `korban_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `paket_bantuan`
--
ALTER TABLE `paket_bantuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paket_bantuan_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `penerima_distribusi`
--
ALTER TABLE `penerima_distribusi`
  ADD PRIMARY KEY (`penerima_id`),
  ADD KEY `penerima_distribusi_detail_distribusi_id_foreign` (`detail_distribusi_id`);

--
-- Indeks untuk tabel `pengaduan_bencana`
--
ALTER TABLE `pengaduan_bencana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaduan_bencana_user_id_foreign` (`user_id`),
  ADD KEY `pengaduan_bencana_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_barang_bencana_id_foreign` (`bencana_id`),
  ADD KEY `pengajuan_barang_pegawai_id_foreign` (`pegawai_id`),
  ADD KEY `pengajuan_barang_created_by_foreign` (`created_by`),
  ADD KEY `pengajuan_barang_updated_by_foreign` (`updated_by`),
  ADD KEY `pengajuan_barang_acc_ketua_id_foreign` (`acc_ketua_id`);

--
-- Indeks untuk tabel `pengambilan`
--
ALTER TABLE `pengambilan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengambilan_barang_id_foreign` (`barang_id`),
  ADD KEY `pengambilan_bencana_id_foreign` (`bencana_id`),
  ADD KEY `pengambilan_petugas_id_foreign` (`petugas_id`),
  ADD KEY `pengambilan_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengembalian_pengambilan_id_foreign` (`pengambilan_id`),
  ADD KEY `pengembalian_petugas_id_foreign` (`petugas_id`),
  ADD KEY `pengembalian_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `penjemput`
--
ALTER TABLE `penjemput`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penjemputan_anak`
--
ALTER TABLE `penjemputan_anak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjemputan_anak_anak_id_foreign` (`anak_id`),
  ADD KEY `penjemputan_anak_penjemput_id_foreign` (`penjemput_id`),
  ADD KEY `penjemputan_anak_petugas_id_foreign` (`petugas_id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petugas_posko_id_foreign` (`posko_id`);

--
-- Indeks untuk tabel `posko`
--
ALTER TABLE `posko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posko_pengaduan_bencana_id_foreign` (`pengaduan_bencana_id`),
  ADD KEY `posko_desa_id_foreign` (`desa_id`),
  ADD KEY `posko_bencana_id_foreign` (`bencana_id`);

--
-- Indeks untuk tabel `relawan`
--
ALTER TABLE `relawan`
  ADD PRIMARY KEY (`id_relawan`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `stok_gudang`
--
ALTER TABLE `stok_gudang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_gudang_gudang_id_foreign` (`gudang_id`),
  ADD KEY `stok_gudang_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `stok_posko`
--
ALTER TABLE `stok_posko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stok_posko_posko_id_foreign` (`posko_id`),
  ADD KEY `stok_posko_barang_id_foreign` (`barang_id`);

--
-- Indeks untuk tabel `sumber_barang_masuk`
--
ALTER TABLE `sumber_barang_masuk`
  ADD PRIMARY KEY (`id_sumber`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD UNIQUE KEY `user_nik_unique` (`nik`);

--
-- Indeks untuk tabel `warga_terdampak`
--
ALTER TABLE `warga_terdampak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warga_terdampak_no_kk_unique` (`no_kk`),
  ADD UNIQUE KEY `warga_terdampak_nik_kepala_keluarga_unique` (`nik_kepala_keluarga`),
  ADD KEY `warga_terdampak_desa_id_foreign` (`desa_id`),
  ADD KEY `warga_terdampak_bencana_id_foreign` (`bencana_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak_terpisah`
--
ALTER TABLE `anak_terpisah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bencana`
--
ALTER TABLE `bencana`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `dapur_umum`
--
ALTER TABLE `dapur_umum`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `desa`
--
ALTER TABLE `desa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_paket`
--
ALTER TABLE `detail_paket`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_pengajuan_barang`
--
ALTER TABLE `detail_pengajuan_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_pengambilan`
--
ALTER TABLE `detail_pengambilan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `distribusi_paket`
--
ALTER TABLE `distribusi_paket`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori_bantuan`
--
ALTER TABLE `kategori_bantuan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kategori_bencana`
--
ALTER TABLE `kategori_bencana`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kebutuhan_harian`
--
ALTER TABLE `kebutuhan_harian`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kebutuhan_pengaduan`
--
ALTER TABLE `kebutuhan_pengaduan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `korban`
--
ALTER TABLE `korban`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `paket_bantuan`
--
ALTER TABLE `paket_bantuan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penerima_distribusi`
--
ALTER TABLE `penerima_distribusi`
  MODIFY `penerima_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengaduan_bencana`
--
ALTER TABLE `pengaduan_bencana`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengambilan`
--
ALTER TABLE `pengambilan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penjemput`
--
ALTER TABLE `penjemput`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penjemputan_anak`
--
ALTER TABLE `penjemputan_anak`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posko`
--
ALTER TABLE `posko`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `relawan`
--
ALTER TABLE `relawan`
  MODIFY `id_relawan` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `stok_gudang`
--
ALTER TABLE `stok_gudang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stok_posko`
--
ALTER TABLE `stok_posko`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `warga_terdampak`
--
ALTER TABLE `warga_terdampak`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anak_terpisah`
--
ALTER TABLE `anak_terpisah`
  ADD CONSTRAINT `anak_terpisah_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_id_jenis_barang_foreign` FOREIGN KEY (`id_jenis_barang`) REFERENCES `jenis_barang` (`id_jenis_barang`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_keluar_pengajuan_barang_id_foreign` FOREIGN KEY (`pengajuan_barang_id`) REFERENCES `pengajuan_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_keluar_petugas_gudang_id_foreign` FOREIGN KEY (`petugas_gudang_id`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_keluar_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_id_sumber_foreign` FOREIGN KEY (`id_sumber`) REFERENCES `sumber_barang_masuk` (`id_sumber`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bencana`
--
ALTER TABLE `bencana`
  ADD CONSTRAINT `bencana_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_bencana` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dapur_umum`
--
ALTER TABLE `dapur_umum`
  ADD CONSTRAINT `dapur_umum_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  ADD CONSTRAINT `detail_barang_keluar_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_barang_keluar_barang_keluar_id_foreign` FOREIGN KEY (`barang_keluar_id`) REFERENCES `barang_keluar` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  ADD CONSTRAINT `detail_barang_masuk_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_barang_masuk_id_barang_masuk_foreign` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  ADD CONSTRAINT `detail_distribusi_detail_barang_keluar_id_foreign` FOREIGN KEY (`detail_barang_keluar_id`) REFERENCES `detail_barang_keluar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_distribusi_distribusi_id_foreign` FOREIGN KEY (`distribusi_id`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_paket`
--
ALTER TABLE `detail_paket`
  ADD CONSTRAINT `detail_paket_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_paket_paket_bantuan_id_foreign` FOREIGN KEY (`paket_bantuan_id`) REFERENCES `paket_bantuan` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pengajuan_barang`
--
ALTER TABLE `detail_pengajuan_barang`
  ADD CONSTRAINT `detail_pengajuan_barang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pengajuan_barang_pengajuan_barang_id_foreign` FOREIGN KEY (`pengajuan_barang_id`) REFERENCES `pengajuan_barang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  ADD CONSTRAINT `detail_pengembalian_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pengembalian_pengembalian_barang_id_foreign` FOREIGN KEY (`pengembalian_barang_id`) REFERENCES `pengembalian` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `distribusi_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `distribusi_paket`
--
ALTER TABLE `distribusi_paket`
  ADD CONSTRAINT `distribusi_paket_paket_bantuan_id_foreign` FOREIGN KEY (`paket_bantuan_id`) REFERENCES `paket_bantuan` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_paket_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `distribusi_paket_warga_terdampak_id_foreign` FOREIGN KEY (`warga_terdampak_id`) REFERENCES `warga_terdampak` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `foto_pengaduan`
--
ALTER TABLE `foto_pengaduan`
  ADD CONSTRAINT `foto_pengaduan_pengaduan_bencana_id_foreign` FOREIGN KEY (`pengaduan_bencana_id`) REFERENCES `pengaduan_bencana` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwal_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kategori_bantuan`
--
ALTER TABLE `kategori_bantuan`
  ADD CONSTRAINT `kategori_bantuan_id_sumber_foreign` FOREIGN KEY (`id_sumber`) REFERENCES `sumber_barang_masuk` (`id_sumber`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kebutuhan_harian`
--
ALTER TABLE `kebutuhan_harian`
  ADD CONSTRAINT `kebutuhan_harian_dapur_umum_id_foreign` FOREIGN KEY (`dapur_umum_id`) REFERENCES `dapur_umum` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kebutuhan_pengaduan`
--
ALTER TABLE `kebutuhan_pengaduan`
  ADD CONSTRAINT `kebutuhan_pengaduan_pengaduan_bencana_id_foreign` FOREIGN KEY (`pengaduan_bencana_id`) REFERENCES `pengaduan_bencana` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `korban`
--
ALTER TABLE `korban`
  ADD CONSTRAINT `korban_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`),
  ADD CONSTRAINT `korban_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`),
  ADD CONSTRAINT `korban_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `paket_bantuan`
--
ALTER TABLE `paket_bantuan`
  ADD CONSTRAINT `paket_bantuan_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penerima_distribusi`
--
ALTER TABLE `penerima_distribusi`
  ADD CONSTRAINT `penerima_distribusi_detail_distribusi_id_foreign` FOREIGN KEY (`detail_distribusi_id`) REFERENCES `detail_distribusi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengaduan_bencana`
--
ALTER TABLE `pengaduan_bencana`
  ADD CONSTRAINT `pengaduan_bencana_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_bencana` (`id`),
  ADD CONSTRAINT `pengaduan_bencana_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `pengajuan_barang`
--
ALTER TABLE `pengajuan_barang`
  ADD CONSTRAINT `pengajuan_barang_acc_ketua_id_foreign` FOREIGN KEY (`acc_ketua_id`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL,
  ADD CONSTRAINT `pengajuan_barang_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_barang_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pengajuan_barang_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_barang_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `pengambilan`
--
ALTER TABLE `pengambilan`
  ADD CONSTRAINT `pengambilan_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengambilan_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengambilan_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengambilan_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_pengambilan_id_foreign` FOREIGN KEY (`pengambilan_id`) REFERENCES `pengambilan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengembalian_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengembalian_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjemputan_anak`
--
ALTER TABLE `penjemputan_anak`
  ADD CONSTRAINT `penjemputan_anak_anak_id_foreign` FOREIGN KEY (`anak_id`) REFERENCES `anak_terpisah` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penjemputan_anak_penjemput_id_foreign` FOREIGN KEY (`penjemput_id`) REFERENCES `penjemput` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penjemputan_anak_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `posko`
--
ALTER TABLE `posko`
  ADD CONSTRAINT `posko_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posko_desa_id_foreign` FOREIGN KEY (`desa_id`) REFERENCES `desa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posko_pengaduan_bencana_id_foreign` FOREIGN KEY (`pengaduan_bencana_id`) REFERENCES `pengaduan_bencana` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stok_gudang`
--
ALTER TABLE `stok_gudang`
  ADD CONSTRAINT `stok_gudang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_gudang_gudang_id_foreign` FOREIGN KEY (`gudang_id`) REFERENCES `gudang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stok_posko`
--
ALTER TABLE `stok_posko`
  ADD CONSTRAINT `stok_posko_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `stok_posko_posko_id_foreign` FOREIGN KEY (`posko_id`) REFERENCES `posko` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `warga_terdampak`
--
ALTER TABLE `warga_terdampak`
  ADD CONSTRAINT `warga_terdampak_bencana_id_foreign` FOREIGN KEY (`bencana_id`) REFERENCES `bencana` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `warga_terdampak_desa_id_foreign` FOREIGN KEY (`desa_id`) REFERENCES `desa` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
