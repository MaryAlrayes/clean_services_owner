// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/core/utils/helpers/months_helper.dart';
import 'package:saudi_clean_services_owner/features/statistics/presentation/screens/annual_screen.dart';
import 'package:tuple/tuple.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/features/statistics/presentation/widgets/custom_bar_chart.dart';

class ChartsCard extends StatefulWidget {
  final String label;
  final Map<int, List<Tuple2<int, int>>> data;
  const ChartsCard({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  @override
  State<ChartsCard> createState() => _ChartsCardState();
}

class _ChartsCardState extends State<ChartsCard> {
  List<OrdersStatistics> _currentShownData = [];
  List<String> yearsList = [];
  late String? _selectedYear;

  void _initData() {
    //get the years for the drop down menu
    yearsList = widget.data.keys.map((e) => e.toString()).toList();

//get current year and make it the default for the drop down
    // var now = DateTime.now();
    // var formatter = DateFormat('yyyy');
    // int currentYear = int.parse(formatter.format(now));
    // _selectedYear = currentYear.toString();

     int currentYear = data.entries.last.key;
    _selectedYear = currentYear.toString();

//get the bar chart data of the current year
    final currentYearData = widget.data[currentYear];
    print(currentYearData);
    if (currentYearData != null) {
      currentYearData
          .map(
            (e) => _currentShownData.add(
              OrdersStatistics(
                month: MonthsHelper.months[e.item1]!,
                total: e.item2,
              ),
            ),
          )
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
    print(_currentShownData.toString());
  }

  void _updateChartData() {
    final selectedYearData = widget.data[int.parse(_selectedYear!)];
    _currentShownData.clear();
    if (selectedYearData != null) {
      selectedYearData
          .map(
            (e) => _currentShownData.add(
              OrdersStatistics(
                month: MonthsHelper.months[e.item1]!,
                total: e.item2,
              ),
            ),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(AppPadding.p8),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLabel(
                  text: widget.label,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: ColorManager.secondary),
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(

                        items: yearsList.map(_buildMenuItem).toList(),
                        value: _selectedYear,
                        onChanged: (value) {
                          setState(() {
                            _selectedYear = value;
                            _updateChartData();
                          });
                        }),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: CustomBarChart(data: _currentShownData),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildMenuItem(String year) {
    return DropdownMenuItem(
      alignment: Alignment.center,
      value: year,
      child: Text(
        year,

      ),
    );
  }
}
