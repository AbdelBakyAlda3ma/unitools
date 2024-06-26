import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_images.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/strings.dart';
import 'package:unitools/core/common/widgets/vertical_space.dart';
import 'package:unitools/widgets/auth_text_field.dart';
import 'package:unitools/widgets/submit_elevated_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(
                space: 64,
              ),
              SvgPicture.asset(
                AppImages.forgotPasswordImage,
              ),
              const VerticalSpace(
                space: 14,
              ),
              const SizedBox(
                width: 130,
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.h2,
                ),
              ),
              Text(
                kForgotPasswordText,
                style: AppTextStyles.body2.copyWith(
                  fontSize: 12,
                ),
              ),
              const VerticalSpace(
                space: 50,
              ),
              AuthTextField(
                focusNode: emailFocusNode,
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              ),
              const VerticalSpace(
                space: 20,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SubmitElevatedButton(
                  child: Text(
                    'Submit',
                    style: AppTextStyles.h1.copyWith(
                      color: AppColors.mainColorWhite,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const VerticalSpace(
                space: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
