import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';

class WeatherModel {
  double lat;
  double long;
  String cityName;
  Future<dynamic> getCityWeather(String ctName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$ctName&appid=$apiKey&units=metric';
    Networking networking = Networking(url);
    var decodedData = await networking.getClimate();
    return decodedData;
  }

  Future<dynamic> getWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    lat = loc.latitude;
    long = loc.longitude;
    Networking networking = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');

    var decodedData = await networking.getClimate();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
