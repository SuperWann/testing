import 'package:flutter/material.dart';
import 'package:testing/widgets/roundedNavbar.dart';

class ApiConfig {
  static const String baseUrl = '';
}

class NavBarConfig {
  static List<NavBarItem> get mainNavItems => [
    NavBarItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    NavBarItem(
      icon: Icons.shopping_bag_outlined,
      activeIcon: Icons.shopping_bag,
      label: 'Shop',
    ),
    NavBarItem(
      icon: Icons.menu_book_outlined,
      activeIcon: Icons.menu_book,
      label: 'Articles',
    ),
    NavBarItem(
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Community',
    ),
    NavBarItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  static const Color primaryColor = Colors.green;
  static final Color inactiveColor = Colors.grey[600]!;
}