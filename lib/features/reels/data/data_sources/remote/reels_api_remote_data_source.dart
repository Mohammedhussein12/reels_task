import 'package:reels_task/features/reels/data/data_sources/remote/reels_remote_data_source.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/data/remote/api_consumer.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/reel_response_model.dart';

class ReelsApiRemoteDataSource implements ReelsRemoteDataSource {
  final ApiConsumer dio;

  const ReelsApiRemoteDataSource(this.dio);

  @override
  Future<ReelResponseModel> getReels() async {
    try {
      final response = await dio.get(ApiConstants.reelsEndPoint);
      print('API Response: $response');
      final json = response;
      return ReelResponseModel.fromJson(json);
    } catch (exception) {
      print('Exception: $exception');
      throw RemoteException('Failed to get Reels: $exception');
    }
  }
}