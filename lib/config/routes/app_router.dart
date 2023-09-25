import 'package:flutter/material.dart';

import '../../core/managers/string_manager.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/signup/presentation/screens/signup_screen.dart';
import '../../features/drawer_navigation/presentation/screens/homepage_screen.dart';
import '../../features/offers/presentation/screens/delivery_offer_screen.dart';
import '../../features/offers/presentation/screens/discount_offer_screen.dart';
import '../../features/orders/data/order.dart';
import '../../features/orders/presentation/screens/order_details.dart';
import '../../features/profile/data/laundry_service.dart';
import '../../features/services/presentation/screens/edit_service_screen.dart';
import '../../features/services/presentation/screens/add_service_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/settings/screens/change_language_screen.dart';
import '../../features/settings/screens/change_password_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
        );

      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (context) =>  SignupScreen(),
        );

      case HomepagScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomepagScreen(),
        );

      case OrderDetails.routeName:
        final data = routeSettings.arguments as Map<String, dynamic>;
        final order = data['order'] as Order;
        return MaterialPageRoute(
          builder: (context) => OrderDetails(order: order),
        );

      case EditProfileScreen.routeName:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'];
        return MaterialPageRoute(
          builder: (context) => EditProfileScreen(),
        );

      case ChangeLanguageScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChangeLanguageScreen(),
        );

      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        );
      case AddServiceScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => AddServiceScreen(),
        );
      case DisountOfferScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const DisountOfferScreen(),
        );

      case DeliveryOfferScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const DeliveryOfferScreen(),
        );

      case EditServiceScreen.routeName:
        final data = routeSettings.arguments as Map<String, dynamic>;
        final service = data['service'] as LaundryService;
        return MaterialPageRoute(
          builder: (context) => EditServiceScreen(laundryService: service),
        );
      default:
        return unDefinedRoute();
    }
  }

  Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
