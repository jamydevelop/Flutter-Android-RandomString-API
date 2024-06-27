import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_data/services/api_service.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiService apiService;
  Timer? _cooldownTimer;

  // Constructor: Initialize the bloc with an ApiService and set initial state
  DataBloc(this.apiService) : super(DataInitial()) {
    // Register the event handler for FetchDataEvent
    on<FetchDataEvent>(_onFetchData);
  }

  // Event handler for FetchDataEvent
  Future<void> _onFetchData(
      FetchDataEvent event, Emitter<DataState> emit) async {
    // Check if cooldown timer is active, if so, do nothing
    if (_cooldownTimer?.isActive ?? false) return;
    // Emit loading state
    emit(DataLoading());
    try {
      // Fetch random string from API
      final randomString = await apiService.fetchRandomString();
      // Emit loaded state with the fetched string
      emit(DataLoaded(randomString));
    } catch (e) {
      // If an error occurs, emit error state
      emit(DataError(e.toString()));
    }

    // Start a cooldown timer to prevent rapid requests
    _cooldownTimer = Timer(const Duration(seconds: 2), () {});
  }

  // Override close method to cancel the timer when the bloc is closed
  @override
  Future<void> close() {
    _cooldownTimer?.cancel();
    return super.close();
  }
}
