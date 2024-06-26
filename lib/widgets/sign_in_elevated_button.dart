import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unitools/controllers/login_cubit/login_cubit.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/widgets/primary_button.dart';
import 'package:unitools/views/home_page_view.dart';

class SignInElevatedButton extends StatelessWidget {
  const SignInElevatedButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212,
      child: PrimaryButton(
        borderRadius: 16,
        onPressed: onPressed,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(
                context,
                HomePage.routeName,
              );
            } else if (state is LoginFailure) {
              Fluttertoast.showToast(
                msg: state.errMsg,
                fontSize: 16,
                backgroundColor: Colors.black38,
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const SizedBox(
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return Text(
                'Sign in',
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.mainColorWhite,
                  fontSize: 14,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
