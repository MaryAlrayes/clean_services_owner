import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saudi_clean_services_owner/core/managers/assets_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/dialogs/logout_dialog.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/drawer_navigation/bloc/cubit/drawer_navigation_cubit.dart';
import 'package:saudi_clean_services_owner/features/drawer_navigation/presentation/widgets/drawer_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeaderDrawer(),
          _getMyOrdersItem(context),
          _getStatisticsItem(context),
          _getProfileItem(context),
          _getSettingsItem(context),
          const Divider(
            height: 2,
          ),
          _getLogOutItem(context)
        ],
      ),
    );
  }

  UserAccountsDrawerHeader _buildHeaderDrawer() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(
              AssetsManager.background,
            ),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover),
      ),
      accountName: Text(
        'اسم المغسلة',
        style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
      ),
      accountEmail: Text('السعودية، الرياض',
          style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16)),
    );
  }

  Widget _getLogOutItem(BuildContext context) {
    return DrawerItem(
      handler: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => showLogOutDialog(context),
        );
      },
      iconData: Icons.logout,
      title: AppLocalizations.of(context)!.logout_nav,
    );
  }

  Widget _getProfileItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.room_service,
      title: AppLocalizations.of(context)!.profile_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.profile);
      },
    );
  }

  Widget _getStatisticsItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.bar_chart,
      title: AppLocalizations.of(context)!.statistics_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.statistics);
      },
    );
  }

  Widget _getSettingsItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.settings,
      title: AppLocalizations.of(context)!.settings_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.settings);
      },
    );
  }

  // Widget _getLogItem(BuildContext context) {
  //   return DrawerItem(
  //     iconData: Icons.history,
  //     title: 'سجل الطلبات',
  //     handler: () {
  //       Navigator.pop(context);
  //       BlocProvider.of<DrawerNavigationCubit>(context)
  //           .getDrawerItem(NavigationDrawer.ordersLog);
  //     },
  //   );
  // }

  Widget _getMyOrdersItem(BuildContext context) {
    return DrawerItem(
      iconData: Icons.home,
      title: AppLocalizations.of(context)!.orders_nav,
      handler: () {
        Navigator.pop(context);
        BlocProvider.of<DrawerNavigationCubit>(context)
            .getDrawerItem(NavigationLabelsDrawer.comingOrders);
      },
    );
  }
}
