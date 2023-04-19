part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherHasData extends WeatherState {
  final WeatherEntity weatherEntity;

  const WeatherHasData(this.weatherEntity);

  @override
  List<Object?> get props => [weatherEntity];
}
