import 'package:currencies/utils/colors_set.dart';
import 'package:currencies/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const AddButton({this.onTap, this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: GestureDetector(
        onTap: onTap?.call,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: ColorsSet.addButton),
              ),
              child: Icon(Icons.add, color: ColorsSet.addButton),
            ),
            const SizedBox(width: 10),
            Text('Добавить валюту', style: TextStyles.addButton),
          ],
        ),
      ),
    );
  }
}
