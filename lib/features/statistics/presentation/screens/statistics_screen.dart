import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import 'annual_screen.dart';
import 'daily_screen.dart';
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.statistics_nav),
          bottom:  TabBar(tabs: [
            Tab(
              text: AppLocalizations.of(context)!.daily_sails,
            ),
            Tab(
              text: AppLocalizations.of(context)!.sails_statistics,
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
          DailyScreen(),
            AnnualScreen()
          ],
        ),
      ),
    );
  }
}
