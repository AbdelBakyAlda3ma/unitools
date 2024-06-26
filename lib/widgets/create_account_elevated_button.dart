import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unitools/controllers/regestration_cubit/regestration_cubit.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/core/common/widgets/primary_button.dart';
import 'package:unitools/views/auth_verification_screen.dart';

class CreateAccountElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  const CreateAccountElevatedButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: PrimaryButton(
        onPressed: onPressed,
        child: BlocConsumer<RegestragionCubit, RegestragionState>(
          listener: (context, state) {
            if (state is RegestragionSuccess) {
              Navigator.pushNamed(
                context,
                AuthVerificationScreen.routeName,
              );
            } else if (state is RegistragionFailure) {
              Fluttertoast.showToast(
                msg: state.errMsg,
                fontSize: 16,
                backgroundColor: Colors.black38,
              );
            }
          },
          builder: (context, state) {
            if (state is RegestragionLoading) {
              return const SizedBox(
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return Text(
                'Submit',
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
