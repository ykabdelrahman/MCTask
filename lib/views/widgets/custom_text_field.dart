import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.lableText,
    this.iconn,
    this.textType,
    this.hideText = false,
    this.onChanged,
    this.controller,
    this.validator,
    // this.decoration,
    this.textStyle,
  });
  final String? hint;
  final String? lableText;
  final IconData? iconn;
  final TextInputType? textType;
  final bool? hideText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  // final InputDecoration? decoration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: textType,
      obscureText: hideText!,
      style: textStyle,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconn,
          color: kPrimaryColor,
        ),
        labelText: lableText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
