import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/weather_attributes_model.dart';
import '../../domain/entities/current_weather_entity.dart';

class Current extends Equatable {
  const Current({
    required this.dt,
    this.sunrise,
    this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    this.pop,
  });

  final int dt;
  final int? sunrise;
  final int? sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;
  final double? pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        uvi: json["uvi"]?.toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "pop": pop,
      };

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weather,
        pop
      ];
}

CurrentEntity mapCurrenttoEntity(Current current) {
  return CurrentEntity(
    dt: current.dt,
    temp: current.temp,
    feelsLike: current.feelsLike,
    pressure: current.pressure,
    humidity: current.humidity,
    dewPoint: current.dewPoint,
    uvi: current.uvi,
    clouds: current.clouds,
    visibility: current.visibility,
    windSpeed: current.windSpeed,
    windDeg: current.windDeg,
    weather:
        current.weather.map((e) => mapWeatherMainModelToEntitiy(e)).toList(),
  );
}