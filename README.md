# inazuma_sportswear

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Tugas Individu 7:
1. Widget tree adalah cara menunjukkan struktur hubungan antara widget pada tampilan aplikasi. Parent-child pada widget berkerja dengan cara parent sebagai pembungkus yang mengatur bagaimana child ditampilkan dan child menentukan apa yang ditampilkan/isinya
2. 
   1) MaterialApp: Root widget yang menentukan tema, judul, dan pengaturan global lainnya
   2) Scaffold: Menyediakan rangka dasar untuk halaman
   3) AppBar: Menampilkan toolbar
   4) Text: Menampilkan teks
   5) Padding: Memberikan jarak (padding) antara elemen dan tepi tampilan
   6) Column: Menyusun widget-widget secara vertikal
   7) Center: Menaruh widget di tengah
   8) SizedBox: Memberikan jarak antar elemen dengan ukuran tertentu.
   9) GridView.count: Menampilkan sekumpulan elemen dalam bentuk grid
   10) Material: Parent widget yang memberikan efek material design ke anaknya
   11) InkWell: Memberikan efek klik saat menekan tombol
   12) Container: Memberikan wadah untuk menata widget-widget lain
   13) Icon: Menampilkan ikon-ikon dari library bawaan
   14) SnackBar: Menampilkan notif/pesan pada bawah layar
   15) ThemeData && ColorScheme: Mengaturan tampilan global aplikasi (warna utama, warna sekunder, font, dll)
   16) ItemCard: Menampilkan menu kartu
3. Fungsi dari MaterialApp adalah sebagai pembungkus utama yang berbasis material design dan oleh karena hal tersebut ia digunakan sebagai widget root karena memberikan konteks dan konfigurasi aplikasi yang sesuai.
4. StatelessWidget adalah widget yang tdak berubah/statis sedangkan StatefulWidget adalah widget yang bisa berubah/dinamis. Karena sifat keduanya, stateless digunakan ketika tampilan tidak bergantungan dengan data yang berubah/data yang statis seperti untuk icon statis, label, dll sedangkan stateful digunakan ketika bergantungan terhadap data yang berubah/dinamis seperti untuk input, counter, dll.
5. BuildContext adalah sebuah referensi kepada lokasi sebuah widget dalam sebuah widget tree, BuildContext penting karena tanpanya tidak akan diketahui posisi sebuah widget pada widget tree sehingga tidak tahu harus ditampilkan di mana, hal tersebut sangat diperlukan pada metode build()
6. Hot reload adalah pemasukkan perubahan kode ke VM lalu membangun ulang widget tree dengan menyimpan status appnya karena tidak menjalan ulang main() ataupun  initState(). Di sisi lain, hot restart memasukkan perubahan kode ke VM lalu merestart applikasi flutternya sehingga kehilangan status aplikasinya.

Tugas 8:
1. Perbedaan antara .push dan .pushreplacement adalah pada bagaimana ia mengatasi halaman sebelumnya. Pada .push halaman sebelumnya di simpan pada stack dan pengguna bisa kembali ke halaman tersebut karena halaman baru hanyalah di atas halaman sebelumnya di stack. Di sisi lain, .pushreplacement mengubah langusng halaman sebelumnya menjadi halaman baru tanpa kemungkin kembali. Penggunaanya pada toko saya adalah ketika penggguna menekan tombol home maka digunakan .pushreplacement agar membersihkan stacknya sedangkan .push dapat digunakan ketika misal setelah user membuat atau membaca detail produk agar mereka bisa kembali ke halaman sebelumnya dengan pencet tombol kembali
2. Scaffold merupakan kerangka dari setiap halaman dan dalamnya terdapat appbar dan drawer, di mana appbar digunakan untuk memberikan title bar yang konsisten pada setiap halaman dan drawer digunkan untuk menampilkan menu sidebar. dengan menggunakan scaffold dan hierarki di mana appbar dan drawer di dalamnya dapat dipastikan bahwa menunya akan consisten dan sama pada seluruh aplikasi
3. Padding memberikan ruangan antar tempat input di suatu form sehingga tidak terlihat sempit dan sulit di navigasi, SingleChildScrollView memberikan pengguna kemampuan untuk tetap melakukan scrolling walaupun sedang mengetik di form agar tidak perlu menutup keyboard untuk menekan tombol atau hal lain yang ditutupinya, ListView memberikan kemampuan scroll otomatis yang berguna ketika jumlah hal yang ingin ditampilkan tidak pasti. Contoh penerpan hal berikut di aplikasi saya ada di bagian productlist_form.dart yang menerapkan padding dan SingleChildScrollView serta pada bagian left_drawer.dart yang menerapkan Listview
4. Untuk menyeseuikan warna tema aplikasi cukup mengubah widget MaterialsApp pada main.dart yang mengandung atribut/properti theme yang menyimpan styling(warna) aplikasi

Tugas 9:
1. Model diperlukan karena data yang diambil dari backend django berupa mentah json yang tidak memiliki struktur dan penggunaan model mengubah data tersebut menjadi objek dart yang aman digunakan. Jika tidak menggunakan model dan hanya map<String,dynamic> maka kita tidak bisa validasi tipe dan keberadaan(null-safety) sebuah data misal, data "price" pada produk jika diambil langsung dengan map maka tidak ada validasi tipenya integer atau tidak dan juga validasi apakah datanya ada atau tidak. Selain masalah validasi dan null safety juga ada masalah maintanability yang di mana jika kita ingin mengubah sesuatu di backend misal nama sebuah data diubah ("price" ke "harga") maka harus diubah satu per satu jika tidak menggunakan model (model hanya perlu ubah modelnya saja)
2. Fungsi kedua package adalah untuk melakukan komunikasi http di mana http merupakan dasar-dasar untuk membuat permintaan http sehingga hanya menigirim saja sedangkan CookieRequest adalah wrapper yang melakukan manajemen session dengan menangkap cookie yang dikirim django dan melanjutkannya ke setiap permintaan berikutnya sehingga ia tidak hanya mengirim tetapi juga sekaligus memvalidasi diri menggunakan session cookie yang dari login
3. Karena tanpa pembagiannya maka kita tidak ada cara untuk menyimpan status login antar halaman sehingga akan ada masalah persepsi belum login jika pada dua halaman terdapat cookies yang berbeda akibat dari tidak ada pembagian
4. Supaya Flutter bisa berkomunikasi dengan Django harus dilakukan konfigurasi yang harus benar, 10.0.2.2 ditambahkan pada ALLOWED_HOSTS karena ia merupakan ip khusus yang disediakan emulator android sebagai alias untuk merujuk ke localhost komputer dan dengan menambahkannya ke ALLOWED_HOSTS maka django akan percaya permintaan yang datang dari sana.  Corsheaders adalah middleware Django yang menambahkan header HTTP khusus ke respons server yang memberi tahu browser bahwa aplikasi dari http://localhost:51234(flutter) memiliki izin untuk mengambil data walaupun beda origin dari http://localhost:8000(django). Pengaturan SameSite Cookie memberi tahu browser kapan ia harus mengirim cookie. Dalam pengembangan cross origin kita sering harus mengatur SESSION_COOKIE_SAMESITE = 'None' supaya browser mau mengirimkan sessionid kembali ke server walaupun permintaannya berasal dari origin yang berbeda. Izin internet dilakukan dengan menambahkan <uses-permission android:name="android.permission.INTERNET" /> ke dalam file AndroidManifest.xml, aplikasi kita meminta izin kepada sistem operasi Android untuk membuka koneksi ke server Django yang kita miliki. Konsekuensi jika salah konfigurasi: Emulator Android gagal terhubung tanpa 10.0.2.2, Flutter Web mendapatkan error CORS dan memblokir respons dari Django jika tidak ada cors, Aplikasi crash atau gagal total saat mencoba melakukan panggilan jaringan apa pun karena tidak ada izin internet, Login hanya secara visual berhasil tetapi tidak ada cookies sehingga permintaan ke halaman yang memiliki @login_required akan gagal tanpa mengatur samesite cookie.
5. 
   1) Pengguna mengisi textformfield yang akan mengupdate variable-variable state
   2) Setelah melakukan save oleh pengguna akan dijalankan validator untuk validasi input yang telah diberikan
   3) Jika sudah tervalidasi maka dilakukan encoding dengan input diubah ke map lalu ke json
   4) Setelah diencode data akan dikirim melalui pemanggilan post json ke endpoint create-flutter
   5) Setelah itu create-flutter akan diarahkan untuk ke create_product_flutter di views.py (main)
   6) Di create_product_flutter akan terjadi cek oleh @login_required untuk memastikan bahwa data dikirim oleh user yang logged in dan aman
   7) View mengubah string JSON kembali menjadi data Python. 
   8) Data yang diterima akan divalidasi dan dibersihkan lalu sebuah objek Product baru dibuat dan data ini akan ditulis ke database.
   9) Setelah dimasukan ke database maka django akan mengirim jsonresponse "status:success" kembali ke flutter
   10) Flutter menerima respons tersebut lalu mengecek statusnya dan menampilkan snackbar yang sesuai
   11) Jika berhasil dimasukkan ke database maka produk akan bisa dilihat pada "All Products" dengan cara memanggil endpoint json dan akan ditampilkan pada daftar produk
6. Sebuah pengguna melakukan register dengan mengisi form pada register.dart dan data tersebut akan dikirim sebagai json ke fungsi register pada views.py di authentication yang lalu akan membuat objek user jika data aman untuk membuat akunnya lalu pengguna akan dibalikkan ke halaman login dengan status sukses buat akun.  Setelah registrasi sebuah pengguna melakukan login dengan mengisi form pada login.dart dan seperti pada register akan dikirim ke views.py pada authentication dalam bentuk form data ke fungsi login yang nanti akan memanggil authenticate untuk validasi data yang diterima dan jika aman akan membuat sesi pada database django lalu mengirim header sessionid unik yang diterima oleh cookierequest dan disimpan olehnya secara internal lalu menetapkan request.loggedin = true dan akhirnya akan memunculkan snackbar yang sesuai dan mengarahkan pengguna ke halaman utama.  Ketika pengguna berusaha untuk menambahkan produk maka akan dicek apakah ia memiliki sessionid yang valid seperti sebelumnya tetapi melalui @login_required pada create_proudct_flutter dan jika aman maka akan diperbolehkan untuk buka.  Ketika pengguna menekan tombol logout request.logout akan dipanggil dan fungsi logout pada views.py di authentication akan menghapus sesi di sisi django yang setelah itu diikuti oleh cookierequest yang juga menghasipus sesi di sisi flutter dan kemudian aplikasinya akan mengarah ke loginpage.
7. 
   1) Melakukan integrasi autentikasi antara django dengan flutter, pertama membuat app 'authentication' lalu mengunduh dependensi-dependensi yang dibutuhkan django dan flutter (lupa naruh salah satunua di requirements tapi nanti difix saya taruh di sini biar lebih mudah dibaca)
   2) Membuat file-file yang dibutuhkan oleh flutter seperti login, register lalu mengisinya dengan kode yang sesuai dan juga menambahkan fungsi yang dibutuhkan pada django
   3) Membuat model sesuai dengan json django lalu membuat product_detail untuk menampilkan semua data model
   4) Melakukan integrasi data produk dengan menerapkan model tersebut dan django agar data-data produk bisa ditampilkan semua pada product_detail dan card
   5) Membuat form untuk mengisi data produk baru menampilkan data baru bukan hanya pop-up dengan cara membuat fungi create_product_flutter pada main views.py lalu menhubungkannya dengan flutter pada newslist_form.dart
   6) Membuat fungsi logout sama seperti login dan register
   7) Membuat filter untuk produk berdasarkan id user dan status featured lalu menghubungkannya ke tombol pada halaman utama
   8) Membuat tombol logout dan featured pada halamana utama dan hubungkan logout ke fungsi (juga ada tombol logout pada left drawer)
   9) Membuat dropdown pada dafter produk agar bisa lebih mudah milih filter langsung
   10) Menyesuaikan desain flutter dengan desain website django (warna, posisi, dll) dan juga ubah warna tombol all products karena berantem dengan background
   11) Setelah melakukan testing pakai local dan pws push hasil ke github
   12) Jawab readme
   13) Push ke github terakhir setelah jawab readme