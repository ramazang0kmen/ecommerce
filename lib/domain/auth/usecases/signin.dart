import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:ecommerce/data/auth/model/user_signin_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}