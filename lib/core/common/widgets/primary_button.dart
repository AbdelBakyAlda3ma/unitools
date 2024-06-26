import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.child,
    this.borderRadius = 6,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        disabledBackgroundColor: const Color(0xff8E8E8E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
