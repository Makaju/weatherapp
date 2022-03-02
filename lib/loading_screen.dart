import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//location getter
  Future<void> getLocationData() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherData = await weathermodel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        LocationScreen(locationWeather: weatherData),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.black,
        ),
      ),
    );
  }
}
