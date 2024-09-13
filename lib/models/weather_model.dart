class WeatherModel {
  final String cityName;
  final String countryName;
  final DateTime date;
  final String icon;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String condition;

  WeatherModel(
      {required this.countryName,
      required this.date,
      required this.cityName,
      required this.icon,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['location']['name'],
        countryName: json['location']['country'],
        date: DateTime.parse(json['current']['last_updated']),
        icon: json['current']['condition']['icon'],
        temperature: json['current']['temp_c'],
        minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        condition: json['current']['condition']['text']);
  }
}
