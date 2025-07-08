import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/extensions/data_time_extension.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_filled_button.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/common/widgets/back_button_widget.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_details_model.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';
import 'package:movies_booking_app/util/router/paths.dart';

class MovieImageWithButtonWidget extends StatelessWidget {
  final MovieDetailsModel movieDetails;

  const MovieImageWithButtonWidget({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    // [ Padding ]
    final mediaQueryPadding = MediaQuery.of(context).padding;
    return Stack(
      children: [
        // Movie Poster Image
        Image.network(
          width: double.infinity,
          movieDetails.fullPosterPath ?? '',
          height: 480.h,
          fit: BoxFit.cover,
        ),

        // BACK BUTTON
        Positioned(
            top: mediaQueryPadding.top + 10.h, child: const BackButtonWidget()),
        // Gradient Overlay (30% of image height)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height * 0.9 * 0.4,
          // 30% of image height
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                  Colors.black,
                ],
              ),
            ),
          ),
        ),

        // Action Buttons
        Positioned(
            left: 66.w,
            right: 66.w,
            top: MediaQuery.of(context).size.height * 0.8* 0.4,
            child: _buildActionButtons(
                movieDetails: movieDetails, context: context)),
      ],
    );
  }

  // [ Action Buttons , title and release date ]
  Widget _buildActionButtons(
      {required MovieDetailsModel movieDetails,
      required BuildContext context}) {
    return Column(
      children: [
        Assets.pngs.kingManImage.image(
          width: 102.w,
          height: 30.h,
          fit: BoxFit.cover,
        ),
        10.hb,
        AppText(
          text: "In theaters ${movieDetails.releaseDate.toFormattedDate()}",
          // formatted date
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: R.colors.white_FFFFFF,
        ),
        10.hb,
        AppFilledButton(
          height: 50.h,
          width: 243.w,
          text: 'Get Tickets',
          onTap: () => GoRouter.of(context).push(
            RoutePaths.movieSeatsMapping,
          ),
        ),
        10.hb,
        _watchTrailerButton(context),
        30.hb,
      ],
    );
  }

  // [ WATCH TRAILER BUTTON ]
  InkWell _watchTrailerButton(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .push(RoutePaths.moviePlayer, extra: movieDetails.id),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 62.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: R.colors.white_FFFFFF, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svgs.playButtonIcon.svg(
              width: 8.w,
              height: 12.h,
              colorFilter: ColorFilter.mode(
                R.colors.white_FFFFFF,
                BlendMode.srcIn,
              ),
            ),
            8.wb,
            AppText(
              text: 'Watch Trailer',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: R.colors.white_FFFFFF,
            ),
          ],
        ),
      ),
    );
  }
}
