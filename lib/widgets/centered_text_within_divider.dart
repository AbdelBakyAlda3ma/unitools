import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_text_styles.dart';

class CenteredTextWithinDivider extends StatelessWidget {
  final String text;
  const CenteredTextWithinDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            height: 0,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Text(
            text,
            style: AppTextStyles.body1.copyWith(
              color: AppColors.mainColorBlack,
              fontSize: 16,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            height: 0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
