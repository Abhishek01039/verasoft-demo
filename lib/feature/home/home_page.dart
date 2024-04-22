import 'package:flutter/material.dart';
import 'package:flutter_test_ui/utils/app_colors.dart';
import 'package:flutter_test_ui/feature/home/full_count_page.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/app_images.dart';
import '../../utils/app_loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double paddingHor = 20.0;
  static Circle processIndicator = Circle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.imgBg,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: paddingHor + paddingHor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.imgLogo,
                        height: MediaQuery.of(context).size.height * 0.09,
                      ),
                      Icon(
                        Icons.menu,
                        color: AppColors().colorWhite,
                        size: 30.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingHor + paddingHor, vertical: 25.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffCCCCCC).withOpacity(.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Afternoon",
                            style: TextStyle(
                              color: AppColors().colorWhite,
                              fontSize: 22.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Eric",
                            style: TextStyle(
                              color: AppColors().colorWhite,
                              fontSize: 32.0,
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.userImage),
                        radius: 45.0,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingHor + paddingHor, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffCCCCCC).withOpacity(.05),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DETAILS",
                        style: TextStyle(
                          color: AppColors().colorWhite,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Change location",
                        style: TextStyle(
                          color: AppColors().colorWhite,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(26.0),
                          decoration: BoxDecoration(
                              color: AppColors().appColor.withOpacity(.3),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.history,
                                color: AppColors().appColor,
                                size: 30.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "RECENT",
                                style: TextStyle(
                                  color: AppColors().colorWhite,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "counts",
                                style: TextStyle(
                                  color: AppColors().colorWhite,
                                  fontSize: 14.0,
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
                          padding: const EdgeInsets.all(26.0),
                          decoration: BoxDecoration(
                              color: AppColors().appColor.withOpacity(.3),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Icon(
                                Ionicons.play_outline,
                                color: AppColors().appColor,
                                size: 30.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "RESUME",
                                style: TextStyle(
                                  color: AppColors().colorWhite,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "count",
                                style: TextStyle(
                                  color: AppColors().colorWhite,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22.0,
                    vertical: 28.0,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors().appColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "START NEW COUNT",
                        style: TextStyle(
                          color: AppColors().colorWhite,
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Ionicons.chevron_forward,
                        color: AppColors().colorWhite,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    processIndicator.show(context);
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        processIndicator.hide(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage(),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 29, vertical: 1),
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: AppColors().appColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors().colorWhite,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "LOOKUP PRODUCT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors().colorWhite,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
