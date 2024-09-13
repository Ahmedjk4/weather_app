import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/utils/get_Theme_Colors.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition ??
                      'some unkown condition'),
              useMaterial3: false,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
