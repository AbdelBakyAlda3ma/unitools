import 'package:flutter/material.dart';
import 'package:unitools/core/common/widgets/custom_text_button.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomTextButton(
      note: 'Forgot Password?',
      text: 'Click Here',
    );
  }
}
