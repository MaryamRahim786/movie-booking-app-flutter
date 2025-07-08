import 'package:injectable/injectable.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/repository/movies_repository.dart';
import 'package:movies_booking_app/infrastructure/usecase.dart';
import 'package:movies_booking_app/infrastructure/usecase_input.dart';
import 'package:movies_booking_app/infrastructure/usecase_output.dart';

class GetMoviesUsecaseInput extends Input {
  final String bearer;

  GetMoviesUsecaseInput({required this.bearer});
}

class GetMoviesUsecaseOutput extends Output {
  final List<Movie> movies;

  GetMoviesUsecaseOutput({required this.movies});
}

@lazySingleton
class GetMoviesUsecase
    extends Usecase<GetMoviesUsecaseInput, GetMoviesUsecaseOutput> {
  final MoviesRepository _moviesRepository;

  GetMoviesUsecase({required MoviesRepository notificationsRepository})
      : _moviesRepository = notificationsRepository;

  @override
  Future<GetMoviesUsecaseOutput> call(GetMoviesUsecaseInput input) async {
    return await _moviesRepository.getMovies(input);
  }
}
