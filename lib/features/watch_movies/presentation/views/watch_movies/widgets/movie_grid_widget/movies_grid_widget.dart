import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/movie_grid_widget/movie_grid_card.dart';

class MoviesGridWidget extends StatelessWidget {
  final List<Movie> movies;

  const MoviesGridWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding:
          EdgeInsets.only(bottom: 1.sh / 8, left: 20.w, right: 20.w, top: 30.h),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 14 / 9,
      ),
      itemBuilder: (context, index) {
        // [ MOVIE ]
        final Movie movie = movies[index];
        return MovieGridCard(
          movie: movie,
        );
      },
    );
  }
}
