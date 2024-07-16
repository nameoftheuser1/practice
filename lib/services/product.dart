class Product {
  int id;
  String product_name;
  String generic_name;
  String category;
  String product_description;
  double price;
  String url;

  Product(
      {required this.id,
      required this.product_name,
      required this.generic_name,
      required this.category,
      required this.product_description,
      required this.price,
      required this.url});

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'product_name': String product_name,
        'generic_name': String generic_name,
        'category': String category,
        'product_description': String product_description,
        'price': double price,
        'url': String url
      } =>
        Product(
            id: id,
            product_name: product_name,
            generic_name: generic_name,
            category: category,
            product_description: product_description,
            price: price,
            url: url),
      _ => throw const FormatException('Failed to load products')
    };
  }
}
