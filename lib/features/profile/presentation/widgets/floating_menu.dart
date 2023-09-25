import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/features/offers/presentation/screens/delivery_offer_screen.dart';
import 'package:saudi_clean_services_owner/features/offers/presentation/screens/discount_offer_screen.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/floating_menu_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/screens/add_service_screen.dart';

class FloatingMenu extends StatefulWidget {
  const FloatingMenu({
    super.key,
  });

  @override
  State<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: AppLocalizations.of(context)!.add_service,
          iconColor: Colors.white,
          bubbleColor: const Color.fromARGB(255, 76, 181, 79),
          icon: Icons.add,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            BlocProvider.of<FloatingMenuCubit>(context)
                .changeTransparency(true);
            print('hi1');
            _animationController.reverse();
            Navigator.pushNamed(context, AddServiceScreen.routeName);
          },
        ),
        // Floating action menu item
        Bubble(
          title: AppLocalizations.of(context)!.delivery_offer,
          iconColor: Colors.white,
          bubbleColor: const Color(0xffFCD835),
          icon: Icons.delivery_dining,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            BlocProvider.of<FloatingMenuCubit>(context)
                .changeTransparency(true);
            print('hi2');
            _animationController.reverse();
            Navigator.pushNamed(context, DeliveryOfferScreen.routeName);
          },
        ),
        //Floating action menu item
        Bubble(
          title: AppLocalizations.of(context)!.discount_offer,
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: Icons.shopping_cart,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            BlocProvider.of<FloatingMenuCubit>(context)
                .changeTransparency(true);
            print('hi3');
            _animationController.reverse();
            Navigator.pushNamed(context, DisountOfferScreen.routeName);

          },
        ),
      ],

      // animation controller
      animation: _animation,

      // On pressed change animation state
      onPress: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
          BlocProvider.of<FloatingMenuCubit>(context).changeTransparency(true);
        } else {
          _animationController.forward();
          BlocProvider.of<FloatingMenuCubit>(context).changeTransparency(false);
        }
      },
      // Floating Action button Icon color
      iconColor: Colors.white,

      // Flaoting Action button Icon
      iconData: Icons.menu,
      backGroundColor: const Color.fromARGB(255, 8, 79, 212),
    );
  }
}
