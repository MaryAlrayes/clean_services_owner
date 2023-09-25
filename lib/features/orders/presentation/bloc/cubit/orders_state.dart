// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrderDataState extends OrdersState {
  final OrderStatus orderStatus;
  final List<Order> orders;
  const OrderDataState({
    required this.orderStatus,
    required this.orders,
  });
  @override
  List<Object> get props => [orderStatus, orders];
}
