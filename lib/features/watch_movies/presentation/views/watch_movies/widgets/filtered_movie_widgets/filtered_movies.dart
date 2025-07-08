import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/widgets/filtered_movie_widgets/filtered_movie_card.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class FilteredMoviesWidget extends StatelessWidget {
  final List<Movie> movies;

  const FilteredMoviesWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.hb,
          SizedBox(
            height: 40.h,
            width: 100.w,
            child: AppText(
              text: movies.length == 1
                  ? '${movies.length} Result Found'
                  : '${movies.length} Results Found',
              fontSize: 14.sp,
              color: R.colors.black_242424,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 1.sh / 9, top: 4.h),
              itemCount: movies.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // [ MOVIE ]
                final Movie movie = movies[index];

                return FilteredMovieCard(
                  movie: movie,
                );
              },
              separatorBuilder: (context, index) => 16.hb,
            ),
          ),
        ],
      ),
    );
  }
}
