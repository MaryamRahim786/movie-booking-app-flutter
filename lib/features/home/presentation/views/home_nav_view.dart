import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_exit_dialog.dart';
import 'package:movies_booking_app/features/home/domain/enums/bottom_nav_item.dart';
import 'package:movies_booking_app/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:movies_booking_app/features/home/presentation/views/common_view.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/watch_movies/watch_movies_view.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  // [ VIEW ]
  Widget view(BottomNavItem currentView) {
    if (currentView.isDashBoard) {
      return CommonView(
        view: currentView.name,
      );
    }
    if (currentView.isWatchMoves) return const WatchMoviesView();
    if (currentView.isMediaLibrary) {
      return const CommonView(
        view: 'Media Library',
      );
    }
    if (currentView.isMore) {
      return CommonView(
        view: currentView.name,
      );
    }
    return const SizedBox();
  }

  // [ ON WILL POP ]
  Future<bool> onWillPop(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppExitDialog(
          color: R.colors.blue_45C6EE,
        );
      },
    );

    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // [ Padding ]
    final mediaQueryPadding = MediaQuery.of(context).padding;

    // [ Watching Providers ]
    final currentView = ref.watch(selectedNavItemProvider);
    final navController = ref.watch(selectedNavItemProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: PopScope(
        onPopInvokedWithResult: (_, __) =>
            currentView != BottomNavItem.dashBoard
                ? resetToDashBoard()
                : onWillPop(context),
        canPop: false,
        child: Scaffold(
          backgroundColor: R.colors.grey_E7E7E7,
          extendBody: true,
          bottomNavigationBar: LayoutBuilder(
            builder: (context, constraints) {
              final bottomPadding = MediaQuery.of(context).padding.bottom;
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r), // adjust as needed
                  topRight: Radius.circular(20.r),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: (constraints.maxHeight * 0.1) + bottomPadding,
                    decoration: BoxDecoration(
                      color: R.colors.appColor,
                    ), // Adjust height as needed
                    child: BottomNavigationBar(
                      showSelectedLabels: true,
                      iconSize: 18.r,
                      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
                      backgroundColor: R.colors.appColor,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: R.colors.white_FFFFFF,
                      // White for selected icon & text
                      unselectedItemColor: R.colors.grey_97A2B0,
                      // Grey for unselected
                      selectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          height: 3.h,
                          color: R.colors.white_FFFFFF),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        height: 3.h,
                      ),
                      currentIndex: currentView.index,
                      onTap: (index) {
                        navController.state = BottomNavItem.values[index];
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: buildNavIcon(
                            svgBuilder: Assets.svgs.dashboardIcon.svg,
                            isSelected: currentView == BottomNavItem.dashBoard,
                          ),
                          label: 'Dashboard',
                        ),
                        BottomNavigationBarItem(
                          icon: buildNavIcon(
                            svgBuilder: Assets.svgs.watchIcon.svg,
                            isSelected: currentView == BottomNavItem.watchMoves,
                          ),
                          label: 'Watch',
                        ),
                        BottomNavigationBarItem(
                          icon: buildNavIcon(
                            svgBuilder: Assets.svgs.mediaLiberayIcon.svg,
                            isSelected: currentView == BottomNavItem.mediaLibrary,
                          ),
                          label: 'Media Library',
                        ),
                        BottomNavigationBarItem(
                          icon: buildNavIcon(
                            svgBuilder: Assets.svgs.moreMenuIcon.svg,
                            isSelected: currentView == BottomNavItem.more,
                          ),
                          label: 'More',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          body: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaQueryPadding.bottom.h),
                child: view(currentView),
              )),
        ),
      ),
    );
  }

  // [ BUILD NAV ICON ]
  Widget buildNavIcon({
    required Widget Function(
            {double? width, double? height, ColorFilter? colorFilter})
        svgBuilder,
    required bool isSelected,
  }) {
    return Column(
      children: [
        16.hb, // Space above the icon
        svgBuilder(
          width: 22.r,
          height: 22.r,
          colorFilter: ColorFilter.mode(
            isSelected ? R.colors.white_FFFFFF : R.colors.grey_AEAEAE,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }

  // [ RESET TO HOME ]
  void resetToDashBoard() {
    ref.read(selectedNavItemProvider.notifier).state = BottomNavItem.dashBoard;
  }
}
