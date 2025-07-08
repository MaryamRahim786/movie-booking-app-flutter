import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/widgets/movie_title.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/common/widgets/error_image.dart';
import 'package:movies_booking_app/common/widgets/loading_indicator.dart';
import 'package:movies_booking_app/util/router/paths.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () =>
            GoRouter.of(context).push(RoutePaths.movieDetails, extra: movie.id),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: movie.fullPosterPath,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ErrorImage(),
                progressIndicatorBuilder: (context, url, progress) =>
                    LoadingIndicator(
                  progress: progress.progress,
                ),
              ),
            ),
            Positioned(
                bottom: 20.h,
                left: 20.w,
                child: MovieTitle(
                  title: movie.title,
                  subString: 20,
                  textSize: 18,
                )),
          ],
        ),
      ),
    );
  }
}
