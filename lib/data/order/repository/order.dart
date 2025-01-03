import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/models/add_to_card_req.dart';
import 'package:ecommerce/data/order/models/order.dart';
import 'package:ecommerce/data/order/models/order_registration_req.dart';
import 'package:ecommerce/data/order/models/product_orderer.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) async {
    return sl<OrderFirebaseService>().addToCart(addToCardReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductOrdererModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(
          message,
        );
      },
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq orders) async {
    var returnedData =
        await sl<OrderFirebaseService>().orderRegistration(orders);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(
          message,
        );
      },
    );
  }

  @override
  Future<Either> getOrders() async {
    var returnedData = await sl<OrderFirebaseService>().getOrders();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) => OrderModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
