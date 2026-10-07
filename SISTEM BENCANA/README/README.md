# Sistem Manajemen Bencana


---

## Fitur

| Modul | Deskripsi |
|-------|-----------|
| **Bencana & Kategori** | Pencatatan event bencana (banjir, gempa, longsor, dll.) |
| **Pengaduan Bencana** | Pelaporan insiden oleh warga/relawan + upload foto + daftar kebutuhan |
| **Verifikasi Pengaduan** | Alur: `pending` → `ditangani` (kabid) → `selesai` (ketua tim) |
| **Posko** | Pusat komando evakuasi (CRUD + foto) |
| **Dapur Umum** | Manajemen dapur di setiap posko + kebutuhan harian (porsi, realisasi) |
| **Gudang & Stok** | Pusat penyimpanan barang, stok per gudang |
| **Barang Masuk / Keluar** | Transaksi penerimaan & pengeluaran barang + detail |
| **Distribusi Bantuan** | Pengiriman bantuan ke posko/warga, cetak berita acara PDF |
| **Paket Bantuan** | Paket bantuan standar + distribusi paket |
| **Pengajuan Barang** | Pengajuan kebutuhan barang (import Excel) |
| **Warga Terdampak** | Data warga terkena bencana (+ status penyaluran) |
| **Korban** | Pencatatan korban (luka ringan, luka berat, meninggal, hilang) |
| **Perlindungan Anak** | Anak terpisah dari orang tua + proses penjemputan & reunifikasi |
| **Jadwal Layanan** | Jadwal kegiatan posko + cetak PDF |
| **Laporan PDF** | Laporan terpusat, review data korban, berita acara |
| **Multi-Role** | 8 role dengan akses berbeda (Admin, Kabid, Ketua Tim, Pegawai, Petugas, Relawan, Kadus, Desa) |

---

## Tech Stack

| Layer | Teknologi |
|-------|-----------|
| Backend | Laravel 13.x (PHP ^8.3) |
| Frontend | Blade + Tailwind CSS 3.x + Alpine.js 3.x |
| Build Tool | Vite 8.x (*laravel-vite-plugin*) |
| Database | MySQL / MariaDB |
| Auth | Laravel Breeze (session-based) |
| Otorisasi | Spatie Laravel Permission v7.x |
| PDF | barryvdh/laravel-dompdf |
| Excel | maatwebsite/excel v3.x |
| Icons | blade-ui-kit/blade-heroicons |

---

## Syarat Sistem

- PHP **^8.3** (dengan ekstensi: BCMath, Ctype, cURL, DOM, Fileinfo, JSON, Mbstring, OpenSSL, PCRE, PDO, PDO MySQL, Tokenizer, XML, Zip)
- Composer **2.x**
- Node.js **18+** & npm
- MySQL **8.0+** (atau MariaDB 10.6+)
- Database driver MySQL aktif

> Untuk mengecek ekstensi PHP: `php -m`

---

## Instalasi (dari ZIP)

> Panduan ini untuk distribusi source code via **ZIP** (bukan git clone).

### 1. Ekstrak file ZIP

Ekstrak ke folder web server Anda (misal `C:\xampp\htdocs\manajemen-bencana` atau `/var/www/html/manajemen-bencana`).

```bash
cd path/ke/folder-hasil-ekstrak
```

### 2. Install dependensi PHP

```bash
composer install
```

### 3. Install dependensi frontend

```bash
npm install
```

### 4. Buat file `.env`

```bash
cp .env.example .env
```

### 5. Generate application key

```bash
php artisan key:generate
```

### 6. Buat database

Buat database baru (nama bebas, misal `manajemen_bencana`).

Edit file `.env` dan sesuaikan:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=manajemen_bencana
DB_USERNAME=root
DB_PASSWORD=
```

### 7. Migrasi & seeder

```bash
php artisan migrate --seed
```

Seeder akan membuat:
- 8 role pengguna
- Data dummy untuk testing (bencana, posko, gudang, barang, dll.)
- Akun demo (lihat tabel di bawah)

### 8. Storage link

```bash
php artisan storage:link
```

### 9. Compile asset frontend

```bash
npm run build
```

### 10. Jalankan server

```bash
php artisan serve
```

Akses di browser: **http://localhost:8000**

---

## Akses Sistem

| Role | Email | Password |
|------|-------|----------|
| **Admin** | `admin@admin.com` | `admin123` |
| **Relawan** | `relawan@test.com` | `password` |
| **Kadus** | `kadus@test.com` | `password` |
| **Kabid** | `kabid@test.com` | `password` |
| **Desa** | `desa@test.com` | `password` |
| **Ketua Tim** | `ketuatim@test.com` | `password` |
| **Pegawai** | `pegawai@test.com` | `password` |
| **Petugas** | `petugas@test.com` | `password` |

Buka `http://localhost:8000/login` → masukkan email & password di atas.

### Dashboard per Role

Setiap role melihat dashboard dengan data statistik berbeda:

| Role | Melihat |
|------|---------|
| **Admin** | Total pengaduan, posko, gudang, bencana, warga terdampak |
| **Relawan** | Pengaduan saya (total, pending, diproses) |
| **Kadus** | Warga terdampak, pengaduan desa |
| **Kabid** | Bencana aktif, posko, distribusi |
| **Desa** | Warga terdampak, pengaduan desa |
| **Ketua Tim** | Posko, dapur umum, distribusi pending |
| **Pegawai** | Stok gudang, distribusi, barang masuk/keluar |
| **Petugas** | Posko, dapur umum, warga, kebutuhan harian |

---

## Troubleshooting

| Masalah | Solusi |
|---------|--------|
| `target class does not exist` | `composer dump-autoload` |
| `No application encryption key` | `php artisan key:generate` |
| File upload tidak muncul | `php artisan storage:link` |
| `Class "..." not found` | `composer dump-autoload` lalu `php artisan optimize` |
| CSS/JS tidak ke-load | `npm run build` |
| Error terkait permission folder | Pastikan `storage/` & `bootstrap/cache/` writable |

