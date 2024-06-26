import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/controllers/login_cubit/login_cubit.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_images.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/widgets/vertical_space.dart';
import 'package:unitools/widgets/auth_text_field.dart';
import 'package:unitools/widgets/background_shape_painter.dart';
import 'package:unitools/widgets/centered_text_within_divider.dart';
import 'package:unitools/widgets/forgot_password_button_text_button.dart';
import 'package:unitools/widgets/row_of_account_buttons.dart';
import 'package:unitools/widgets/sign_in_elevated_button.dart';
import 'package:unitools/widgets/sign_up_text_button.dart';

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({super.key});

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoginCubit.get(context).login(
        email: LoginCubit.get(context).email!,
        password: LoginCubit.get(context).password!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomPaint(
          painter: BackgroundShapePainter(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                onChanged: () => setState(() {
                  _enableBtn = _formKey.currentState!.validate();
                }),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.mainColorBlack,
                      ),
                    ),
                    SvgPicture.asset(
                      AppImages.welcomingImage,
                    ),
                    const VerticalSpace(
                      space: 30,
                    ),
                    AuthTextField(
                      focusNode: nameFocusNode,
                      hintText: 'email',
                      prefixIcon: Icons.account_circle_outlined,
                      onChanged: (value) {
                        LoginCubit.get(context).email = value;
                      },
                    ),
                    const VerticalSpace(
                      space: 20,
                    ),
                    AuthTextField(
                      focusNode: passwordFocusNode,
                      hintText: 'password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: Icons.visibility_off,
                      onChanged: (value) {
                        LoginCubit.get(context).password = value;
                      },
                    ),
                    const ForgotPasswordTextButton(),
                    SignInElevatedButton(
                      onPressed: _enableBtn
                          ? () {
                              _submitForm(context);
                            }
                          : null,
                    ),
                    const CenteredTextWithinDivider(text: 'Sign In With'),
                    const RowOfAccoutsButtons(),
                    const SignUpTextButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
