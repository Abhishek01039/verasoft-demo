import 'package:flutter/material.dart';

class AppColors {
  /// Singleton factory
  static final AppColors _instance = AppColors._internal();
  factory AppColors() {
    return _instance;
  }
  AppColors._internal();

  Color appColor = const Color(0xff2291D6);
  Color appGreenColor = const Color(0xff17B780);
  Color appDarkOrangeColor = const Color(0xffE0960B);
  Color colorBlack = const Color(0xff000000);
  Color colorGrey = const Color(0xff707070);
  Color appGreyTextColor = const Color(0xffDDDDDD);
  Color colorWhite = const Color(0xffFFFFFF);

  void showInSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
