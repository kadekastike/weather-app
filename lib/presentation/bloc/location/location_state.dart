part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final String locationName;

  const LocationLoaded(this.locationName);

  @override
  List<Object?> get props => [locationName];
}

class LocationError extends LocationState {
  final String errorMessage;

  const LocationError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
