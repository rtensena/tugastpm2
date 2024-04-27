import 'package:flutter/material.dart';
import 'package:kuis/data/data_buku.dart';
import 'package:kuis/pages/detail.dart';
import 'package:kuis/pages/home.dart';
import 'package:kuis/pages/homepage.dart';
import 'package:kuis/pages/login.dart';

class ListBuku extends StatelessWidget {
  const ListBuku({super.key});

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
            "Data Buku",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listBuku.length,
          itemBuilder: ((context, index) {
            return Container(
              height: 300,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail(
                      detail: listBuku[index],
                    );
                  }));
                },
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    Image.network(listBuku[index].imageLink),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listBuku[index].title,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "penulis: ${listBuku[index].author}",
                          style: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.grey,
                            ),
                            Text(
                              "${listBuku[index].pages} Halaman",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
