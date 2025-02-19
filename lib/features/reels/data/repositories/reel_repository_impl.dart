import 'package:injectable/injectable.dart';
import 'package:reels_task/features/reels/data/data_sources/remote/reels_remote_data_source.dart';
import 'package:reels_task/features/reels/data/mappers/reel_mappers.dart';
import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/reel_repository.dart';
import 'package:dartz/dartz.dart';

@LazySingleton(as: ReelRepository)
class ReelRepositoryImpl implements ReelRepository {
  final ReelsRemoteDataSource _remoteDataSource;
  const ReelRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ReelItemEntity>>> getReels() async {
    try {
      final response = await _remoteDataSource.getReels();
      return Right(response.data.map((reelDataModel) => reelDataModel.toEntity()).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }
}