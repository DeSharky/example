import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  final Widget? icon;
  final String title;
  final String message;
  final double? width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Padding? rightIcon;
  final Duration animationDuration;
  final Duration duration;
  final bool isDismissible;

  Snackbar({
    this.icon,
    this.title = '',
    this.message = '',
    this.width,
    this.padding = const EdgeInsets.all(25),
    this.margin = const EdgeInsets.symmetric(horizontal: 15),
    this.rightIcon,
    this.animationDuration = const Duration(milliseconds: 500),
    this.duration = const Duration(seconds: 3),
    this.isDismissible = false,
  }) {
    Get.rawSnackbar(
      title: title,
      maxWidth: width,
      messageText: Text(message),
      margin: margin,
      padding: padding,
      shouldIconPulse: false,
      backgroundColor: Colors.white,
      mainButton: rightIcon,
      icon: icon,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      animationDuration: animationDuration,
      duration: duration,
      isDismissible: isDismissible,
    );
  }
}