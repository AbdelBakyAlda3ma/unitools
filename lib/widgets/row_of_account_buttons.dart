import 'package:flutter/material.dart';
import 'package:unitools/core/common/app_images.dart';
import 'package:unitools/widgets/accout_button.dart';

class RowOfAccoutsButtons extends StatelessWidget {
  const RowOfAccoutsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AccountButton(
          image: AppImages.facebookLogo,
        ),
        AccountButton(
          image: AppImages.googleLogo,
        ),
        AccountButton(
          image: AppImages.appleLogo,
        ),
        AccountButton(
          image: AppImages.twitterLogo,
        ),
      ],
    );
  }
}
