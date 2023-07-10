import 'package:flutter/material.dart';

import 'package:chat/mainpage.dart';
import 'package:chat/setting.dart';
import 'package:chat/bookmark.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Briefly',
      home: Mainscreen(),
    );
  }
}

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOption = <Widget>[
    Setting(),
    Mainpage(),
    Bookmark()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOption.elementAt(_selectedIndex)),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 158, 224, 1),
            Color.fromRGBO(0, 114, 183, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/setting_off.png',
              width: 25,
              height: 25,
            ),
            label: "설정",
            activeIcon: Image.asset(
              'assets/images/setting_on.png',
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_off.png',
              width: 25,
              height: 25,
            ),
            label: "홈",
            activeIcon: Image.asset(
              'assets/images/home_on.png',
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/bookmark_off.png',
              width: 25,
              height: 25,
            ),
            label: "북마크",
            activeIcon: Image.asset(
              'assets/images/bookmark_on.png',
              width: 25,
              height: 25,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
