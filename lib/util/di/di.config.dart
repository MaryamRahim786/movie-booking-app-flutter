// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/watch_movies/data/source/remote/get_movies_remote_datasource.dart'
    as _i527;
import '../../features/watch_movies/data/source/remote/get_movies_remote_datasource_imp.dart'
    as _i541;
import '../../features/watch_movies/domain/repository/movies_repository.dart'
    as _i877;
import '../../features/watch_movies/domain/repository/movies_repository_imp.dart'
    as _i1064;
import '../../features/watch_movies/domain/usecase/get_movie_details.dart'
    as _i755;
import '../../features/watch_movies/domain/usecase/get_movie_trailer_videos.dart'
    as _i544;
import '../../features/watch_movies/domain/usecase/get_movies.dart' as _i589;
import '../../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i336;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i73;
import 'di.dart' as _i913;

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
    gh.lazySingleton<_i974.Logger>(() => _i913.LoggerImp());
    gh.lazySingleton<_i73.NetworkCallHelper>(
        () => _i336.HttpNetworkCallHelperImpl(logger: gh<_i974.Logger>()));
    gh.lazySingleton<_i527.MoviesRemoteDataSource>(
        () => _i541.MoviesRemoteDataSourceImp(
              logger: gh<_i974.Logger>(),
              networkCallHelper: gh<_i73.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i877.MoviesRepository>(() => _i1064.MoviesRepositoryImp(
        MoviesRemoteDataSource: gh<_i527.MoviesRemoteDataSource>()));
    gh.lazySingleton<_i589.GetMoviesUsecase>(() => _i589.GetMoviesUsecase(
        notificationsRepository: gh<_i877.MoviesRepository>()));
    gh.lazySingleton<_i544.GetMovieTrailerVideosUsecase>(() =>
        _i544.GetMovieTrailerVideosUsecase(
            notificationsRepository: gh<_i877.MoviesRepository>()));
    gh.lazySingleton<_i755.GetMovieDetailsUsecase>(() =>
        _i755.GetMovieDetailsUsecase(
            notificationsRepository: gh<_i877.MoviesRepository>()));
    return this;
  }
}
