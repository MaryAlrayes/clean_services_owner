import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';

part 'drawer_navigation_state.dart';

class DrawerNavigationCubit extends Cubit<DrawerNavigationState> {
  DrawerNavigationCubit()
      : super(const DrawerNavigationState(
            navigationDrawer: NavigationLabelsDrawer.comingOrders));
  void getDrawerItem(NavigationLabelsDrawer navigationDrawer) {
    switch (navigationDrawer) {

      case NavigationLabelsDrawer.comingOrders:
       emit(const DrawerNavigationState(navigationDrawer:NavigationLabelsDrawer.comingOrders ));
       break;
      case NavigationLabelsDrawer.profile:
           emit(const DrawerNavigationState(navigationDrawer:NavigationLabelsDrawer.profile ));
       break;
      case NavigationLabelsDrawer.statistics:
          emit(const DrawerNavigationState(navigationDrawer:NavigationLabelsDrawer.statistics ));
       break;
      case NavigationLabelsDrawer.settings:
         emit(const DrawerNavigationState(navigationDrawer:NavigationLabelsDrawer.settings ));
       break;
    }
  }
}
