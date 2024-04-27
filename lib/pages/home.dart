import 'package:flutter/material.dart';
import 'package:kuis/pages/favorite.dart';
import 'package:kuis/pages/login.dart';
import 'package:kuis/pages/rekomendasi_buku.dart';

import 'package:kuis/screens/anggota.dart';
import 'package:kuis/screens/bilangan_prima.dart';
import 'package:kuis/screens/segitiga.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
            icon: Icon(Icons.undo)),
        title: Center(
          child: Text(
            "Halo " + username,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Daftar Anggota'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemberListPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Bilangan Prima'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeNumberPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Penghitung Luas dan Keliling Segitiga'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TriangleCalculatorPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Daftar Situs Rekomendasi'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListBuku()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Favorite'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
