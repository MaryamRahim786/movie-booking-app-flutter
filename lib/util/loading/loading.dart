import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/loading_widget.dart';
import 'package:movies_booking_app/util/resources/r.dart';
import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white_FFFFFF.withOpacity(0.5),
      child: Center(
        child: SpinKitDoubleBounce(color: R.colors.navyBlue_00478B),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void loadingWithText(BuildContext context, String text) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white_FFFFFF.withOpacity(0.5),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: R.colors.navyBlue_00478B,
              ),
              12.hb,
              Text(text)
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
