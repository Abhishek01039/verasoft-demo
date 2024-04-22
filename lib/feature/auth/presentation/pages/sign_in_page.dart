import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ui/widgets/common_textfield.dart';
import 'package:flutter_test_ui/utils/app_colors.dart';
import 'package:flutter_test_ui/utils/app_images.dart';
import 'package:flutter_test_ui/utils/app_loader.dart';
import 'package:flutter_test_ui/feature/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter_test_ui/feature/home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isRemember = false;
  bool isObserverText = true;

  static Circle processIndicator = Circle();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else if (state is SignInError) {
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.imgLogo,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonTextField(
                    controller: txtUsername,
                    labelText: "USERNAME or EMAIL ADDRESS",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  CommonTextField(
                    controller: txtPassword,
                    labelText: "Password",
                    isObscureText: isObserverText,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObserverText = !isObserverText;
                        });
                      },
                      child: Icon(
                        isObserverText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors().colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 22.0,
                        width: 22.0,
                        child: Checkbox(
                            value: isRemember,
                            onChanged: (val) {
                              setState(() {
                                isRemember = !isRemember;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          color: AppColors().colorWhite,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (txtUsername.text.isEmpty &&
                          txtPassword.text.isEmpty) {
                        AppColors().showInSnackBar(
                            context: context,
                            message: "Please fill username and password");
                      } else {
                        processIndicator.show(context);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            processIndicator.hide(context);
                            context
                                .read<SignInBloc>()
                                .add(SignInButtonPressedEvent(
                                  username: txtUsername.text,
                                  password: txtPassword.text,
                                ));
                          },
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: AppColors().appColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors().colorWhite,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.imgBg,
                ),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Change server  |  Learn More",
                    style: TextStyle(
                        color: AppColors().colorWhite, fontSize: 13.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Copyright 2024 Verasoft",
                    style:
                        TextStyle(color: AppColors().colorWhite, fontSize: 9.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
