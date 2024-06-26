import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/core/common/api_services.dart';
import 'package:unitools/core/common/storage.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/core/errors.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());
  static EmailVerificationCubit get(context) => BlocProvider.of(context);
  String? code;

  Future<void> verifiy({
    required String code,
  }) async {
    emit(EmailVerificationLoading());

    try {
      Response response = await ApiService.get(
        path: "/api/Authentication/ConfirmEmail?Code=$code",
        token: AppSharedPreferences.getString(key: accessToken),
      );
      if (response.statusCode == 200) {
        emit(EmailVerificationSuccess());
      } else {
        emit(EmailVerificationFailure(
            errMsg: response.data?['message'] ??
                'Some thing went wrong ,Please try again later!'));
      }
    } on DioException catch (e) {
      emit(
        EmailVerificationFailure(
          errMsg: errorMsg(e),
        ),
      );
    } catch (e) {
      emit(
        EmailVerificationFailure(
          errMsg: 'Some thing went wrong ,Please try again later!',
        ),
      );
    }
  }
}
