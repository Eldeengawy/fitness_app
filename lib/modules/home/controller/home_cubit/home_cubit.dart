import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_app/modules/home/controller/home_cubit/home_state.dart';
import 'package:fitness_app/modules/home/models/exercises_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Exercise> allExercises = [];

  final Dio _dio = Dio();

  Future<void> fetchExercises() async {
    emit(HomeLoading());

    try {
      final response = await _dio.get(
          'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.data)['exercises'];
        final exercises =
            jsonData.map((json) => Exercise.fromJson(json)).toList();
        allExercises = jsonData.map((json) => Exercise.fromJson(json)).toList();
        emit(HomeLoaded(exercises));
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(HomeError('Error: $e'));
    }
  }

  // Function to search exercises based on a query
  void searchExercises(String query) {
    if (query.isEmpty) {
      emit(HomeLoaded(allExercises));
    } else {
      // Filter exercises based on the query
      final filteredExercises = allExercises.where((exercise) {
        return exercise.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(HomeLoaded(filteredExercises));
    }
  }
}
