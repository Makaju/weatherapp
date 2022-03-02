

import 'package:geolocator/geolocator.dart';

class Location{
  late double longitude;
  late double latitude;

  Future<void> getLocation() async {


    try{

      print('Started Location');
      LocationPermission permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
        print('Permission not avilable');
        LocationPermission asked = await Geolocator.requestPermission();
      }
      else if (permission == LocationPermission.always || permission == LocationPermission.whileInUse){

        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        // print('Longitude: ' + position.longitude.toString());
        // print('latitude: ' + position.latitude.toString());
        // return position;
        latitude=position.latitude;
        longitude=position.longitude;

      }



    }catch(e){print(e);}

  }

}