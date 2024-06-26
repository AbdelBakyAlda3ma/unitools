import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/controllers/email_verification_cubit/email_verification_cubit.dart';
import 'package:unitools/widgets/auth_verification_screen_body.dart';

class AuthVerificationScreen extends StatefulWidget {
  static String routeName = '/AuthVerificationScreen';

  const AuthVerificationScreen({super.key});

  @override
  State<AuthVerificationScreen> createState() => _AuthVerificationScreenState();
}

class _AuthVerificationScreenState extends State<AuthVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationCubit>(
      create: (context) => EmailVerificationCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: AuthVerificationScreenBody(),
        ),
      ),
    );
  }
}
