import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/controllers/login_cubit/login_cubit.dart';
import 'package:unitools/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: const SigninScreenBody(),
    );
  }
}
