
import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/features/offers/presentation/widgets/custom_date_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateSection extends StatelessWidget {
  const DateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDateSection(context);
  }

  Column _buildDateSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       CustomLabel(text: AppLocalizations.of(context)!.offer_period_length),
      const SizedBox(
        height: 4,
      ),
      Row(
        children: [
          Expanded(
            child: _buildStartDate(context),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: _buildEndDate(context),
          )
        ],
      ),
    ]);
  }

  Column _buildEndDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.offer_start_date,
          style: getSemiBoldStyle(
            color: ColorManager.secondary,
            fontSize: FontSize.s16,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const CustomeDatePiker(),
      ],
    );
  }

  Column _buildStartDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.offer_end_date,
          style: getSemiBoldStyle(
            color: ColorManager.secondary,
            fontSize: FontSize.s16,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const CustomeDatePiker(),
      ],
    );
  }
}
