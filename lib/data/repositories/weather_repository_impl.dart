import 'package:weather_app/common/exeception.dart';
import 'package:weather_app/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({ required this.weatherRemoteDataSource });
  @override
  Future<Either<Failure, WeatherEntity>> getWeather(double lat, double lon) async {
    try {
      final result = await weatherRemoteDataSource.getWeather(lat, lon);
      return Right(mapWeatherModeltoEntity(result));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on ConnectionFailure {
      return const Left(ConnectionFailure(''));
    }
  }
}