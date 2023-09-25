// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/coords_cubit.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/widgets/location_coords.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CityDropDown extends StatefulWidget {
  final String? selected;
  const CityDropDown({
    Key? key,
    this.selected,
  }) : super(key: key);

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  List<String> cities = ['مدينة 1', 'مدينة 2', 'مدينة 3'];
  String? selected;
  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext muContext) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(

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
              hint:  Text(AppLocalizations.of(context)!.choose_city),
              items: cities.map((e) => _buildDropMenuItem(context, e)).toList(),
              onChanged: ((value) {
                setState(() {
                  selected = value;
                });
              }),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      if (selected != widget.selected) _buildFetchLocation(muContext)
    ]);
  }

  BlocBuilder<CoordsCubit, CoordsState> _buildFetchLocation(
      BuildContext muContext) {
    return BlocBuilder<CoordsCubit, CoordsState>(
      builder: (context, state) {
        if (state is CoordsFetched) {
          return _buildFetched();
        } else {
          return _buildOtherwise(context, muContext);
        }
      },
    );
  }

  Column _buildOtherwise(BuildContext context, BuildContext muContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.should_set_location,
          style: getRegularStyle(
            color: Colors.red,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => BlocProvider.value(
                value: BlocProvider.of<CoordsCubit>(muContext),
                child: const Dialog(
                  child: LocationCoords(),
                ),
              ),
            );
          },
          child:  Text(
              AppLocalizations.of(context)!.set_location,
          ),
        )
      ],
    );
  }

  Row _buildFetched() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
      const  Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      const  SizedBox(
          width: 8,
        ),
        Text( AppLocalizations.of(context)!.coords_has_been_fetched)
      ],
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
