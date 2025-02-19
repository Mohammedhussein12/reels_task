import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_task/features/reels/domain/use_cases/get_reels_use_case.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_states.dart';

class ReelsProvider extends StateNotifier<ReelsStates> {
  final GetReelsUseCase _getReelsUseCase;

  ReelsProvider(this._getReelsUseCase) : super(ReelsInitialState());

  Future<void> getReels() async {
    state = ReelsLoadingState();
    final result = await _getReelsUseCase();
    result.fold(
          (failure) {
        state = ReelsErrorState(message: failure.message);
        print('Error: ${failure.message}');
      },
          (reels) {
        state = ReelsSuccessState(reels: reels);
        print('Reels fetched successfully');
      },
    );
  }
}