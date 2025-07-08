import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_booking_app/common/providers/get_bearer_token_provider/get_bearer_token_provider.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/domain/usecase/get_movie_trailer_videos.dart';
import 'package:movies_booking_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_trailer_videos_provider.g.dart';

@riverpod
Future<MovieTrailerVideosModel> getMovieTrailerVideos(Ref ref,
    {required int movieId}) async {
  final getMovieTrailer = sl<GetMovieTrailerVideosUsecase>();
  // [ GET API BEARER TOKEN ]
  final bearer = ref.read(getBearerTokenProvider);

  final input = GetMovieTrailerVideosUsecaseInput(
    bearer: bearer,
    movieId: movieId.toString(),
  );
  final output = await getMovieTrailer(input);

  return output.movieTrailerVideos;
}
