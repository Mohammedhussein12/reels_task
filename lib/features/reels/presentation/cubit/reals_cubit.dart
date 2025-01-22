import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reels_task/features/reels/domain/use_cases/get_reels_use_case.dart';
import 'package:reels_task/features/reels/presentation/cubit/reals_state.dart';

@injectable
class ReelsCubit extends Cubit<ReelsState> {
  final GetReelsUseCase _getReelsUseCase;

  ReelsCubit(this._getReelsUseCase) : super(ReelsInitialState());

  Future<void> getReels() async {
    emit(ReelsLoadingState());
    final result = await _getReelsUseCase();
    result.fold(
      (failure) => emit(ReelsErrorState(message: failure.message)),
      (reels) => emit(ReelsSuccessState(reels: reels)),
    );
  }
}
