import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

import '../../common/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(double lat, double lon);
}