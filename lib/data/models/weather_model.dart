import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

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

class Current extends Equatable {
  Current({
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
    required this.windGust,
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
  final double windGust;
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
        windGust: json["wind_gust"]?.toDouble(),
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
        "wind_gust": windGust,
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
        windGust,
        weather,
        pop
      ];
}

class Weather extends Equatable {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"]!,
        description: json["description"]!,
        icon: json["icon"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  WeatherMain toEntity() {
    return WeatherMain(
        id: id, main: main, description: description, icon: icon);
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}

class Daily extends Equatable {
  Daily({
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

  DailyEntity toEntity() {
    return DailyEntity(
        dt: dt,
        sunrise: sunrise,
        sunset: sunset,
        moonrise: moonrise,
        moonset: moonset,
        moonPhase: moonPhase,
        temp: temp as TempEntity,
        feelsLike: feelsLike as FeelsLikeEntity,
        pressure: pressure,
        humidity: humidity,
        dewPoint: dewPoint,
        windSpeed: windSpeed,
        windDeg: windDeg,
        windGust: windGust,
        weather: weather as List<WeatherMain>,
        clouds: clouds,
        pop: pop,
        uvi: uvi);
  }

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

  FeelsLikeEntity toEntity() {
    return FeelsLikeEntity(day: day, night: night, eve: eve, morn: morn);
  }

  @override
  List<Object?> get props => [day, night, eve, morn];
}

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

  TempEntity toEntity() {
    return TempEntity(
        day: day, min: min, max: max, night: night, eve: eve, morn: morn);
  }

  @override
  List<Object?> get props => [day, min, max, night, eve, morn];
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
    windGust: current.windGust,
    weather:
        current.weather.map((e) => mapWeatherMainModelToEntitiy(e)).toList(),
  );
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

FeelsLikeEntity mapFeelsLikeModelToFeelsLikeEntity(FeelsLike model) {
  return FeelsLikeEntity(
    day: model.day,
    night: model.night,
    eve: model.eve,
    morn: model.morn,
  );
}

WeatherMain mapWeatherMainModelToEntitiy(Weather model) {
  return WeatherMain(
      id: model.id,
      main: model.main,
      description: model.description,
      icon: model.icon);
}
