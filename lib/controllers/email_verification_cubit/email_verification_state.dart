part of 'email_verification_cubit.dart';

sealed class EmailVerificationState {}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {}

class EmailVerificationFailure extends EmailVerificationState {
  String errMsg;
  EmailVerificationFailure({
    required this.errMsg,
  });
}
