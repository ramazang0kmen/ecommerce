import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/models/add_to_card_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCardReq addToCardReq);
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCardReq addToCardReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCardReq.toMap());
      return const Right(
        'Add to cart was successful',
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}
