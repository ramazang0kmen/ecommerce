import 'package:ecommerce/data/order/models/order_status.dart';
import 'package:ecommerce/data/order/models/product_orderer.dart';
import 'package:ecommerce/domain/order/entities/order.dart';

class OrderModel {
  final List<ProductOrdererModel> products;
  final String createdDate;
  final int itemCount;
  final double totalPrice;
  final String shippingAddress;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
    required this.code,
    required this.orderStatus,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: List<ProductOrdererModel>.from(
          map['products']?.map((e) => ProductOrdererModel.fromMap(e))),
      createdDate: map['createdDate'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      shippingAddress: map['shippingAddress'] as String,
      code: map['code'] as String,
      orderStatus: List<OrderStatusModel>.from(
          map['orderStatus']?.map((e) => OrderStatusModel.fromMap(e))),
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      itemCount: itemCount,
      totalPrice: totalPrice,
      shippingAddress: shippingAddress,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
