import 'package:fluttertoast/fluttertoast.dart';

class HelperFunction {
  static final shared = HelperFunction();

  void showToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
    );
  }
}
