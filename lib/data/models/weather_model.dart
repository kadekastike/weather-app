import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'current_weather_model.dart';
import 'daily_weather_model.dart';

class WeatherModel extends Equatable {
  WeatherModel({
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
  final Current current;
  final List<Current> hourly;
  final List<Daily> daily;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props =>
      [lat, lon, timezone, timezoneOffset, current, hourly, daily];
}

WeatherEntity mapWeatherModeltoEntity(WeatherModel model) {
  return WeatherEntity(
    lat: model.lat,
    lon: model.lon,
    timezone: model.timezone,
    timezoneOffset: model.timezoneOffset,
    current: mapCurrenttoEntity(model.current),
    hourly: model.hourly.map((e) => mapCurrenttoEntity(e)).toList(),
    daily: model.daily.map((e) => mapDailyModelToDailyEntity(e)).toList(),
  );
}
