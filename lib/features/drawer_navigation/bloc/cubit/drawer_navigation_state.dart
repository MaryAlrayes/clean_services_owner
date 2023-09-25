part of 'drawer_navigation_cubit.dart';

class DrawerNavigationState extends Equatable {
  final NavigationLabelsDrawer navigationDrawer;

  const DrawerNavigationState({
    required this.navigationDrawer,
  });

  @override
  List<Object?> get props => [
        navigationDrawer,
      ];
}
