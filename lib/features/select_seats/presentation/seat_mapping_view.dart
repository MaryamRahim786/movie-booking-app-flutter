import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_filled_button.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/features/select_seats/presentation/widgets/seleted_date_section.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class MovieSeatsMappingView extends StatelessWidget {
  const MovieSeatsMappingView({super.key});

  @override
  Widget build(BuildContext context) {
    // [PADDING ]
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30.w,

        toolbarHeight: 90.h,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: SizedBox(
            height: 3.5.r,
            width: 15.r,
            child: Assets.svgs.backButtonIcon.svg(),
          ),
        ),
        // leadingWidth: 60.w,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            _buildMovieTitleSection(),
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Date Selection Section
              const SelectDateSection(),
              39.hb,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w, left: (index!=1)?20.w:0.w),
                      // optional spacing between items
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildScreeningTimesSection(),
                          10.hb,
                          // Price Section
                          _buildPriceSection(),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const Spacer(),
              // Screening Times Section

              30.hb,

              // Select Seats Button

              AppFilledButton(
                  text: 'Select Seats',
                  onTap: () {
                    GoRouter.of(context).pop();
                  }),
              20.hb,
              padding.bottom.hb,
            ],
          ),
        ),
      ),
    );
  }

  // Movie Title Section Widget
  Widget _buildMovieTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: "The King's Man",
          color: R.colors.purple_202C43,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        6.hb,
        AppText(
          text: "In Theaters December 22, 2021",
          color: R.colors.blue_61C3F2,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  // Screening Times Section Widget
  Widget _buildScreeningTimesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const AppText(
              text: "12:30",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            AppText(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: R.colors.grey_8F8F8F,
              text: '  Cinetech + Hall 1',
            ),
          ],
        ),
        6.hb,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
          width: 249.w,
          height: 145.h,
          decoration: BoxDecoration(
            border: Border.all(color: R.colors.blue_20B4E3, width: 1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Assets.pngs.seatsImage.image(
            width: 1.sw,
            height: 200.h,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  // Price Section Widget
  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 12,
              color: R.colors.purple_202C43,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                  text: "From ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: R.colors.grey_97A2B0)),
              const TextSpan(
                text: "50\$",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: " or ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: R.colors.grey_97A2B0)),
              const TextSpan(
                text: "2500 bonus",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
