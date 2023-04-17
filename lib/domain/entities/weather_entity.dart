import 'package:equatable/equatable.dart';
import 'current_weather_entity.dart';
import 'daily_weather_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentEntity current;
  final List<CurrentEntity> hourly;
  final List<DailyEntity> daily;

  @override
  List<Object?> get props =>
      [lat, lon, timezone, timezoneOffset, current, hourly, daily];
}