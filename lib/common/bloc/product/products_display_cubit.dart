import 'package:ecommerce/common/bloc/product/products_display_state.dart';
import 'package:ecommerce/core/usercase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());

    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(LoadProductsFailure());
      },
      (data) {
        emit(ProductsLoaded(data));
      },
    );
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}
