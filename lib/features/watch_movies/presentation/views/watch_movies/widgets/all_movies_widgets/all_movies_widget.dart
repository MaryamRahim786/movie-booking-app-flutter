import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/all_movies_widgets/movie_card.dart';

class AllMoviesWidget extends StatelessWidget {
  final List<Movie> movies;

  const AllMoviesWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 1.sh/9, left: 20.w, right: 20.w, top: 30.h),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieCard(movie: movies[index]),
      separatorBuilder: (_, __) => 20.hb,
    );
  }
}
