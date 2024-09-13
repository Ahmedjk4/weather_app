import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.yellow;
    case 'partly cloudy':
      return Colors.grey;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
    case 'blizzard':
      return Colors.blue;
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
      return Colors.blueGrey;
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.blueGrey;
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.blueGrey;
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.grey;
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.grey;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.grey;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.orange;
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.blueGrey;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
