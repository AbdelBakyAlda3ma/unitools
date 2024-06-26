import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function(String)? onChanged;

  const AuthTextField({
    super.key,
    required this.focusNode,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        prefixIcon: Icon(prefixIcon),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
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
      borderSide: BorderSide(
        color: AppColors.mainColorBlack,
      ),
    );
  }
}
