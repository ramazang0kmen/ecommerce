import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}
