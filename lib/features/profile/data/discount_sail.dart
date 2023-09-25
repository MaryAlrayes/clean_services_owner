import 'package:saudi_clean_services_owner/features/profile/data/offer.dart';

class DiscountOffer extends Offer {
  final num amount;
  DiscountOffer(
      {required this.amount,
      required super.offereBeginingDate,
      required super.offereEndingDate,
      required super.userLevels,
      required super.offerStatus});
}
