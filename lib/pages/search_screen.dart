// ignore_for_file: unused_import

import 'package:app7_weather/cubits/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen();
   String cityname= '';
   
  @override
  Widget build(BuildContext context) {
     
     return Scaffold(
      appBar: AppBar(
      title: const Text('Search a City'),
  
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(

           onSubmitted: (value) async{
            cityname = value;
            BlocProvider.of<WeatherCubit>(context).getweather(cityname: cityname);
            BlocProvider.of<WeatherCubit>(context).cityname =cityname;
             Navigator.pop(context);
           },
          
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              border: OutlineInputBorder(
                
              ),
              hintText: 'Enter a City'
            ),
          ),
        ),
      ),
    );
  }
}
