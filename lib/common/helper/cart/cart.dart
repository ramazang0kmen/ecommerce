import 'package:ecommerce/domain/order/entities/product_orderer.dart';

class CartHelper {
  static double calculateCartSubtotal(List<ProductOrdererEntity> products) {
    double subtotalPrice = 0;
    for (var item in products) {
      subtotalPrice = subtotalPrice + item.totalPrice;
    }
    return subtotalPrice;
  }
}
