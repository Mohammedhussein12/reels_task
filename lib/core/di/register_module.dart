import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reels_task/core/constants.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
    return dio;
  }
}