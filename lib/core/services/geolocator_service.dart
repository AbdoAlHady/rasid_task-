import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task/core/exception/exceptions.dart';
import 'package:task/model/location_model.dart';

abstract class GeolocatorService {
  static Future<void> checkLocationPremission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceException();
    } else {
      log('Location services are enabled');
      // check if location permission is granted
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationPermissionException();
        }
      } else if (permission == LocationPermission.deniedForever) {
        throw LocationPermissionException();
      }
    }
  }

  static Future<LocationModel?> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return LocationModel(
          name: place.name,
          street: place.street,
          country: place.country,
          postalCode: place.postalCode,
          locality: place.locality,
        );
      }
      throw AddressFromCoordinatesException(message: 'No address found');
    } catch (e) {
      throw AddressFromCoordinatesException(
          message: 'Error getting address from coordinates');
    }
  }
}
