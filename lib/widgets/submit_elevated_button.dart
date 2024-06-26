import 'package:flutter/material.dart';
import 'package:unitools/core/common/widgets/primary_button.dart';

class SubmitElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const SubmitElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      child: PrimaryButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
