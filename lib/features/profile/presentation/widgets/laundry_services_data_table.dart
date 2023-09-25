// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_data_table.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/core/utils/extensions/extensions.dart';
import 'package:saudi_clean_services_owner/features/profile/data/basic_service.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/dialogs/edit_delete_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LaundryServicesDataTable extends StatelessWidget {
  final List<LaundryService> laundryService;
  const LaundryServicesDataTable({
    Key? key,
    required this.laundryService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Flexible(
              child: CustomLabel(
                text:  AppLocalizations.of(context)!.laundry_services,
              ),
            ),

          ],
        ),
        const SizedBox(
          height: 8,
        ),
        CustomDataTable(
          columns: getColums(context),
          rows: getRows(context, laundryService),
        )
      ],
    );
  }

  // OutlinedButton _buildAddServiceBtn(BuildContext context) {
  //   return OutlinedButton.icon(
  //     onPressed: () {
  //       Navigator.pushNamed(context, AddServiceScreen.routeName);
  //     },
  //     icon: const Icon(Icons.add),
  //     style: OutlinedButton.styleFrom(
  //       foregroundColor: ColorManager.primary,
  //     ),
  //     label: Text(
  //      AppLocalizations.of(context)!.add_service,
  //     ),
  //   );
  // }

  List<String> getColums(BuildContext context) {
    List<String> columns = [
      '#',
    AppLocalizations.of(context)!.item_type  ,
     AppLocalizations.of(context)!.services_provided_with_it ,
     AppLocalizations.of(context)!.item_weight
    ];
    return columns;
  }

  List<DataRow> getRows(BuildContext context, List<LaundryService> data) {
    return data.map((e) {
      final cells = [
        e.id,
        e.item,
        e.service,
        e.serviceType.displayText(context)
      ];
      return DataRow(
        onSelectChanged: (value) {
          showDialog(
            context: context,
            builder: (context) {
              return showAddDeleteServiceDialog(context, e);
            },
          );
        },
        cells: getCells(
          cells,
        ),
      );
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((cell) {
      if (cell is List<BasicService>) {
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

  DataCell _buildServiceCell(List<BasicService> cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: cell
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        e.service,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '${e.price}',
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
