import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';

class EcommerceProvider extends ChangeNotifier {
  int _selectedCategoryIndex = 0; 
  String _searchQuery = '';
  
  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get searchQuery => _searchQuery;
  
  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  final List<Category> categories = [
    Category(
      name: 'Hasil Panen',
      imageAsset: 'assets/images/harvest_icon.png',
      color: const Color(0xFFE8F5E8),
    ),
    Category(
      name: 'Olahan Kebun',
      imageAsset: 'assets/images/soil_icon.png',
      color: const Color(0xFFFFF3E0),
    ),
    Category(
      name: 'Bibit & Benih',
      imageAsset: 'assets/images/seed_icon.png',
      color: const Color(0xFFF3E5F5),
    ),
    Category(
      name: 'Bibit dan Pakan Hewan',
      imageAsset: 'assets/images/animal_icon.png',
      color: const Color(0xFFF3E5F5),
    ),
    Category(
      name: 'Pupuk',
      imageAsset: 'assets/images/fertilizer_icon.png',
      color: const Color(0xFFE3F2FD),
    ),
    Category(
      name: 'Perlengkapan',
      imageAsset: 'assets/images/tools_icon.png',
      color: const Color(0xFFFFF8E1),
    ),
    Category(
      name: 'Peralatan IoT',
      imageAsset: 'assets/images/iot_icon.png',
      color: const Color(0xFFFCE4EC),
    ),
    Category(
      name: 'Paket Kebun',
      imageAsset: 'assets/images/kebun_icon.png',
      color: const Color(0xFFE0F7FA),
    ),
  ];

  final List<Product> products = [
    Product(
      name: 'Benih Pakchoy F1',
      price: 'Rp. 13.000',
      imageAsset: 'assets/images/pakchoy.png',
      description: 'Stok: 25 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Bibit Cabai 50 Biji',
      price: 'Rp. 13.000',
      imageAsset: 'assets/images/cabai.png',
      description: 'Stok: 25 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Tomat Bareto F1',
      price: 'Rp. 25.000',
      imageAsset: 'assets/images/tomat.png',
      description: 'Stok: 25 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Bibit Timun F1',
      price: 'Rp. 18.000',
      imageAsset: 'assets/images/timun.png',
      description: 'Stok: 25 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Bayam Merah',
      price: 'Rp. 15.000',
      imageAsset: 'assets/images/pakchoy.png',
      description: 'Stok: 20 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Kolplay F1',
      price: 'Rp. 20.000',
      imageAsset: 'assets/images/pakchoy.png',
      description: 'Stok: 30 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Terong Ungu',
      price: 'Rp. 17.000',
      imageAsset: 'assets/images/pakchoy.png',
      description: 'Stok: 15 Terjual',
      isHot: false,
    ),
    Product(
      name: 'Benih Selada Hidroponik',
      price: 'Rp. 22.000',
      imageAsset: 'assets/images/pakchoy.png',
      description: 'Stok: 40 Terjual',
      isHot: false,
    ),
  ];

  List<Product> get filteredProducts {
    if (_searchQuery.isEmpty) return products;
    return products.where((product) => 
      product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      product.description.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  void sortProducts(String sortBy) {
    switch (sortBy) {
      case 'price_low':
        products.sort((a, b) => int.parse(a.price.replaceAll(RegExp(r'[^\d]'), '')).compareTo(int.parse(b.price.replaceAll(RegExp(r'[^\d]'), ''))));
        break;
      case 'price_high':
        products.sort((a, b) => int.parse(b.price.replaceAll(RegExp(r'[^\d]'), '')).compareTo(int.parse(a.price.replaceAll(RegExp(r'[^\d]'), ''))));
        break;
      case 'name_az':
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'name_za':
        products.sort((a, b) => b.name.compareTo(a.name));
        break;
    }
    notifyListeners();
  }
}