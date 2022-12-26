import 'package:flutter/material.dart';
import 'package:pixxie/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  static const List<Widget> page = [
    HomePage(),
    Text("notification"),
    Text("Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: page.elementAt(
          selectedIndex,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: selectedIndex == 0
              ? const Color(0xFFF4AB38)
              : selectedIndex == 1
                  ? const Color(0xFF00C0B0)
                  : const Color(0xFFFA4990),
          backgroundColor: Colors.white,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) => setState(
            () {
              selectedIndex = value;
            },
          ),
        ),
      ),
    );
  }
}
