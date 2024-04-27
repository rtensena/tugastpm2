import 'package:flutter/material.dart';
import 'package:kuis/data/data_buku.dart';
import 'package:kuis/pages/homepage.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Filtered list containing only unavailable books
    final unavailableBooks =
        listBuku.where((book) => !book.isAvailable).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return DashboardPage();
              }),
            );
          },
          icon: Icon(Icons.undo),
        ),
        title: Center(
          child: Text(
            "Buku Favorite",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: unavailableBooks.length,
        itemBuilder: (BuildContext context, int index) {
          final book = unavailableBooks[index];
          // Return a widget to display the book
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            // Add more details if needed
          );
        },
      ),
    );
  }
}
