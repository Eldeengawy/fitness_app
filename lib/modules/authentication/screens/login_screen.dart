import 'package:fitness_app/core/extensions/sized_box.dart';
import 'package:fitness_app/core/utils/colors.dart';
import 'package:fitness_app/core/widgets/conditional_button.dart';
import 'package:fitness_app/core/widgets/custom_text_form_field.dart';
import 'package:fitness_app/modules/authentication/controller/login_cubit/login_cubit.dart';
import 'package:fitness_app/modules/authentication/controller/login_cubit/login_state.dart';
import 'package:fitness_app/modules/authentication/screens/register_screen.dart';
import 'package:fitness_app/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        builder: (BuildContext context, LoginStates state) => Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: LoginCubit.get(context).formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        controller: LoginCubit.get(context).emailController,
                        prefix: Icons.person,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        hint: 'Username',
                      ),
                      20.ph,
                      CustomTextFormField(
                        prefix: Icons.lock,
                        controller: LoginCubit.get(context).passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        validate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        hint: 'Password',
                      ),
                      20.ph,
                      ConditionalButton(
                        condition: state is! LoginLoadingState,
                        onPressed: () {
                          if (LoginCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).login(
                              email:
                                  LoginCubit.get(context).emailController.text,
                              password: LoginCubit.get(context)
                                  .passwordController
                                  .text,
                            );
                          }
                        },
                        buttonText: 'Login',
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: AppColors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(color: AppColors.buttonColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
