import 'package:flutter/material.dart';
import 'package:kuis/data/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  Detail({required this.detail, super.key});

  DataBuku detail;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.undo)),
        title: Center(
          child: Text(widget.detail.title),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    _launchURL(widget.detail.link);
                  },
                  child: Image.network(widget.detail.imageLink)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Penulis                    : ${widget.detail.author}"),
                  Text("Bahasa                    : ${widget.detail.language}"),
                  Text("Negara                    : ${widget.detail.country}"),
                  Text("Jumlah Halaman  : ${widget.detail.pages}"),
                  Text("Tahun Terbit          : ${widget.detail.year}"),
                  Text(
                      "Status                     : ${(widget.detail.isAvailable == true) ? "Tersedia" : "tidak tersedia"}"),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: (widget.detail.isAvailable == true)
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.detail.isAvailable =
                                  !widget.detail.isAvailable;
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Berhasil Menambahkan Buku Ke Favorite")));
                            });
                          },
                          child: Text("Favorite"))
                      : ElevatedButton(
                          onPressed: null, child: Text("Sudah Ditambahkan")))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
