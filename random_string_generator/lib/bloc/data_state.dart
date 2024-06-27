part of 'data_bloc.dart';

@immutable
abstract class DataState {}

// Initial state when the bloc is created
class DataInitial extends DataState {}

// State when data is being loaded
class DataLoading extends DataState {}

// State when data is successfully loaded
class DataLoaded extends DataState {
  final String randomString;

  DataLoaded(this.randomString);
}

// State when an error occurs
class DataError extends DataState {
  final String message;

  DataError(this.message);
}
