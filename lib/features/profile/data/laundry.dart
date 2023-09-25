// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';

class Coords {
  final num lat;
  final num lng;
  Coords({
    required this.lat,
    required this.lng,
  });
}

class Laundry {
  final String name;
  final String phone;
  final String cityName;
  final Coords coords;
  final List<LaundryService> services;
  Laundry({
    required this.name,
    required this.phone,
    required this.cityName,
    required this.coords,
    required this.services,
  });
}
