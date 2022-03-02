import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../utility/constants.dart';
import 'networking.dart';


class WeatherModel {
  late double latitude;
  late double longitude;


  Future<dynamic> getCityWeather(String cityName) async {
var url='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
NetworkHelper networkHelper = NetworkHelper(url);
return networkHelper.getData();
  }


  Future<dynamic> getLocationWeather() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('Permission Not avilable');
      LocationPermission asked = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      longitude = position.longitude;
      latitude = position.latitude;
      NetworkHelper networkHelper = NetworkHelper(
          '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      return weatherData;
    }
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

  String getMessage(double temp) {
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
