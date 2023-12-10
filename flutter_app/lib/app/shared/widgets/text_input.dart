import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

class TextInput extends StatelessWidget {
  String hintText;
  IconData iconSuffix;
  TextEditingController? controller;
  Function(String value) validate;
  TextInput(
      {super.key,
      required this.hintText,
      required this.iconSuffix,
      this.controller,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validate(value!),
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFFCFCFC),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xFFF2f2f2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xFFF2f2f2))),
          suffixIcon: Icon(
            iconSuffix,
            color: AppColors.primaryColor,
          )),
    );
  }
}
