import 'package:ecommerce/core/usercase/get_ages.dart';
import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Use cases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
}
