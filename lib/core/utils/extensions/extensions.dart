import 'package:flutter/cupertino.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension OrderStatusExtension on OrderStatus {
  String displayText(BuildContext context) {
    switch (this) {
      case OrderStatus.pending_laundry_acceptance:
        return AppLocalizations.of(context)!.pending_laundry_acceptance;
      case OrderStatus.pending_acceptance_delivery:
        return AppLocalizations.of(context)!.pending_acceptance_delivery;
      case OrderStatus.onWay_to_recieve_from_client:
        return AppLocalizations.of(context)!.onWay_to_recieve_from_client;
      case OrderStatus.onWay_to_deliver_to_laundry:
        return AppLocalizations.of(context)!.onWay_to_deliver_to_laundry;
      case OrderStatus.pre_processing:
        return AppLocalizations.of(context)!.pre_processing;
      case OrderStatus.processing:
        return AppLocalizations.of(context)!.processing;
      case OrderStatus.ready_to_deliver:
        return AppLocalizations.of(context)!.ready_to_deliver;
      case OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry:
        return AppLocalizations.of(context)!
            .pending_acceptance_from_delivery_to_recieve_from_laundry;
      case OrderStatus.onWay_to_recieve_from_laundry:
        return AppLocalizations.of(context)!.onWay_to_recieve_from_laundry;
      case OrderStatus.onWay_to_deliver_to_client:
        return AppLocalizations.of(context)!.onWay_to_deliver_to_client;
      case OrderStatus.recieved:
        return AppLocalizations.of(context)!.recieved;
      case OrderStatus.all:
        return AppLocalizations.of(context)!.all_orders;
    }
  }
}

extension ServiceTypeExtension on ItemWeight {
  String displayText(BuildContext context) {
    switch (this) {
      case ItemWeight.heavy:
        return AppLocalizations.of(context)!.heavy_item_weight;
      case ItemWeight.light:
        return AppLocalizations.of(context)!.light_item_weight;
    }
  }
}

extension UserLevelsExtension on UserLevels {
  String displayText(BuildContext context) {
    switch (this) {
      case UserLevels.bronze:
        return AppLocalizations.of(context)!.bronze;
      case UserLevels.silver:
        return AppLocalizations.of(context)!.silver;
      case UserLevels.gold:
        return AppLocalizations.of(context)!.gold;
      case UserLevels.diamond:
        return AppLocalizations.of(context)!.diamond;
    }
  }
}

extension OfferStatusExtension on OfferStatus {
  String displayText(BuildContext context) {
    switch (this) {
      case OfferStatus.accepted:
        return AppLocalizations.of(context)!.accepted_from_admin;
      case OfferStatus.pending:
        return AppLocalizations.of(context)!.pending_admin_acceptence;
    }
  }
}
