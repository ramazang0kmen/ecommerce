import 'package:ecommerce/domain/order/entities/order_status.dart';
import 'package:ecommerce/domain/order/entities/product_orderer.dart';

class OrderEntity {
  final List<ProductOrdererEntity> products;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.code,
    required this.orderStatus,
  });
}
