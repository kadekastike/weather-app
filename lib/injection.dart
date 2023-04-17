import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => WeatherBloc(getWeather:locator()));

  locator.registerLazySingleton(() => GetWeather(weatherRepository: locator()));

  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(weatherRemoteDataSource: locator()));

  locator.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());
}