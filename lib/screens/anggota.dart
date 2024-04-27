import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';

class MemberListPage extends StatelessWidget {
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
            "Daftar Anggota",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Alfiyan Yusuf/123210068",
              style: TextStyle(fontSize: 20), // Adjust the fontSize here
            ),
            Text(
              "Damario Denny Daniswara/123210110",
              style: TextStyle(fontSize: 20), // Adjust the fontSize here
            ),
            Text(
              "Winalfan Artensena Pamuji/123210168",
              style: TextStyle(fontSize: 20), // Adjust the fontSize here
            ),
          ],
        ),
      ),
    );
  }
}

class MemberDetailPage extends StatelessWidget {
  final int index;

  MemberDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anggota $index'),
      ),
      body: Center(
        child: Text('Detail Anggota $index'),
      ),
    );
  }
}
