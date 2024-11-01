import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/models/add_to_card_req.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) async {
    return sl<OrderFirebaseService>().addToCart(addToCardReq);
  }
}
