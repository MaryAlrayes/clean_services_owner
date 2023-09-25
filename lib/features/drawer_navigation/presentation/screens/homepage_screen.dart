import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums/enums.dart' ;
import '../../../orders/presentation/screens/order_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../settings/screens/settings_screen.dart';
import '../../../statistics/presentation/screens/statistics_screen.dart';
import '../../bloc/cubit/drawer_navigation_cubit.dart';
import '../widgets/custom_drawer.dart';

class HomepagScreen extends StatelessWidget {
  static const routeName = 'homepage_screen';
  const HomepagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDrawer customDrawer = const CustomDrawer();
    return BlocBuilder<DrawerNavigationCubit, DrawerNavigationState>(
      builder: (context, state) {
        switch (state.navigationDrawer) {
          case NavigationLabelsDrawer.comingOrders:
            return _buildComingOrdersScreen();
          case NavigationLabelsDrawer.profile:
            return _buildProfileScreen();
          case NavigationLabelsDrawer.statistics:
            return _buildStatisticsScreen();
          case NavigationLabelsDrawer.settings:
            return _buildSettingsScreen();
        }
      },
    );
  }

  Widget _buildSettingsScreen() {
    return const SettingsScreen();
  }

  Widget _buildStatisticsScreen() {
    return const StatisticsScreen();
  }

  Widget _buildProfileScreen() {
    return ProfileScreen();
  }

  Widget _buildComingOrdersScreen() {
    return const OrdersScreen();
  }
}
