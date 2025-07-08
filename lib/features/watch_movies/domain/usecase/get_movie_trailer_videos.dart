import 'package:injectable/injectable.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/repository/movies_repository.dart';
import 'package:movies_booking_app/infrastructure/usecase.dart';
import 'package:movies_booking_app/infrastructure/usecase_input.dart';
import 'package:movies_booking_app/infrastructure/usecase_output.dart';

class GetMovieTrailerVideosUsecaseInput extends Input {
  final String bearer;
  final String movieId;

  GetMovieTrailerVideosUsecaseInput({required this.bearer, required this.movieId});
}

class GetMovieTrailerVideosUsecaseOutput extends Output {
  final MovieTrailerVideosModel movieTrailerVideos;

  GetMovieTrailerVideosUsecaseOutput({required this.movieTrailerVideos});
}

@lazySingleton
class GetMovieTrailerVideosUsecase
    extends Usecase<GetMovieTrailerVideosUsecaseInput, GetMovieTrailerVideosUsecaseOutput> {
  final MoviesRepository _moviesRepository;

  GetMovieTrailerVideosUsecase({required MoviesRepository notificationsRepository})
      : _moviesRepository = notificationsRepository;

  @override
  Future<GetMovieTrailerVideosUsecaseOutput> call(
      GetMovieTrailerVideosUsecaseInput input) async {
    return await _moviesRepository.getMovieTrailerVideos(input);
  }
}
