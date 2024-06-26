part of 'regestration_cubit.dart';

sealed class RegestragionState {}

class RegestragionInitial extends RegestragionState {}

class RegestragionLoading extends RegestragionState {}

class RegestragionSuccess extends RegestragionState {}

class RegistragionFailure extends RegestragionState {
  String errMsg;
  RegistragionFailure({
    required this.errMsg,
  });
}
