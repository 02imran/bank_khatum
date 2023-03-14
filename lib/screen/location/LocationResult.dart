import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/address_component.dart';

/// The result returned after completing location selection.
class LocationResult {
  /// The human readable name of the location. This is primarily the
  /// name of the road. But in cases where the place was selected from Nearby
  /// places list, we use the <b>name</b> provided on the list item.
  late String name; // or road

  /// The human readable locality of the location.
  late String locality;

  /// Latitude/Longitude of the selected location.
  late LatLng latLng;

  /// Formatted address suggested by Google
  late String formattedAddress;

  late AddressComponent country;

  late AddressComponent city;

  late AddressComponent administrativeAreaLevel1;

  late AddressComponent administrativeAreaLevel2;

  late AddressComponent subLocalityLevel1;

  late AddressComponent subLocalityLevel2;

  late String postalCode;

  late String placeId;
}
