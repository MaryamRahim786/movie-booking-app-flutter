import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/common/widgets/loading_indicator.dart';
import 'package:movies_booking_app/common/widgets/watch_movies_loading_widget.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_movie_trailer_videos_provider/get_movie_trailer_videos_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_youtube_trailer_video_provider/get_youtube_trailer_video_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/widgets/trailer_player_widget.dart';

class MoviePlayerView extends ConsumerStatefulWidget {
  final int movieId;

  const MoviePlayerView({super.key, required this.movieId});

  @override
  ConsumerState createState() => _MoviePlayerViewState();
}

class _MoviePlayerViewState extends ConsumerState<MoviePlayerView> {
  @override
  Widget build(BuildContext context) {
    // [ Providers ]
    ref.watch(getMovieTrailerVideosProvider(movieId: widget.movieId));
    final trailerAsync =
        ref.watch(getYoutubeTrailerProvider(movieId: widget.movieId));
    return Scaffold(
      body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: (trailerAsync.value != null &&
                  trailerAsync.value?.site == 'YouTube')
              ? trailerAsync.when(
                  data: (MovieVideoResult trailer) {
                    // Navigate to TrailerPlayerScreen with the selected trailer

                    return TrailerPlayerScreen(
                      video: trailer,
                    );
                  },
                  loading: () => const Center(child: LoadingWidget()),
                  error: (e, _) => Center(child: AppText(text: 'Error: $e')),
                )
              : const LoadingIndicator()),
    );
  }
}
