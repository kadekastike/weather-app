import 'dart:convert';
import 'package:weather_app/common/exeception.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {

  static const URL = "https://api.openweathermap.org/data/2.5";
  static const APP_ID = "8c1c230db9d1ef99bf33660785575a51";
    
  final http.Client client;

  WeatherRemoteDataSourceImpl({ required this.client});

  @override
  Future<WeatherModel> getWeather(double lat, double lon) async {
    
    final response = await client.get(
      Uri.parse('$URL/onecall?lat=$lat&lon=$lon&units=metric&exclude=minutely&appid=$APP_ID'));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    } 
  }
}