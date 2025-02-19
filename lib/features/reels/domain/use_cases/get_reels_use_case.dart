import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/reel_item_entity.dart';
import '../repositories/reel_repository.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
class GetReelsUseCase {
  final ReelRepository _reelRepository;

  GetReelsUseCase(this._reelRepository);

  Future<Either<Failure, List<ReelItemEntity>>> call() async =>
      await _reelRepository.getReels();
}
