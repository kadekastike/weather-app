import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      throw Exception('Location service is disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permission denied forever. Please enable location permissions in settings.');
    }

    if (permission == LocationPermission.denied) {
      throw Exception(
          'Location permission denied. Please grant location permissions.');
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      throw Exception('Failed to get current location');
    }
  }

  Future<String> getLocationNameFromCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    try {
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        if (placemark.subLocality == '') {
          return placemark.locality!;
        } else {
          return placemark.subLocality!;
        }
      } else {
        throw Exception('Failed to get location name');
      }
    } catch (e) {
      throw Exception('Failed to get location name');
    }
  }
}
