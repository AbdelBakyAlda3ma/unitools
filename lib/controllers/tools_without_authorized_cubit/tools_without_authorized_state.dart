part of 'tools_without_authorized_cubit.dart';

sealed class ToolsWithoutAuthorizedState {}

class ToolsWithoutAuthorizedInitial extends ToolsWithoutAuthorizedState {}

class ToolsWithoutAuthorizedLoading extends ToolsWithoutAuthorizedState {}

class ToolsWithoutAuthorizedSuccess extends ToolsWithoutAuthorizedState {
  List<ToolModel> tools;
  ToolsWithoutAuthorizedSuccess({
    required this.tools,
  });
}

class ToolsWithoutAuthorizedFailure extends ToolsWithoutAuthorizedState {
  String errMsg;
  ToolsWithoutAuthorizedFailure({
    required this.errMsg,
  });
}

class ToolsWithoutAuthorizedFromPaginationLoading
    extends ToolsWithoutAuthorizedState {}

class ToolsWithoutAuthorizedFromPaginationFailed
    extends ToolsWithoutAuthorizedState {}
