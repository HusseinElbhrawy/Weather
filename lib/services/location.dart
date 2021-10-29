import 'package:geolocator/geolocator.dart';

class Location {
  var latitude, longitude;

  Location({this.latitude, this.longitude});

  getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }
}
