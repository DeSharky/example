import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {

  final Widget child;

  const InputContainer({required this.child, Key? key}) : super(key: key);

  static InputDecoration inputField(String label, {String? errorText}) => InputDecoration(
    labelText: label,
    labelStyle: TextStyles.textInputLabel,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: InputBorder.none,
    isDense: true,
    errorText: errorText,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
