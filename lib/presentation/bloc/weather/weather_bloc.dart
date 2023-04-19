import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import '../../../domain/entities/weather_entity.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final GetWeather getWeather;

  WeatherBloc({ required this.getWeather}) : super(WeatherInitial()) {
    on<LoadWeatherData>((event, emit) async {
      emit(WeatherLoading());
      final result = await getWeather.execute();
      result.fold(
        (failure) => emit(WeatherError(failure.message)), 
        (data) => emit(WeatherHasData(data)),
        );
    });
  }
}