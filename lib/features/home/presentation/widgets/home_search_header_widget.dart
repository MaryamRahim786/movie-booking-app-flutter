import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/common/widgets/search_bar_widget.dart';
import 'package:movies_booking_app/features/home/presentation/providers/is_searching_provider/is_searching_provider.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/filtered_movies_provider/filtered_movies_provider.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class HomeSearchHeaderWidget extends ConsumerStatefulWidget {
  const HomeSearchHeaderWidget({super.key});

  @override
  ConsumerState<HomeSearchHeaderWidget> createState() =>
      _HomeSearchHeaderWidgetState();
}

class _HomeSearchHeaderWidgetState
    extends ConsumerState<HomeSearchHeaderWidget> {
  // Add search controller
  final TextEditingController _movieSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // [ Watching Providers ]
    final isSearching = ref.watch(isSearchingProvider);
    // [ MEDIA QUERY ]
    final mediaQueryPadding = MediaQuery.of(context).padding;

    return Padding(
      padding: EdgeInsets.only(
        top: mediaQueryPadding.top,
      ),
      child: (!isSearching)
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 20.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isSearching) ...[
                    AppText(
                      text: 'Watch',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      color: R.colors.black_242424,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(isSearchingProvider.notifier).toggle();
                      },
                      child: Assets.svgs.searchIcon.svg(
                        height: 24.r,
                        width: 24.r,
                      ),
                    ),
                  ],
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: SearchBarWidget(
                controller: _movieSearchController,
                onChanged: (searchQuery) {
                  if (searchQuery != null && searchQuery.isNotEmpty) {
                    ref
                        .read(filteredMoviesProvider.notifier)
                        .filterMovies(searchQuery);
                  }
                },
              ),
            ),
    );
  }
}
