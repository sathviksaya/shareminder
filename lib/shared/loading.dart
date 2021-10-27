import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void loading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (builder) {
      return WillPopScope(
        onWillPop: () => Future(() => false),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SizedBox(
            height: 70,
            width: 100,
            child: SpinKitFadingCircle(
              color: Colors.black54,
              size: 20,
            ),
          ),
        ),
      );
    },
  );
}
