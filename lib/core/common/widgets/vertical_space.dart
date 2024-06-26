import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double? space;
  const VerticalSpace({super.key, this.space});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
