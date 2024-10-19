import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationReq user);
}
