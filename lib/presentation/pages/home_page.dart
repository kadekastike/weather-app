import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
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
    Future.microtask(() => context
        .read<WeatherBloc>()
        .add(const LoadWeatherData(3.097676570299186, 101.60354834630813)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11103a),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherHasData) {
          final data = state.weatherEntity;
          return DetailContent(data);
        } else if (state is WeatherError) {
          return Text(state.message);
        } else {
          return const Text('Failed');
        }
      }),
    );
  }
}

class DetailContent extends StatelessWidget {
  final WeatherEntity weather;

  const DetailContent(this.weather);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Weather Forecast",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'SFUI',
                  fontWeight: FontWeight.normal,
                  color: Color(0xffdcdce2),
                  fontSize: 20,
                  letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              elevation: 1.0,
              color: const Color(0xff1b1c48),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                      'Today',
                      style: TextStyle(
                          fontFamily: 'SFUI',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat('EEE, d MMM').format(DateTime.now()),
                      
                      style: const TextStyle(
                          fontFamily: 'SFUI',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffbebdcb),
                          height: 2,
                          letterSpacing: 1),
                    ),
                      ],
                    ),
  
                    Row(
                      children: [
                        Text(weather.current.temp.round().toString(),
                            style: const TextStyle(
                                fontFamily: 'SFUI',
                                fontWeight: FontWeight.w600,
                                fontSize: 45,
                                color: Colors.white,
                                letterSpacing: 1)),
                        const Text(" \u2103",
                            style: TextStyle(
                                fontFamily: 'SFUI',
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                color: Color(0xfff7c511),
                                letterSpacing: 1)),
                        Spacer(),
                        Image.network(
                          "http://openweathermap.org/img/wn/${weather.current.weather[0].icon}@2x.png",
                          scale: 0.2,
                          alignment: Alignment.topRight,
                          width: 190,
                          height: 130,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          weather.timezone,
                          style: const TextStyle(
                              fontFamily: 'SFUI',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: 1),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
