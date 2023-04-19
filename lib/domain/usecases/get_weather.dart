import 'package:dartz/dartz.dart';
import 'package:weather_app/common/failure.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/services/location_service.dart';

class GetWeather {
  final WeatherRepository weatherRepository;
  final LocationService locationService;

  GetWeather({ required this.weatherRepository, required this.locationService});

  Future<Either<Failure, WeatherEntity>> execute() async {
     try {
      final position = await locationService.getCurrentLocation();
      final latitude = position.latitude;
      final longitude = position.longitude;
      return await weatherRepository.getWeather(latitude, longitude);
    } catch (e) {
      throw Exception('Failed to get weather data');
    }
  }

}