import 'package:flutter/material.dart';
import 'package:weatherapp/city_screen.dart';
import 'package:weatherapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  var temprature;
  var feelliketemp;
  late String weatherIcon;
  late String comment;
  var city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {


    setState(() {
      if(weather ==null){
        temprature=0;
        feelliketemp=0;
        var condition='Not Avilable ';
        weatherIcon='🚫';
        comment='Data Not vilable';
        city='Unknown City';

      }
      else if((weatherData)['main']['temp']==null)
        {
          print("No country found");
        }
      else{
      temprature = ((weatherData)['main']['temp']);
      feelliketemp = (weatherData)['main']['feels_like'];
      // print('Temprature: ' + temprature.toString());
      // print('Feellike: ' + feelliketemp.toString());
      var condition = (weatherData)['weather'][0]['id'];
      // print(condition.toString());
      weatherIcon = weather.getWeatherIcon(condition);
      comment = weather.getMessage(temprature);
      city = (weatherData)['name'];
      // print('City ' + city);
      }//else close
    });
  }
  rtrCityName(String typedName) async {

    var weatherData =
        await weather.getCityWeather(typedName);
    updateUI(weatherData);
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(title: Text('This is the Weather app'),),
      body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8), BlendMode.dstATop),
                  image: AssetImage(
                    'assets/images/bg.jpg',
                  ))),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0x77111328),
            ),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            var weatherData =
                                await weather.getLocationWeather();
                            updateUI(weatherData);
                          },
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Colors.white,
                            size: 40.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CityScreen(),
                                ));
                            print('from location page $typedName');
                            if (typedName != null) {
                              var weatherData = await weather.getCityWeather(typedName);
                              updateUI(weatherData);
                              print(weatherData);
                            }
                          },
                          child: Icon(
                            Icons.location_city_sharp,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Text(
                        'Weather in $city',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 75.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '$temprature°',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'c',
                                style: TextStyle(fontSize: 50.0),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          weatherIcon,
                          style: TextStyle(fontSize: 45.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0x77111328),
                    ),
                    child: Text(
                      'Feels like $feelliketemp',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0x77111328),
                    ),
                    child: Text(
                      comment,
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),

                  // Row(),
                ],
              ),
            ),
          )),
    ));
  }
}
