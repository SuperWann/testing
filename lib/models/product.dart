class Product {
  final String name;
  final String price;
  final String imageAsset;
  final String description;
  final bool isHot;

  Product({
    required this.name,
    required this.price,
    required this.imageAsset,
    required this.description,
    this.isHot = false,
  });
}