// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'floating_menu_cubit.dart';

class FloatingMenuState extends Equatable {
  final bool isTransparent;
  const FloatingMenuState({
   required this.isTransparent,
  }
  );

  @override
  List<Object> get props => [isTransparent];
}
