import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constants.dart';
import '../../error/exceptions.dart';
import 'api_consumer.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }

  @override
  Future get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw RemoteException('DioError: ${e.message}');
    } catch (e) {
      throw RemoteException('Unexpected error: $e');
    }
  }
}