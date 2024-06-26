import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:unitools/controllers/email_verification_cubit/email_verification_cubit.dart';

class VerificationPin extends StatefulWidget {
  const VerificationPin({super.key});

  @override
  State<VerificationPin> createState() => _VerificationPinState();
}

class _VerificationPinState extends State<VerificationPin> {
  final defaultPinTheme = PinTheme(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromARGB(30, 195, 180, 180).withOpacity(.12),
      border: Border.all(style: BorderStyle.none),
    ),
    width: 56,
    height: 56,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (value) {
          EmailVerificationCubit.get(context).code = value;
        },
      ),
    );
  }
}
