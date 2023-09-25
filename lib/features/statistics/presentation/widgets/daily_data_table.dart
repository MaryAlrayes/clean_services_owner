import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
class DailyDataTable extends StatelessWidget {
  const DailyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 32,
            color: Colors.white,
            child: DataTable(
              showCheckboxColumn: false,
              border: TableBorder.all(
                width: 1.0,
                color: ColorManager.primary,
              ),
               columnSpacing: 30,
            dataRowHeight: 60,
              headingRowColor: MaterialStateColor.resolveWith(
                (states) {
                  return ColorManager.primary;
                },
              ),
              headingTextStyle: getRegularStyle(color: Colors.white),
              columns: getColumns(context),
              rows: getRows(context),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(BuildContext context) {
    List<String> columns = [ AppLocalizations.of(context)!.order_status,  AppLocalizations.of(context)!.counts];
    return columns
        .map(
          (e) => DataColumn(
            label: Expanded(
              child: Text(
                e,
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  List<DataRow> getRows(
    BuildContext context,
  ) {
    List<Tuple2<OrderStatus, int>> data = const [
      Tuple2(OrderStatus.pending_acceptance_delivery, 12),
      Tuple2(OrderStatus.onWay_to_recieve_from_client, 15),
      Tuple2(OrderStatus.onWay_to_deliver_to_laundry, 22),
      Tuple2(OrderStatus.pre_processing, 3),
      Tuple2(OrderStatus.processing, 25),
      Tuple2(OrderStatus.ready_to_deliver, 55),
      Tuple2(OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry, 45),
      Tuple2(OrderStatus.onWay_to_recieve_from_laundry, 23),
      Tuple2(OrderStatus.onWay_to_deliver_to_client, 23),
    ];
    return data.map((e) {
      return DataRow( cells: [
        getCell(e.item1.displayText(context)),
        getCell(e.item2),
      ]);
    }).toList();
  }

  DataCell getCell(dynamic cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Text(
          '$cell',
          textAlign: TextAlign.center,
          style: getRegularStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ),
    );
  }
}
