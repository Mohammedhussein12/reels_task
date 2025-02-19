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

import '../../features/reels/data/data_sources/remote/reels_api_remote_data_source.dart'
    as _i193;
import '../../features/reels/data/data_sources/remote/reels_remote_data_source.dart'
    as _i298;
import '../../features/reels/data/repositories/reel_repository_impl.dart'
    as _i199;
import '../../features/reels/domain/repositories/reel_repository.dart' as _i262;
import '../../features/reels/domain/use_cases/get_reels_use_case.dart' as _i333;
import '../../features/reels/presentation/providers/reels_notifier.dart'
    as _i1006;
import '../data/remote/api_consumer.dart' as _i315;
import '../data/remote/dio_consumer.dart' as _i338;
import 'register_module.dart' as _i291;

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
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i315.ApiConsumer>(
        () => _i338.DioConsumer(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i298.ReelsRemoteDataSource>(
        () => _i193.ReelsApiRemoteDataSource(gh<_i315.ApiConsumer>()));
    gh.lazySingleton<_i262.ReelRepository>(
        () => _i199.ReelRepositoryImpl(gh<_i298.ReelsRemoteDataSource>()));
    gh.lazySingleton<_i333.GetReelsUseCase>(
        () => _i333.GetReelsUseCase(gh<_i262.ReelRepository>()));
    gh.factory<_i1006.ReelsProvider>(
        () => _i1006.ReelsProvider(gh<_i333.GetReelsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
