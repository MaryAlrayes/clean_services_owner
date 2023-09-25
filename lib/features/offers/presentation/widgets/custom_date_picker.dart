import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomeDatePiker extends StatefulWidget {
  const CustomeDatePiker({super.key});

  @override
  State<CustomeDatePiker> createState() => _CustomeDatePikerState();
}

class _CustomeDatePikerState extends State<CustomeDatePiker> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(children: [
        IconButton(
            onPressed: () async {
              DateTime? selectedDate = await pickDateRange(context);
              if (selectedDate != null) {
                setState(() {
                  date = selectedDate;
                });
              }
            },
            icon: Icon(
              Icons.calendar_month,
              color: ColorManager.primary,
            )),
        Text(AppLocalizations.of(context)!.custom_date(date))
      ]),
    );
  }

  Future<DateTime?> pickDateRange(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    return selectedDate;
  }
}
