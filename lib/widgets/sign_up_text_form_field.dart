import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;

  const SignUpTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: const Color(0xffDEDEDE),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff888888),
          fontSize: 14,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide.none,
    );
  }
}
