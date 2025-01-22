import 'package:reels_task/features/reels/data/models/reel_response_model.dart';

abstract class ReelsRemoteDataSource{
  Future<ReelResponseModel> getReels();
}