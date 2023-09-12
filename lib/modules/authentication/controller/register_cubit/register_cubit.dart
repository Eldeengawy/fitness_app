import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/modules/authentication/controller/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // Define a registration function using Firebase Authentication
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    // Emit the loading state to indicate the registration process has started
    emit(RegisterLoadingState());

    try {
      // Use Firebase Authentication to create a user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful registration, you can update the user's display name
      await userCredential.user!.updateDisplayName(fullName);

      print(userCredential.user?.email);
      print(userCredential.user?.uid);

      // Emit the success state when registration is successful
      emit(RegisterSuccessState());
    } catch (error) {
      // Handle registration errors here
      // You can customize this part based on your error handling logic
      emit(RegisterErrorState(errMessage: 'Registration failed: $error'));
    }
  }
}
