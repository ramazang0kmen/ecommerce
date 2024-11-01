import 'package:ecommerce/domain/product/entities/product.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductEntity product) {
    return product.discountPrice != 0
        ? product.discountPrice.toDouble()
        : product.price.toDouble();
  }
}
