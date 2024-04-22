import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test_ui/widgets/common_textfield.dart';
import 'package:flutter_test_ui/utils/app_colors.dart';
import 'package:flutter_test_ui/utils/app_images.dart';
import 'package:flutter_test_ui/feature/auth/presentation/bloc/server_url_bloc.dart';
import 'package:flutter_test_ui/feature/auth/presentation/pages/sign_in_page.dart';

class ServerUrlPage extends StatefulWidget {
  const ServerUrlPage({Key? key}) : super(key: key);

  @override
  State<ServerUrlPage> createState() => _ServerUrlPageState();
}

class _ServerUrlPageState extends State<ServerUrlPage> {
  TextEditingController txtServer = TextEditingController();
  TextEditingController txtConnect = TextEditingController();
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServerUrlBloc, ServerUrlState>(
      listener: (context, state) {
        if (state is ServerUrlSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
          );
        } else if (state is ServerUrlError) {
          AppColors()
              .showInSnackBar(context: context, message: state.error ?? '');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.imgBg,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            contentView(),
          ],
        ),
      ),
    );
  }

  Widget contentView() {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.imgLogo,
            height: size.height * 0.15,
          ),
          const SizedBox(
            height: 10,
          ),
          isConnected
              ? connectingView()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextField(
                      controller: txtServer,
                      labelText: "ENTER YOUR KEOP SERVER URL",
                    ),
                    SizedBox(
                      height: size.width * 0.15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (txtServer.text.isNotEmpty) {
                          setState(() {
                            isConnected = true;
                            txtConnect.text = txtServer.text;
                          });
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              context
                                  .read<ServerUrlBloc>()
                                  .add(ConnectButtonPressed());
                            },
                          );
                        } else {
                          AppColors().showInSnackBar(
                            context: context,
                            message: "Please fill server name..",
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            color: AppColors().appColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "CONNECT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors().colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget connectingView() {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextField(
            controller: txtConnect,
            labelText: "CONNECTING",
            isEnable: false,
            textStyle: TextStyle(color: AppColors().colorWhite, fontSize: 20),
          ),
          SizedBox(
            height: size.width * 0.15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.width * 0.3,
            decoration: BoxDecoration(
                color: AppColors().appColor,
                borderRadius: BorderRadius.circular(30)),
            child: isConnected
                ? const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 25.0,
                  )
                : Text(
                    "CONNECT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors().colorWhite,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
