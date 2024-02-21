

import 'package:flutter/material.dart';

class WeatherModel {
   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;

  WeatherModel(
  {required this.date,
   required this.temp,
    required this.maxTemp,
     required this.minTemp,
      required this.weatherStateName});

 factory WeatherModel.fromjson(dynamic data){
        var jsonData=  data['forecast']['forecastday'][0]['day'];
       
       return WeatherModel(
         date: data['location']['localtime'], 
        temp:jsonData['avgtemp_c'], 
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'], 
        weatherStateName: jsonData['condition']['text'],);
  }

 @override
  String toString() {
    return 'Weather{date:$date ,temp:$temp ,maxTemp:$maxTemp ,minTemp:$minTemp}';
    // return super.toString();
  }

 String getimage(){
  if (weatherStateName =='Clear' ||weatherStateName =='Light Cloud' ) {
    return 'assets/images/lightcloud.jpg';
  } else if (weatherStateName =='Sleet' 
              ||weatherStateName =='Snow' 
              ||weatherStateName =='Hail'  
              ) {
    return 'assets/images/snow.png';

  }else if 
  (weatherStateName =='Heavy Cloud') {
    return 'assets/images/havycloud.png';
  } 
  else if (weatherStateName =='Light Rain' 
              ||weatherStateName =='Heavy Rain' 
              ||weatherStateName =='Showers'
              ) {
    return 'assets/images/havyreain.png';

  } else if (weatherStateName == 'Thunderstorm') {
    return 'assets/images/thanderstorm.png';
  }
  else if (weatherStateName == 'Sunny') {
    return 'assets/images/sunny.png';
  } 
   else {
    return 'assets/images/clear.jpg';
  }
 }


 MaterialColor getthemcolor(){
  if (weatherStateName =='Clear' ||weatherStateName =='Light Cloud' ) {
    return Colors.orange;
  } else if (weatherStateName =='Sleet' 
              ||weatherStateName =='Snow' 
              ||weatherStateName =='Hail'
              ) {
    return Colors.blue;

  }else if 
  (weatherStateName =='Heavy Cloud') {
    return Colors.blueGrey;
  } 
  else if (weatherStateName =='Light Rain' 
              ||weatherStateName =='Heavy Rain' 
              ||weatherStateName =='Showers'
              ) {
    return Colors.blueGrey;

  } else if (weatherStateName == 'Thunderstorm') {
    return Colors.teal;
  }
  else if (weatherStateName == 'Sunny') {
    return Colors.amber;
  } else if (weatherStateName == 'Partly cloudy') {
    return Colors.cyan;
  } 
   else {
    return Colors.amber;
  }
 }


}
