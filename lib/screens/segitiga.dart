import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';

class TriangleCalculatorPage extends StatefulWidget {
  @override
  _TriangleCalculatorPageState createState() => _TriangleCalculatorPageState();
}

class _TriangleCalculatorPageState extends State<TriangleCalculatorPage> {
  double _sideA = 0, _sideB = 0, _sideC = 0;

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
            "Hitung Luas & Keliling Segitiga",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisi A',
              ),
              onChanged: (value) {
                setState(() {
                  _sideA = double.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisi B',
              ),
              onChanged: (value) {
                setState(() {
                  _sideB = double.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Sisi C',
              ),
              onChanged: (value) {
                setState(() {
                  _sideC = double.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sideA == null || _sideB == null || _sideC == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TriangleCalculatorResultPage(
                            sideA: _sideA,
                            sideB: _sideB,
                            sideC: _sideC,
                          ),
                        ),
                      );
                    },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleCalculatorResultPage extends StatelessWidget {
  final double sideA, sideB, sideC;

  TriangleCalculatorResultPage(
      {Key? key, required this.sideA, required this.sideB, required this.sideC})
      : super(key: key);

  double _getPerimeter() {
    return sideA + sideB + sideC;
  }

  double _getSemiPerimeter() {
    return _getPerimeter() / 2;
  }

  double _getArea() {
    double sp = _getSemiPerimeter();
    return sqrt(sp * (sp - sideA) * (sp - sideB) * (sp - sideC));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Keliling: ${_getPerimeter().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Luas: ${_getArea().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
