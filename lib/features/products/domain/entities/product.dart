class Product {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Map<String, dynamic> rating;
  bool isFavourite = false;
  int quantity = 1;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}
