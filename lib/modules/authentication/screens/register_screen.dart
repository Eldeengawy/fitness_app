import 'package:fitness_app/core/extensions/sized_box.dart';
import 'package:fitness_app/core/widgets/conditional_button.dart';
import 'package:fitness_app/core/widgets/custom_text_form_field.dart';
import 'package:fitness_app/modules/authentication/controller/register_cubit/register_cubit.dart';
import 'package:fitness_app/modules/authentication/controller/register_cubit/register_state.dart';
import 'package:fitness_app/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, RegisterStates state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        builder: (BuildContext context, RegisterStates state) => Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: RegisterCubit.get(context).formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    controller: RegisterCubit.get(context).fullNameController,
                    prefix: Icons.person,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    hint: 'Full Name',
                  ),
                  20.ph, // Use, ScreenUtil for SizedBox
                  CustomTextFormField(
                    controller: RegisterCubit.get(context).emailController,
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    hint: 'Email',
                  ),
                  20.ph, // Use ScreenUtil for SizedBox
                  CustomTextFormField(
                    controller: RegisterCubit.get(context).passwordController,
                    isPassword: true,
                    prefix: Icons.lock,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid password';
                      }
                      return null;
                    },
                    hint: 'Password',
                  ),
                  20.ph,
                  ConditionalButton(
                    condition: state is! RegisterLoadingState,
                    onPressed: () {
                      if (RegisterCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        RegisterCubit.get(context).register(
                          fullName: RegisterCubit.get(context)
                              .fullNameController
                              .text,
                          email:
                              RegisterCubit.get(context).emailController.text,
                          password: RegisterCubit.get(context)
                              .passwordController
                              .text,
                        );
                      }
                    },
                    buttonText: 'Register',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
