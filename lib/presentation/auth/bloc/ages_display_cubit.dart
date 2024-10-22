import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_states.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayStates> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) {
        emit(
          AgesLoadFailure(message: message),
        );
      },
      (data) {
        emit(
          AgesLoaded(ages: data),
        );
      },
    );
  }
}