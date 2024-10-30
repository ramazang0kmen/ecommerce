import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategory(String categoryId);
  Future<Either> getProductByTitle(String title);
}
