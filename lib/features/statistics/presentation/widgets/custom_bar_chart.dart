import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../../../core/managers/color_manager.dart';
import '../screens/annual_screen.dart';

class CustomBarChart extends StatelessWidget {
  final List<OrdersStatistics> data;
  const CustomBarChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrdersStatistics, String>> series = [
      charts.Series(
          id: 'Orders Numbers',
          data: data,
          domainFn: (OrdersStatistics ordersStatistics, _) =>
              ordersStatistics.month,
          measureFn: (OrdersStatistics ordersStatistics, _) =>
              ordersStatistics.total,
          colorFn: (OrdersStatistics ordersStatistics, _) =>
              charts.ColorUtil.fromDartColor(ColorManager.secondary),
          labelAccessorFn: (OrdersStatistics ordersStatistics, _) =>
              '${ordersStatistics.total}'),
    ];
    return charts.BarChart(
      series,
      animate: true,
      primaryMeasureAxis: const charts.NumericAxisSpec(
        showAxisLine: true,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredMinTickCount: 6,
          desiredMaxTickCount: 10,
        ),
      ),
    );
  }
}
