import 'package:saudi_clean_services_owner/core/utils/services/location_service.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry.dart';
import 'package:saudi_clean_services_owner/features/profile/data/user_coords.dart';

class UserCoordsLocationImpl implements UserCoords {
  @override
  Future<Coords> getCoords() async {
    Coords coords = await getCurrentLocation();

    return coords;
  }
}
