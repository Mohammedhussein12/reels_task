import 'package:reels_task/features/reels/domain/entities/reel_item_entity.dart';

abstract class ReelsStates {}

class ReelsInitialState extends ReelsStates {}

class ReelsLoadingState extends ReelsStates {}

class ReelsSuccessState extends ReelsStates {
  final List<ReelItemEntity> reels;

  ReelsSuccessState({required this.reels});
}

class ReelsErrorState extends ReelsStates {
  final String message;

  ReelsErrorState({required this.message});
}

