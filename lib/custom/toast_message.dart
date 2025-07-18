import 'package:ai_project/helper/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: orangeFFB44D,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    textColor: black,
  );
}
