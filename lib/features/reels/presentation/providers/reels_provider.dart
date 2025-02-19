import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_task/core/data/remote/dio_consumer.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_notifier.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_states.dart';
import '../../data/data_sources/remote/reels_api_remote_data_source.dart';
import '../../data/data_sources/remote/reels_remote_data_source.dart';
import '../../data/repositories/reel_repository_impl.dart';
import '../../domain/repositories/reel_repository.dart';
import '../../domain/use_cases/get_reels_use_case.dart';

final reelsNotifierProvider =
    StateNotifierProvider<ReelsProvider, ReelsStates>((ref) {
  final getReelsUseCase = ref.watch(getReelsUseCaseProvider);
  return ReelsProvider(getReelsUseCase);
});

final getReelsUseCaseProvider = Provider<GetReelsUseCase>((ref) {
  final reelRepository = ref.watch(reelRepositoryProvider);
  return GetReelsUseCase(reelRepository);
});

final reelRepositoryProvider = Provider<ReelRepository>((ref) {
  final remoteDataSource = ref.watch(reelsRemoteDataSourceProvider);
  return ReelRepositoryImpl(remoteDataSource);
});

final reelsRemoteDataSourceProvider = Provider<ReelsRemoteDataSource>((ref) {
  final dio = DioConsumer(dio: Dio());
  return ReelsApiRemoteDataSource(dio);
});
