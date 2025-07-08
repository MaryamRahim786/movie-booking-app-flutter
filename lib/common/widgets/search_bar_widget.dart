import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/widgets/custom_text_form_field.dart';
import 'package:movies_booking_app/features/home/presentation/providers/is_searching_provider/is_searching_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/filtered_movies_provider/filtered_movies_provider.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextFormField(
      height: 50,
      radius: 100,
      fillColor: R.colors.grey_F2F2F6,
      controller: controller,
      suffixIcon: InkWell(
        // This will toggle the search state
        onTap: () {
          ref.read(isSearchingProvider.notifier).toggle();
          ref.read(filteredMoviesProvider.notifier).clearFilter();
          controller?.clear();
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Assets.svgs.closeIcon.svg(
                height: 30.r,
                width: 30.r,
                colorFilter: ColorFilter.mode(
                  R.colors.black_242424,
                  BlendMode.srcIn,
                ))),
      ),
      prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Assets.svgs.searchIcon.svg(
              colorFilter: ColorFilter.mode(
            R.colors.black_242424,
            BlendMode.srcIn,
          ))),
      hintText: 'TV shows, movies and more',
      hintStyle: TextStyle(
        fontSize: 14.sp,
        color: R.colors.grey_717171,
      ),
      onChanged: onChanged,
      labelText: '',
      keyboardType: TextInputType.text,
      validator: (v) {
        return null;
      },
    );
  }
}
