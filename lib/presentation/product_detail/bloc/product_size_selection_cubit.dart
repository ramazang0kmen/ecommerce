import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSelectionCubit extends Cubit<int> {
  ProductSizeSelectionCubit() : super(0);

  int selectedIndex = 0;
  void selectSize(int index) {
    selectedIndex = index;
    emit(index);
  }
}
