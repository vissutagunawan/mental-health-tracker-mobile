import 'package:flutter/material.dart';
import 'package:mental_health_tracker/widgets/left_drawer.dart';
import 'package:mental_health_tracker/widgets/mood_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306214656';
  final String name = 'Vissuta Gunawan Lim';
  final String className = 'PBP D';
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Mood", Icons.mood),
    ItemHomepage("Tambah Mood", Icons.mood),
    ItemHomepage("Logout", Icons.logout),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Mental Health Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Mengganti warna icon drawer menjadi putih
        iconTheme: const IconThemeData(color: Colors.white),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      //Masukkan drawer sebagai parameter nilai drawer edari widget Scaffold drawer
      drawer: const LeftDrawer(),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Mental Health Tracker',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        child: Container(
            width: MediaQuery.of(context).size.width / 3.5,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
              ],
            )));
  }
}
