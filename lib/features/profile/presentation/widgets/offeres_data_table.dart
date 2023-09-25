// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_data_table.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/core/utils/extensions/extensions.dart';
import 'package:saudi_clean_services_owner/features/profile/data/delivery_offer.dart';
import 'package:saudi_clean_services_owner/features/profile/data/discount_sail.dart';
import 'package:saudi_clean_services_owner/features/profile/data/offer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OfferesDataTable extends StatelessWidget {
  final List<Offer> offeres;
  const OfferesDataTable({
    Key? key,
    required this.offeres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Flexible(
              child: CustomLabel(
                text:  AppLocalizations.of(context)!.laundry_offers,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        CustomDataTable(
          columns: getColums(context),
          rows: getRows(context, offeres),
        )
      ],
    );
  }

  List<String> getColums(
    BuildContext context,
  ) {
    List<String> columns = [
      '#',
       AppLocalizations.of(context)!.offer_type,
        AppLocalizations.of(context)!.target_group,
        AppLocalizations.of(context)!.offer_start_date,
        AppLocalizations.of(context)!.offer_end_date,
    ];
    return columns;
  }

  List<DataRow> getRows(BuildContext context, List<Offer> offeres) {
    List<DataRow> rows = [];
    for (int i = 0; i < offeres.length; i++) {
      final cells = [
        i + 1,
        offeres[i],
        offeres[i].userLevels,
        offeres[i].offereBeginingDate,
        offeres[i].offereEndingDate
      ];
      final dataRow = DataRow(
        cells: getCells(
          context,
          cells,
        ),
      );
      rows.add(dataRow);
    }
    return rows;
  }

  List<DataCell> getCells(BuildContext context, List<dynamic> cells) {
    return cells.map((cell) {
      if (cell is DeliveryOffer || cell is DiscountOffer) {
        return _buildOfferTypeCell(context, cell);
      } else if (cell is DateTime) {
        return _buildDateCell(context, cell);
      } else if (cell is List<UserLevels>) {
        return _buildUserLevelsCell(context, cell);
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

  DataCell _buildUserLevelsCell(BuildContext context, List<UserLevels> cell) {
    List<String> newCells = [];
    for (var element in cell) {
      newCells.add(element.displayText(context));
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
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
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

  DataCell _buildOfferTypeCell(BuildContext context, Offer cell) {
    String txt = '';
    if (cell is DeliveryOffer) {
      txt =   AppLocalizations.of(context)!.free_delivery_offer;
    } else if (cell is DiscountOffer) {
      txt = AppLocalizations.of(context)!.discount_offer_perctnage(cell.amount);
    }
    return DataCell(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              txt,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              cell.offerStatus.displayText(context),
              style: getMediumStyle(
                color: ColorManager.primary,
                fontSize: FontSize.s14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataCell _buildDateCell(BuildContext context, DateTime cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.custom_date(cell),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
