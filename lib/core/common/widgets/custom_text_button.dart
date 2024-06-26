import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String note;
  final String text;
  final double fontSize;
  final void Function()? onPressed;
  const CustomTextButton({
    super.key,
    required this.note,
    required this.text,
    this.fontSize = 12,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          note,
          style: TextStyle(fontSize: fontSize),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.h1.copyWith(
              color: Colors.blue[700],
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
