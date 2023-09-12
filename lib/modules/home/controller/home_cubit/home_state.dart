import 'package:fitness_app/modules/home/models/exercises_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeLoaded extends HomeStates {
  final List<Exercise>? exercises;

  HomeLoaded(this.exercises);
}

class HomeError extends HomeStates {
  final String errorMessage;

  HomeError(this.errorMessage);
}
