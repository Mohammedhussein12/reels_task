import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_task/core/di/service_locator.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_notifier.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_states.dart';

final reelsNotifierProvider =
    StateNotifierProvider<ReelsProvider, ReelsStates>((ref) {
  return serviceLocator.get<ReelsProvider>();
});
