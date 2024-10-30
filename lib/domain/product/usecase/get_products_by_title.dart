import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/service_locator.dart';

class GetProductByTitleUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getProductByTitle(params!);
  }
}
