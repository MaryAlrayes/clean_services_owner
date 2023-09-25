// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/accept_reject_btn.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/ask_delivery_to_recieve_btn.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/deliver_to_client_from_laundry.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/deliver_to_delivery_from_laundry_btn.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/finish_btn.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/recieve_from_delivery_btn.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/widgets/Btns/start_btn.dart';

class OrderBtn extends StatelessWidget {
  final OrderStatus orderStatus;
  final OrderType orderType;
  final bool isExpanded;
  const OrderBtn({
    Key? key,
    required this.orderStatus,
    required this.orderType,
    required this.isExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getBtn(orderStatus);
  }

  Widget _getBtn(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.all:
        return Container();

      case OrderStatus.pending_laundry_acceptance:
        return _buildAcceptRejectBtn();

      case OrderStatus.pending_acceptance_delivery:
        return Container();

      case OrderStatus.onWay_to_recieve_from_client:
        return Container();

      case OrderStatus.onWay_to_deliver_to_laundry:
        return _buildReiceveStuffBtn();

      case OrderStatus.pre_processing:
        return _buildStartBtn();

      case OrderStatus.processing:
        return _buildFinishBtn();

      case OrderStatus.ready_to_deliver:
        switch (orderType) {
          case OrderType.oneWay:
            return _buildDeliverToClient();
          case OrderType.twoWay:
            return _buildAskDelgateBtn();
        }

      case OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry:
        return Container();

      case OrderStatus.onWay_to_recieve_from_laundry:
        return _buildDeliverToDeliveryBtn();

      case OrderStatus.onWay_to_deliver_to_client:
        return Container();

      case OrderStatus.recieved:
        return Container();
    }
  }

  Widget _buildAcceptRejectBtn() {
    if (isExpanded) {
      return const AcceptRejectBtn(
        isEqual: true,
      );
    } else {
      return const AcceptRejectBtn(
        isEqual: false,
      );
    }
  }

  Widget _buildReiceveStuffBtn() {
    return const RecieveFromDeliveryBtn();
  }

  Widget _buildStartBtn() {
    return const StartBtn();
  }

  Widget _buildFinishBtn() {
    return const FinishBtn();
  }

  Widget _buildAskDelgateBtn() {
    return const AskDelegateToRecieveBtn();
  }

  Widget _buildDeliverToDeliveryBtn() {
    return const DeliverToDeliveryFormLaundryBtn();
  }

  Widget _buildDeliverToClient() {
    return const DeliverToClientFormLaundryBtn();
  }
}
