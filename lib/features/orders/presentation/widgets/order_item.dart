import 'package:flutter/material.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../data/order.dart';
import '../screens/order_details.dart';
import 'order_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, OrderDetails.routeName,
            arguments: {'order': order});
      },
      child: Card(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p18),
          // height: 100,
          width: double.infinity,
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(context),
                  const SizedBox(
                    height: 4,
                  ),
                  _buildStatus(context)
                ],
              ),
            ),
            const SizedBox(width: 4,),
            _getBtn(order.orderStatus,order.orderType),
          ]),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      '${AppLocalizations.of(context)!.order_number_label} #${order.id}',
      style: getBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Row _buildStatus(BuildContext context) {
    return Row(
crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
        //  color: Colors.red,

          child: Icon(
            Icons.history,
            color: ColorManager.primary,

            size: 18,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            order.orderStatus.displayText(context),
            style: getMediumStyle(
                color: ColorManager.primary, fontSize: FontSize.s14),

          ),
        )
      ],
    );
  }

  Widget _getBtn(OrderStatus orderStatus,OrderType orderType) {
    return OrderBtn(
      orderStatus: orderStatus,
      orderType: orderType,
      isExpanded: false,
    );
  }
}
