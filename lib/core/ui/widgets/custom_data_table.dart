// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';


class CustomDataTable extends StatelessWidget {
  final List<String> columns;
   final List<DataRow> rows;
  const CustomDataTable({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
            showCheckboxColumn: false,
            border: TableBorder.all(
              width: 1.0,
              color: ColorManager.primary,
            ),
            headingRowColor: MaterialStateColor.resolveWith(
              (states) {
                return ColorManager.primary;
              },
            ),
            headingTextStyle: getRegularStyle(color: Colors.white),
            columnSpacing: 30,
            dataRowHeight: 60,
            columns: getColums(),
            rows: rows,
          ),
        ],
      ),
    );
  }

  List<DataColumn> getColums() {
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
}
