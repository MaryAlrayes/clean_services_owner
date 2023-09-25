// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/coords_cubit.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/widgets/location_coords.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class FetchCoords extends StatelessWidget {
  final CoordsCubit coordsCubit;
  const FetchCoords({
    Key? key,
    required this.coordsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoordsCubit, CoordsState>(
      builder: (context, state) {
        if (state is CoordsFetched) {
          return _buildFetch(context);
        } else {
          return _buildOtherwise(context);
        }
      },
    );
  }

  Column _buildOtherwise(BuildContext context) {
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
                value: coordsCubit,
                child: const Dialog(
                  child: LocationCoords(),
                ),
              ),
            );
          },
          child:  Text(
           AppLocalizations.of(context)!.set_location
          ),
        )
      ],
    );
  }

  Column _buildFetch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
          const  Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 16,
            ),
          const  SizedBox(
              width: 8,
            ),
            Text(AppLocalizations.of(context)!.we_have_your_coords),
          ],
        ),

      ],
    );
  }
}
