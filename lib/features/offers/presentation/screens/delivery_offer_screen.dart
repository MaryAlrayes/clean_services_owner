import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../widgets/date_section.dart';
import '../widgets/user_types_section.dart';

class DeliveryOfferScreen extends StatelessWidget {
  static const routeName = 'delivery_offer_screen';
  const DeliveryOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          children: [
            _buildSend(context),
            const SizedBox(
              width: 8,
            ),
            _buildCancel(context)
          ],
        )
      ],
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.delivery_offer),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(context),
            const SizedBox(
              height: 16,
            ),
            _buildCategories(),
            const SizedBox(
              height: 16,
            ),
            _buildDateSection(),
          ],
        ),
      ),
    );
  }

  Expanded _buildSend(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      child: Text(AppLocalizations.of(context)!.send_to_admin),
      onPressed: () {},
    ));
  }

  Expanded _buildCancel(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.grey,
        ),
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
    );
  }

  Widget _buildCategories() {
    return const UserTypeSection();
  }

  Widget _buildLabel(BuildContext context) {
    return Container(
      child: Text(
        AppLocalizations.of(context)!.delivery_label,
        textAlign: TextAlign.center,
        style: getBoldStyle(color: Colors.black, fontSize: FontSize.s16),
      ),
    );
  }

  Widget _buildDateSection() {
    return const DateSection();
  }
}
