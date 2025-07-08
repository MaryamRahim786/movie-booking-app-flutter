////********** START IMPORTS **********////

import 'package:movies_booking_app/features/watch_movies/data/source/remote/get_movies_remote_datasource.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_details.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_trailer_videos.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movies.dart';

import 'movies_repository.dart';
import 'package:injectable/injectable.dart';

////********** END IMPORTS **********////

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImp implements MoviesRepository {
////********** START VARIABLES **********////
  final MoviesRemoteDataSource _MoviesRemoteDataSource;
////********** END VARIABLES **********////

MoviesRepositoryImp({
////********** START RECEIVE VALUES **********////
    required MoviesRemoteDataSource MoviesRemoteDataSource,
////********** END RECEIVE VALUES **********////
  })  :
////********** START SET VALUES **********////
        _MoviesRemoteDataSource = MoviesRemoteDataSource
////********** END SET VALUES **********////
  ;
    
////********** START METHODS **********////
  /// [GetMoviesUsecaseInput] is received to [getMovies] method as parameter
  /// [GetMoviesUsecaseOutput] is returned from [getMovies] method
  @override
  Future<GetMoviesUsecaseOutput> getMovies(GetMoviesUsecaseInput input) async {
    return _MoviesRemoteDataSource.getMovies(input);
  }

  /// [GetMovieDetailsUsecaseInput] is received to [getMovieDetails] method as parameter
  /// [GetMovieDetailsUsecaseOutput] is returned from [getMovieDetails] method
  @override
  Future<GetMovieDetailsUsecaseOutput> getMovieDetails(GetMovieDetailsUsecaseInput input) {
    // TODO: implement getMovieDetails
    return _MoviesRemoteDataSource.getMoviesDetails(input);
  }


  /// [GetMovieTrailerVideosUsecaseInput] is received to [getMovieTrailerVideos] method as parameter
  /// [GetMovieTrailerVideosUsecaseOutput] is returned from [getMovieTrailerVideos] method
  @override
  Future<GetMovieTrailerVideosUsecaseOutput> getMovieTrailerVideos(GetMovieTrailerVideosUsecaseInput input) {
    // TODO: implement getMovieTrailerVideos
    return _MoviesRemoteDataSource.getMovieTrailerVideos(input);  }
////********** END METHODS **********////
}
  