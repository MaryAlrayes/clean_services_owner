import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';

showLogOutDialog(BuildContext context) {
  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.log_out,
      textAlign: TextAlign.center,
    ),
    content: Text(AppLocalizations.of(context)!.confirm_log_out,
        textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {},
        child: Text(AppLocalizations.of(context)!.yes,
            textAlign: TextAlign.center),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.grey,
        ),
        child: Text(
          AppLocalizations.of(context)!.cancel,
        ),
      ),
    ],
  );
}
