import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  getCityWeather(var cityName) async {
    var networkHelper = NetworkHelper(
        url: '$openWeatherAppUrl?q=$cityName&appid=$apiKey&units=metric');

    var weatherDate = await networkHelper.getDate();
    return weatherDate;
  }

  getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation(); //this to get the location of device
    var networkHelper = NetworkHelper(
        url:
            '$openWeatherAppUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherDate = await networkHelper.getDate();
    return weatherDate;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ';
    } else if (condition < 700) {
      return 'โ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ';
    } else if (condition <= 804) {
      return 'โ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
