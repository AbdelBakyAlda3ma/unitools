import 'package:flutter/material.dart';
import 'package:unitools/core/common/widgets/custom_text_button.dart';
import 'package:unitools/views/sign_up_screen.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      note: 'Don’t have an account?',
      text: 'Sign Up',
      onPressed: () {
        Navigator.pushNamed(context, SignUpScreen.routeName);
      },
    );
  }
}
