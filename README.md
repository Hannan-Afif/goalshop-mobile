# GOALSHOP

## TUGAS 7 (JAWABAN)

### 1. Widget Tree dan Hubungan Parent-Child

**Widget tree**: struktur hierarki widget dalam Flutter.

- **Parent widget**: membungkus widget lain.
- **Child widget**: berada di dalam parent dan mengikuti layout-nya.

**Contoh:**
```dart
Center(
  child: Text('Hello World'),
);
```

### 2. Widget yang digunakan

Widget yang digunakan di dalam aplikasi ini:

Struktur Utama

- **MaterialApp**: Pembungkus utama aplikasi Flutter berbasis Material Design. Menentukan `title`, `theme`, dan halaman awal (`home`).
- **Scaffold**: Menyediakan kerangka dasar halaman (AppBar, Body, FloatingButton, dll).
- **ThemeData**: Mengatur tema global aplikasi.
- **ColorScheme**: Mengatur gaya warna aplikasi.

AppBar

- **AppBar**: Menampilkan banner di bagian atas aplikasi.
- **Icon** (dalam `leading`): Menampilkan ikon di sisi kiri AppBar.
- **Text** (dalam `title` dan `actions`): Menampilkan teks.
- **Padding**: Memberikan jarak antara teks dengan tepi kanan AppBar.
- **Center**: Menyusun widget di tengah area horizontal/vertikalnya.

Body

- **Padding**: Memberikan ruang di sekeliling isi halaman.
- **Column**: Menyusun widget secara vertikal.
- **Row**: Menyusun widget secara horizontal.
- **InfoCard** (custom widget): Dibuat untuk menampilkan `NPM`, `Name`, `Class`.
- **SizedBox**: Memberikan jarak antar elemen secara vertikal.
- **Center** (di bagian bawah): Menempatkan teks di tengah.
- **Padding** (untuk teks): Memberikan jarak antara teks dengan elemen di atasnya.
- **Text**: Menampilkan teks.
- **GridView.Count**: Membuat tampilan grid (dalam kode ini, 3 kolom) berisi `ItemCard`.

InfoCard

- **Card**: Membuat tampilan seperti kartu.
- **Container**: Pembungkus fleksibel untuk mengatur ukuran, padding, dan gaya.
- **Column**: Menyusun teks dan isi secara vertikal.
- **SizedBox**: Memberi jarak antara judul dan isi kartu.

ItemCard

- **Material**: Memberikan efek material (warna, bayangan, radius, dll).
- **InkWell**: Memberi efek ripple dan menangani fungsi `onTap`.
- **Container**: Untuk padding dan pengaturan tata letak isi kartu.
- **Center**: Menyusun isi di tengah kartu.
- **Column**: Menyusun `Icon` dan `Text` secara vertikal.
- **Icon**: Menampilkan ikon.
- **Padding**: Memberi jarak antara ikon dan teks.
- **SnackBar**: Menampilkan pesan singkat (mirip notifikasi di bagian bawah) ketika kartu ditekan. 
- **ScaffoldMessenger**: Menangani tampilan dan penghapusan `SnackBar`.

### 3. Widget MaterialApp

Fungsi widget MaterialApp:
1. Menentukan halaman awal aplikasi

```dart
home: MyHomePage(),
```

2. Mengatur tema aplikasi

```dart
theme: ThemeData(
  colorScheme: ...
),
```

3. Menentukan judul aplikasi
4. Mendefinisikan route antar halaman

```dart
routes: {
  '/home': (context) => MyHomePage(),
  '/about': (context) => AboutPage(),
},
```

5. Mengaktifasi fitur bawaan Material Design (`AppBar`, `FloatingActionButton`, dsb), tidak bisa berfungsi dengan baik tanpa `MaterialApp`

Widget ini sering digunakan sebagai root karena:
1. Menjadi pondasi utama aplikasi berbasis Material Design.
2. Menyediakan tema dan navigasi global.
3. Membuat seluruh widget bawaan fluter berfungsi dengan benar.
4. Memudahkan developer menjaga konsistensi tampilan dan perilaku di seluruh halaman. 

### 4. Stateless dan Stateful Widget

Perbedaan antara stateless widget dengan stateful widget.

Stateless widget:

- **Sifat**: Tidak berubah (*immutable*)
- **Update UI**: Tidak bisa diperbarui setelah dibuat.
- **Penggunaan**: Teks statis, ikon, tombol, layout tetap. Secara general, yaitu tampilan yang tidak perlu berubah setelah ditampilkan.
- **Lifecycle**: Hanya memiliki `build()`

Stateful widget:
- **Sifat**: Dapat berubah (*mutable*)
- **Update UI**: bisa diperbarui setelah dibuat dengan menggunakan `setState()`.
- **Penggunaan**: Form input, counter, animasi, data yang bersifat dinamis. Secara general, yaitu tampilan yang bisa berubah karena interaksi atau data baru.
- **Lifecycle**: Memiliki `build()`, `initState()`, `setState()`, dan `dispose()`.

### 5. BuildContext di build

`BuildContext` adalah objek yang mewakilkan lokasi suatu widget di dalam widget tree Flutter. `BuildContext` penting karena banyak fitur Flutter yang bergantung pada konteks posisi widget di dalam widget tree. Contohnya `Theme.of(context)`, `Navigator.of(context)`, `ScaffoldMessenger.of(context)`, dll. Tanpa konteks yang tepat, widget bisa gagal menemukan parent widgetnya dan error.

Contoh penggunaan BuildContext di build:

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Test')),
          );
        },
      ),
    ),
  );
}

```


### 6. Hot Reload dan Hot Restart

Konsep *hot reload* adalah kita bisa melihat perubahan kdoe secara langsung tanpa kehilangan state suatu aplikasi.
sementara, konsep *hot restart* adalah mengulang menjalankan aplikasi dari awal, menghapus semua state yang ada.

