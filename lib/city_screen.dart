import 'package:flutter/material.dart';
import 'package:weatherapp/utility/constants.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  late String cityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 45,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              onChanged: (value){
                cityName=value;
              },
              style: TextStyle(color: Colors.black),
              decoration: kTextFieldInputDecoration,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.orange,
                              Colors.orange,
                              Colors.orange,
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {Navigator.pop(context, cityName);},
                      child: const Text('Get Weather'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
