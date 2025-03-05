

class CartItemModel {
  int quantity;
  String productId;
  String variationId;
  double price;
  String? image;
  String title;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.quantity,
    required this.productId,
    this.variationId="",
    this.image,
    this.price=0.0,
    this.title="",
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', variationId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'Quantity': quantity,
      'ProductId': productId,
      'VariationId': variationId,
      'Price': price,
      'Image': image,
      'Title': title,
      'BrandName': brandName,
      'SelectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      quantity: json['Quantity'] ?? 0,
      productId: json['ProductId'] ?? '',
      variationId: json['VariationId'] ?? '',
      price: json['Price']?.toDouble() ,
      image: json['Image'],
      title: json['Title'],
      brandName: json['BrandName'],
      selectedVariation: json['SelectedVariation'] != null
          ? Map<String, String>.from(json['SelectedVariation'])
          : null,
    );
  }

}
