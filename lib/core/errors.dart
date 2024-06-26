import 'package:dio/dio.dart';

String errorMsg(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout with api server';
    case DioExceptionType.sendTimeout:
      return 'Send timeout with ApiServer';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout with ApiServer';
    case DioExceptionType.badCertificate:
      return 'badCertificate with api server';
    case DioExceptionType.cancel:
      return 'Request to ApiServer was canceld';
    case DioExceptionType.connectionError:
      return 'No Internet Connection';
    case DioExceptionType.unknown:
      return 'Opps There was an Error, Please try again';
    case DioExceptionType.badResponse:
      return e.response?.data['message'] ?? 'bad response error!';

    default:
      return 'There was an error , please try again';
  }
}
