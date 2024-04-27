import 'package:flutter/material.dart';

class RecommendedSiteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Situs Rekomendasi'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/images/site$index.png'),
            title: Text('Situs $index'),
            subtitle: Text('Deskripsi situs $index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RecommendedSiteDetailPage(index: index)),
              );
            },
          );
        },
      ),
    );
  }
}

class RecommendedSiteDetailPage extends StatelessWidget {
  int index;

  RecommendedSiteDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs $index'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/site$index.png'),
            SizedBox(height: 16.0),
            Text(
              'Deskripsi situs $index',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class finalint {}
