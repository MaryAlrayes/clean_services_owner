import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import '../bloc/cubit/orders_cubit.dart';
import '../widgets/order_filter.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocProvider(
        create: (context) => OrdersCubit()..getOrders(OrderStatus.all),
        child: Scaffold(
             drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.orders_nav),
      ),
          body: Stack(
            children:[
            const  Background(),
               Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OrderFilter(),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: _buildOrdersList(),
                  ),
                ],
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList() {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrderDataState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return OrderItem(order: state.orders[index]);
            },
            itemCount: state.orders.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 2,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
