import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_loader.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double paddingHor = 20.0;
  static Circle processIndicator = Circle();
  final appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.imgBg,
            fit: BoxFit.fill,
            height: size.height,
            width: size.width,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: appColors.colorWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset(
                            AppImages.imgLogo,
                            height: size.height * 0.07,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.menu,
                        color: appColors.colorWhite,
                        size: 30.0,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: appColors.appColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "FULL COUNT",
                          style: TextStyle(
                            color: appColors.colorWhite,
                            fontSize: 24.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "count #305032",
                          style: TextStyle(
                            color: appColors.colorWhite,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "STARTED TODAY AT 8:03 AM BY AMANDA J",
                          style: TextStyle(
                            color: appColors.appGreyTextColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                              color:
                                  appColors.appGreyTextColor.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: appColors.appGreenColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "ITEMS COUNTED",
                                style: TextStyle(
                                  color: appColors.colorWhite,
                                  fontSize: 15.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "nothing counted",
                                style: TextStyle(
                                  color: appColors.colorWhite,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                              color:
                                  appColors.appGreyTextColor.withOpacity(.15),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            children: [
                              Text(
                                "4,605",
                                style: TextStyle(
                                  color: appColors.appDarkOrangeColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "ITEMS REMAINING",
                                style: TextStyle(
                                  color: appColors.colorWhite,
                                  fontSize: 15.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "nothing counted",
                                style: TextStyle(
                                  color: appColors.colorWhite,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Finish Later",
                          style: TextStyle(
                            color: appColors.colorWhite,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Cancel Count",
                          style: TextStyle(
                            color: appColors.colorWhite,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Complete Count",
                          style: TextStyle(
                            color: appColors.colorWhite,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.checkmark_circle_sharp,
                        color: appColors.appColor,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "SCAN AFTER SCAN",
                        style: TextStyle(
                          color: appColors.colorWhite,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      processIndicator.show(context);
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          processIndicator.hide(context);
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 17),
                            width: size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: appColors.appColor,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "BROWSE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appColors.colorWhite,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 17),
                            width: size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: appColors.appColor,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "COUNT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appColors.colorWhite,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
