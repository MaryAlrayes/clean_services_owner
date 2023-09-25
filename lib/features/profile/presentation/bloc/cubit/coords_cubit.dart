
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry.dart';
import 'package:saudi_clean_services_owner/features/profile/data/user_coords.dart';

part 'coords_state.dart';

class CoordsCubit extends Cubit<CoordsState> {
  final UserCoords userCoords;
  CoordsCubit({
   required this.userCoords,
  }
  ) : super(CoordsInitial());

  void fetchLocation() async {
    emit(CoordsLoading());
    try{
    Coords coords = await userCoords.getCoords();
    emit(CoordsFetched(coords: coords));
    }on Exception {
      emit(CoordsError());
    }
    }
}

