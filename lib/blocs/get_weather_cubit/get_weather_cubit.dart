import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/services/weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherErrorState());
      log(e.toString());
    }
  }
}
