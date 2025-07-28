import 'package:flutter/material.dart';
import 'package:testing/config.dart';
import 'package:testing/widgets/roundedNavbar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  // List halaman sesuai dengan navbar
  final List<Widget> _pages = [
    // HomePage(),
    // EcommercePage(),
    // ArticlePage(),
    // CommunityPage(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: RoundedNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: NavBarConfig.mainNavItems,
        activeColor: NavBarConfig.primaryColor,
        inactiveColor: NavBarConfig.inactiveColor,
      ),
    );
  }
}