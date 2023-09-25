part of 'edit_service_bloc.dart';

abstract class EditServiceEvent extends Equatable {
  const EditServiceEvent();

  @override
  List<Object> get props => [];
}

class ItemChangedEditEvent extends EditServiceEvent {
  final String item;
  const ItemChangedEditEvent({
    required this.item,
  });
  @override
  List<Object> get props => [item];
}

class ItemTypeChangedEditEvent extends EditServiceEvent {
  final ItemWeight type;
  const ItemTypeChangedEditEvent({
    required this.type,
  });
  @override
  List<Object> get props => [type];
}

class NewServiceAddedEditEvent extends EditServiceEvent {
  final int index;
  final String service;
  const NewServiceAddedEditEvent({
    required this.index,
    required this.service,
  });
  @override
  List<Object> get props => [service, index];
}

class AddNewRowEditEvent extends EditServiceEvent {

}

class NewPriceAddedEditEvent extends EditServiceEvent {
  final int index;
  final double price;
  const NewPriceAddedEditEvent({
    required this.index,
    required this.price,
  });
  @override
  List<Object> get props => [price, index];
}

class DeleteServiceEditEvent extends EditServiceEvent {
  final int index;

  const DeleteServiceEditEvent({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}

class EditEvent extends EditServiceEvent {}
