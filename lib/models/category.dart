import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageAsset; // Tambahkan field ini
  final Color color;

  Category({
    required this.name,
    required this.imageAsset,
    required this.color,
  });
}