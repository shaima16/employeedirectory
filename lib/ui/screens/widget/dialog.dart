import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/my_colors.dart';
import 'loading_widget.dart';

class Dialogs {
  static loading() async {
    await Get.dialog(
        Scaffold(
          backgroundColor: Colors.black.withAlpha(140),
          body: WillPopScope(
            onWillPop: () async => true,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LoadingWidget(center: true),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please wait.....",
                        style: TextStyle(
                            color: MyColors.backgroundWhite, fontSize: 14),
                      )
                    ]),
              ),
            ),
          ),
        ),
        useSafeArea: false);
  }
}

Future<void> showSnackBar(
    {String? message,
    bool fromBottom = false,
    bool isDismissible = true,
    double marginVertical = 0.0,
    double marginHorizontal = 10.0,
    double borderRadius = 8.0}) async {
  Get.snackbar(
    message ?? 'Something wrong, Please try again later',
    "",
    messageText: const SizedBox(),
    snackPosition: fromBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    backgroundColor: MyColors.backgroundBlack,
    colorText: MyColors.backgroundWhite,
    borderRadius: borderRadius,
    margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal, vertical: marginVertical),
    isDismissible: isDismissible,
  );
}
