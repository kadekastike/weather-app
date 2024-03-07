import 'package:equatable/equatable.dart';

class WeatherMain extends Equatable {
  const WeatherMain({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [id, main, description, icon];
}
