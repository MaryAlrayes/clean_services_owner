// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';

import 'package:saudi_clean_services_owner/core/ui/widgets/custom_data_table.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/features/orders/data/service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrderTable extends StatelessWidget {
  final List<Service> services;
  final num price;
  const OrderTable({
    Key? key,
    required this.services,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomLabel(
          text: AppLocalizations.of(context)!.order_details,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomDataTable(
          columns: getColums(context),
          rows: getRows(
            services,
          ),
        ),
         const SizedBox(
          height: 8,
        ),
        _buildPrice(context)
      ],
    );
  }
  Widget _buildPrice(BuildContext context) {
    return Row(
      children: [
        CustomLabel(
          text: "${AppLocalizations.of(context)!.total}: ",
        ),
        Text(
          '$price ${AppLocalizations.of(context)!.saudi_currency}',
          style: getRegularStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }
  List<String> getColums(BuildContext context) {
    List<String> columns = [
      '#',
      AppLocalizations.of(context)!.item_type,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.counts,
      AppLocalizations.of(context)!.price
    ];
    return columns;
  }

  List<DataRow> getRows(List<Service> data) {
    return data.map((e) {
      final cells = [e.serviceId, e.item, e.serviceType, e.count, e.price];
      return DataRow(
        cells: getCells(
          cells,
        ),
      );
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((cell) {
      if (cell is List<String>) {
        return _buildServiceCell(cell);
      } else {
        return _buildBasicCell(cell);
      }
    }).toList();
  }

  DataCell _buildBasicCell(cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Text(
          '$cell',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  DataCell _buildServiceCell(List<String> cell) {
    List<String> newCells = [];
    for (var element in cell) {
      newCells.add(element);
      newCells.add(' - ');
    }
    newCells.removeAt(newCells.length - 1);
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: newCells
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
