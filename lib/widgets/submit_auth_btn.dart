import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unitools/controllers/email_verification_cubit/email_verification_cubit.dart';
import 'package:unitools/core/common/app_colors.dart';
import 'package:unitools/core/common/app_text_styles.dart';
import 'package:unitools/views/home_page_view.dart';
import 'package:unitools/widgets/submit_elevated_button.dart';

class SubmitAuthBtn extends StatelessWidget {
  const SubmitAuthBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SubmitElevatedButton(
      child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
        listener: (context, state) {
          if (state is EmailVerificationSuccess) {
            Navigator.pushNamed(
              context,
              HomePage.routeName,
            );
          } else if (state is EmailVerificationFailure) {
            Fluttertoast.showToast(
              msg: state.errMsg,
              fontSize: 16,
              backgroundColor: Colors.black38,
            );
          }
        },
        builder: (context, state) {
          if (state is EmailVerificationLoading) {
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
      onPressed: () {
        EmailVerificationCubit.get(context)
            .verifiy(code: EmailVerificationCubit.get(context).code ?? '');
      },
    );
  }
}
