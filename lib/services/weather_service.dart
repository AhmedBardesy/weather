import 'dart:convert';

import 'package:app7_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherService 
{
  String baseUrl ='http://api.weatherapi.com/v1';
  String apikey ='ed9c39f246584ebfb3c122237230609';
Future<WeatherModel> getWether ({required String cityNmae})async
{
  Uri url = Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityNmae&days=1');

 http.Response response = await http.get(url);
Map<String,dynamic> data = jsonDecode(response.body);
WeatherModel weather = WeatherModel.fromjson(data);


return weather;

}

}
