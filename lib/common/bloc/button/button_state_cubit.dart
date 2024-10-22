import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) => emit(ButtonFailureState(errorMesssage: error)),
        (data) => emit(ButtonSuccessState()),
      );
    } catch (e) {
      emit(ButtonFailureState(errorMesssage: e.toString()));
    }
  }
}