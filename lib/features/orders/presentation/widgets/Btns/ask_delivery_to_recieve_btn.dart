
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AskDelegateToRecieveBtn extends StatelessWidget {
  const AskDelegateToRecieveBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(AppLocalizations.of(context)!.ask_delivery_to_recieve_btn),
    );
  }
}
