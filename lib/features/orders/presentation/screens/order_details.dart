import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_card.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../data/order.dart';
import '../widgets/order_btn.dart';
import '../widgets/order_table.dart';

class OrderDetails extends StatelessWidget {
  static const routeName = 'order_details';
  final Order order;
  const OrderDetails({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: OrderBtn(
                orderStatus: order.orderStatus,
                isExpanded: true,
                orderType: order.orderType,
              ),
            ),
          ],
        )
      ],
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.order_details),
      ),
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Center(
                child: _buildCard(context),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return CustomCard(
      child: _buildDetails(context),
    );
  }

  Column _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOrderNumber(context),
        _buildDivider(),
        _buildStatus(context),
        _buildDivider(),
        _buildOrderOwner(context),
        _buildDivider(),
        _buildPhone(context),
        _buildDivider(),
        _buildDate(context),
        _buildDivider(),
        _buildServicesDetails(),
      ],
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 16,
      thickness: 0.5,
    );
  }

  Widget _buildServicesDetails() {
    return OrderTable(services: order.services, price: order.price);
  }

  Widget _buildDate(BuildContext context) {
    return _buildRow(
      AppLocalizations.of(context)!.order_date,
      AppLocalizations.of(context)!.custom_date(DateTime.now()),
    );
  }

  Widget _buildPhone(BuildContext context) {
    return _buildRow(
     AppLocalizations.of(context)!.his_phone,
      '057399734',
    );
  }

  Widget _buildOrderOwner(BuildContext context) {
    return _buildRow(
      AppLocalizations.of(context)!.order_owner,
      'اسم صاحب الطلب',
    );
  }

  Widget _buildOrderNumber(BuildContext context) {
    return _buildRow(
      AppLocalizations.of(context)!.order_id,
      '#${order.id}',
    );
  }

  Widget _buildStatus(BuildContext context) {
    return _buildRow(
   AppLocalizations.of(context)!.order_status,
      order.orderStatus.displayText(context),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildLabel(
            label,
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildValue(
            value,
          ),
        )
      ],
    );
  }

  Widget _buildLabel(String label) {
    return CustomLabel(
      text: label,
    );
  }

  Widget _buildValue(String value) {
    return Text(
      value,
      style: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }
}
