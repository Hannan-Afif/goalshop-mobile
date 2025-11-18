# GOALSHOP

## TUGAS 7

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

## TUGAS 8
### 1. Navigator.push() dan Navigator.pushReplacement()

`Navigator.push()`:
- Digunakan untuk menambahkan halaman baru ke atas stack navigasi.
- Halaman sebelumnya tetap tersimpan di dalam stack, sehingga user bisa balik ke halaman sebelumnya dengan menggunakan tombol back

Kasus: Digunakan saat user ingin navigasi bersifat sementara. Misalnya, dari list produk ke detail produk, agar mereka bisa balik ke list produk dengan mudah.

`Navigator.pushReplacement()`:
- Digunakan untuk mengganti halaman saat ini dengan halaman baru.

- Halaman sebelumnya dihapus dari stack, sehingga tombol back tidak akan kembali ke halaman tersebut.

Kasus: Digunakan saat user berhasil login atau checkout, sehingga tidak kembali ke halaman tersebut.

### 2. Pemanfaatan Hierarchy Widget (Scaffold, AppBar, Drawer)

Penjelasan:

- **Scaffold**: menyediakan kerangka dasar halaman (AppBar, Drawer, FloatingActionButton, dll).

- **AppBar**: berisi judul, tombol aksi (search, dll), dan konsisten di setiap halaman.

- **Drawer**: berfungsi sebagai menu navigasi ke halaman lain (misalnya Home, Profile, dll).

### 3. Kelebihan Layout Widget (Padding, SingleChildScrollView, ListView) dalam menampilkan elemen-elemeen form

Penjelasan:

- **Padding**: Memberi jarak antar elemen agar tampilan lebih rapi dan tidak terlalu rapat ke tepi layar.
- **SingleChildScrollView**: Mengatasi overflow (misalnya saat keyboard muncul) dengan memungkinkan halaman di-scroll.
- **ListView**: Cocok untuk form dengan banyak input atau komponen yang bersifat dinamis (misalnya daftar produk di keranjang).

### 4. Penyesuaian warna tema aplikasi sebagai identitas visual yang konsisten dengan brand toko

Dengan menggunakan widget `ThemeData`, widget-widget seperti AppBar, ElevatedButton, dsb akan bersifat konsisten di seluruh page. Karena, `ThemeData` menentukan gaya default global (keseluruhan) aplikasi. 


## TUGAS 9
### Alasan Membuat Model Dart untuk JSON: Validasi Tipe, Null-Safety, dan Maintainability
Model Dart diperlukan karena:

- **Validasi tipe** → JSON bisa berisi tipe data salah, sedangkan model memastikan setiap field mengikuti tipe yang benar.

- **Null-safety** → Compiler Dart dapat mendeteksi field nullable/non-nullable sehingga mencegah runtime error.

- **Maintainability** → Struktur data menjadi terdefinisi jelas; jika endpoint berubah, hanya model yang diperbarui, bukan seluruh kode.

- **Reusability** → Model dapat dipakai berulang di banyak widget, fungsi, atau service.
Jika hanya memakai `Map<String, dynamic>`, kesalahan tipe baru muncul saat runtime, sulit dilacak, dan kode lebih berantakan serta rawan bug.

### Perbedaan Peran package http dan CookieRequest dalam Komunikasi Flutter–Django
package `http`
- Digunakan untuk request biasa (GET/POST) tanpa manajemen session atau cookie.
- Tidak menyimpan autentikasi.
- Cocok untuk endpoint publik atau stateless API.
`CookieRequest` (PBPK / Django–Flutter template)

- Mengelola session cookie Django, termasuk login, CSRF token, dan state autentikasi.

- Memastikan request tetap dalam konteks user yang sama.

- Otomatis menyertakan cookie pada setiap request setelah login.

Intinya:
`http` = stateless request.
`CookieRequest` = authenticated/session-aware request.

### Pentingnya Membagikan Satu Instance CookieRequest ke Seluruh Komponen Flutter
Karena:

- Session harus konsisten. Setelah login, cookie ingin dipakai seluruh aplikasi. Jika tiap widget membuat instance baru, session hilang.
- State login disimpan dalam instance CookieRequest. Jika tidak dibagikan, aplikasi selalu menganggap user belum login.
- Penggunaan Provider → memungkinkan satu instance di-root widget yang dapat diakses seluruh widget.
- Jika tidak dilakukan → login tidak persist, API gagal, user terlihat logout ketika berpindah halaman.

### Konfigurasi Konektivitas Flutter–Django: ALLOWED_HOSTS, CORS, SameSite Cookie, dan Izin Internet Android
a. 10.0.2.2 dalam ALLOWED_HOSTS

Emulator Android tidak dapat langsung mengakses localhost;\
harus menggunakan 10.0.2.2 untuk mengakses komputer host.\
Jika tidak ditambahkan → Django menolak request “Bad Request (400)”.

b. Aktivasi CORS

Mengizinkan domain Flutter mengakses Django.\
Tanpa CORS → request ditolak oleh browser policy (Cross Origin Error).

c. Pengaturan SameSite / Cookie

Untuk login berbasis session, cookie harus dikirim bolak-balik.\
Jika salah konfigurasi → cookie tidak terkirim, user tidak pernah dianggap login.

d. Izin Internet Android

AndroidManifest.xml harus menambahkan:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Jika tidak → Flutter tidak dapat mengakses jaringan sama sekali.

### Alur Pengiriman Data: Dari Input Pengguna Hingga Ditampilkan Kembali di Flutter
1. Pengguna mengisi form di Flutter.
2. Data dikumpulkan (misal menjadi JSON atau form-data).
3. Flutter mengirim request (http atau CookieRequest) ke Django.
4. Django menerima request → memproses → menyimpan ke database → mengembalikan JSON response.
5. Flutter menerima JSON → di-parse menjadi model Dart.
6. Widget menampilkan data menggunakan model tersebut.

Jika model tidak digunakan, parsing/error menjadi jauh lebih rawan.

### Mekanisme Autentikasi: Proses Login, Register, dan Logout antara Flutter dan Django
**Login**

1. User memasukkan username/password.
2. Flutter mengirim ke endpoint Django login (CookieRequest).
3. Django memvalidasi kredensial → jika benar, Django membuat session dan mengirim session cookie.
4. CookieRequest menyimpan cookie tersebut.
5. Flutter kini dianggap login dan dapat mengakses endpoint yang membutuhkan auth.
6. UI menampilkan menu khusus user yang sudah login.

**Register**

1. Flutter mengirim data akun baru ke Django.
2. Django membuat user baru.
3. Kadang bisa langsung login atau perlu login terpisah.
4. Setelah session aktif, cookie tersimpan dan digunakan.

**Logout**

1. Flutter memanggil endpoint logout Django.
2. Django menghapus session dan cookie.
3. CookieRequest menghapus cookie lokal.
4. Flutter kembali ke halaman login karena state auth hilang.