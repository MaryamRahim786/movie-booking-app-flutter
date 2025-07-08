import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_booking_app/common/providers/get_bearer_token_provider/get_bearer_token_provider.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movies.dart';
import 'package:movies_booking_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_provider.g.dart';

@riverpod
Future<List<Movie>> getMovies(Ref ref) async {
  final getMovies = sl<GetMoviesUsecase>();
  final bearer = ref.read(getBearerTokenProvider);

  final input = GetMoviesUsecaseInput(bearer: bearer);
  final output = await getMovies(input);

  return output.movies;
}
