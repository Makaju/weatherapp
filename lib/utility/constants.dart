import 'package:flutter/material.dart';

const apiKey = 'f7799154c1892242d3fc8db751a02b62';
const openWeatherMapURL ='https://api.openweathermap.org/data/2.5/weather';

const kTextFieldInputDecoration = InputDecoration(
  hintText: 'Enter City',
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(
    Icons.location_city_sharp,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide.none,
  ),
)
;