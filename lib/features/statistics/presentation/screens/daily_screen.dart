import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_card.dart';
import '../widgets/daily_data_table.dart';
class DailyScreen extends StatelessWidget {
  const DailyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var heightWidget = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        32;
    return Stack(
      children: [
        const Background(),
        SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: heightWidget,
            ),
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDoneOrdersNumber(context),
                const SizedBox(
                  height: 16,
                ),
                _buildTable(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoneOrdersNumber(BuildContext context) {
    return _buildCard(Column(
      children: [
        _buildLabels(context),
        _buildNumbers(),
      ],
    ));
  }

  Row _buildNumbers() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.primary),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '25',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                    color: Colors.white,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildLabels(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
           AppLocalizations.of(context)!.order_numbers_delivered_today  ,
            textAlign: TextAlign.center,
            style: getBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s18),
          ),
        ),
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          color: ColorManager.primary,
          alignment: Alignment.center,
          child: Text(
              AppLocalizations.of(context)!.running_orders_sofar,
            style: getBoldStyle(color: Colors.white,fontSize: FontSize.s18),
          ),
        ),

        const DailyDataTable(),
      ],
    );
  }

  Widget _buildCard(Widget widget) {
    return CustomCard(child: widget);
  }
}
