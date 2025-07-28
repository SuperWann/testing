import 'package:flutter/material.dart';
import 'package:testing/widgets/roundedNavbar.dart';

class ApiConfig {
  static const String baseUrl = '';
}

class GeminiApiKey{
  static const String apiKey = 'AIzaSyBs4oYKk64AyQsNEF4aZ4Fa1ElYgQPq6k0';
}

class NavBarConfig {
  static List<NavBarItem> get mainNavItems => [
    NavBarItem(
      icon: Icons.home_rounded,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    NavBarItem(
      icon: Icons.shopping_bag_rounded,
      activeIcon: Icons.shopping_bag_rounded,
      label: 'Shop',
    ),
    NavBarItem(
      icon: Icons.menu_book_rounded,
      activeIcon: Icons.menu_book_rounded,
      label: 'Articles',
    ),
    NavBarItem(
      icon: Icons.people_rounded,
      activeIcon: Icons.people_rounded,
      label: 'Community',
    ),
    NavBarItem(
      icon: Icons.person_rounded,
      activeIcon: Icons.person_rounded,
      label: 'Profile',
    ),
  ];

  static const Color primaryColor = Colors.green;
  static final Color inactiveColor = Colors.grey[600]!;
}
