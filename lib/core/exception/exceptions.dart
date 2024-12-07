class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}

class AddressFromCoordinatesException implements Exception {
  final String message;

  AddressFromCoordinatesException({required this.message});
}
