part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

// Event to trigger data fetching
class FetchDataEvent extends DataEvent {}
