import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/models/add_to_card_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCardReq addToCardReq);
}
