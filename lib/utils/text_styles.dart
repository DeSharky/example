import 'package:flutter/material.dart';
import 'package:currencies/utils/colors_set.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get defaultStyle => const TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bold => defaultStyle.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get italic => defaultStyle.copyWith(fontStyle: FontStyle.italic);

  static TextStyle get textInputLabel => defaultStyle.copyWith(color: ColorsSet.greyLabel);

  static TextStyle get error => defaultStyle.copyWith(color: Colors.red);
}