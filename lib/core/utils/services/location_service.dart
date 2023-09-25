
  import 'package:location/location.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry.dart';

Future<Coords> getCurrentLocation() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;
    try {
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
      }

      _permissionGranted = await _location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _location.requestPermission();
      }

      // Get capture the current user location
      LocationData _locationData = await _location.getLocation();
      print('the lat is ' + _locationData.latitude.toString());
      print('the long is ' + _locationData.longitude.toString());
      Coords currentLatLng =
          Coords(lat:  _locationData.latitude!,lng:  _locationData.longitude!);

      return currentLatLng;
    } catch (e) {
      throw Exception('Error');
    }
  }
