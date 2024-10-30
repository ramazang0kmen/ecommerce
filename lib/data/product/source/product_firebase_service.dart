import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategory(String categoryId);
  Future<Either> getProductByTitle(String title);
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'createdDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
              DateTime(
                2024,
                7,
                25,
              ),
            ),
          )
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<Either> getProductByCategory(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'categoryId',
            isEqualTo: categoryId,
          )
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again later');
    }
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'title',
            isGreaterThanOrEqualTo: title,
          )
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again later');
    }
  }
}
