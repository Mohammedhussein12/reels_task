// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:reels_task/core/di/register_module.dart' as _i741;
import 'package:reels_task/features/reels/data/data_sources/remote/reels_api_remote_data_source.dart'
    as _i172;
import 'package:reels_task/features/reels/data/data_sources/remote/reels_remote_data_source.dart'
    as _i496;
import 'package:reels_task/features/reels/data/repositories/reel_repository_impl.dart'
    as _i788;
import 'package:reels_task/features/reels/domain/repositories/reel_repository.dart'
    as _i646;
import 'package:reels_task/features/reels/domain/use_cases/get_reels_use_case.dart'
    as _i387;
import 'package:reels_task/features/reels/presentation/cubit/reals_cubit.dart'
    as _i669;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i496.ReelsRemoteDataSource>(
        () => _i172.ReelsApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i646.ReelRepository>(
        () => _i788.ReelRepositoryImpl(gh<_i496.ReelsRemoteDataSource>()));
    gh.lazySingleton<_i387.GetReelsUseCase>(
        () => _i387.GetReelsUseCase(gh<_i646.ReelRepository>()));
    gh.factory<_i669.ReelsCubit>(
        () => _i669.ReelsCubit(gh<_i387.GetReelsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i741.RegisterModule {}
