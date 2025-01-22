import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ReelRepository {
  Future<Either<Failure, List<ReelItemEntity>>> getReels();
}