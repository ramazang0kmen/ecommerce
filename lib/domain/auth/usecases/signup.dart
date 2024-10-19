import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
