import 'package:flutter/material.dart';
import 'colors_set.dart';

class Widgets {
  Widgets._();

  static Color get appBg => const Color(0xFF14192F);
  static Color get appBar => Colors.transparent;
  static Color get tileColor => Colors.transparent;
  static Color get addButton => Colors.blue;
  static Color get greyLabel => const Color(0xFFA1A1A1);
  static Color get dividerColor => const Color(0x66696969);
  static Color get isChecked => Colors.white;

  static Widget get divider => Divider(color: ColorsSet.dividerColor);
}
