

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  // Convert a ProductCategoryModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  // Create a ProductCategoryModel instance from a JSON map
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      productId: json['ProductId'] as String,
      categoryId: json['CategoryId'] as String,
    );
  }
}
