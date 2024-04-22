class AppImages {
  // Singleton
  static final AppImages _instance = AppImages._internal();
  factory AppImages() {
    return _instance;
  }
  AppImages._internal();

  static const String imageRoute = "assets/";

  ///todo------SignIn----------
  static const String imgBg = "${imageRoute}bg.webp";
  static const String imgLogo = "${imageRoute}logo.png";
  static const String userImage = "${imageRoute}userImg.jpg";
}
