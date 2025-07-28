import 'package:flutter/material.dart';
import 'package:testing/config.dart';
import 'package:testing/pages/articlePage/listArticlePage.dart';
import 'package:testing/pages/communityPage/listCommunityPage.dart';
import 'package:testing/pages/ecommercePage/ecommercePage.dart';
import 'package:testing/pages/homePage/homePage.dart';
import 'package:testing/pages/profilePage/profilePage.dart';
import 'package:testing/widgets/roundedNavbar.dart';

class Navbar extends StatefulWidget {
  static const routeName = '/navbar';

  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  // List halaman sesuai dengan navbar
  final List<Widget> _pages = [
    HomePage(),
    EcommercePage(),
    ListArticlePage(),
    ListCommunityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody penting untuk membuat navbar float
      extendBody: true,
      body: Stack(
        children: [
          // Pages content
          IndexedStack(index: _currentIndex, children: _pages),
          // Floating navbar overlay
          FloatingNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: NavBarConfig.mainNavItems,
            activeColor: Color(0xFF007B29),
            backgroundColor: Colors.white,
            bottomMargin: 30,
          ),
        ],
      ),
    );
  }
}
