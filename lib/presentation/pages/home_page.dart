import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/current_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<WeatherBloc>().add(const LoadWeatherData()));
    Future.microtask(() => context.read<LocationBloc>().add(FetchLocationName())); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11103a),
      body: SingleChildScrollView(
        child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: const CircularProgressIndicator()
              );
          } else if (state is WeatherHasData) {
            final data = state.weatherEntity;
            return CurrentWeather(data);
          } else if (state is WeatherError) {
            return Text(state.message);
          } else {
            return const Text('Failed');
          }
        }),
      ),
    );
  }
}
