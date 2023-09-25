import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/features/profile/presentation/bloc/cubit/coords_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationCoords extends StatelessWidget {
  const LocationCoords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoordsCubit, CoordsState>(
      listener: (context, state) {
        if (state is CoordsFetched) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        }
      },
      builder: (context, state) {
        return BlocBuilder<CoordsCubit, CoordsState>(
          builder: (context, state) {
            if (state is CoordsInitial) {
              return _buildInitial(context);
            }
            if (state is CoordsLoading) {
              return _buildLoading(context);
            } else if (state is CoordsFetched) {
              return _buildFetched(context);
            } else if (state is CoordsError) {
              return _buildError(context);
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  Widget _buildError(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.error_fetching_coords),
          OutlinedButton.icon(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () {
              BlocProvider.of<CoordsCubit>(context).fetchLocation();
            },
            label: Text(
              AppLocalizations.of(context)!.retry,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFetched(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(AppLocalizations.of(context)!.coords_has_been_fetched)
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.fetch_coords_loading,
          ),
          const SizedBox(
            height: 8,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.are_you_in_laundry,
            textAlign: TextAlign.center,
            style: getBoldStyle(color: Colors.black, fontSize: FontSize.s18),
          ),
          Text(
            AppLocalizations.of(context)!.fetching_location_msg1,
            textAlign: TextAlign.center,
            style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.fetching_location_msg2,
            textAlign: TextAlign.center,
            style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppLocalizations.of(context)!.fetching_location_msg3,
            textAlign: TextAlign.center,
            style: getRegularStyle(color: Colors.black, fontSize: FontSize.s16),
          ),
          const SizedBox(
            height: 12,
          ),
          OutlinedButton(
            onPressed: () {
              BlocProvider.of<CoordsCubit>(context).fetchLocation();
            },
            child: Text(
              AppLocalizations.of(context)!.fetch_coords,
            ),
          )
        ],
      ),
    );
  }
}
