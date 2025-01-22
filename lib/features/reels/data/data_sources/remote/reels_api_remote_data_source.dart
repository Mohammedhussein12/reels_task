import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reels_task/core/constants.dart';
import 'package:reels_task/features/reels/data/data_sources/remote/reels_remote_data_source.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/reel_response_model.dart';

@LazySingleton(as: ReelsRemoteDataSource)
class ReelsApiRemoteDataSource implements ReelsRemoteDataSource {
  final Dio _dio;

  const ReelsApiRemoteDataSource(this._dio);

  @override
  Future<ReelResponseModel> getReels() async {
    try {
      final response = await _dio.get(ApiConstants.reelsEndPoint);
      final json = await response.data;
      return ReelResponseModel.fromJson(json);
    } catch (exception) {
      throw const RemoteException('Failed to get Reels');
    }
  }

}