import 'package:fitness_app/core/extensions/sized_box.dart';
import 'package:fitness_app/core/utils/colors.dart';
import 'package:fitness_app/modules/home/controller/exercise_cubit/exersise_cubit.dart';
import 'package:fitness_app/modules/home/controller/exercise_cubit/exersise_state.dart';
import 'package:fitness_app/modules/home/models/exercises_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExerciseWidget extends StatelessWidget {
  const CustomExerciseWidget({Key? key, required this.exercise})
      : super(key: key);
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseCubit(),
      child: BlocBuilder<ExerciseCubit, ExerciseStates>(
        builder: (context, state) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: state is ExerciseInitial
                  ? PausedWidget(exercise: exercise)
                  : PlayedWidget(exercise: exercise));
        },
      ),
    );
  }
}

class PausedWidget extends StatelessWidget {
  const PausedWidget({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseStates>(
      builder: (context, state) {
        return Column(
          children: [
            20.0.ph,
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Stack(
                children: [
                  Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(exercise.thumbnail ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                          Colors.black
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0.h,
                    left: 20.0.w,
                    child: Text(
                      exercise.title ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20.0.h,
                      right: 20.0.w,
                      child: Column(
                        children: [
                          FloatingActionButton(
                              backgroundColor: Colors.white.withOpacity(0.3),
                              mini: true,
                              onPressed: () {},
                              child: Text(exercise.seconds ?? '')),
                          5.ph,
                          FloatingActionButton(
                            onPressed: () {
                              ExerciseCubit.get(context).toggleExerciseState();
                            },
                            child: const Icon(
                              FeatherIcons.play,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            20.0.ph,
          ],
        );
      },
    );
  }
}

class PlayedWidget extends StatelessWidget {
  const PlayedWidget({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseStates>(
      builder: (context, state) {
        return Column(
          children: [
            20.0.ph,
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 250.h,
                    child: Image(
                      image: NetworkImage(exercise.gif!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 250.h,
                    decoration: const BoxDecoration(),
                  ),
                  Positioned(
                      bottom: 20.0.h,
                      right: 20.0.w,
                      child: Column(
                        children: [
                          FloatingActionButton(
                              backgroundColor: Colors.black.withOpacity(0.6),
                              mini: true,
                              onPressed: () {},
                              child: Text(exercise.seconds ?? '')),
                          5.ph,
                          FloatingActionButton(
                            backgroundColor: AppColors.black,
                            onPressed: () {
                              ExerciseCubit.get(context).toggleExerciseState();
                            },
                            child: const Icon(
                              FeatherIcons.pause,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            20.0.ph,
          ],
        );
      },
    );
  }
}
