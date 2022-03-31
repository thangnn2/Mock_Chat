import 'package:flutter/material.dart';
import '../config/constants.dart';

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField(
      {Key? key,
      required this.controller,
      this.obscureText,
      this.hintText,
      this.labelText,
      this.iconData,
      this.textInputType = TextInputType.none})
      : super(key: key);

  final TextEditingController controller;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final IconData? iconData;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              iconData,
              color: colorBlack,
            )),
      ),
    );
  }
}
