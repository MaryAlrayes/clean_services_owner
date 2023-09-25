import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/screens/edit_service_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
showAddDeleteServiceDialog(
    BuildContext context, LaundryService laundryService) {
  return AlertDialog(
    title: Text(
      '${AppLocalizations.of(context)!.service_number_label} #${laundryService.id}',
      textAlign: TextAlign.center,
      style: getBoldStyle(color: Colors.black),
    ),
    content: Text(
      '${AppLocalizations.of(context)!.edit_or_delete_msg} #${laundryService.id}؟',
      textAlign: TextAlign.center,
    ),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      _buildEditBtn(context, laundryService),
      _buildDeleteBtn(context),
    ],
  );
}

ElevatedButton _buildDeleteBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
    child:  Text(
      AppLocalizations.of(context)!.delete,
    ),
  );
}

ElevatedButton _buildEditBtn(
    BuildContext context, LaundryService laundryService) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
      Navigator.pushNamed(
        context,
        EditServiceScreen.routeName,
        arguments: {
          'service': laundryService,
        },
      );
    },
    child:  Text(
      AppLocalizations.of(context)!.edit,
      textAlign: TextAlign.center,
    ),
  );
}
