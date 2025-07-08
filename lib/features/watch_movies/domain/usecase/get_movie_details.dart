import 'package:injectable/injectable.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/repository/movies_repository.dart';
import 'package:movies_booking_app/infrastructure/usecase.dart';
import 'package:movies_booking_app/infrastructure/usecase_input.dart';
import 'package:movies_booking_app/infrastructure/usecase_output.dart';

class GetMovieDetailsUsecaseInput extends Input {
  final String bearer;
  final String movieId;

  GetMovieDetailsUsecaseInput({required this.bearer, required this.movieId});
}

class GetMovieDetailsUsecaseOutput extends Output {
  final MovieDetailsModel movie;

  GetMovieDetailsUsecaseOutput({required this.movie});
}

@lazySingleton
class GetMovieDetailsUsecase
    extends Usecase<GetMovieDetailsUsecaseInput, GetMovieDetailsUsecaseOutput> {
  final MoviesRepository _moviesRepository;

  GetMovieDetailsUsecase({required MoviesRepository notificationsRepository})
      : _moviesRepository = notificationsRepository;

  @override
  Future<GetMovieDetailsUsecaseOutput> call(
      GetMovieDetailsUsecaseInput input) async {
    return await _moviesRepository.getMovieDetails(input);
  }
}
