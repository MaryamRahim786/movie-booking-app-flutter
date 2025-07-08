import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/extensions/substring_string.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/common/widgets/error_image.dart';
import 'package:movies_booking_app/common/widgets/loading_indicator.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';
import 'package:movies_booking_app/util/router/paths.dart';

class FilteredMovieCard extends StatelessWidget {
  final Movie movie;

  const FilteredMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // [ ON TAP  NAVIGATE TO DETAILS VIEW ]
      onTap: () =>
          GoRouter.of(context).push(RoutePaths.movieDetails, extra: movie.id),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE
          ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: movie.fullPosterPath,
                height: 100.h,
                width: 130.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ErrorImage(),
                progressIndicatorBuilder: (context, url, progress) =>
                    LoadingIndicator(progress: progress.progress),
              )),
          8.wb,

          // TITLE AND CATEGORY
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: movie.title.substringSafe(0, 17),
                color: R.colors.black_242424,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              6.hb,
              AppText(
                  text: movie.releaseDate,
                  fontSize: 12.sp,
                  color: R.colors.grey_97A2B0),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Assets.svgs.menuBlueIcon.svg(
              width: 15.w,
              height: 5.h,
            ),
          )
        ],
      ),
    );
  }
}
