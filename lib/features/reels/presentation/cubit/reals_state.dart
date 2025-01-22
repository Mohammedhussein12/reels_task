import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';

abstract class ReelsState {}

class ReelsInitialState extends ReelsState {}

class ReelsLoadingState extends ReelsState {}

class ReelsSuccessState extends ReelsState {
  final List<ReelItemEntity> reels;

  ReelsSuccessState({required this.reels});
}

class ReelsErrorState extends ReelsState {
  final String message;

  ReelsErrorState({required this.message});
}

