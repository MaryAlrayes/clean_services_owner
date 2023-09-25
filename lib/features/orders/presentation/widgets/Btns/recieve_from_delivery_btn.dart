
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RecieveFromDeliveryBtn extends StatelessWidget {
  const RecieveFromDeliveryBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(AppLocalizations.of(context)!.recieve_from_delivery_btn),
    );
  }
}
