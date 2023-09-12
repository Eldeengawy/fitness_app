import 'package:fitness_app/core/extensions/sized_box.dart';
import 'package:fitness_app/modules/home/controller/home_cubit/home_cubit.dart';
import 'package:fitness_app/modules/home/controller/home_cubit/home_state.dart';
import 'package:fitness_app/modules/home/widgets/custom_exercise_widget.dart';
import 'package:fitness_app/modules/home/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (BuildContext context) => HomeCubit()..fetchExercises(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (BuildContext context, HomeStates state) {},
          builder: (BuildContext context, HomeStates state) {
            if (state is HomeLoading) {
              // Display a CircularProgressIndicator while loading
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        20.ph,
                        const CustomSearchWidget(),
                        Expanded(child: LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 948) {
                              // Display GridView when screen width is greater than the threshold
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      2, // Set the number of columns
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: state.exercises!.length,
                                itemBuilder: (context, index) =>
                                    CustomExerciseWidget(
                                        exercise: state.exercises![index]),
                              );
                            } else {
                              // Display ListView when screen width is smaller than the threshold
                              return ListView.builder(
                                itemCount: state.exercises!.length,
                                itemBuilder: (context, index) =>
                                    CustomExerciseWidget(
                                        exercise: state.exercises![index]),
                              );
                            }
                          },
                        )),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${state.errorMessage}'),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
