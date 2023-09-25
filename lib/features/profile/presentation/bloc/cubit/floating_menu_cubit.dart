import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'floating_menu_state.dart';

class FloatingMenuCubit extends Cubit<FloatingMenuState> {
  FloatingMenuCubit() : super(const FloatingMenuState(isTransparent: true));
  void changeTransparency(bool isTransparent) {
    emit(FloatingMenuState(isTransparent: isTransparent));
  }
}
