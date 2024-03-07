import 'package:equatable/equatable.dart';
import '../../domain/entities/weather_attributes_entity.dart';

class Weather extends Equatable {
  const Weather({
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

  @override
  List<Object?> get props => [id, main, description, icon];
}

WeatherMain mapWeatherMainModelToEntitiy(Weather model) {
  return WeatherMain(
      id: model.id,
      main: model.main,
      description: model.description,
      icon: model.icon);
}
