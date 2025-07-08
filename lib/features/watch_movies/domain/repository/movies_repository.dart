////********** START IMPORTS **********////

import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_details.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_trailer_videos.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movies.dart';

import '../../../../infrastructure/repository.dart';
////********** END IMPORTS **********////

abstract class MoviesRepository extends Repository {
////********** START METHODS **********////
  /// [GetMoviesUsecaseInput] is received to [getMovies] method as parameter
  /// [GetMoviesUsecaseOutput] is returned from [getMovies] method
  Future<GetMoviesUsecaseOutput> getMovies(GetMoviesUsecaseInput input);

  /// [GetMovieDetailsUsecaseInput] is received to [getMovieDetails] method as parameter
  /// [GetMovieDetailsUsecaseOutput] is returned from [getMovieDetails] method
  Future<GetMovieDetailsUsecaseOutput> getMovieDetails(GetMovieDetailsUsecaseInput input);

  /// [GetMovieTrailerVideosUsecaseInput] is received to [getMovieTrailerVideos] method as parameter
  /// [GetMovieTrailerVideosUsecaseOutput] is returned from [getMovieTrailerVideos] method
  Future<GetMovieTrailerVideosUsecaseOutput> getMovieTrailerVideos(
      GetMovieTrailerVideosUsecaseInput input);

////********** END METHODS **********////
}
  