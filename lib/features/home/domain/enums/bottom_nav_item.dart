import 'package:movies_booking_app/gen/assets.gen.dart';

enum BottomNavItem {
  dashBoard,
  watchMoves,
  mediaLibrary,
  more;

  String get iconPath {
    return switch (this) {
      dashBoard => Assets.svgs.dashboardIcon.path,
      watchMoves => Assets.svgs.watchIcon.path,
      mediaLibrary => Assets.svgs.mediaLiberayIcon.path,
      more => Assets.svgs.moreMenuIcon.path,
    };
  }

  bool get isDashBoard => this == BottomNavItem.dashBoard;

  bool get isWatchMoves => this == BottomNavItem.watchMoves;

  bool get isMediaLibrary => this == BottomNavItem.mediaLibrary;

  bool get isMore => this == BottomNavItem.more;
}
