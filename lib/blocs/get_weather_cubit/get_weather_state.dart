part of 'get_weather_cubit.dart';

sealed class GetWeatherState {}

final class WeatherInitialState extends GetWeatherState {}

final class WeatherLoadedState extends GetWeatherState {}

final class WeatherErrorState extends GetWeatherState {}
