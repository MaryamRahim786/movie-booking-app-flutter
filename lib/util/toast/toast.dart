import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_booking_app/util/resources/r.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.white_FFFFFF,
    backgroundColor: R.colors.green_0DD168,
  );
}

//showErrorToast
void showErrorToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.white_FFFFFF,
    backgroundColor: R.colors.red_DE2323,
  );
}
