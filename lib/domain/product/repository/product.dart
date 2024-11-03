import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/product/entities/product.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategory(String categoryId);
  Future<Either> getProductByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoritesProducts();
}
