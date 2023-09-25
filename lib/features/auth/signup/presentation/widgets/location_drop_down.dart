import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/auth/signup/presentation/bloc/bloc/signup_bloc.dart';

import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/managers/styles_manager.dart';
import '../../../../../core/managers/values_manager.dart';

class LocationDropDown extends StatefulWidget {
  final String? selected;
  const LocationDropDown({
    Key? key,
    this.selected,
  }) : super(key: key);

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  List<String> cities = ['مدينة 1', 'مدينة 2', 'مدينة 3'];
  String? selected;
  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          child: DropdownButton<String>(
            value: selected,
            hint: Text(AppLocalizations.of(context)!.choose_city),
            items: cities.map((e) => _buildDropMenuItem(context, e)).toList(),
            onChanged: ((value) {
              BlocProvider.of<SignupBloc>(context).add(CityChangedEvent(city: value!));
              setState(() {
                selected = value;
              });
            }),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropMenuItem(BuildContext context, String e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e,
        style: getRegularStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
