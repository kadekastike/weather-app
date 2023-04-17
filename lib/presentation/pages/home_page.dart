import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<WeatherBloc>().add(LoadWeatherData(30.3, 30.3)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherHasData) {
          final data = state.weatherEntity.daily;
          
          if (kDebugMode) {
            print(data);
          }
          return Text(data.toString());
        } else if (state is WeatherError) {
          return Text(state.message);
        } else {
          return Text('Failed');
        }
      }
      ),
    );
  }
}