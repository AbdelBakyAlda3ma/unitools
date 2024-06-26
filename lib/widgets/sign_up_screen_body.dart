import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_images.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/widgets/horizontal_space.dart';
import 'package:unitools/core/common/widgets/vertical_space.dart';
import 'package:unitools/widgets/background_shape_painter.dart';
import 'package:unitools/widgets/centered_text_within_divider.dart';
import 'package:unitools/widgets/row_of_account_buttons.dart';
import 'package:unitools/widgets/sign_up_form.dart';
import 'package:unitools/widgets/termes_and_contdition_check.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomPaint(
          painter: BackgroundShapePainter(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            alignment: Alignment.center,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const VerticalSpace(
                        space: 80,
                      ),
                      Text(
                        'Create Account',
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.mainColorBlack,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const HorizontalSpace(
                            space: 40,
                          ),
                          SvgPicture.asset(
                            AppImages.createAccoutImage,
                          ),
                        ],
                      ),
                      const VerticalSpace(
                        space: 10,
                      ),
                      const SignUpForm(),
                      const TermsAndConditionsCheck(),
                      const CenteredTextWithinDivider(text: 'Sign Up With'),
                      const RowOfAccoutsButtons(),
                      const VerticalSpace(
                        space: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
