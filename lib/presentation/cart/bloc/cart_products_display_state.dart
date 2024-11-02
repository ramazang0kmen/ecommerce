import 'package:ecommerce/domain/order/entities/product_orderer.dart';

abstract class CartProductsDisplayState {}

class CartProductsLoading extends CartProductsDisplayState {}

class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrdererEntity> products;

  CartProductsLoaded(this.products);
}

class LoadCartProductsFailure extends CartProductsDisplayState {
  final String errorMessage;

  LoadCartProductsFailure({required this.errorMessage});
}
