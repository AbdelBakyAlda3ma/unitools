import 'package:flutter/material.dart';
import 'package:unitools/core/common/widgets/custom_text_button.dart';

class TermsAndConditionsCheck extends StatefulWidget {
  const TermsAndConditionsCheck({super.key});

  @override
  State<TermsAndConditionsCheck> createState() =>
      _TermsAndConditionsCheckState();
}

class _TermsAndConditionsCheckState extends State<TermsAndConditionsCheck> {
  bool? checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: const BorderSide(),
          activeColor: Colors.blue[900],
          value: checked,
          onChanged: (value) {
            setState(
              () {
                checked = value;
              },
            );
          },
        ),
        const CustomTextButton(
          fontSize: 11,
          note: 'I agree to the UNICEF',
          text: 'Terms and conditions',
        ),
      ],
    );
  }
}
