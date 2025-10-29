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

Tugas Individu 6:
1. Widget tree adalah cara menunjukkan struktur hubungan antara widget pada tampilan aplikasi. Parent-child pada widget berkerja dengan cara parent sebagai pembungkus yang mengatur bagaimana child ditampilkan dan child menentukan apa yang ditampilkan/isinya
2. 
   1) MaterialApp
   2) Scaffold
   3) AppBar
   4) Text
   5) Padding
   6) Column
   7) Center
   8) SizedBox
   9) GridView.count
   10) Material
   11) InkWell
   12) Container
   13) Icon
   14) SnackBar
   15) ScaffoldMessenger
   16) Theme.of(context)
   17) 
3. Fungsi dari MaterialApp adalah sebagai pembungkus utama yang berbasis material design dan oleh karena hal tersebut ia digunakan sebagai widget root karena memberikan konteks dan konfigurasi aplikasi yang sesuai.
4. StatelessWidget adalah widget yang tdak berubah/statis sedangkan StatefulWidget adalah widget yang bisa berubah/dinamis. Karena sifat keduanya, stateless digunakan ketika tampilan tidak bergantungan dengan data yang berubah/data yang statis seperti untuk icon statis, label, dll sedangkan stateful digunakan ketika bergantungan terhadap data yang berubah/dinamis seperti untuk input, counter, dll.
5. BuildContext adalah sebuah referensi kepada lokasi sebuah widget dalam sebuah widget tree, BuildContext penting karena tanpanya tidak akan diketahui posisi sebuah widget pada widget tree sehingga tidak tahu harus ditampilkan di mana, hal tersebut sangat diperlukan pada metode build()
6. Hot reload adalah pemasukkan perubahan kode ke VM lalu membangun ulang widget tree dengan menyimpan status appnya karena tidak menjalan ulang main() ataupun  initState(). Di sisi lain, hot restart memasukkan perubahan kode ke VM lalu merestart applikasi flutternya sehingga kehilangan status aplikasinya.
7. Untuk berpindah antar layar pada suatu aplikasi flutter maka dapat digunakan sistem navigator yang ketika membuka layar baru akan menambahkannya ke stack navigasi. Maksud dari stack navigasi adalah stack yang menyimpan semua layar yang telah dikunjungi sehingga ketika lanjut hanya perlu menambahkan/push ke stack layar terbaru sedangkan ketika kembali hanya perlu melakukan pop untuk balik ke layar sebelumnya melalui sesuatu jalur/context bernama Route.