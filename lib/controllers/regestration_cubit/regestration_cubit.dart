import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/core/common/api_services.dart';
import 'package:unitools/core/common/storage.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/core/errors.dart';
part 'regestration_state.dart';

class RegestragionCubit extends Cubit<RegestragionState> {
  RegestragionCubit() : super(RegestragionInitial());
  static RegestragionCubit get(context) => BlocProvider.of(context);
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? university;

  Future<void> regester({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String uinversity,
  }) async {
    emit(RegestragionLoading());

    try {
      Response response = await ApiService.post(
        path: "/api/User/Registration",
        body: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "university": uinversity,
        },
      );
      if (response.statusCode == 200) {
        AppSharedPreferences.setString(
          key: accessToken,
          value: response.data['data']['accessToken'],
        );
        emit(RegestragionSuccess());
      } else {
        emit(
          RegistragionFailure(
            errMsg: response.data['message'] ??
                'Some thing went wrong ,Please try again later!',
          ),
        );
      }
    } on DioException catch (e) {
      emit(
        RegistragionFailure(
          errMsg: errorMsg(e),
        ),
      );
    } catch (e) {
      emit(
        RegistragionFailure(
          errMsg: 'Some thing went wrong ,Please try again later!',
        ),
      );
    }
  }
}
