import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_booking_app/common/providers/get_bearer_token_provider/get_bearer_token_provider.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_details.dart';
import 'package:movies_booking_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_details_provider.g.dart';

@riverpod
Future<MovieDetailsModel> getMovieDetails(Ref ref, {required int movieId}) async {
  final getMovies = sl<GetMovieDetailsUsecase>();
  final bearer = ref.read(getBearerTokenProvider);

  final input = GetMovieDetailsUsecaseInput(
    bearer: bearer,
    movieId: movieId.toString(),
  );
  final output = await getMovies(input);

  return output.movie;
}
