import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/weather_attributes_model.dart';
import '../../domain/entities/daily_weather_entity.dart';

class Daily extends Equatable {
  const Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"]?.toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"]?.toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"]?.toDouble(),
        uvi: json["uvi"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
      };

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        windGust,
        weather,
        clouds,
        pop,
        uvi
      ];
}

// ignore: must_be_immutable
class FeelsLike extends Equatable {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  List<Object?> get props => [day, night, eve, morn];
}

// ignore: must_be_immutable
class Temp extends Equatable {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };

  @override
  List<Object?> get props => [day, min, max, night, eve, morn];
}

DailyEntity mapDailyModelToDailyEntity(Daily model) {
  return DailyEntity(
    dt: model.dt,
    sunrise: model.sunrise,
    sunset: model.sunset,
    moonrise: model.moonrise,
    moonset: model.moonset,
    clouds: model.clouds,
    windGust: model.windGust,
    pop: model.pop,
    uvi: model.uvi,
    moonPhase: model.moonPhase,
    temp: mapTempModelToTempEntity(model.temp),
    feelsLike: mapFeelsLikeModelToFeelsLikeEntity(model.feelsLike),
    pressure: model.pressure,
    humidity: model.humidity,
    dewPoint: model.dewPoint,
    windSpeed: model.windSpeed,
    windDeg: model.windDeg,
    weather: model.weather.map((e) => mapWeatherMainModelToEntitiy(e)).toList(),
  );
}

FeelsLikeEntity mapFeelsLikeModelToFeelsLikeEntity(FeelsLike model) {
  return FeelsLikeEntity(
    day: model.day,
    night: model.night,
    eve: model.eve,
    morn: model.morn,
  );
}

TempEntity mapTempModelToTempEntity(Temp model) {
  return TempEntity(
    day: model.day,
    min: model.min,
    max: model.max,
    night: model.night,
    eve: model.eve,
    morn: model.morn,
  );
}