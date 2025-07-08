import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/widgets/movie_title.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/common/widgets/error_image.dart';
import 'package:movies_booking_app/common/widgets/loading_indicator.dart';
import 'package:movies_booking_app/util/router/paths.dart';

class MovieGridCard extends StatelessWidget {
  final Movie movie;

  const MovieGridCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // [ ON TAP  NAVIGATE TO DETAILS VIEW ]
      onTap: () =>
          GoRouter.of(context).push(RoutePaths.movieDetails, extra: movie.id),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: movie.fullPosterPath,
                height: 110.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ErrorImage(),
                progressIndicatorBuilder: (context, url, progress) =>
                    LoadingIndicator(progress: progress.progress),
              ),
            ),
          ),
          Positioned(
              bottom: 20.h,
              left: 10.h,
              child: MovieTitle(title: movie.title, subString: 10,textSize: 16,)),
        ],
      ),
    );
  }
}
