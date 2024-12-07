import 'package:task/model/location_model.dart';

class LocationState {
  final bool mapLoading;
  final bool currentLocationLoading;
  final bool coordinateLoading;
  final LocationModel? mapLocation;
  final LocationModel? currentLocation;
  final LocationModel? coordinateLocation;
  final String errorMessage;
  final String mapError;
  final String coordinateError;
  final String currentLocationErrorError;

  LocationState(
      {this.mapLocation,
      this.currentLocation,
      this.mapError = '',
      this.coordinateError = '',
      this.currentLocationErrorError = '',
      this.errorMessage = '',
      this.mapLoading = false,
      this.currentLocationLoading = false,
      this.coordinateLoading = false,
      this.coordinateLocation});

  LocationState copyWith({
    LocationModel? mapLocation,
    LocationModel? currentLocation,
    LocationModel? coordinateLocation,
    String? errorMessage,
    String? mapError,
    String? coordinateError,
    String? currentLocationErrorError,
    bool? mapLoading,
    bool? currentLocationLoading,
    bool? coordinateLoading,
  }) {
    return LocationState(
      mapLocation: mapLocation ?? this.mapLocation,
      currentLocation: currentLocation ?? this.currentLocation,
      coordinateLocation: coordinateLocation ?? this.coordinateLocation,
      errorMessage: errorMessage ?? this.errorMessage,
      mapError: mapError ?? this.mapError,
      coordinateLoading: coordinateLoading ?? this.coordinateLoading,
      currentLocationLoading:
          currentLocationLoading ?? this.currentLocationLoading,
      mapLoading: mapLoading ?? this.mapLoading,
      coordinateError: coordinateError ?? this.coordinateError,
      currentLocationErrorError:
          currentLocationErrorError ?? this.currentLocationErrorError,
    );
  }
}
