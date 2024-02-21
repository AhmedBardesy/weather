import 'package:app7_weather/cubits/cubit_state.dart';
import 'package:app7_weather/models/weather_model.dart';
import 'package:app7_weather/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<weatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  String cityname = '';
  WeatherService weatherService;
  WeatherModel? weatherModel;
  void getweather({required String cityname}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherService.getWether(cityNmae: cityname);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailerState());
      print('Error when getting data${e.toString()}');
    }
  }

  String getimage() {
    if (weatherModel!.weatherStateName == 'Clear' ||
        weatherModel!.weatherStateName == 'Light Cloud') {
      return 'assets/images/lightcloud.jpg';
    } else if (weatherModel!.weatherStateName == 'Sleet' ||
        weatherModel!.weatherStateName == 'Snow' ||
        weatherModel!.weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherModel!.weatherStateName == 'Heavy Cloud') {
      return 'assets/images/havycloud.png';
    } else if (weatherModel!.weatherStateName == 'Light Rain' ||
        weatherModel!.weatherStateName == 'Heavy Rain' ||
        weatherModel!.weatherStateName == 'Showers') {
      return 'assets/images/havyreain.png';
    } else if (weatherModel!.weatherStateName == 'Thunderstorm') {
      return 'assets/images/thanderstorm.png';
    } else if (weatherModel!.weatherStateName == 'Sunny') {
      return 'assets/images/sunny.png';
    } else {
      return 'assets/images/clear.jpg';
    }
  }


}
