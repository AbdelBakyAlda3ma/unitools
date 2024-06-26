import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/core/common/api_services.dart';
import 'package:unitools/core/common/storage.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/core/errors.dart';
import 'package:unitools/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  String? email;
  String? password;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      Response response = await ApiService.post(
        path: "/api/Authentication/LogIn",
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        AppSharedPreferences.setString(
            key: accessToken, value: response.data['data']['accessToken']);
        User user = User.fromMap(response.data['data']);
        AppSharedPreferences.setString(
          key: "User",
          value: user.toJson(),
        );
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(
            errMsg: response.data['message'] ??
                'Some thing went wrong ,Please try again later!'));
      }
    } on DioException catch (e) {
      emit(
        LoginFailure(
          errMsg: errorMsg(e),
        ),
      );
    } catch (e) {
      emit(
        LoginFailure(
          errMsg: 'Some thing went wrong ,Please try again later!',
        ),
      );
    }
  }
}
