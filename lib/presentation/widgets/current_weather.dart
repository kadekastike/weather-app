import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/weather_entity.dart';
import '../bloc/location/location_bloc.dart';
import 'forecast.dart';
import 'fourecast_daily.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherEntity weather;

  const CurrentWeather(this.weather);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
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
                        const Spacer(),
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
                        const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Color(0xfff7c511),
                        ),
                        const SizedBox(width: 10),
                        BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, state) {
                          if (state is LocationInitial) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is LocationLoaded) {
                            return Text(state.locationName,
                                style: const TextStyle(
                                    fontFamily: 'SFUI',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                    letterSpacing: 1));
                          } else if (state is LocationError) {
                            return Text(state.errorMessage);
                          } else {
                            return const Text('failed');
                          }
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 4, color: Color.fromARGB(255, 80, 82, 168)),
                    ),
                    labelPadding: EdgeInsets.all(8),
                    isScrollable: true,
                    tabs: [
                    Text('Today',
                        style: TextStyle(
                            fontFamily: 'SFUI',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: 1)),
                            
                    Text('Next 7 Days',
                        style: TextStyle(
                            fontFamily: 'SFUI',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: 1))
                  ]),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 190,
                              child: Forecast(weather.hourly),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 190,
                              child: ForecastDaily(weather.daily),
                            )
                          ],
                        ),
                      ]),
                  )
                ],
              )),
        ],
      ),
    );
  }
}