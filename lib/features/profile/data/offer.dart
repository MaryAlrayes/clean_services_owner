// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/profile/data/delivery_offer.dart';
import 'package:saudi_clean_services_owner/features/profile/data/discount_sail.dart';

class Offer {
  final DateTime offereBeginingDate;
  final DateTime offereEndingDate;
  final List<UserLevels> userLevels;
  final OfferStatus offerStatus;

  Offer({
    required this.offereBeginingDate,
    required this.offereEndingDate,
    required this.userLevels,
    required this.offerStatus,
  });
}

final offeres = [
  DeliveryOffer(
      offereBeginingDate: DateTime.now(),
      offereEndingDate: DateTime.now(),
      userLevels: [UserLevels.bronze, UserLevels.gold],
      offerStatus: OfferStatus.accepted),
  DiscountOffer(
      amount: 30,
      offereBeginingDate: DateTime.now(),
      offereEndingDate: DateTime.now(),
      userLevels: [UserLevels.gold, UserLevels.bronze],
      offerStatus: OfferStatus.pending),
  DeliveryOffer(
      offereBeginingDate: DateTime.now(),
      offereEndingDate: DateTime.now(),
      userLevels: [
        UserLevels.silver,
      ],
      offerStatus: OfferStatus.accepted),
  DiscountOffer(
      amount: 20,
      offereBeginingDate: DateTime.now(),
      offereEndingDate: DateTime.now(),
      userLevels: [UserLevels.gold, UserLevels.bronze],
      offerStatus: OfferStatus.pending),
];
