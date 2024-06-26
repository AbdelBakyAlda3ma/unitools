import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/core/common/app_images.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/strings.dart';
import 'package:unitools/core/common/widgets/vertical_space.dart';
import 'package:unitools/widgets/submit_auth_btn.dart';
import 'package:unitools/widgets/verification_pin.dart';

class AuthVerificationScreenBody extends StatelessWidget {
  const AuthVerificationScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const VerticalSpace(
                  space: 64,
                ),
                SvgPicture.asset(
                  AppImages.authVerificationIamge,
                ),
                const VerticalSpace(
                  space: 14,
                ),
                const Text(
                  'Authy Verification',
                  style: AppTextStyles.h2,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    kAuthVerificationText,
                    style: AppTextStyles.body2.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
                const VerticalSpace(
                  space: 30,
                ),
                const VerificationPin(),
                const VerticalSpace(
                  space: 20,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SubmitAuthBtn(),
                ),
                const VerticalSpace(
                  space: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
