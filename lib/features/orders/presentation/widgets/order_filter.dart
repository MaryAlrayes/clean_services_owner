import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/core/utils/extensions/extensions.dart';
import 'package:saudi_clean_services_owner/features/orders/presentation/bloc/cubit/orders_cubit.dart';

class OrderFilter extends StatelessWidget {
  const OrderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.primary),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      child: BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
        if (state is OrderDataState) {
          return DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<OrderStatus>(
                value: state.orderStatus,
                items: OrderStatus.values
                    .map((e) => _buildDropMenuItem(context, e))
                    .toList(),
                onChanged: ((value) {
                  BlocProvider.of<OrdersCubit>(context).getOrders(value!);
                }),
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  DropdownMenuItem<OrderStatus> _buildDropMenuItem(
      BuildContext context, OrderStatus e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e.displayText(context),
        style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
      ),
    );
  }
}
