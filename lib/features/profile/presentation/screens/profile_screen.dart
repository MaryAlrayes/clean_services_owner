import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/profile/data/offer.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/floating_menu_cubit.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/widgets/offeres_data_table.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/screens/edit_profile_screen.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_card.dart';
import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import '../../data/laundry_service.dart';
import '../../data/user_coords_impl.dart';
import '../bloc/cubit/coords_cubit.dart';
import '../widgets/fetch_coords.dart';
import '../widgets/floating_menu.dart';
import '../widgets/laundry_services_data_table.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _coordsCubit = CoordsCubit(
    userCoords: UserCoordsLocationImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _coordsCubit,
        ),
        BlocProvider(
          create: (context) => FloatingMenuCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: const CustomDrawer(),
          floatingActionButton: const FloatingMenu(),
          appBar: _buildAppBar(context),
          body: SafeArea(
            child: BlocBuilder<FloatingMenuCubit, FloatingMenuState>(
              builder: (context, state) {
                return ColorFiltered(
                  colorFilter: state.isTransparent
                      ? const ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.srcOver,
                        )
                      : const ColorFilter.mode(
                          Colors.black54,
                          BlendMode.srcOver,
                        ),
                  child: Stack(children: [
                    const Background(),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Center(
                          child: _buildContent(
                            context,
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTransparency() {
    return BlocBuilder<FloatingMenuCubit, FloatingMenuState>(
        builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: state.isTransparent
            ? Colors.transparent
            : Colors.black.withOpacity(0.3),
      );
    });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.profile_nav),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProfileScreen.routeName,
                  arguments: {'cubit': _coordsCubit});
            },
            icon: const Icon(Icons.edit))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildName(),
          _buildRate(),
          const Divider(),
          _buildPhoneNumber(),
          const Divider(),
          _buildLocation(context),
          const Divider(),
          _buildServicesDetails(context),
          const Divider(),
          _buildOffersDetails(context),
        ],
      ),
    );
  }

  Text _buildName() {
    return Text(
      'مغسلة الأمين',
      style: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s24,
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.phone,
              color: ColorManager.secondary,
            ),
          ),
          Flexible(
            child: Text(
              '0534674536',
              style: getRegularStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.location_on,
              color: ColorManager.secondary,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    'الرياض',
                    style: getRegularStyle(
                      color: Colors.black,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
                FetchCoords(coordsCubit: _coordsCubit)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildRate() {
    return Container(
      constraints: const BoxConstraints(minWidth: 30),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.star_rounded,
              color: Colors.amber,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '5.0 / 4.3 ',
            ),
          ]),
    );
  }

  Widget _buildServicesDetails(BuildContext context) {
    return LaundryServicesDataTable(laundryService: myServices);
  }

  Widget _buildOffersDetails(BuildContext context) {
    return OfferesDataTable(
      offeres: offeres,
    );
  }
}
