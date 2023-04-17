import 'package:dartz/dartz.dart';
import 'package:weather_app/common/failure.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';

class GetWeather {
  final WeatherRepository weatherRepository;

  GetWeather({ required this.weatherRepository});

  Future<Either<Failure, WeatherEntity>> execute(lat, lon) {
    return weatherRepository.getWeather(lat, lon);
  }
}