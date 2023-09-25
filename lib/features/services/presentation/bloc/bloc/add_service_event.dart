// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_service_bloc.dart';

abstract class AddServiceEvent extends Equatable {
  const AddServiceEvent();

  @override
  List<Object> get props => [];
}

class ItemChangedEvent extends AddServiceEvent {
  final String item;
  const ItemChangedEvent({
    required this.item,
  });
  @override
  List<Object> get props => [item];
}

class ItemTypeChangedEvent extends AddServiceEvent {
  final String type;
  const ItemTypeChangedEvent({
    required this.type,
  });
  @override
  List<Object> get props => [type];
}

class NewServiceAddedEvent extends AddServiceEvent {
  final int index;
  final String service;
  const NewServiceAddedEvent({
    required this.index,
    required this.service,
  });
  @override
  List<Object> get props => [service, index];
}

class AddNewRowEvent extends AddServiceEvent {

}

class NewPriceAddedEvent extends AddServiceEvent {
  final int index;
  final double price;
  const NewPriceAddedEvent({
    required this.index,
    required this.price,
  });
  @override
  List<Object> get props => [price, index];
}

class DeleteServiceEvent extends AddServiceEvent {
  final int index;

  const DeleteServiceEvent({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

class SubmitEvent extends AddServiceEvent {}
