import 'package:ecommerce/data/order/models/product_orderer.dart';
import 'package:ecommerce/domain/order/entities/product_orderer.dart';

class OrderRegistrationReq {
  final List<ProductOrdererEntity> products;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;

  OrderRegistrationReq({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
    };
  }
}
