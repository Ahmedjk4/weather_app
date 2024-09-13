import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EasyAutocomplete(
                progressIndicatorBuilder: const CircularProgressIndicator(),
                asyncSuggestions: (searchValue) async {
                  if (searchValue.length <= 2) {
                    return [
                      'You Need At Least 3 Letters'
                    ]; // Return an empty list if searchValue is too short
                  }
                  return await WeatherService().getAutoComplete(searchValue);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Search City',
                  hintText: 'Enter city name',
                  suffixIcon: Icon(Icons.search),
                ),
                suggestionBuilder: (data) {
                  return Container(
                    margin: const EdgeInsets.all(1),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
                onSubmitted: (value) async {
                  if (value.isNotEmpty) {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWeather(cityName: value);
                    Navigator.pop(context);
                  }
                },
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
