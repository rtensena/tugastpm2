import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';
import 'dart:math';

import 'package:kuis/pages/page_content.dart';

class PrimeNumberPage extends StatefulWidget {
  const PrimeNumberPage({Key? key}) : super(key: key);
  @override
  State<PrimeNumberPage> createState() => _PrimeNumberPageState();
}

class _PrimeNumberPageState extends State<PrimeNumberPage> {
  var menuItems = <String>[
    "About",
  ];

  void onSelected(item) {
    switch (item) {
      case 'About':
        // showDialog(
        //   context: context,
        //   builder: buildErrotDialog,
        // );
        showAboutDialog(
            context: context,
            applicationVersion: versionString,
            applicationName: "PrimeCheck",
            applicationLegalese:
                "Released under the terms of the GNU GPL v3.\n\nCopyright (c) 2022-${DateTime.now().year} Piotr Lange",
            applicationIcon: const Image(
              image: AssetImage("assets/images/icon-1.png"),
              width: 52,
              height: 52,
            ));
        break;
    }
  }

  int _number = -1;
  bool _isPrime = false;
  int _numberThatDevides = 0;
  final textFieldController = TextEditingController();
  String versionString = "0.2.1";

  void checkIfNumberIsPrime() {
    setState(() {
      _number = int.parse(textFieldController.text);
      List tempList = isPrime(_number);
      _isPrime = tempList[0];
      _numberThatDevides = tempList[1];
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }

  Widget buildErrotDialog(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            const Text(
              "PrimeCheck",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 7,
            ),
            const Icon(Icons.info),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Released under the GNU GPL v3",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "version: $versionString",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
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
            "Cek Bilangan Prima",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: PageContent(
        number: _number,
        isPrime: _isPrime,
        numberThatDevides: _numberThatDevides,
        textFieldController: textFieldController,
        checkIfNumberIsPrime: checkIfNumberIsPrime,
      )),
    );
  }
}

List isPrime(final int number) {
  if (number <= 1) {
    return [false, 0];
  }
  if (number == 2) {
    return [true, 0];
  }
  if (number == 3) {
    return [true, 0];
  }
  if (number % 2 == 0) {
    return [false, 2];
  }
  if (number % 3 == 0) {
    return [false, 3];
  }

  final int lim = sqrt(number).toInt();
  for (int i = 5; i <= lim; i += 6) {
    if (number % i == 0) {
      return [false, i];
    }
    if (number % (i + 2) == 0) {
      return [false, i + 2];
    }
  }

  return [true, 0];
}
