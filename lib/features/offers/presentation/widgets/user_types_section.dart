import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/offers/presentation/widgets/custom_check_box.dart';
import 'package:saudi_clean_services_owner/core/utils/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserTypeSection extends StatelessWidget {
  const UserTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.select_target_group),
        ...UserLevels.values
            .map(
              (e) => CustomeCheckBox(title: e.displayText(context)),
            )
            .toList(),
      ],
    );
  }
}
