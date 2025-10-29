# 🎲 Randomizer App (Dart CLI)

Program **Randomizer App** adalah aplikasi berbasis console yang ditulis menggunakan bahasa **Dart**. Aplikasi ini memiliki dua fitur utama:

1. **Team Divider** – Membagi daftar nama menjadi beberapa kelompok secara acak.
2. **Spin Wheel** – Memilih nama secara acak satu per satu dari daftar.

Program ini cocok digunakan untuk keperluan seperti pembagian kelompok saat kerja kelompok, games, atau undian sederhana.

---

## 💡 Fitur Utama

| Fitur | Deskripsi |
|-------|-----------|
| Team Divider | Membagi list nama menjadi beberapa tim secara otomatis dan acak |
| Spin Wheel | Memilih satu nama secara acak per putaran dengan animasi |
| CLI Interactive | Interaktif melalui terminal |
| Validasi Input | Menangani input kosong atau tidak valid |

---

## 🧱 Alur Program

Saat program dijalankan, pengguna akan masuk ke **menu utama**:


Pengguna memilih fitur berdasarkan angka 1–3. Program berjalan sesuai mode yang dipilih, lalu kembali ke menu utama hingga pengguna memilih keluar (opsi 3).

---

1. Team Divider - Bagi ke grup
2. Spin Wheel - Pilih satu per satu
3. Keluar

## 🗂️ Struktur Kode

Program terdiri dari satu kelas utama `Randomizer` dengan beberapa metode pendukung:

| Method | Fungsi |
|--------|--------|
| `run()` | Loop utama program, menampilkan menu dan navigasi |
| `_showMainMenu()` | Menampilkan menu utama |
| `_teamDivider()` | Logika pembagian kelompok |
| `_spinWheel()` | Logika pemilihan acak satu per satu |
| `_getNames()` | Input daftar nama dari user |
| `_getGroupCount()` | Input jumlah grup |
| `_divideIntoTeams()` | Algoritma pembagian tim |
| `_animateSpin()` | Animasi putaran "spin wheel" |
| `_getInput()` | Helper untuk input di console |
| `_pressEnterToContinue()` | Pause sebelum kembali ke menu |

---

## 🔧 Cara Kerja Fitur

### ✅ 1. Team Divider
1. User memasukkan daftar nama satu per satu.
2. Ketik `done` jika sudah selesai.
3. Input jumlah grup.
4. Nama diacak lalu dibagi rata ke tiap grup.
5. Hasil dibagi menggunakan konsep **round-robin**.

Contoh output:
Tim 1: Ani, Budi
Tim 2: Caca, Deni

---

### 🎯 2. Spin Wheel
1. User memasukkan daftar nama.
2. Program memilih satu nama secara acak per putaran.
3. Nama yang sudah terpilih **dihapus dari daftar**.
4. User bisa memilih lanjut spin atau selesai.

---

## 🛠️ Cara Menjalankan

Pastikan Dart SDK sudah terinstall.

```bash
dart main.dart
```


### 🧠 Penjelasan Singkat Logika Program

- Program berjalan dalam **infinite loop** sampai pengguna memilih keluar dari menu.
- Fitur **Team Divider** menggunakan metode `List.shuffle()` untuk mengacak urutan nama sebelum dibagi ke dalam tim.
- Fitur **Spin Wheel** memilih satu nama secara acak menggunakan `Random.nextInt()`.
- Program menerima input melalui terminal menggunakan `stdin.readLineSync()`.
- Terdapat beberapa validasi input untuk mencegah:
- Input nama kosong
- Input jumlah grup tidak valid (bukan angka atau ≤ 0)
- Jumlah grup lebih banyak daripada jumlah peserta
