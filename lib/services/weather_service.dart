import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "de7219f93a5549c587f11158242107";
  Future<dynamic> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      final json = response.data;
      return WeatherModel.fromJson(json);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        log(e.message.toString());
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<String>> getAutoComplete(String search) async {
    try {
      if (search.isEmpty) return [];
      Response response = await Dio().get(
          'https://api.weatherapi.com/v1/search.json?key=de7219f93a5549c587f11158242107&q=$search');
      List<dynamic> cities = response.data;

      List<String> cityNames =
          cities.map((city) => city['name'].toString()).toList();

      return cityNames.isNotEmpty ? cityNames : [];
    } catch (e) {
      log(e.toString());
      return ['Check Your Interent Connection'];
    }
  }
}
