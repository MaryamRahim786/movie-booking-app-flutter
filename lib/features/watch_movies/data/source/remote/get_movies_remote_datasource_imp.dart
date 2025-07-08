////********** START IMPORTS **********////
library;

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:movies_booking_app/features/watch_movies/data/source/remote/get_movies_remote_datasource.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_details.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_trailer_videos.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movies.dart';
import 'package:movies_booking_app/helpers/network_call_helper/network_call_helper.dart';
import 'package:movies_booking_app/util/consts/api.dart';
import 'package:movies_booking_app/util/exceptions/message_exception.dart';
////********** END IMPORTS **********////

@LazySingleton(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImp implements MoviesRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  MoviesRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

////********** START METHODS **********////
  @override
  Future<GetMoviesUsecaseOutput> getMovies(GetMoviesUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.movies,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      // Parse the response data
      final results = response['results'] as List<dynamic>;
      final movies =
          results.map((movieJson) => Movie.fromJson(movieJson)).toList();

      return GetMoviesUsecaseOutput(movies: movies);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("Something went wrong at getMovies: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetMovieDetailsUsecaseInput] is received to [getMovieDetails] method as parameter
  /// [GetMovieDetailsUsecaseOutput] is returned from [getMovieDetails] method
  @override
  Future<GetMovieDetailsUsecaseOutput> getMoviesDetails(
      GetMovieDetailsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.movieDetails(input.movieId),
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      // Parse the response data
      final movie = MovieDetailsModel.fromJson(response);

      return GetMovieDetailsUsecaseOutput(movie: movie);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("Something went wrong at getMoviesDetails: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetMovieTrailerVideosUsecaseInput] is received to [getMovieTrailerVideos] method as parameter
  /// [GetMovieTrailerVideosUsecaseOutput] is returned from [getMovieTrailerVideos] method
  @override
  Future<GetMovieTrailerVideosUsecaseOutput> getMovieTrailerVideos(
      GetMovieTrailerVideosUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        "${Apis.movieDetails(input.movieId)}/videos",
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      // Parse the response data
      final movie = MovieTrailerVideosModel.fromJson(response);

      return GetMovieTrailerVideosUsecaseOutput(movieTrailerVideos: movie);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("Something went wrong at getMovieTrailerVideos: $e");
      throw SomethingWentWrongException();
    }
  }
////********** END METHODS **********////
}
