import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';
import 'package:kuis/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Method used to delete the [isAuth] key from the shared prefs.
  Future<bool> _deleteAuthKey() async {
    final prefs = await SharedPreferences.getInstance();

    // The key-value is deleted using the remove method.
    final isKeyDeleted = prefs.remove('isAuth');

    // The result of the delete operation is returned.
    return isKeyDeleted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return DashboardPage();
              }));
            },
            icon: Icon(Icons.undo)),
        title: Center(
          child: Text(
            "Cara Penggunaan Aplikasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your paragraph here
              Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. Menu Bilangan Prima : Untuk menentukan range pencarian bilangan prima, diisi dengan angka lalu keluar hasil.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "2. Menu Segitiga : Untuk melakukan pencarian Luas dan Keliling Segitiga, isi masing - masing kolom dengan angka. Kolom sisi a sisi b sisi c, dalam pengisian sisi a sisi b sisi c perlu dipertimbangkan karena dalam pengisian sisi dapat menentukan kevalidan segitiga yang dibuat.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "3. Menu Daftar Buku : Berisi kumpulan Buku, terdapat tombol Favorite dan Link menuju situs(dengan mengklik gambar buku).",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "4. Menu Favorite : Berisi kumpulan buku yang sudah ditambahkan ke dalam buku Favorite.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "5. Menu Stopwatch : Berfungsi sebagai stopwatch yang dapat anda gunakan dimana saja dan kapan saja.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                  height: 20), // Optional spacing between paragraph and button
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final isDeleted = await _deleteAuthKey();
                        if (isDeleted && context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
