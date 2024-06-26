import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://unitoolproject.runasp.net",
    ),
  );

  ApiService();

  static Future<dynamic> get({
    required String path,
    dynamic body,
    String? token,
  }) async {
    var response = await _dio.get(
      path,
      data: body,
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
        },
      ),
    );
    return response;
  }

  static Future<dynamic> post({
    required String path,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    FormData formData = FormData.fromMap(body);
    var response = await _dio.post(
      path,
      data: formData,
      options: Options(
        headers: {
          'accept': '*/*',
          'Content-Type': 'multipart/form-data',
          HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
        },
      ),
    );
    return response;
  }
}
