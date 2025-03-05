class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  // Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// to Json
  toJson() {
    return {
      'Id':id,
      'Image':image,
      'Price':price,
      'SKU':sku,
      'Stock':stock,
      'SalePrice':salePrice,
      'Description':description,
      'AttributeValues':attributeValues

    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      description: data['Description']??'',
      price:data['Price'] ?? 0.0,
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? '',
      salePrice: data['SalePrice'] ?? 0.0,
      image: data['Image'] ?? '',
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
