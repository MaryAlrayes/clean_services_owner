// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_service_bloc.dart';
enum EditServiceValidation { initiail, valid, itemEmpty, typeNotSelected,emptyService,priceNotValid,noServices }

class EditServiceState extends Equatable {
  final String item;
  final ItemWeight type;
  final List<BasicService> services;
  final EditServiceValidation validation;

  const EditServiceState({
    required this.item,
    required this.type,
    required this.services,
    required this.validation,
  });

  @override
  List<Object?> get props => [item, type, services,validation];

  EditServiceState copyWith({
    String? item,
    ItemWeight? type,
    List<BasicService>? services,
    EditServiceValidation? validation,
  }) {
    return EditServiceState(
      item: item ?? this.item,
      type: type ?? this.type,
      services: services ?? this.services,
      validation: validation ?? this.validation,
    );
  }
}
