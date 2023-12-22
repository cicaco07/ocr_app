import 'package:ocr_app/pages/account.dart';
import 'package:ocr_app/pages/history.dart';
import 'package:ocr_app/pages/home_screen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentPageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const HistoryPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.history),
              icon: Icon(Icons.history_outlined),
              label: 'History',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.switch_account),
              icon: Icon(Icons.switch_account_outlined),
              label: 'Account',
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          height: 60,
        ),
      ),
      body: _pages[currentPageIndex],
    );
  }
}
