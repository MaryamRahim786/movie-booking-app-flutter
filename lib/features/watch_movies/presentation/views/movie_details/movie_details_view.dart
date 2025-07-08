import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_divider_widget.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_movie_details_provider/get_movie_details_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_details/widgets/bg_image_with_button_widget.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_details/widgets/genres_section_widget.dart';
import 'package:movies_booking_app/common/widgets/watch_movies_loading_widget.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class MovieDetailsView extends ConsumerStatefulWidget {
  final int movieId;

  const MovieDetailsView({required this.movieId, super.key});

  @override
  ConsumerState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends ConsumerState<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    // [ Watching Provider ]
    final movieDetailsAsync = ref.watch(getMovieDetailsProvider(
      movieId: widget.movieId,
    ));
    return Scaffold(
      backgroundColor: R.colors.white_FFFFFF,
      body: movieDetailsAsync.when(
        data: (movie) => SingleChildScrollView(
          child: Column(
            children: [
              // Background Image with Gradient Overlay widget
              MovieImageWithButtonWidget(movieDetails: movie),

              // Content Column
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Genres Section
                    GenresSectionWidget(
                      genres: const [
                        'Action',
                        'Thriller',
                        'Science',
                        'Fiction'
                      ],
                    ),
                    22.hb,

                    // Divider
                    const AppDividerWidget(),

                    // Overview Section
                    _buildOverviewSection(movie: movie),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: LoadingWidget()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  // Overview Section
  Widget _buildOverviewSection({required MovieDetailsModel movie}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Overview',
            color: R.colors.purple_202C43,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          16.hb,
          AppText(
            text: movie.overview.isNotEmpty
                ? movie.overview
                : 'No overview available',
            fontSize: 12,
            textAlign: TextAlign.left,
            color: R.colors.grey_8F8F8F,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
