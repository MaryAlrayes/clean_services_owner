import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/features/statistics/presentation/widgets/charts_card.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../widgets/custom_bar_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnnualScreen extends StatelessWidget {
  const AnnualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Column(children: [
           Expanded(child: _buildOrderNumber(context)),
            Expanded(child: _buildMoney(context)),
          ]),
        ),
      ),
    ]);
  }

  Widget _buildMoney(BuildContext context) {
    return ChartsCard(
      data: data,
      label: AppLocalizations.of(context)!.payment_chart_bar_label,
    );
  }

  Widget _buildOrderNumber(BuildContext context) {
    return ChartsCard(
      data: data,
      label: AppLocalizations.of(context)!.orders_done_chart_bar_label,
    );
  }
}

class OrdersStatistics {
  final String month;
  final int total;
  OrdersStatistics({required this.month, required this.total});
}

Map<int, List<Tuple2<int, int>>> data = {
  2021:
      List.generate(data1.length, (index) => Tuple2(index, data1[index].total)),
  2022:
      List.generate(data2.length, (index) => Tuple2(index, data2[index].total)),
};
List<OrdersStatistics> data1 = [
  OrdersStatistics(month: 'Jan', total: 100),
  OrdersStatistics(month: 'Fab', total: 50),
  OrdersStatistics(month: 'Map', total: 20),
  OrdersStatistics(month: 'Apr', total: 50),
  OrdersStatistics(month: 'May', total: 130),
  OrdersStatistics(month: 'Jun', total: 10),
  OrdersStatistics(month: 'Jul', total: 85),
  OrdersStatistics(month: 'Aug', total: 123),
  OrdersStatistics(month: 'Sep', total: 24),
  OrdersStatistics(month: 'Oct', total: 23),
  OrdersStatistics(month: 'Nov', total: 45),
  OrdersStatistics(month: 'Dec', total: 24),
];

List<OrdersStatistics> data2 = [
  OrdersStatistics(month: 'Jan', total: 24),
  OrdersStatistics(month: 'Fab', total: 45),
  OrdersStatistics(month: 'Map', total: 23),
  OrdersStatistics(month: 'Apr', total: 24),
  OrdersStatistics(month: 'May', total: 123),
  OrdersStatistics(month: 'Jun', total: 85),
  OrdersStatistics(month: 'Jul', total: 10),
  OrdersStatistics(month: 'Aug', total: 85),
  OrdersStatistics(month: 'Sep', total: 123),
  OrdersStatistics(month: 'Oct', total: 45),
  OrdersStatistics(month: 'Nov', total: 23),
  OrdersStatistics(month: 'Dec', total: 31),
];
