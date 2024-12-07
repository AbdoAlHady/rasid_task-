import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task/core/exception/exceptions.dart';
import 'package:task/core/services/geolocator_service.dart';
import 'package:task/logic/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState());

  int currentIndex = 0;
  bool isLocationPermissionGranted = false;

  void changeIndex() {
    currentIndex++;
    emit(state.copyWith());
  }

  void changeIndexBack() {
    currentIndex--;
    emit(state.copyWith());
  }

  Future<void> locationPermission() async {
    try {
      await GeolocatorService.checkLocationPremission();
      isLocationPermissionGranted = true;
      emit(state.copyWith());
    } on LocationServiceException {
      emit(state.copyWith(
          errorMessage: 'Location services are disabled. Please enable it.'));
    } on LocationPermissionException {
      emit(state.copyWith(
          errorMessage: 'Location permission is denied. Please enable it.'));
    }
  }

  String? extractCoordinatesFromUrl(String url) {
    final regex = RegExp(r'@(-?\d+\.\d+),(-?\d+\.\d+)');
    final match = regex.firstMatch(url);
    if (match != null) {
      return '${match.group(1)},${match.group(2)}';
    }
    return null;
  }

  void getMapLinkAddress(String url) async {
    emit(state.copyWith(
      mapLoading: true,
      mapLocation: null,
      mapError: '',
    ));
    final coordinates = extractCoordinatesFromUrl(url)?.split(',');
    if (coordinates != null) {
      final latitude = double.parse(coordinates[0]);
      final longitude = double.parse(coordinates[1]);
      final location = await GeolocatorService.getAddressFromCoordinates(
          latitude, longitude);
      emit(state.copyWith(mapLocation: location, mapLoading: false));
    } else {
      emit(state.copyWith(mapError: 'Invalid map link', mapLoading: false));
    }
  }

  void getCoordinateLocation(
      {required double latitude, required double longitude}) async {
    emit(state.copyWith(
      mapLoading: true,
      coordinateLocation: null,
      coordinateError: '',
    ));

    try {
      final location = await GeolocatorService.getAddressFromCoordinates(
          latitude, longitude);
      log('Location: ${location!.name}');
      emit(state.copyWith(
          coordinateLocation: location, coordinateLoading: false));
    } on AddressFromCoordinatesException catch (e) {
      emit(
          state.copyWith(coordinateError: e.message, coordinateLoading: false));
    }
  }

  void getCurrentDeviceLocation() async {
    emit(state.copyWith(
      currentLocationLoading: true,
      currentLocation: null,
      currentLocationErrorError: '',
    ));
    try {
      Position position = await Geolocator.getCurrentPosition();
      final location = await GeolocatorService.getAddressFromCoordinates(
          position.latitude, position.longitude);
      log(location!.name.toString());
      emit(state.copyWith(
          currentLocation: location, currentLocationLoading: false));
    } catch (e) {
      emit(state.copyWith(
          currentLocationErrorError:
              'Failed to get current location. Please try again.',
          currentLocationLoading: false));
    }
  }
}
