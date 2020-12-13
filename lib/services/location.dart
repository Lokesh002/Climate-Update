import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch (e) {
      print('Geolocation not found!!!');
    }
  }
}
