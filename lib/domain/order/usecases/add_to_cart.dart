import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:ecommerce/data/order/models/add_to_card_req.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, AddToCardReq> {
  @override
  Future<Either> call({AddToCardReq? params}) async {
    return await sl<OrderRepository>().addToCart(params!);
  }
}
