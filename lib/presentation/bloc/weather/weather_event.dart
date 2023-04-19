part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class LoadWeatherData extends WeatherEvent {
  // final double lat;
  // final double lon;

  const LoadWeatherData();
}