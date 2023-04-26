import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/pages/home_page.dart';
import 'injection.dart' as di;
void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<WeatherBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LocationBloc>()
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather",
        home: HomePage(),
      ),
    );
  }
}
