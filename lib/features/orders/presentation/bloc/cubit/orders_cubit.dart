import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/orders/data/order.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void getOrders(OrderStatus ordersState) {
    switch (ordersState) {
      case OrderStatus.all:
        _allOrders();

        break;
      case OrderStatus.pending_laundry_acceptance:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.pending_laundry_acceptance,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.pending_laundry_acceptance)
                .toList(),
          ),
        );
        break;
      case OrderStatus.pending_acceptance_delivery:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.pending_acceptance_delivery,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.pending_acceptance_delivery)
                .toList(),
          ),
        );
        break;
      case OrderStatus.onWay_to_recieve_from_client:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.onWay_to_recieve_from_client,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.onWay_to_recieve_from_client)
                .toList(),
          ),
        );
        break;
      case OrderStatus.onWay_to_deliver_to_laundry:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.onWay_to_deliver_to_laundry,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.onWay_to_deliver_to_laundry)
                .toList(),
          ),
        );
        break;
      case OrderStatus.pre_processing:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.pre_processing,
            orders: orders
                .where((element) =>
                    element.orderStatus == OrderStatus.pre_processing)
                .toList(),
          ),
        );
        break;
      case OrderStatus.processing:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.processing,
            orders: orders
                .where(
                    (element) => element.orderStatus == OrderStatus.processing)
                .toList(),
          ),
        );
        break;
      case OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry:
        emit(
          OrderDataState(
            orderStatus:
                OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry)
                .toList(),
          ),
        );
        break;
      case OrderStatus.onWay_to_recieve_from_laundry:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.onWay_to_recieve_from_laundry,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.onWay_to_recieve_from_laundry)
                .toList(),
          ),
        );
        break;
      case OrderStatus.onWay_to_deliver_to_client:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.onWay_to_deliver_to_client,
            orders: orders
                .where((element) =>
                    element.orderStatus ==
                    OrderStatus.onWay_to_deliver_to_client)
                .toList(),
          ),
        );
        break;
      case OrderStatus.recieved:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.recieved,
            orders: orders
                .where((element) => element.orderStatus == OrderStatus.recieved)
                .toList(),
          ),
        );
        break;
      case OrderStatus.ready_to_deliver:
        emit(
          OrderDataState(
            orderStatus: OrderStatus.ready_to_deliver,
            orders: orders
                .where((element) =>
                    element.orderStatus == OrderStatus.ready_to_deliver)
                .toList(),
          ),
        );
        break;
    }
  }

  void _allOrders() {
    List<Order> priorOrders = orders
        .where((element) => [
              OrderStatus.pending_laundry_acceptance,
              OrderStatus.onWay_to_deliver_to_laundry,
              OrderStatus.pre_processing,
              OrderStatus.processing,
              OrderStatus.ready_to_deliver,
              OrderStatus.onWay_to_recieve_from_laundry
            ].contains(element.orderStatus))
        .toList();

    List<Order> otheOrders = orders
        .where((element) => ![
              OrderStatus.pending_laundry_acceptance,
              OrderStatus.onWay_to_deliver_to_laundry,
              OrderStatus.pre_processing,
              OrderStatus.processing,
              OrderStatus.ready_to_deliver,
              OrderStatus.onWay_to_recieve_from_laundry
            ].contains(element.orderStatus))
        .toList();

    List<Order> finalOrders = [];
    finalOrders.addAll(priorOrders);
    finalOrders.addAll(otheOrders);
    emit(
      OrderDataState(
          orderStatus: OrderStatus.all,
          orders: finalOrders),
    );
  }
}
