import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonTextField extends StatefulWidget {
  final String labelText;
  final bool isEnable;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final TextEditingController controller;

  const CommonTextField({
    Key? key,
    this.isEnable = true,
    this.isObscureText = false,
    this.textStyle,
    this.suffixIcon,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors().colorWhite,
      enabled: widget.isEnable,
      obscureText: widget.isObscureText,
      style: widget.textStyle ??
          TextStyle(color: AppColors().colorWhite, fontSize: 18),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().colorGrey)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().colorGrey)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().colorGrey)),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: AppColors().colorWhite, fontSize: 14),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
