// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_label.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/custom_text_field.dart';
import 'package:saudi_clean_services_owner/features/auth/signup/presentation/widgets/location_drop_down.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';
import 'package:saudi_clean_services_owner/features/profile/data/user_coords_impl.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/coords_cubit.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/widgets/city_drop_down.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = 'edit_profile_screen';

  const EditProfileScreen({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoordsCubit(
        userCoords: UserCoordsLocationImpl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
           AppLocalizations.of(context)!.edit_profile,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildNameField(context),
                  const SizedBox(
                    height: 12,
                  ),

                  _buildPhoneField(context),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildLocationField(context),
                  const SizedBox(
                    height: 12,
                  ),
                  _buildSubmitCloseBtn(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return CustomLabel(text: label);
  }

  Widget _buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel( AppLocalizations.of(context)!.laundry_name),
        const SizedBox(
          height: 4,
        ),
        CustomTextField(
            initalValue: '',
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
           hintText:  AppLocalizations.of(context)!.laundry_name,
            iconData: (Icons.room_service_outlined),
            validator: (String? value) {},
            isObscure: false),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel( AppLocalizations.of(context)!.phone_number),
        const SizedBox(
          height: 4,
        ),
        CustomTextField(
            initalValue: '',
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.phone,
            hintText:  AppLocalizations.of(context)!.phone_number,
            iconData: (Icons.phone),
            validator: (String ? value) {},
            isObscure: false),
      ],
    );
  }

  Widget _buildLocationField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel( AppLocalizations.of(context)!.laundry_location),
        const SizedBox(
          height: 4,
        ),
        CityDropDown(
          selected: 'مدينة 1',
        ),
      ],
    );
  }

  Widget _buildSubmitCloseBtn(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child:  Text( AppLocalizations.of(context)!.edit),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            child: Text( AppLocalizations.of(context)!.cancel),
          ),
        ),
      ],
    );
  }
}
