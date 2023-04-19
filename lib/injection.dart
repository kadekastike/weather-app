import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/presentation/bloc/location/location_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location_service.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => WeatherBloc(getWeather: locator()));

  locator.registerFactory(() => LocationBloc(locationService: locator()));

  locator.registerLazySingleton(() =>
      GetWeather(weatherRepository: locator(), locationService: locator()));

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()));

  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());

  locator.registerLazySingleton(() => LocationService());
}
