import 'package:reels_task/core/di/service_locator.dart';
import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';
import 'package:reels_task/features/reels/domain/use_cases/get_reels_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reels_notifier.g.dart';

@riverpod
class ReelsController extends _$ReelsController {
  final _getReelsUseCase = serviceLocator.get<GetReelsUseCase>();

  @override
  Future<List<ReelItemEntity>> build() async {
    return await getReels();
  }

  Future<List<ReelItemEntity>> getReels() async {
    state = const AsyncLoading();

    final result = await _getReelsUseCase();

    return result.fold(
          (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        return []; // Return an empty list in case of failure
      },
          (reels) {
        state = AsyncData(reels);
        return reels; // Return the correct type
      },
    );
  }
}
