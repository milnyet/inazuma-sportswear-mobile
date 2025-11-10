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