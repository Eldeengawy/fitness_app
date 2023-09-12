import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/modules/authentication/controller/login_cubit/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // Define a registration function using Firebase Authentication
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (kDebugMode) {
          print(value.user?.email);
          print(value.user?.uid);
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        emit(LoginErrorState(errMessage: 'Login failed: $error'));
      });
    } catch (error) {
      emit(LoginErrorState(errMessage: 'Login failed: $error'));
    }
  }
}
