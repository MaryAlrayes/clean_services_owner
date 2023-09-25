// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_service_bloc.dart';

enum AddServiceValidation { initiail, valid, itemEmpty, typeNotSelected,emptyService,priceNotValid,noServices }

class AddServiceState extends Equatable {
  final String item;
  final String type;
  final List<BasicService> services;
  final AddServiceValidation addServiceValidation;
  const AddServiceState({
    required this.item,
    required this.type,
    required this.services,
    required this.addServiceValidation,
  });
  @override
  List<Object?> get props => [item, type, services, addServiceValidation,identityHashCode(this)];

  factory AddServiceState.empty() {
    return  AddServiceState(
      item: '',
      type: '',
      services: [BasicService.empty()],
      addServiceValidation: AddServiceValidation.initiail,
    );
  }

  AddServiceState copyWith({
    String? item,
    String? type,
    List<BasicService>? services,
    AddServiceValidation? addServiceValidation,
  }) {
    return AddServiceState(
      item: item ?? this.item,
      type: type ?? this.type,
      services: services ?? this.services,
      addServiceValidation: addServiceValidation ?? this.addServiceValidation,
    );
  }

  @override
  bool get stringify => true;
}
