import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/controllers/regestration_cubit/regestration_cubit.dart';
import 'package:unitools/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/SignUpScreen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegestragionCubit>(
      create: (context) => RegestragionCubit(),
      child: const SignupScreenBody(),
    );
  }
}
