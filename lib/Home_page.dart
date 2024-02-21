// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:app7_weather/cubits/cubit_state.dart';
import 'package:app7_weather/cubits/weather_cubit.dart';
import 'package:app7_weather/pages/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/weather_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        BlocBuilder<WeatherCubit, weatherState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor:
                BlocProvider.of<WeatherCubit>(context).weatherModel == null
                    ? Colors.blue
                    : BlocProvider.of<WeatherCubit>(context)
                        .weatherModel!
                        .getthemcolor(),
            title: const Text('Weather App'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ));
                  }),
            ],
          ),
          body: state is WeatherLoadingState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state is WeatherSuccessState
                  ? SuccessBody()
                  : state is WeatherFailerState
                      ? Center(
                          child: Text('something went wrong please try again '))
                      : DefaultBody());
    }));
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Text('There is no Weather Start', style: TextStyle(fontSize: 30)),
        Text(
          'Search now',
          style: TextStyle(fontSize: 30),
        )
      ]),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherdata = BlocProvider.of<WeatherCubit>(context).weatherModel;
    print(
        'weatherModel in the homePage ${BlocProvider.of<WeatherCubit>(context).weatherModel}');

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getthemcolor(),
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getthemcolor()[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<WeatherCubit>(context).cityname,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              weatherdata!.date,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 140,
                    width: 140,
                    child: Image.asset(BlocProvider.of<WeatherCubit>(context)
                        .weatherModel!
                        .getimage())),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '${weatherdata.temp}',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text('Maxtemb:${weatherdata.maxTemp}'),
                    Text('Mintemb:${weatherdata.minTemp}')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'weather state:${weatherdata.weatherStateName}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
