import 'package:fitness_app/modules/home/controller/exercise_cubit/exersise_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseCubit extends Cubit<ExerciseStates> {
  ExerciseCubit() : super(ExerciseInitial());
  static ExerciseCubit get(context) => BlocProvider.of(context);

  void toggleExerciseState() {
    if (state is ExerciseInitial) {
      emit(ExercisePlaying());
    } else {
      emit(ExerciseInitial());
    }
  }
}
