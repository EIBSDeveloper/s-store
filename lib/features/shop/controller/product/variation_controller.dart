import 'package:get/get.dart';
import 'package:t_store/features/shop/controller/product/cart_controller.dart';
import 'package:t_store/features/shop/controller/product/image_controller.dart';
import 'package:t_store/features/shop/model/product_model.dart';

import '../../model/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockPrice = ''.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute and variation

  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    /// when attribute selected we will add that attribute to the selected attribute
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeVariation(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    /// Show the selected image variation as main image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
     cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    /// Assign the selected variation
    this.selectedVariation.value = selectedVariation;

    /// update the selected product variation status
    getProductVariationStockStatus();
  }

  /// Check if selected attributes matches any  variation attributes
  bool _isSameAttributeVariation(Map<String, String> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    /// if selected Attributes contain 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    /// If any of the attribute is different than return ex: [green,large] x[Green, small]
    for (final key in variationAttributes.keys) {
      /// Attributes[keys] = values could be [small, Green, Cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  Set<String?> getAttributesAvaliblityInVariation(
      List<ProductVariationModel> variation, String attributeName) {
    /// pass the variation to check which attributes  are available and stock is not 0
    final availableVariationAttributesValues = variation
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
    /// fetch non empty attributes of variation
    .map((variation)=>variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributesValues;
  }

  String getVariationPrice(){

    return (selectedVariation.value.salePrice> 0? selectedVariation.value.salePrice:selectedVariation.value.price).toString();

  }
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value ='';
    selectedVariation.value =ProductVariationModel.empty();
  }
}
