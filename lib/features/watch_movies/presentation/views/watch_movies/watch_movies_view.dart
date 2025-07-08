import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/features/home/presentation/providers/is_searching_provider/is_searching_provider.dart';
import 'package:movies_booking_app/features/home/presentation/widgets/home_search_header_widget.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/filtered_movies_provider/filtered_movies_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_movies_provider/get_movies_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/all_movies_widgets/all_movies_widget.dart';
import 'package:movies_booking_app/common/widgets/error_text_widget.dart';
import 'package:movies_booking_app/common/widgets/watch_movies_loading_widget.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/filtered_movie_widgets/filtered_movies.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/movie_grid_widget/movies_grid_widget.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class WatchMoviesView extends ConsumerWidget {
  const WatchMoviesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // [ Padding ]
    final padding = MediaQuery.of(context).padding;

    // [ Watching Provider ]
    final moviesAsync = ref.watch(getMoviesProvider);
    ref.watch(isSearchingProvider);
    ref.watch(filteredMoviesProvider);

    return KeyboardDismissOnTap(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // [ SEARCH BAR WIDGET ]
          Container(
              color: R.colors.white_FFFFFF,
              child: const HomeSearchHeaderWidget()),

          // [ MOVIES LIST VIEW ]

          Expanded(
            child: moviesAsync.when(
              data: (movies) => (movies.isNotEmpty)
                  ? moviesListViewWidget(
                    movies: movies,
                    ref: ref,
                  )
                  : Center(
                      child: AppText(
                          text: 'No Movie Found',
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
              loading: () => const Center(child: LoadingWidget()),
              error: (e, _) => Center(child: ErrorTextWidget(e: e.toString())),
            ),
          ),
        ],
      ),
    );
  }

  // [ MOVIES LIST VIEW ]
  Widget moviesListViewWidget({
    required List<Movie> movies,
    required WidgetRef ref,
  }) {
    // [ PROVIDERS ]
    final isSearching = ref.read(isSearchingProvider);
    final filteredMovies = ref.read(filteredMoviesProvider);

    // [ Filtered movies ]
    if (filteredMovies.isNotEmpty) {
      return FilteredMoviesWidget(movies: filteredMovies);
    }
    // [ unfiltered movies ]
    return (isSearching)
        ? MoviesGridWidget(movies: movies)
        : AllMoviesWidget(movies: movies);
  }
}
