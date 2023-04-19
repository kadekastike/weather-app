import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/location_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService locationService;

  LocationBloc({required this.locationService}) : super(LocationInitial()) {
    on<FetchLocationName>((event, emit) async {
      try {
        emit(LocationLoading());
        final result = await locationService.getLocationNameFromCoordinates();
        emit(LocationLoaded(result));
      } catch (e) {
        emit(const LocationError('Failed to get e'));
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }
}
