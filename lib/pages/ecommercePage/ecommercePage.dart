import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/ecommerce_provider.dart';
import 'widgets/categories_section.dart';
import 'widgets/product_section.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EcommerceProvider(),
      child: const EcommerceView(),
    );
  }
}

class EcommerceView extends StatelessWidget {
  const EcommerceView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EcommerceProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Mencegah navbar naik saat keyboard muncul
        backgroundColor: const Color(0xFFFAFAFA),
        body: SafeArea(
          child: Column(
            children: [
              // Search Bar and Sort Button
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    // Search Bar
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(
                                Icons.search,
                                color: Color(0xFF9E9E9E),
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                cursorColor: const Color(0xFF4CAF50),
                                decoration: const InputDecoration(
                                  hintText: 'Cari',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9E9E9E),
                                    fontSize: 14,
                                  ),
                                ),
                                onChanged: (value) {
                                  provider.setSearchQuery(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Sort Button
                    GestureDetector(
                      onTap: () {
                        // Unfocus keyboard sebelum menampilkan dialog
                        FocusScope.of(context).unfocus();
                        showDialog(
                          context: context,
                          barrierColor: Colors.black54,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Header
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF8F9FA),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4CAF50),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.sort,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Urutkan Berdasarkan',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF212121),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Sort Options
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        _buildSortOption(
                                          context: context,
                                          icon: Icons.arrow_upward,
                                          title: 'Harga Terendah',
                                          subtitle: 'Urutkan dari harga terendah ke tertinggi',
                                          onTap: () {
                                            provider.sortProducts('price_low');
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Color(0xFFE0E0E0),
                                        ),
                                        _buildSortOption(
                                          context: context,
                                          icon: Icons.arrow_downward,
                                          title: 'Harga Tertinggi',
                                          subtitle: 'Urutkan dari harga tertinggi ke terendah',
                                          onTap: () {
                                            provider.sortProducts('price_high');
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Color(0xFFE0E0E0),
                                        ),
                                        _buildSortOption(
                                          context: context,
                                          icon: Icons.sort_by_alpha,
                                          title: 'Nama A-Z',
                                          subtitle: 'Urutkan nama dari A sampai Z',
                                          onTap: () {
                                            provider.sortProducts('name_az');
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Color(0xFFE0E0E0),
                                        ),
                                        _buildSortOption(
                                          context: context,
                                          icon: Icons.sort_by_alpha,
                                          title: 'Nama Z-A',
                                          subtitle: 'Urutkan nama dari Z sampai A',
                                          iconTransform: Matrix4.rotationY(3.14159), // Flip icon horizontally
                                          onTap: () {
                                            provider.sortProducts('name_za');
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Cancel Button
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    child: TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color(0xFFF5F5F5),
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Batal',
                                        style: TextStyle(
                                          color: Color(0xFF757575),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Categories Section
              const CategoriesSection(),
              
              // Products Section
              Expanded(
                child: const ProductsSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSortOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Matrix4? iconTransform,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Transform(
                  alignment: Alignment.center,
                  transform: iconTransform ?? Matrix4.identity(),
                  child: Icon(
                    icon,
                    color: const Color(0xFF4CAF50),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF9E9E9E),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}