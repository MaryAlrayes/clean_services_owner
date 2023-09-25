import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DeliverToDeliveryFormLaundryBtn extends StatelessWidget {
  const DeliverToDeliveryFormLaundryBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(AppLocalizations.of(context)!.deliver_to_delivery_from_from_laundry_btn),
    );
  }
}
