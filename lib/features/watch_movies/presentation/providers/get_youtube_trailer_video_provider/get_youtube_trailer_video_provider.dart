import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_movie_trailer_videos_provider/get_movie_trailer_videos_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_youtube_trailer_video_provider.g.dart';

@riverpod
Future<MovieVideoResult> getYoutubeTrailer(Ref ref,
    {required int movieId}) async {
  final videosResponse =
      await ref.watch(getMovieTrailerVideosProvider(movieId: movieId).future);

  final trailer = videosResponse.results.firstWhere(
    (v) =>
        v.site.toLowerCase() == 'youtube' &&
        v.type.toLowerCase().contains('trailer'),
  );
  return trailer;
}
