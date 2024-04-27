import 'package:flutter/material.dart';
import 'package:kuis/pages/home.dart';
import 'package:kuis/pages/profile_page.dart';
import 'package:kuis/screens/stopwatch.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // [_currentIndex] value denotes which
  // [BottomNavigationBarItem] is currently selected.
  var _currentIndex = 0;

  // [_bodyPages] list is used to switch pages based on [_currentIndex].
  final _bodyPages = const <Widget>[
    HomePage(),
    FlutterStopWatch(),
    ProfilePage(),
  ];

  // [_bottomNavBarItems] list is used to
  // populate the [BottomNavigationBar] items.
  final _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.timer),
      label: 'Stopwatch',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.help_outline),
      label: 'Bantuan',
    ),
  ];

  // This method is used to set the current index and rebuild [DashboardPage].
  void _onItemClick(int value) {
    // [setState] is used to rebuild the [StatefulWidget].
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is assigned using the current index
      body: _bodyPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavBarItems,
        onTap: _onItemClick,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
