import 'package:app7_weather/Home_page.dart';
import 'package:app7_weather/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:app7_weather/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/weather_cubit.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    print('weatherModel in the main ${BlocProvider.of<WeatherCubit>(context).weatherModel}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: HomePage(),
    );
  }
}
